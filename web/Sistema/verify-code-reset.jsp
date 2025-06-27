<%-- 
    Document   : verify-code-reset
    Created on : 27 jun 2025, 15:21:26
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.net.URLDecoder, java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verificación de Código</title>
    </head>
    <body>
        <%
            String enteredCode = request.getParameter("code");
            
            // Variables para almacenar los datos de restablecimiento
            String correo = null;
            String savedCode = null;
            Long codeExpiry = null;
            
            // MÉTODO 1: Intentar obtener de cookies personalizadas
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("kidi_reg_correo".equals(cookie.getName())) {
                        correo = URLDecoder.decode(cookie.getValue(), "UTF-8");
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
            if (correo == null || savedCode == null || codeExpiry == null) {
                String urlCorreo = request.getParameter("c");
                String urlCode = request.getParameter("vc");
                String urlExpiry = request.getParameter("ve");
                
                if (urlCorreo != null && urlCode != null && urlExpiry != null) {
                    correo = URLDecoder.decode(urlCorreo, "UTF-8");
                    savedCode = urlCode;
                    try {
                        codeExpiry = Long.parseLong(urlExpiry);
                    } catch (NumberFormatException e) {
                        // Ignorar si no se puede parsear
                    }
                }
            }
            
            // MÉTODO 3: Como último recurso, intentar sesión tradicional
            if (correo == null || savedCode == null || codeExpiry == null) {
                correo = (String) session.getAttribute("correo");
                savedCode = (String) session.getAttribute("verificationCode");
                codeExpiry = (Long) session.getAttribute("codeExpiry");
            }
            
            // Verificar que tenemos los datos necesarios
            if (correo == null || savedCode == null || codeExpiry == null) {
                out.println("<script>alert('Información de restablecimiento incompleta. Por favor, inicia el proceso nuevamente.');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            // Verificar si el código ha expirado
            if (System.currentTimeMillis() > codeExpiry) {
                // Limpiar cookies de restablecimiento expiradas
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
                
                out.println("<script>alert('El código de verificación ha expirado. Por favor, solicita un nuevo código.');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            // Verificar si el código es correcto
            if (!savedCode.equals(enteredCode)) {
                out.println("<script>alert('Código de verificación incorrecto. Intenta nuevamente.');history.back();</script>");
                return;
            }
            
            // Código correcto - crear cookies/sesión para el siguiente paso
            Cookie resetCorreoCookie = new Cookie("kidi_reset_correo", URLEncoder.encode(correo, "UTF-8"));
            Cookie resetTokenCookie = new Cookie("kidi_reset_token", savedCode + "_" + System.currentTimeMillis());
            Cookie resetExpiryCookie = new Cookie("kidi_reset_expiry", String.valueOf(System.currentTimeMillis() + 15*60*1000)); // 15 minutos más
            
            resetCorreoCookie.setPath("/");
            resetTokenCookie.setPath("/");
            resetExpiryCookie.setPath("/");
            
            resetCorreoCookie.setMaxAge(60 * 15); // 15 minutos
            resetTokenCookie.setMaxAge(60 * 15);
            resetExpiryCookie.setMaxAge(60 * 15);
            
            resetCorreoCookie.setSecure(false);
            resetTokenCookie.setSecure(false);
            resetExpiryCookie.setSecure(false);
            
            response.addCookie(resetCorreoCookie);
            response.addCookie(resetTokenCookie);
            response.addCookie(resetExpiryCookie);
            
            // También guardar en sesión
            session.setAttribute("reset_correo", correo);
            session.setAttribute("reset_token", savedCode + "_" + System.currentTimeMillis());
            session.setAttribute("reset_expiry", System.currentTimeMillis() + 15*60*1000);
            
            // Limpiar cookies de verificación anteriores
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
            
            // Limpiar sesión de verificación
            session.removeAttribute("verificationCode");
            session.removeAttribute("correo");
            session.removeAttribute("codeExpiry");
            
            // Redirigir al formulario de nueva contraseña
            String redirectUrl = "formNuevaContra.jsp?c=" + URLEncoder.encode(correo, "UTF-8") + 
                                "&rt=" + (savedCode + "_" + System.currentTimeMillis()) +
                                "&re=" + (System.currentTimeMillis() + 15*60*1000);
            
            out.println("<script>alert('¡Código verificado correctamente! Ahora puedes establecer tu nueva contraseña.');window.location='" + redirectUrl + "';</script>");
        %>
    </body>
</html>