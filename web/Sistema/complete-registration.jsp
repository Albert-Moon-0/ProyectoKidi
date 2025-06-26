<%-- 
    Document   : complete-registration
    Created on : 11 abr. 2025, 20:57:09
    Author     : P500
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.net.URLDecoder"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Completando Registro</title>
    </head>
    <body>
        <%
            String enteredCode = request.getParameter("code");
            
            // Variables para almacenar los datos de registro
            String nombre = null;
            String correo = null;
            String contrasena = null;
            String savedCode = null;
            Long codeExpiry = null;
            
            // MÉTODO 1: Intentar obtener de cookies personalizadas
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("kidi_reg_nombre".equals(cookie.getName())) {
                        nombre = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    } else if ("kidi_reg_correo".equals(cookie.getName())) {
                        correo = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    } else if ("kidi_reg_contrasena".equals(cookie.getName())) {
                        contrasena = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    } else if ("kidi_reg_code".equals(cookie.getName())) {
                        savedCode = cookie.getValue();
                    } else if ("kidi_reg_expiry".equals(cookie.getName())) {
                        try {
                            codeExpiry = Long.parseLong(cookie.getValue());
                        } catch (NumberFormatException e) {
                            // Ignorar si no se puede parsear
                        }
                    }
                }
            }
            
            // MÉTODO 2: Si no hay cookies, intentar obtener de parámetros URL
            if (nombre == null || correo == null || contrasena == null || savedCode == null || codeExpiry == null) {
                String urlNombre = request.getParameter("n");
                String urlCorreo = request.getParameter("c");
                String urlContrasena = request.getParameter("p");
                String urlCode = request.getParameter("vc");
                String urlExpiry = request.getParameter("ve");
                
                if (urlNombre != null && urlCorreo != null && urlContrasena != null && urlCode != null && urlExpiry != null) {
                    nombre = URLDecoder.decode(urlNombre, "UTF-8");
                    correo = URLDecoder.decode(urlCorreo, "UTF-8");
                    contrasena = URLDecoder.decode(urlContrasena, "UTF-8");
                    savedCode = urlCode;
                    try {
                        codeExpiry = Long.parseLong(urlExpiry);
                    } catch (NumberFormatException e) {
                        // Ignorar si no se puede parsear
                    }
                    
                    // Si obtenemos datos de URL, crear cookies para la próxima vez
                    if (nombre != null && correo != null && contrasena != null && savedCode != null && codeExpiry != null) {
                        Cookie nombreCookie = new Cookie("kidi_reg_nombre", java.net.URLEncoder.encode(nombre, "UTF-8"));
                        Cookie correoCookie = new Cookie("kidi_reg_correo", java.net.URLEncoder.encode(correo, "UTF-8"));
                        Cookie contrasenaCookie = new Cookie("kidi_reg_contrasena", java.net.URLEncoder.encode(contrasena, "UTF-8"));
                        Cookie codeCookie = new Cookie("kidi_reg_code", savedCode);
                        Cookie expiryCookie = new Cookie("kidi_reg_expiry", String.valueOf(codeExpiry));
                        
                        nombreCookie.setPath("/");
                        correoCookie.setPath("/");
                        contrasenaCookie.setPath("/");
                        codeCookie.setPath("/");
                        expiryCookie.setPath("/");
                        
                        nombreCookie.setMaxAge(60 * 30);
                        correoCookie.setMaxAge(60 * 30);
                        contrasenaCookie.setMaxAge(60 * 30);
                        codeCookie.setMaxAge(60 * 30);
                        expiryCookie.setMaxAge(60 * 30);
                        
                        nombreCookie.setSecure(false);
                        correoCookie.setSecure(false);
                        contrasenaCookie.setSecure(false);
                        codeCookie.setSecure(false);
                        expiryCookie.setSecure(false);
                        
                        response.addCookie(nombreCookie);
                        response.addCookie(correoCookie);
                        response.addCookie(contrasenaCookie);
                        response.addCookie(codeCookie);
                        response.addCookie(expiryCookie);
                    }
                }
            }
            
            // MÉTODO 3: Como último recurso, intentar sesión tradicional
            if (nombre == null || correo == null || contrasena == null || savedCode == null || codeExpiry == null) {
                nombre = (String) session.getAttribute("nombre");
                correo = (String) session.getAttribute("correo");
                contrasena = (String) session.getAttribute("contrasena");
                savedCode = (String) session.getAttribute("verificationCode");
                codeExpiry = (Long) session.getAttribute("codeExpiry");
            }
            
            // Verificar que tenemos los datos necesarios
            if (nombre == null || correo == null || contrasena == null || savedCode == null || codeExpiry == null) {
                out.println("<script>alert('Información de registro incompleta. Por favor, inicia el registro nuevamente.');window.location='../Registro.jsp';</script>");
                return;
            }
            
            // Imagen por defecto (ejemplo: 1)
            int idFotoDefault = 1;
            
            // Verificar si el código ha expirado
            if (System.currentTimeMillis() > codeExpiry) {
                // Limpiar cookies de registro expiradas
                Cookie[] cookiesToClear = request.getCookies();
                if (cookiesToClear != null) {
                    for (Cookie cookie : cookiesToClear) {
                        if (cookie.getName().startsWith("kidi_reg_")) {
                            cookie.setMaxAge(0);
                            cookie.setPath("/");
                            response.addCookie(cookie);
                        }
                    }
                }
                
                out.println("<script>alert('El código de verificación ha expirado. Por favor, solicita un nuevo código.');window.location='verify-email.jsp';</script>");
                return;
            }
            
            // Verificar si el código es correcto
            if (!savedCode.equals(enteredCode)) {
                response.sendRedirect("verify-email.jsp?error=invalid");
                return;
            }
            
            Connection c = null;
            PreparedStatement ps = null;
            
            try {
                // Insertar usuario en la base de datos
                Class.forName("com.mysql.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost/Kidi", "root", "n0m3l0");
                
                String contrasenaHash = BCrypt.hashpw(contrasena, BCrypt.gensalt(12));                        
                
                String sql = "INSERT INTO TUTOR (NOMBRE_T, CORREO_T, CONTRA_T,ID_FOTO) VALUES (?, ?, ?,?)";
                ps = c.prepareStatement(sql);
                ps.setString(1, nombre);
                ps.setString(2, correo);
                ps.setString(3, contrasenaHash);
                ps.setInt(4, idFotoDefault);
                ps.executeUpdate();
                
                // Limpiar datos de sesión
                session.removeAttribute("nombre");
                session.removeAttribute("correo");
                session.removeAttribute("contrasena");
                session.removeAttribute("verificationCode");
                session.removeAttribute("codeExpiry");
                
                // Limpiar cookies de registro
                Cookie[] cookiesToClear = request.getCookies();
                if (cookiesToClear != null) {
                    for (Cookie cookie : cookiesToClear) {
                        if (cookie.getName().startsWith("kidi_reg_")) {
                            cookie.setMaxAge(0);
                            cookie.setPath("/");
                            response.addCookie(cookie);
                        }
                    }
                }
                
                // Mostrar mensaje de éxito y redirigir
                out.println("<script>alert('¡Registro completado exitosamente!');window.location='../iniciodesesion.jsp';</script>");
                
            } catch (Exception e) {
                out.println("<script>alert('Error al completar el registro: " + e.getMessage() + "');window.location='Registro.jsp';</script>");
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