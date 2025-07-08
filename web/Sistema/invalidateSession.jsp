<%-- 
    Document   : invalidateSession
    Created on : March 2025
    Author     : Sistema Kidi
    Purpose    : Cerrar sesión de forma segura eliminando todas las credenciales
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*,java.util.concurrent.ConcurrentHashMap" %>
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
    String correoUsuario = null;

    System.out.println("🔁 [DEBUG] Entrando a invalidateSession.jsp");

    try {
        // OBTENER SESIÓN ACTUAL
        HttpSession userSession = request.getSession(false);
        
        if (userSession != null) {
            // Obtener correo antes de invalidar la sesión
            try {
                correoUsuario = (String) userSession.getAttribute("userEmail");
                System.out.println("🔁 [DEBUG] Correo del usuario: " + correoUsuario);
            } catch (IllegalStateException e) {
                System.out.println("⚠️ [WARN] La sesión ya estaba invalidada.");
            }
            
            // OBTENER CONTEXTO Y MAPA DE SESIONES ACTIVAS
            ServletContext appContext = getServletContext();
            ConcurrentHashMap<String, HttpSession> activeSessions = null;
            
            // Sincronizar acceso al mapa global
            synchronized(appContext) {
                Object sessionMapObj = appContext.getAttribute("activeSessions");
                if (sessionMapObj != null) {
                    try {
                        activeSessions = (ConcurrentHashMap<String, HttpSession>) sessionMapObj;
                        System.out.println("🔁 [DEBUG] Mapa de sesiones obtenido correctamente.");
                    } catch (ClassCastException cce) {
                        System.out.println("❌ [ERROR] activeSessions no es del tipo esperado: " + cce.getMessage());
                        errorMessage = "Error interno de sesión.";
                        
                        // Recrear el mapa si hay problemas
                        activeSessions = new ConcurrentHashMap<>();
                        appContext.setAttribute("activeSessions", activeSessions);
                    }
                } else {
                    System.out.println("⚠️ [WARN] No existe mapa de sesiones activas.");
                    activeSessions = new ConcurrentHashMap<>();
                    appContext.setAttribute("activeSessions", activeSessions);
                }
            }
            
            // REMOVER DEL MAPA DE SESIONES ACTIVAS
            if (correoUsuario != null && activeSessions != null) {
                HttpSession removedSession = activeSessions.remove(correoUsuario);
                if (removedSession != null) {
                    System.out.println("✅ [INFO] Sesión eliminada del mapa global para: " + correoUsuario);
                } else {
                    System.out.println("⚠️ [WARN] No se encontró sesión en el mapa para: " + correoUsuario);
                }
            }
            
            // LIMPIAR ATRIBUTOS DE SESIÓN
            try {
                userSession.removeAttribute("userEmail");
                userSession.removeAttribute("userType");
                userSession.removeAttribute("userName");
                userSession.removeAttribute("userId");
                
                // Invalidar la sesión
                userSession.invalidate();
                System.out.println("✅ [INFO] Sesión invalidada correctamente.");
                
                logoutSuccess = true;
                
            } catch (IllegalStateException e) {
                System.out.println("⚠️ [WARN] La sesión ya estaba invalidada: " + e.getMessage());
                logoutSuccess = true; // Considerar como exitoso
            }
            
        } else {
            System.out.println("⚠️ [WARN] No hay sesión activa que invalidar.");
            logoutSuccess = true; // Considerar como exitoso para continuar con el logout visual
        }
        
        // ELIMINAR COOKIES PERSONALIZADAS
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
        
        // ELIMINAR COOKIE DE SESIÓN JSESSIONID
        Cookie sessionCookie = new Cookie("JSESSIONID", "");
        sessionCookie.setPath("/");
        sessionCookie.setMaxAge(0);
        sessionCookie.setSecure(false);
        response.addCookie(sessionCookie);
        System.out.println("✅ [INFO] Cookie JSESSIONID eliminada.");
        
    } catch (Exception e) {
        errorMessage = "Error durante el cierre de sesión: " + e.getMessage();
        System.out.println("❌ [ERROR] " + errorMessage);
        e.printStackTrace();
        logoutSuccess = false;
    }
    
    // HEADERS DE SEGURIDAD
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, private");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    response.setHeader("X-Frame-Options", "DENY");
    response.setHeader("X-Content-Type-Options", "nosniff");
    
    System.out.println("🔁 [DEBUG] Logout success: " + logoutSuccess);
%>

<div class="logout-container">
    <% if (logoutSuccess) { %>
        <div class="spinner-border" role="status">
            <span class="visually-hidden">Cerrando sesión...</span>
        </div>
        <h3 class="logout-title">Cerrando Sesión</h3>
        <p class="logout-message">Su sesión ha sido cerrada correctamente.<br>Será redirigido al inicio de sesión.</p>
        <script>
            // Limpiar toda la historia del navegador
            if (window.history && window.history.pushState) {
                window.history.replaceState(null, null, window.location.href);
            }
            
            // Limpiar cache del navegador
            if (window.caches) {
                caches.keys().then(function(names) {
                    names.forEach(function(name) {
                        caches.delete(name);
                    });
                });
            }
            
            // Redirigir después de 2 segundos
            setTimeout(function() {
                window.location.replace('../iniciodesesion.jsp');
            }, 2000);
        </script>
    <% } else { %>
        <h3 class="logout-title text-warning">Error al Cerrar Sesión</h3>
        <p class="logout-message">Hubo un problema al cerrar la sesión, pero será redirigido al inicio.</p>
        <% if (!errorMessage.isEmpty()) { %>
            <p class="text-muted small">Error: <%= errorMessage %></p>
        <% } %>
        <script>
            // Forzar redirección incluso si hay error
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