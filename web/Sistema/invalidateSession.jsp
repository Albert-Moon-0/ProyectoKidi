<%-- 
    Document   : invalidateSession
    Created on : March 2025
    Author     : Sistema Kidi
    Purpose    : Cerrar sesión de forma segura eliminando todas las credenciales
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*" %>
<%@page import="javax.servlet.http.*, javax.servlet.*" %>
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

    System.out.println("🔁 [DEBUG] Entrando a invalidateSession.jsp");

    HttpSession userSession = request.getSession(false);

    if (userSession != null) {
        try {
            System.out.println("🔁 [DEBUG] Sesión detectada. Intentando limpiar...");

            // Obtener contexto y mapa global de sesiones activas
            ServletContext appContext = getServletContext();
            Map<String, HttpSession> activeSessions = null;
            Object sessionMapObj = appContext.getAttribute("activeSessions");

            if (sessionMapObj instanceof Map) {
                try {
                    activeSessions = (Map<String, HttpSession>) sessionMapObj;
                    System.out.println("🔁 [DEBUG] Mapa de sesiones obtenido correctamente.");
                } catch (ClassCastException cce) {
                    System.out.println("❌ [ERROR] activeSessions no es del tipo esperado: " + cce.getMessage());
                    errorMessage = "Error interno de sesión. Contacte al administrador.";
                }
            }

            // Obtener correo del usuario
            String correoUsuario = null;
            try {
                correoUsuario = (String) userSession.getAttribute("userEmail");
                System.out.println("🔁 [DEBUG] Correo del usuario: " + correoUsuario);
            } catch (IllegalStateException e) {
                System.out.println("⚠️ [WARN] La sesión ya estaba invalidada.");
            }

            // Remover del mapa si existe
            if (correoUsuario != null && activeSessions != null) {
                activeSessions.remove(correoUsuario);
                System.out.println("✅ [INFO] Sesión eliminada del mapa global.");
            }

            // Invalidar atributos y sesión
            userSession.removeAttribute("userEmail");
            userSession.removeAttribute("userType");
            userSession.removeAttribute("userName");
            userSession.removeAttribute("userId");
            userSession.invalidate();
            System.out.println("✅ [INFO] Sesión invalidada correctamente.");

            logoutSuccess = true;

        } catch (Exception e) {
            errorMessage = e.getMessage();
            System.out.println("❌ [ERROR] Fallo al cerrar sesión: " + e.getMessage());
            e.printStackTrace();
        }
    } else {
        System.out.println("⚠️ [WARN] No hay sesión activa que invalidar.");
        logoutSuccess = true; // aún así se puede seguir con logout visual
    }

    // MÉTODO 2: Eliminar cookies personalizadas
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("kidi_user_email".equals(cookie.getName()) ||
                "kidi_user_type".equals(cookie.getName()) ||
                cookie.getName().startsWith("kidi_")) {

                Cookie expiredCookie = new Cookie(cookie.getName(), "");
                expiredCookie.setPath("/");
                expiredCookie.setMaxAge(0);
                expiredCookie.setSecure(false);
                expiredCookie.setHttpOnly(false);
                response.addCookie(expiredCookie);
                System.out.println("✅ [INFO] Cookie eliminada: " + cookie.getName());
            }
        }
    }

    // MÉTODO 4: Headers de seguridad
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, private");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    response.setHeader("X-Frame-Options", "DENY");
    response.setHeader("X-Content-Type-Options", "nosniff");
%>

<div class="logout-container">
    <% if (logoutSuccess) { %>
        <div class="spinner-border" role="status">
            <span class="visually-hidden">Cerrando sesión...</span>
        </div>
        <h3 class="logout-title">Cerrando Sesión</h3>
        <p class="logout-message">Su sesión ha sido cerrada correctamente.<br>Será redirigido al inicio de sesión.</p>
        <script>
            setTimeout(function() {
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

<noscript>
    <meta http-equiv="refresh" content="3;url=../iniciodesesion.jsp">
    <div style="position: fixed; bottom: 20px; left: 20px; background: #f8f9fa; padding: 15px; border-radius: 10px;">
        <p>JavaScript deshabilitado. Si no es redirigido automáticamente, <a href="../iniciodesesion.jsp">haga clic aquí</a>.</p>
    </div>
</noscript>
</body>
</html>
