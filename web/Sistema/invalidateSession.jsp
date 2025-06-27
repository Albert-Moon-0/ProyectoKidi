<%-- 
    Document   : invalidateSession
    Created on : March 2025
    Author     : Sistema Kidi
    Purpose    : Cerrar sesión de forma segura eliminando todas las credenciales
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cerrando Sesión - Kidi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .logout-container {
            background: white;
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 400px;
        }
        
        .spinner-border {
            width: 3rem;
            height: 3rem;
            color: #667eea;
        }
        
        .logout-title {
            color: #333;
            margin-bottom: 1rem;
            font-weight: 600;
        }
        
        .logout-message {
            color: #666;
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>
    <%
        boolean logoutSuccess = false;
        String errorMessage = "";
        
        try {
            // MÉTODO 1: Invalidar sesión tradicional de JSP
            HttpSession userSession = request.getSession(false);
            if (userSession != null) {
                // Remover atributos específicos antes de invalidar completamente
                userSession.removeAttribute("userEmail");
                userSession.removeAttribute("userType");
                userSession.removeAttribute("userName");
                userSession.removeAttribute("userId");
                
                // Invalidar completamente
                userSession.invalidate();
            }
            
            // MÉTODO 2: Eliminar cookies personalizadas
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("kidi_user_email".equals(cookie.getName()) || 
                        "kidi_user_type".equals(cookie.getName()) ||
                        cookie.getName().startsWith("kidi_")) {
                        
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
            
            // MÉTODO 3: Limpiar cualquier sesión adicional que pueda existir
            HttpSession currentSession = request.getSession(false);
            if (currentSession != null) {
                try {
                    currentSession.invalidate();
                } catch (IllegalStateException e) {
                    // Sesión ya invalidada, esto es normal
                }
            }
            
            // MÉTODO 4: Headers de seguridad para evitar cache
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, private");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.setHeader("X-Frame-Options", "DENY");
            response.setHeader("X-Content-Type-Options", "nosniff");
            
            logoutSuccess = true;
            
        } catch (Exception e) {
            errorMessage = e.getMessage();
            // Log del error para debugging
            System.out.println("Error al cerrar sesión: " + e.getMessage());
            e.printStackTrace();
        }
    %>
    
    <div class="logout-container">
        <% if (logoutSuccess) { %>
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Cerrando sesión...</span>
            </div>
            <h3 class="logout-title">Cerrando Sesión</h3>
            <p class="logout-message">Su sesión ha sido cerrada correctamente.<br>Será redirigido al inicio de sesión.</p>
            
            <script>
                // Esperar un momento para que el usuario vea el mensaje
                setTimeout(function() {
                    // Limpiar historial para evitar volver atrás
                    window.history.replaceState(null, null, window.location.href);
                    window.location.replace('../iniciodesesion.jsp');
                }, 2000);
            </script>
        <% } else { %>
            <h3 class="logout-title text-warning">Error al Cerrar Sesión</h3>
            <p class="logout-message">Hubo un problema al cerrar la sesión, pero será redirigido al inicio.</p>
            <p class="text-muted small">Error: <%= errorMessage %></p>
            
            <script>
                setTimeout(function() {
                    window.location.replace('../iniciodesesion.jsp');
                }, 3000);
            </script>
        <% } %>
    </div>
    
    <!-- Fallback en caso de que JavaScript esté deshabilitado -->
    <noscript>
        <meta http-equiv="refresh" content="3;url=../iniciodesesion.jsp">
        <div style="position: fixed; bottom: 20px; left: 20px; background: #f8f9fa; padding: 15px; border-radius: 10px;">
            <p>JavaScript deshabilitado. Si no es redirigido automáticamente, <a href="../iniciodesesion.jsp">haga clic aquí</a>.</p>
        </div>
    </noscript>
</body>
</html>