<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, org.mindrot.jbcrypt.BCrypt, java.util.*, java.time.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String clientIP = request.getRemoteAddr();
            
            Connection c = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost/Kidi", "root", "n0m3l0");
                
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
                        long tiempoEspera = 15 * 60 * 1000; // 15 minutos en milisegundos
                        
                        if (tiempoTranscurrido < tiempoEspera) {
                            long minutosRestantes = (tiempoEspera - tiempoTranscurrido) / (60 * 1000);
                            out.println("<script>alert('Demasiados intentos fallidos. Espera " + minutosRestantes + " minutos antes de intentar nuevamente.');window.location='../index.html';</script>");
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
                String[] redirigir = {"../Admin/menu_A", "menu", "../Tutor/menu_T"};
                boolean authenticated = false;
                
                for (int i = 0; i < tables.length; i++) {
                    String query = "SELECT * FROM " + tables[i] + " WHERE " + emailColumns[i] + " = ?";
                    ps = c.prepareStatement(query);
                    ps.setString(1, correo);
                    rs = ps.executeQuery();
                    
                    if (rs.next()) {
                        String hashAlmacenado = rs.getString(passwordColumns[i]);
                        
                        if (hashAlmacenado != null && BCrypt.checkpw(contrasena, hashAlmacenado)) {
                            // Login exitoso - limpiar intentos fallidos
                            String clearAttemptsQuery = "DELETE FROM login_attempts WHERE ip_address = ? OR email = ?";
                            PreparedStatement clearPs = c.prepareStatement(clearAttemptsQuery);
                            clearPs.setString(1, clientIP);
                            clearPs.setString(2, correo);
                            clearPs.executeUpdate();
                            clearPs.close();
                            
                            userSession.setAttribute("userEmail", correo);
                            userSession.setAttribute("userType", tables[i].replace("_", ""));
                            authenticated = true;
                            out.println("<script>window.location='"+redirigir[i]+".jsp';</script>");
                            return;
                        } else {
                            // Contraseña incorrecta - registrar intento fallido
                            registrarIntentoFallido(c, clientIP, correo);
                            out.println("<script>alert('Contraseña incorrecta');window.location='../iniciodesesion.jsp';</script>");
                            return;
                        }
                    }
                    rs.close();
                    ps.close();
                }
                
                if (!authenticated) {
                    // Usuario no encontrado - registrar intento fallido
                    registrarIntentoFallido(c, clientIP, correo);
                    out.println("<script>alert('Usuario no encontrado');window.location='../iniciodesesion.jsp';</script>");
                }
                
            } catch (Exception e) {
                out.print("Error: " + e.getMessage());
                out.println("<script>alert('Error del sistema: " + e.getMessage() + "');window.location='../iniciodesesion.jsp';</script>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (c != null) c.close();
                } catch (SQLException e) {
                    out.print("Error closing resources: " + e.getMessage());
                }
            }
        %>
        
        <%!
            private void registrarIntentoFallido(Connection c, String ip, String email) throws SQLException {
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
                    updatePs.executeUpdate();
                    updatePs.close();
                } else {
                    // Crear nuevo registro
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