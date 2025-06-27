<%-- 
    Document   : restablecerContra
    Created on : 27 jun 2025, 14:59:38
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.net.URLDecoder"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Procesando Nueva Contraseña</title>
    </head>
    <body>
        <%
            String correo = request.getParameter("correo");
            String resetToken = request.getParameter("reset_token");
            String nuevaContrasena = request.getParameter("nueva_contrasena");
            String confirmarContrasena = request.getParameter("confirmar_contrasena");
            
            // Validaciones básicas
            if (correo == null || resetToken == null || nuevaContrasena == null || confirmarContrasena == null) {
                out.println("<script>alert('Datos incompletos. Por favor, intenta nuevamente.');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            // Verificar que las contraseñas coincidan
            if (!nuevaContrasena.equals(confirmarContrasena)) {
                out.println("<script>alert('Las contraseñas no coinciden. Por favor, intenta nuevamente.');history.back();</script>");
                return;
            }
            
            // Validar fortaleza de la contraseña
            if (nuevaContrasena.length() < 8 || 
                !nuevaContrasena.matches(".*[A-Z].*") || 
                !nuevaContrasena.matches(".*[a-z].*") || 
                !nuevaContrasena.matches(".*[0-9].*")) {
                out.println("<script>alert('La contraseña no cumple con los requisitos de seguridad. Por favor, intenta nuevamente.');history.back();</script>");
                return;
            }
            
            // Verificar token de restablecimiento
            String storedToken = null;
            Long storedExpiry = null;
            String storedCorreo = null;
            
            // MÉTODO 1: Intentar obtener de cookies
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("kidi_reset_correo".equals(cookie.getName())) {
                        storedCorreo = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    } else if ("kidi_reset_token".equals(cookie.getName())) {
                        storedToken = cookie.getValue();
                    } else if ("kidi_reset_expiry".equals(cookie.getName())) {
                        try {
                            storedExpiry = Long.parseLong(cookie.getValue());
                        } catch (NumberFormatException e) {
                            // Ignorar si no se puede parsear
                        }
                    }
                }
            }
            
            // MÉTODO 2: Si no hay cookies, intentar obtener de sesión
            if (storedCorreo == null || storedToken == null || storedExpiry == null) {
                storedCorreo = (String) session.getAttribute("reset_correo");
                storedToken = (String) session.getAttribute("reset_token");
                storedExpiry = (Long) session.getAttribute("reset_expiry");
            }
            
            // Verificar que tenemos los datos de validación
            if (storedCorreo == null || storedToken == null || storedExpiry == null) {
                out.println("<script>alert('Sesión de restablecimiento inválida. Por favor, inicia el proceso nuevamente.');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            // Verificar que el correo coincida
            if (!correo.equals(storedCorreo)) {
                out.println("<script>alert('Datos de restablecimiento inválidos. Por favor, inicia el proceso nuevamente.');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            // Verificar que el token coincida
            if (!resetToken.equals(storedToken)) {
                out.println("<script>alert('Token de restablecimiento inválido. Por favor, inicia el proceso nuevamente.');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            // Verificar que no haya expirado
            if (System.currentTimeMillis() > storedExpiry) {
                out.println("<script>alert('La sesión de restablecimiento ha expirado. Por favor, inicia el proceso nuevamente.');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            Connection c = null;
            PreparedStatement ps = null;
            
            try {
                // Conectar a la base de datos
                Class.forName("com.mysql.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost/Kidi", "root", "n0m3l0");
                
                // Verificar que el usuario existe
                PreparedStatement checkUser = c.prepareStatement("SELECT COUNT(*) FROM TUTOR WHERE CORREO_T = ?");
                checkUser.setString(1, correo);
                ResultSet rs = checkUser.executeQuery();
                
                if (rs.next() && rs.getInt(1) == 0) {
                    out.println("<script>alert('Usuario no encontrado. Por favor, verifica tu correo electrónico.');window.location='../iniciodesesion.jsp';</script>");
                    return;
                }
                
                rs.close();
                checkUser.close();
                
                // Hashear la nueva contraseña
                String contrasenaHash = BCrypt.hashpw(nuevaContrasena, BCrypt.gensalt(12));
                
                // Actualizar la contraseña en la base de datos
                String sql = "UPDATE TUTOR SET CONTRA_T = ? WHERE CORREO_T = ?";
                ps = c.prepareStatement(sql);
                ps.setString(1, contrasenaHash);
                ps.setString(2, correo);
                
                int rowsUpdated = ps.executeUpdate();
                
                if (rowsUpdated > 0) {
                    // Limpiar datos de sesión de restablecimiento
                    session.removeAttribute("reset_correo");
                    session.removeAttribute("reset_token");
                    session.removeAttribute("reset_expiry");
                    
                    // Limpiar cookies de restablecimiento
                    Cookie[] cookiesToClear = request.getCookies();
                    if (cookiesToClear != null) {
                        for (Cookie cookie : cookiesToClear) {
                            if (cookie.getName().startsWith("kidi_reset_")) {
                                cookie.setMaxAge(0);
                                cookie.setPath("/");
                                response.addCookie(cookie);
                            }
                        }
                    }
                    
                    // Mostrar mensaje de éxito y redirigir
                    out.println("<script>alert('¡Contraseña restablecida exitosamente! Ya puedes iniciar sesión con tu nueva contraseña.');window.location='../iniciodesesion.jsp';</script>");
                } else {
                    out.println("<script>alert('Error al actualizar la contraseña. Por favor, intenta nuevamente.');history.back();</script>");
                }
                
            } catch (ClassNotFoundException e) {
                out.println("<script>alert('Error de configuración de la base de datos: " + e.getMessage() + "');window.location='../iniciodesesion.jsp';</script>");
            } catch (SQLException e) {
                out.println("<script>alert('Error de base de datos: " + e.getMessage() + "');window.location='../iniciodesesion.jsp';</script>");
            } catch (Exception e) {
                out.println("<script>alert('Error al restablecer la contraseña: " + e.getMessage() + "');window.location='../iniciodesesion.jsp';</script>");
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (c != null) c.close();
                } catch (SQLException e) {
                    out.print("Error closing resources: " + e.getMessage());
                }
            }
        %>
    </body>
</html>