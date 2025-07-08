<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.net.*, org.mindrot.jbcrypt.BCrypt, java.util.*, java.time.*, java.util.concurrent.ConcurrentHashMap"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script>
            function debugAlert(mensaje) {
                alert("DEBUG LOGIN: " + mensaje);
            }
            
            function errorAlert(mensaje) {
                alert("ERROR: " + mensaje);
            }
            
            function successAlert(mensaje) {
                alert("SUCCESS: " + mensaje);
            }
        </script>
    </head>
    <body>
        <%
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String clientIP = request.getRemoteAddr();           
            
            // Validación de parámetros
            if (correo == null || correo.trim().isEmpty()) {
                out.println("<script>errorAlert('Correo requerido');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            if (contrasena == null || contrasena.trim().isEmpty()) {
                out.println("<script>errorAlert('Contraseña requerida');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            correo = correo.trim();
            
            Connection c = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi?useSSL=false&serverTimezone=UTC", "root", "n0m3l0");
                
                // Verificar intentos fallidos por IP y email
                String checkAttemptsQuery = "SELECT intentos_fallidos, ultimo_intento FROM login_attempts WHERE (ip_address = ? OR email = ?) AND ultimo_intento > DATE_SUB(NOW(), INTERVAL 15 MINUTE)";
                ps = c.prepareStatement(checkAttemptsQuery);
                ps.setString(1, clientIP);
                ps.setString(2, correo);
                rs = ps.executeQuery();
                
                int intentosFallidos = 0;
                Timestamp ultimoIntento = null;
                
                if (rs.next()) {
                    intentosFallidos = rs.getInt("intentos_fallidos");
                    ultimoIntento = rs.getTimestamp("ultimo_intento");
                }
                
                rs.close();
                ps.close();
                
                // Verificar bloqueo
                if (intentosFallidos >= 5) {
                    if (ultimoIntento != null) {
                        long tiempoTranscurrido = System.currentTimeMillis() - ultimoIntento.getTime();
                        long tiempoEspera = 15 * 60 * 1000; // 15 minutos
                        
                        if (tiempoTranscurrido < tiempoEspera) {
                            long minutosRestantes = (tiempoEspera - tiempoTranscurrido) / (60 * 1000);
                            out.println("<script>errorAlert('Cuenta bloqueada. Tiempo restante: " + minutosRestantes + " minutos');window.location='../iniciodesesion.jsp';</script>");
                            return;
                        } else {
                            // Reset counter
                            String resetQuery = "DELETE FROM login_attempts WHERE (ip_address = ? OR email = ?) AND ultimo_intento <= DATE_SUB(NOW(), INTERVAL 15 MINUTE)";
                            ps = c.prepareStatement(resetQuery);
                            ps.setString(1, clientIP);
                            ps.setString(2, correo);
                            ps.executeUpdate();
                            ps.close();
                            intentosFallidos = 0;
                        }
                    }
                }
                
                // OBTENER CONTEXTO Y MAPA DE SESIONES ACTIVAS
                ServletContext appContext = getServletContext();
                ConcurrentHashMap<String, HttpSession> activeSessions = null;
                
                // Sincronizar acceso al mapa global
                synchronized(appContext) {
                    Object sessionMapObj = appContext.getAttribute("activeSessions");
                    if (sessionMapObj == null) {
                        activeSessions = new ConcurrentHashMap<>();
                        appContext.setAttribute("activeSessions", activeSessions);
                    } else {
                        activeSessions = (ConcurrentHashMap<String, HttpSession>) sessionMapObj;
                    }
                }
                
                String[] tables = {"ADMIN_", "USUARIO", "TUTOR"};
                String[] emailColumns = {"CORREO_A", "CORREO_U", "CORREO_T"};
                String[] passwordColumns = {"CONTRA_A", "CONTRASEÑA_U", "CONTRA_T"};
                String[] redirigir = {"../Admin/menu_A", "menu", "../Tutor/menu_T"};
                boolean authenticated = false;
                
                // BUSCAR USUARIO EN TODAS LAS TABLAS
                for (int i = 0; i < tables.length && !authenticated; i++) {
                    String query = "SELECT * FROM " + tables[i] + " WHERE " + emailColumns[i] + " = ?";
                    ps = c.prepareStatement(query);
                    ps.setString(1, correo);
                    rs = ps.executeQuery();
                    
                    if (rs.next()) {
                        String hashAlmacenado = rs.getString(passwordColumns[i]);
                        
                        if (hashAlmacenado == null || hashAlmacenado.trim().isEmpty()) {
                            rs.close();
                            ps.close();
                            continue;
                        }
                        
                        try {
                            boolean passwordMatch = BCrypt.checkpw(contrasena, hashAlmacenado);
                            
                            if (passwordMatch) {
                                // *** VERIFICAR SESIÓN ACTIVA ANTES DE CREAR NUEVA ***
                                HttpSession sesionExistente = activeSessions.get(correo);
                                if (sesionExistente != null) {
                                    try {
                                        // Verificar si la sesión existente sigue siendo válida
                                        sesionExistente.getAttribute("userEmail");
                                        
                                        // Si llegamos aquí, la sesión sigue activa
                                        out.println("<script>errorAlert('Ya hay una sesión activa con este usuario. Cierre la sesión anterior primero.');window.location='../iniciodesesion.jsp';</script>");
                                        rs.close();
                                        ps.close();
                                        return;
                                    } catch (IllegalStateException e) {
                                        // La sesión ya no es válida, remover del mapa
                                        activeSessions.remove(correo);
                                    }
                                }
                                
                                // Login exitoso - limpiar intentos fallidos
                                String clearAttemptsQuery = "DELETE FROM login_attempts WHERE ip_address = ? OR email = ?";
                                PreparedStatement clearPs = c.prepareStatement(clearAttemptsQuery);
                                clearPs.setString(1, clientIP);
                                clearPs.setString(2, correo);
                                clearPs.executeUpdate();
                                clearPs.close();
                                
                                // CREAR NUEVA SESIÓN
                                HttpSession userSession = request.getSession();
                                userSession.setAttribute("userEmail", correo);
                                userSession.setAttribute("userType", tables[i].replace("_", ""));
                                
                                // Agregar información adicional del usuario
                                if (tables[i].equals("ADMIN_")) {
                                    userSession.setAttribute("userName", rs.getString("NOMBRE_A"));
                                    userSession.setAttribute("userId", rs.getString("ID_A"));
                                } else if (tables[i].equals("USUARIO")) {
                                    userSession.setAttribute("userName", rs.getString("NOMBRE_U"));
                                    userSession.setAttribute("userId", rs.getString("ID_U"));
                                } else if (tables[i].equals("TUTOR")) {
                                    userSession.setAttribute("userName", rs.getString("NOMBRE_T"));
                                    userSession.setAttribute("userId", rs.getString("ID_T"));
                                }
                                
                                // REGISTRAR SESIÓN ACTIVA
                                activeSessions.put(correo, userSession);
                                
                                // Crear cookies
                                Cookie emailCookie = new Cookie("kidi_user_email", URLEncoder.encode(correo, "UTF-8"));
                                Cookie typeCookie = new Cookie("kidi_user_type", tables[i].replace("_", ""));
                                
                                emailCookie.setPath("/");
                                typeCookie.setPath("/");
                                emailCookie.setMaxAge(60 * 60 * 8); // 8 horas
                                typeCookie.setMaxAge(60 * 60 * 8);
                                emailCookie.setSecure(false);
                                typeCookie.setSecure(false);
                                emailCookie.setHttpOnly(false);
                                typeCookie.setHttpOnly(false);
                                
                                response.addCookie(emailCookie);
                                response.addCookie(typeCookie);
                                
                                authenticated = true;
                                
                                out.println("<script>window.location='" + redirigir[i] + ".jsp';</script>");                                
                                rs.close();
                                ps.close();
                                return;
                            } else {
                                // Contraseña incorrecta
                                registrarIntentoFallido(c, clientIP, correo);
                                out.println("<script>errorAlert('Contraseña incorrecta');window.location='../iniciodesesion.jsp';</script>");
                                rs.close();
                                ps.close();
                                return;
                            }
                        } catch (Exception bcryptEx) {
                            registrarIntentoFallido(c, clientIP, correo);
                            out.println("<script>errorAlert('Error de autenticación');window.location='../iniciodesesion.jsp';</script>");
                            rs.close();
                            ps.close();
                            return;
                        }
                    }
                    
                    rs.close();
                    ps.close();
                }
                
                if (!authenticated) {
                    // Usuario no encontrado
                    registrarIntentoFallido(c, clientIP, correo);
                    out.println("<script>errorAlert('Usuario no encontrado');window.location='../iniciodesesion.jsp';</script>");
                }
                
            } catch (Exception e) {
                out.println("<script>errorAlert('Error del sistema: " + e.getMessage() + "');window.location='../iniciodesesion.jsp';</script>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (c != null) c.close();
                } catch (SQLException e) {
                    // Log error
                }
            }
        %>
        
        <%!
            private void registrarIntentoFallido(Connection c, String ip, String email) throws SQLException {
                String checkQuery = "SELECT intentos_fallidos FROM login_attempts WHERE ip_address = ? AND email = ?";
                PreparedStatement checkPs = c.prepareStatement(checkQuery);
                checkPs.setString(1, ip);
                checkPs.setString(2, email);
                ResultSet checkRs = checkPs.executeQuery();
                
                if (checkRs.next()) {
                    int intentos = checkRs.getInt("intentos_fallidos") + 1;
                    String updateQuery = "UPDATE login_attempts SET intentos_fallidos = ?, ultimo_intento = NOW() WHERE ip_address = ? AND email = ?";
                    PreparedStatement updatePs = c.prepareStatement(updateQuery);
                    updatePs.setInt(1, intentos);
                    updatePs.setString(2, ip);
                    updatePs.setString(3, email);
                    updatePs.executeUpdate();
                    updatePs.close();
                } else {
                    String insertQuery = "INSERT INTO login_attempts (ip_address, email, intentos_fallidos, ultimo_intento) VALUES (?, ?, 1, NOW())";
                    PreparedStatement insertPs = c.prepareStatement(insertQuery);
                    insertPs.setString(1, ip);
                    insertPs.setString(2, email);
                    insertPs.executeUpdate();
                    insertPs.close();
                }
                
                checkRs.close();
                checkPs.close();
            }
        %>
    </body>
</html>