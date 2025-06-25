<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.net.*, org.mindrot.jbcrypt.BCrypt, java.util.*, java.time.*"%>
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
                return;
            }
            
            if (contrasena == null || contrasena.trim().isEmpty()) {
                return;
            }
            
            correo = correo.trim();
            
            Connection c = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                
                // Cambiar a driver moderno
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
                } else {
                }
                
                rs.close();
                ps.close();
                
                // Si hay muchos intentos, verificar si ha pasado el tiempo de bloqueo
                if (intentosFallidos >= 5) {
                    out.println("<script>debugAlert('Usuario bloqueado por intentos fallidos');</script>");
                    
                    if (ultimoIntento != null) {
                        long tiempoTranscurrido = System.currentTimeMillis() - ultimoIntento.getTime();
                        long tiempoEspera = 15 * 60 * 1000; // 15 minutos en milisegundos
                        
                        if (tiempoTranscurrido < tiempoEspera) {
                            long minutosRestantes = (tiempoEspera - tiempoTranscurrido) / (60 * 1000);
                            out.println("<script>errorAlert('Cuenta bloqueada. Tiempo restante: " + minutosRestantes + " minutos');window.location='../index.html';</script>");
                            return;
                        } else {
                            // Reset counter si ha pasado el tiempo
                            out.println("<script>debugAlert('Tiempo de bloqueo expirado, reseteando contador...');</script>");
                            String resetQuery = "DELETE FROM login_attempts WHERE (ip_address = ? OR email = ?) AND ultimo_intento <= DATE_SUB(NOW(), INTERVAL 15 MINUTE)";
                            ps = c.prepareStatement(resetQuery);
                            ps.setString(1, clientIP);
                            ps.setString(2, correo);
                            int deleted = ps.executeUpdate();
                            ps.close();
                            intentosFallidos = 0;
                        }
                    }
                }
                
                jakarta.servlet.http.HttpSession userSession = request.getSession();
                
                String[] tables = {"ADMIN_", "USUARIO", "TUTOR"};
                String[] emailColumns = {"CORREO_A", "CORREO_U", "CORREO_T"};
                String[] passwordColumns = {"CONTRA_A", "CONTRASEÑA_U", "CONTRA_T"};
                String[] redirigir = {"../Admin/menu_A", "menu", "../Tutor/menu_T"};
                boolean authenticated = false;
                
                
                for (int i = 0; i < tables.length; i++) {
                    
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
                                
                                // Login exitoso - limpiar intentos fallidos
                                String clearAttemptsQuery = "DELETE FROM login_attempts WHERE ip_address = ? OR email = ?";
                                PreparedStatement clearPs = c.prepareStatement(clearAttemptsQuery);
                                clearPs.setString(1, clientIP);
                                clearPs.setString(2, correo);
                                int cleared = clearPs.executeUpdate();
                                clearPs.close();                                                                
                                userSession.setAttribute("userEmail", correo);
                                userSession.setAttribute("userType", tables[i].replace("_", ""));
                                authenticated = true;
                               
                               
                                // MÉTODO 1: Cookies manuales con configuración específica para proxy
    Cookie emailCookie = new Cookie("kidi_user_email", URLEncoder.encode(correo, "UTF-8"));
    Cookie typeCookie = new Cookie("kidi_user_type", tables[i].replace("_", ""));
    
    // Configuración específica para servidores con proxy
    emailCookie.setPath("/");
    typeCookie.setPath("/");
    emailCookie.setMaxAge(60 * 60 * 8); // 8 horas
    typeCookie.setMaxAge(60 * 60 * 8);
    emailCookie.setSecure(false); // Importante: false para HTTP
    typeCookie.setSecure(false);
    emailCookie.setHttpOnly(false); // Permitir acceso desde JavaScript si es necesario
    typeCookie.setHttpOnly(false);
    
    response.addCookie(emailCookie);
    response.addCookie(typeCookie);
    
    // MÉTODO 2: También usar parámetros URL como respaldo
    String redirectUrl = "'"+redirigir[i] + ".jsp?e='" + URLEncoder.encode(correo, "UTF-8") + 
                        "&t=" + URLEncoder.encode(tables[i].replace("_", ""), "UTF-8") + 
                        "&ts=" + System.currentTimeMillis(); // timestamp para evitar cache
    
                                out.println("<script>debugAlert('Redirigiendo a: " + redirigir[i] + "');window.location='" + redirigir[i] + ".jsp';</script>");
                                return;
                            } else {
                                // Contraseña incorrecta - registrar intento fallido
                                registrarIntentoFallidoConDebug(c, clientIP, correo, out);
                                out.println("<script>errorAlert('Contraseña incorrecta');window.location='../iniciodesesion.jsp';</script>");
                                return;
                            }
                        } catch (Exception bcryptEx) {
                            // Posible problema con el hash, registrar como intento fallido
                            registrarIntentoFallidoConDebug(c, clientIP, correo, out);
                            out.println("<script>errorAlert('Error de autenticación');window.location='../iniciodesesion.jsp';</script>");
                            return;
                        }
                    } else {
                    }
                    
                    rs.close();
                    ps.close();
                }
                
                if (!authenticated) {
                    // Usuario no encontrado - registrar intento fallido
                    registrarIntentoFallidoConDebug(c, clientIP, correo, out);
                    out.println("<script>errorAlert('Usuario no encontrado');window.location='../iniciodesesion.jsp';</script>");
                }
                
            } catch (ClassNotFoundException e) {
                out.println("<script>debugAlert('Error: Driver MySQL no encontrado - " + e.getMessage() + "');</script>");
                out.println("<script>errorAlert('Error del sistema: Driver de base de datos no encontrado');window.location='../iniciodesesion.jsp';</script>");
            } catch (SQLException e) {
                out.println("<script>debugAlert('Error SQL: " + e.getMessage() + " - Código: " + e.getErrorCode() + "');</script>");
                out.println("<script>errorAlert('Error de base de datos: " + e.getMessage() + "');window.location='../iniciodesesion.jsp';</script>");
            } catch (Exception e) {
                out.println("<script>debugAlert('Error general: " + e.getMessage() + "');</script>");
                out.println("<script>errorAlert('Error del sistema: " + e.getMessage() + "');window.location='../iniciodesesion.jsp';</script>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (c != null) c.close();
                } catch (SQLException e) {
                    out.println("<script>debugAlert('Error cerrando recursos: " + e.getMessage() + "');</script>");
                }
            }
        %>
        
        <%!
            private void registrarIntentoFallidoConDebug(Connection c, String ip, String email, JspWriter out) throws SQLException, java.io.IOException {
                
                // Verificar si ya existe un registro
                String checkQuery = "SELECT intentos_fallidos FROM login_attempts WHERE ip_address = ? AND email = ?";
                PreparedStatement checkPs = c.prepareStatement(checkQuery);
                checkPs.setString(1, ip);
                checkPs.setString(2, email);
                ResultSet checkRs = checkPs.executeQuery();
                
                if (checkRs.next()) {
                    // Actualizar registro existente
                    int intentos = checkRs.getInt("intentos_fallidos") + 1;
                    
                    String updateQuery = "UPDATE login_attempts SET intentos_fallidos = ?, ultimo_intento = NOW() WHERE ip_address = ? AND email = ?";
                    PreparedStatement updatePs = c.prepareStatement(updateQuery);
                    updatePs.setInt(1, intentos);
                    updatePs.setString(2, ip);
                    updatePs.setString(3, email);
                    int updated = updatePs.executeUpdate();
                    updatePs.close();
                    
                } else {
                    // Crear nuevo registro
                    
                    String insertQuery = "INSERT INTO login_attempts (ip_address, email, intentos_fallidos, ultimo_intento) VALUES (?, ?, 1, NOW())";
                    PreparedStatement insertPs = c.prepareStatement(insertQuery);
                    insertPs.setString(1, ip);
                    insertPs.setString(2, email);
                    int inserted = insertPs.executeUpdate();
                    insertPs.close();
                    
                }
                
                checkRs.close();
                checkPs.close();
            }
            
            // Método original sin debugging para compatibilidad
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