<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cerrando Sesión...</title>
</head>
<body>
    <%
        try {
            // MÉTODO 1: Invalidar sesión tradicional de JSP
            HttpSession userSession = request.getSession(false);
            if (userSession != null) {
                userSession.invalidate();
            }
            
            // MÉTODO 2: Eliminar cookies personalizadas
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("kidi_user_email".equals(cookie.getName()) || 
                        "kidi_user_type".equals(cookie.getName())) {
                        
                        // Crear cookie con el mismo nombre pero expirada
                        Cookie expiredCookie = new Cookie(cookie.getName(), "");
                        expiredCookie.setPath("/");
                        expiredCookie.setMaxAge(0); // Expira inmediatamente
                        expiredCookie.setSecure(false);
                        expiredCookie.setHttpOnly(false);
                        response.addCookie(expiredCookie);
                    }
                }
            }
            
            // MÉTODO 3: Limpiar cualquier atributo de sesión adicional
            // (por si hay otras sesiones activas)
            HttpSession currentSession = request.getSession(false);
            if (currentSession != null) {
                // Remover atributos específicos antes de invalidar completamente
                currentSession.removeAttribute("userEmail");
                currentSession.removeAttribute("userType");
                currentSession.removeAttribute("userName");
                currentSession.removeAttribute("userId");
                
                // Invalidar completamente
                currentSession.invalidate();
            }
            
            // MÉTODO 4: Headers para evitar cache del navegador
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            
            // Mensaje de confirmación y redirección
            out.println("<script>");
            out.println("alert('Sesión cerrada correctamente');");
            out.println("window.location.replace('../iniciodesesion.jsp');"); // replace para evitar volver atrás
            out.println("</script>");
            
        } catch (Exception e) {
            // En caso de error, al menos redirigir al login
            out.println("<script>");
            out.println("alert('Error al cerrar sesión, pero será redirigido al inicio');");
            out.println("window.location.replace('../iniciodesesion.jsp');");
            out.println("</script>");
            
            // Log del error para debugging
            System.out.println("Error al cerrar sesión: " + e.getMessage());
            e.printStackTrace();
        }
    %>
    
    <!-- Fallback en caso de que JavaScript esté deshabilitado -->
    <noscript>
        <meta http-equiv="refresh" content="2;url=../iniciodesesion.jsp">
        <p>Sesión cerrada. Si no es redirigido automáticamente, <a href="../iniciodesesion.jsp">haga clic aquí</a>.</p>
    </noscript>
    
    <!-- Mensaje mientras se procesa -->
    <div style="text-align: center; margin-top: 100px; font-family: Arial, sans-serif;">
        <h3>Cerrando sesión...</h3>
        <p>Por favor espere un momento.</p>
    </div>
</body>
</html>