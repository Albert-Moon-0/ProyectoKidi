<%-- 
    Document   : invalidateSession
    Created on : March 2025
    Author     : Sistema Kidi
    Purpose    : Cerrar sesión de forma segura eliminando todas las credenciales y registros de BD
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*,java.net.*"%>
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
        
        .success-icon {
            color: #28a745;
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        
        .error-icon {
            color: #dc3545;
            font-size: 3rem;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <%
        boolean logoutSuccess = false;
        String errorMessage = "";
        String sessionToken = null;
        String userType = null;
        Integer userId = null;
        int sessionesEliminadas = 0;
        
        try {
            // PASO 1: Obtener datos de la sesión actual antes de cerrarla
            HttpSession userSession = request.getSession(false);
            if (userSession != null) {
                sessionToken = (String) userSession.getAttribute("sessionToken");
                userType = (String) userSession.getAttribute("userType");
                userId = (Integer) userSession.getAttribute("userId");
            }
            
            // PASO 2: Obtener token de cookies como respaldo
            if (sessionToken == null) {
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if ("kidi_session_token".equals(cookie.getName())) {
                            sessionToken = cookie.getValue();
                            break;
                        }
                    }
                }
            }
            
            // PASO 3: Conectar a la base de datos y limpiar sesiones
            Connection c = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi?useSSL=false&serverTimezone=UTC", "root", "n0m3l0");
                
                // Limpiar sesiones expiradas primero
                String cleanExpiredQuery = "DELETE FROM sesiones_activas WHERE expires_at < NOW()";
                ps = c.prepareStatement(cleanExpiredQuery);
                int expiredDeleted = ps.executeUpdate();
                ps.close();
                
                if (sessionToken != null && !sessionToken.trim().isEmpty()) {
                    // Eliminar la sesión específica por token
                    String deleteByTokenQuery = "DELETE FROM sesiones_activas WHERE session_token = ?";
                    ps = c.prepareStatement(deleteByTokenQuery);
                    ps.setString(1, sessionToken);
                    sessionesEliminadas += ps.executeUpdate();
                    ps.close();
                }
                
                // Si tenemos userId y userType, eliminar todas las sesiones del usuario como medida adicional
                if (userId != null && userType != null) {
                    String deleteByUserQuery = "DELETE FROM sesiones_activas WHERE user_id = ? AND user_type = ?";
                    ps = c.prepareStatement(deleteByUserQuery);
                    ps.setInt(1, userId);
                    ps.setString(2, userType);
                    sessionesEliminadas += ps.executeUpdate();
                    ps.close();
                }
                
                // Si no tenemos información específica, intentar limpiar por IP (menos seguro pero funcional)
                if (sessionToken == null && userId == null) {
                    String clientIP = request.getRemoteAddr();
                    String deleteByIPQuery = "DELETE FROM sesiones_activas WHERE ip_address = ?";
                    ps = c.prepareStatement(deleteByIPQuery);
                    ps.setString(1, clientIP);
                    sessionesEliminadas += ps.executeUpdate();
                    ps.close();
                }
                
            } catch (Exception dbEx) {
                errorMessage += "Error BD: " + dbEx.getMessage() + " ";
                System.out.println("Error al eliminar sesiones de BD: " + dbEx.getMessage());
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (c != null) c.close();
                } catch (SQLException e) {
                    System.out.println("Error cerrando recursos BD: " + e.getMessage());
                }
            }
            
            // PASO 4: Invalidar sesión HTTP tradicional
            if (userSession != null) {
                try {
                    userSession.removeAttribute("userEmail");
                    userSession.removeAttribute("userType");
                    userSession.removeAttribute("userName");
                    userSession.removeAttribute("userId");
                    userSession.removeAttribute("sessionToken");
                    userSession.invalidate();
                } catch (IllegalStateException e) {
                    // Sesión ya invalidada, esto es normal
                }
            }
            
            // PASO 5: Eliminar todas las cookies relacionadas con Kidi
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().startsWith("kidi_") || 
                        "JSESSIONID".equals(cookie.getName())) {
                        
                        Cookie expiredCookie = new Cookie(cookie.getName(), "");
                        expiredCookie.setPath("/");
                        expiredCookie.setMaxAge(0);
                        expiredCookie.setSecure(false);
                        expiredCookie.setHttpOnly(false);
                        response.addCookie(expiredCookie);
                    }
                }
            }
            
            // PASO 6: Headers de seguridad para evitar cache
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, private");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.setHeader("X-Frame-Options", "DENY");
            response.setHeader("X-Content-Type-Options", "nosniff");
            response.setHeader("Referrer-Policy", "no-referrer");
            
            logoutSuccess = true;
            
        } catch (Exception e) {
            errorMessage = e.getMessage();
            System.out.println("Error general al cerrar sesión: " + e.getMessage());
            e.printStackTrace();
        }
    %>
    
    <div class="logout-container">
        <% if (logoutSuccess) { %>
            <div class="success-icon">✓</div>
            <h3 class="logout-title text-success">Sesión Cerrada Exitosamente</h3>
            <p class="logout-message">
                Su sesión ha sido cerrada correctamente.<br>
                <small class="text-muted">
                    Sesiones eliminadas: <%= sessionesEliminadas %><br>
                    Será redirigido al inicio de sesión en 3 segundos.
                </small>
            </p>
            
            <div class="spinner-border spinner-border-sm" role="status">
                <span class="visually-hidden">Redirigiendo...</span>
            </div>
            
            <script>
                // Limpiar el historial para evitar volver atrás
                if (window.history && window.history.replaceState) {
                    window.history.replaceState(null, null, window.location.href);
                }
                
                // Limpiar almacenamiento local si existe
                if (typeof(Storage) !== "undefined") {
                    localStorage.clear();
                    sessionStorage.clear();
                }
                
                // Redireccionar después de 3 segundos
                setTimeout(function() {
                    window.location.replace('../iniciodesesion.jsp');
                }, 3000);
                
                // Prevenir el botón de retroceso del navegador
                window.addEventListener('beforeunload', function() {
                    window.location.replace('../iniciodesesion.jsp');
                });
            </script>
        <% } else { %>
            <div class="error-icon">⚠</div>
            <h3 class="logout-title text-warning">Error al Cerrar Sesión</h3>
            <p class="logout-message">
                Hubo un problema al cerrar la sesión, pero será redirigido al inicio por seguridad.
            </p>
            <% if (!errorMessage.isEmpty()) { %>
                <div class="alert alert-warning small">
                    <strong>Detalles:</strong> <%= errorMessage %>
                </div>
            <% } %>
            
            <script>
                // Incluso con error, limpiar todo lo posible
                if (typeof(Storage) !== "undefined") {
                    localStorage.clear();
                    sessionStorage.clear();
                }
                
                setTimeout(function() {
                    window.location.replace('../iniciodesesion.jsp');
                }, 4000);
            </script>
        <% } %>
        
        <!-- Botón manual por si JavaScript falla -->
        <div class="mt-3">
            <a href="../iniciodesesion.jsp" class="btn btn-primary btn-sm">
                Ir al Inicio de Sesión Manualmente
            </a>
        </div>
    </div>
    
    <!-- Fallback en caso de que JavaScript esté deshabilitado -->
    <noscript>
        <meta http-equiv="refresh" content="5;url=../iniciodesesion.jsp">
        <div style="position: fixed; bottom: 20px; left: 20px; background: #f8f9fa; padding: 15px; border-radius: 10px; border: 1px solid #dee2e6;">
            <p><strong>JavaScript deshabilitado.</strong><br>
            Si no es redirigido automáticamente en 5 segundos, 
            <a href="../iniciodesesion.jsp" style="color: #007bff; text-decoration: underline;">haga clic aquí</a>.
            </p>
        </div>
    </noscript>
</body>
</html>