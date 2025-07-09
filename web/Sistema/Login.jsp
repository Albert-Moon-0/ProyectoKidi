<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.net.*, org.mindrot.jbcrypt.BCrypt, java.util.*, java.time.*, java.security.SecureRandom, java.text.SimpleDateFormat"%>
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
            String userAgent = request.getHeader("User-Agent");
            
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
                Class.forName("com.mysql.cj.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi?useSSL=false&serverTimezone=UTC", "root", "n0m3l0");
                
                // Limpiar sesiones expiradas al inicio
                limpiarSesionesExpiradas(c);
                
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
                
                // Si hay muchos intentos, verificar si ha pasado el tiempo de bloqueo
                if (intentosFallidos >= 5) {
                    if (ultimoIntento != null) {
                        long tiempoTranscurrido = System.currentTimeMillis() - ultimoIntento.getTime();
                        long tiempoEspera = 15 * 60 * 1000; // 15 minutos
                        
                        if (tiempoTranscurrido < tiempoEspera) {
                            long minutosRestantes = (tiempoEspera - tiempoTranscurrido) / (60 * 1000);
                            out.println("<script>errorAlert('Cuenta bloqueada. Tiempo restante: " + minutosRestantes + " minutos');window.location='../index.html';</script>");
                            return;
                        } else {
                            // Reset counter si ha pasado el tiempo
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
                
                jakarta.servlet.http.HttpSession userSession = request.getSession();
                
                String[] tables = {"ADMIN_", "USUARIO", "TUTOR"};
                String[] emailColumns = {"CORREO_A", "CORREO_U", "CORREO_T"};
                String[] passwordColumns = {"CONTRA_A", "CONTRASEÑA_U", "CONTRA_T"};
                String[] idColumns = {"ID_A", "ID_U", "ID_T"};
                String[] redirigir = {"../Admin/menu_A", "menu", "../Tutor/menu_T"};
                String[] userTypes = {"ADMIN", "USUARIO", "TUTOR"};
                boolean authenticated = false;
                
                for (int i = 0; i < tables.length; i++) {
                    String query = "SELECT * FROM " + tables[i] + " WHERE " + emailColumns[i] + " = ?";
                    ps = c.prepareStatement(query);
                    ps.setString(1, correo);
                    rs = ps.executeQuery();
                    
                    if (rs.next()) {
                        String hashAlmacenado = rs.getString(passwordColumns[i]);
                        int userId = rs.getInt(idColumns[i]);
                        
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
                                clearPs.executeUpdate();
                                clearPs.close();
                                
                                // Verificar límite de sesiones y crear nueva sesión
                                String sessionToken = crearSesion(c, userId, userTypes[i], clientIP, userAgent);
                                
                                if (sessionToken != null) {
                                    // Configurar sesión HTTP
                                    userSession.setAttribute("userEmail", correo);
                                    userSession.setAttribute("userType", userTypes[i]);
                                    userSession.setAttribute("userId", userId);
                                    userSession.setAttribute("sessionToken", sessionToken);
                                    
                                    // Cookies para persistencia
                                    Cookie emailCookie = new Cookie("kidi_user_email", URLEncoder.encode(correo, "UTF-8"));
                                    Cookie typeCookie = new Cookie("kidi_user_type", userTypes[i]);
                                    Cookie tokenCookie = new Cookie("kidi_session_token", sessionToken);
                                    
                                    emailCookie.setPath("/");
                                    typeCookie.setPath("/");
                                    tokenCookie.setPath("/");
                                    emailCookie.setMaxAge(60 * 60 * 24); // 24 horas
                                    typeCookie.setMaxAge(60 * 60 * 24);
                                    tokenCookie.setMaxAge(60 * 60 * 24);
                                    emailCookie.setSecure(false);
                                    typeCookie.setSecure(false);
                                    tokenCookie.setSecure(false);
                                    
                                    response.addCookie(emailCookie);
                                    response.addCookie(typeCookie);
                                    response.addCookie(tokenCookie);
                                    
                                    authenticated = true;
                                    out.println("<script>window.location='" + redirigir[i] + ".jsp';</script>");
                                    return;
                                } else {
                                    out.println("<script>errorAlert('Límite de sesiones alcanzado. Cierre otras sesiones para continuar.');window.location='../iniciodesesion.jsp';</script>");
                                    return;
                                }
                            } else {
                                // Contraseña incorrecta
                                registrarIntentoFallidoConDebug(c, clientIP, correo, out);
                                out.println("<script>errorAlert('Contraseña incorrecta');window.location='../iniciodesesion.jsp';</script>");
                                return;
                            }
                        } catch (Exception bcryptEx) {
                            registrarIntentoFallidoConDebug(c, clientIP, correo, out);
                            out.println("<script>errorAlert('Error de autenticación');window.location='../iniciodesesion.jsp';</script>");
                            return;
                        }
                    }
                    
                    rs.close();
                    ps.close();
                }
                
                if (!authenticated) {
                    // Usuario no encontrado
                    registrarIntentoFallidoConDebug(c, clientIP, correo, out);
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
                    out.println("<script>debugAlert('Error cerrando recursos: " + e.getMessage() + "');</script>");
                }
            }
        %>
        
        <%!
            // Limpiar sesiones expiradas
            private void limpiarSesionesExpiradas(Connection c) throws SQLException {
                String query = "DELETE FROM sesiones_activas WHERE expires_at < NOW()";
                PreparedStatement ps = c.prepareStatement(query);
                ps.executeUpdate();
                ps.close();
            }
            
            // Crear nueva sesión
            private String crearSesion(Connection c, int userId, String userType, String ip, String userAgent) throws SQLException {
                PreparedStatement ps = null;
                ResultSet rs = null;
                
                try {
                    // 1. Obtener configuración de sesión para este tipo de usuario
                    String sessionConfigQuery = "SELECT max_sessions, session_duration_hours FROM session_config WHERE user_type = ?";
                    ps = c.prepareStatement(sessionConfigQuery);
                    ps.setString(1, userType);
                    rs = ps.executeQuery();
                    
                    int maxSessions = 3; // Default
                    int durationHours = 24; // Default
                    
                    if (rs.next()) {
                        maxSessions = rs.getInt("max_sessions");
                        durationHours = rs.getInt("session_duration_hours");
                    }
                    
                    rs.close();
                    ps.close();
                    
                    // 2. Limpiar sesiones expiradas antes de contar
                    String cleanExpiredQuery = "DELETE FROM sesiones_activas WHERE expires_at < NOW()";
                    ps = c.prepareStatement(cleanExpiredQuery);
                    ps.executeUpdate();
                    ps.close();
                    
                    // 3. Contar sesiones activas del usuario
                    String countActiveQuery = "SELECT COUNT(*) as active_count FROM sesiones_activas WHERE user_id = ? AND user_type = ? AND expires_at > NOW()";
                    ps = c.prepareStatement(countActiveQuery);
                    ps.setInt(1, userId);
                    ps.setString(2, userType);
                    rs = ps.executeQuery();
                    
                    int sesionesActivas = 0;
                    if (rs.next()) {
                        sesionesActivas = rs.getInt("active_count");
                    }
                    
                    rs.close();
                    ps.close();
                    
                    // 4. Verificar si excede el límite
                    if (sesionesActivas >= maxSessions) {
                        return null; // Límite excedido
                    }
                    
                    // 5. Generar token único
                    String sessionToken = generarToken();
                    
                    // 6. Calcular tiempo de expiración
                    long expirationTime = System.currentTimeMillis() + (durationHours * 60 * 60 * 1000L);
                    Timestamp expiresAt = new Timestamp(expirationTime);
                    
                    // 7. Insertar nueva sesión
                    String insertQuery = "INSERT INTO sesiones_activas (user_id, user_type, session_token, ip_address, user_agent, expires_at) VALUES (?, ?, ?, ?, ?, ?)";
                    ps = c.prepareStatement(insertQuery);
                    ps.setInt(1, userId);
                    ps.setString(2, userType);
                    ps.setString(3, sessionToken);
                    ps.setString(4, ip);
                    ps.setString(5, userAgent);
                    ps.setTimestamp(6, expiresAt);
                    
                    int inserted = ps.executeUpdate();
                    ps.close();
                    
                    return inserted > 0 ? sessionToken : null;
                    
                } catch (SQLException e) {
                    throw e;
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                    } catch (SQLException e) {
                        // Log error but don't throw
                    }
                }
            }
            
            // Generar token seguro
            private String generarToken() {
                SecureRandom random = new SecureRandom();
                byte[] bytes = new byte[32];
                random.nextBytes(bytes);
                StringBuilder token = new StringBuilder();
                for (byte b : bytes) {
                    token.append(String.format("%02x", b));
                }
                return token.toString();
            }
            
            // Registrar intento fallido
            private void registrarIntentoFallidoConDebug(Connection c, String ip, String email, JspWriter out) throws SQLException, java.io.IOException {
                PreparedStatement ps = null;
                ResultSet rs = null;
                
                try {
                    String checkQuery = "SELECT intentos_fallidos FROM login_attempts WHERE ip_address = ? AND email = ?";
                    ps = c.prepareStatement(checkQuery);
                    ps.setString(1, ip);
                    ps.setString(2, email);
                    rs = ps.executeQuery();
                    
                    if (rs.next()) {
                        int intentos = rs.getInt("intentos_fallidos") + 1;
                        rs.close();
                        ps.close();
                        
                        String updateQuery = "UPDATE login_attempts SET intentos_fallidos = ?, ultimo_intento = NOW() WHERE ip_address = ? AND email = ?";
                        ps = c.prepareStatement(updateQuery);
                        ps.setInt(1, intentos);
                        ps.setString(2, ip);
                        ps.setString(3, email);
                        ps.executeUpdate();
                        ps.close();
                    } else {
                        rs.close();
                        ps.close();
                        
                        String insertQuery = "INSERT INTO login_attempts (ip_address, email, intentos_fallidos, ultimo_intento) VALUES (?, ?, 1, NOW())";
                        ps = c.prepareStatement(insertQuery);
                        ps.setString(1, ip);
                        ps.setString(2, email);
                        ps.executeUpdate();
                        ps.close();
                    }
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                    } catch (SQLException e) {
                        // Log error but don't throw
                    }
                }
            }
        %>
    </body>
</html>