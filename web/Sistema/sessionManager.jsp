<%-- 
    Document   : sessionManager
    Created on : March 2025
    Author     : Sistema Kidi
    Purpose    : Administrar sesiones activas del sistema
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>
<%
    // Verificar que solo administradores puedan acceder
    HttpSession userSession = request.getSession(false);
    if (userSession == null || !"ADMIN".equals(userSession.getAttribute("userType"))) {
        response.sendRedirect("../iniciodesesion.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Administrador de Sesiones - Kidi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
        }
        
        .container-fluid {
            padding: 2rem;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .badge-admin { background-color: #dc3545; }
        .badge-tutor { background-color: #ffc107; }
        .badge-usuario { background-color: #28a745; }
        
        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
        }
        
        .table-responsive {
            max-height: 600px;
            overflow-y: auto;
        }
        
        .session-active {
            background-color: #d4edda;
        }
        
        .session-expiring {
            background-color: #fff3cd;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">
                            <i class="fas fa-users"></i> Administrador de Sesiones Activas
                        </h4>
                        <div>
                            <button class="btn btn-warning btn-sm" onclick="limpiarExpiradas()">
                                Limpiar Expiradas
                            </button>
                            <button class="btn btn-info btn-sm" onclick="location.reload()">
                                Actualizar
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <%
                            // Procesar acciones si las hay
                            String action = request.getParameter("action");
                            String sessionId = request.getParameter("sessionId");
                            String message = "";
                            
                            if ("eliminar".equals(action) && sessionId != null) {
                                Connection c = null;
                                PreparedStatement ps = null;
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    c = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi?useSSL=false&serverTimezone=UTC", "root", "n0m3l0");
                                    
                                    String deleteQuery = "DELETE FROM sesiones_activas WHERE id = ?";
                                    ps = c.prepareStatement(deleteQuery);
                                    ps.setInt(1, Integer.parseInt(sessionId));
                                    int deleted = ps.executeUpdate();
                                    
                                    message = deleted > 0 ? "Sesión eliminada exitosamente" : "No se pudo eliminar la sesión";
                                } catch (Exception e) {
                                    message = "Error: " + e.getMessage();
                                } finally {
                                    if (ps != null) ps.close();
                                    if (c != null) c.close();
                                }
                            }
                            
                            if ("limpiar".equals(action)) {
                                Connection c = null;
                                PreparedStatement ps = null;
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    c = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi?useSSL=false&serverTimezone=UTC", "root", "n0m3l0");
                                    
                                    String cleanQuery = "DELETE FROM sesiones_activas WHERE expires_at < NOW()";
                                    ps = c.prepareStatement(cleanQuery);
                                    int deleted = ps.executeUpdate();
                                    
                                    message = "Se eliminaron " + deleted + " sesiones expiradas";
                                } catch (Exception e) {
                                    message = "Error: " + e.getMessage();
                                } finally {
                                    if (ps != null) ps.close();
                                    if (c != null) c.close();
                                }
                            }
                        %>
                        
                        <% if (!message.isEmpty()) { %>
                            <div class="alert alert-info alert-dismissible fade show">
                                <%= message %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        <% } %>
                        
                        <!-- Estadísticas -->
                        <div class="row mb-4">
                            <%
                                Connection c = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                
                                int totalSesiones = 0;
                                int sesionesActivas = 0;
                                int sesionesExpiradas = 0;
                                Map<String, Integer> sessionsByType = new HashMap<>();
                                
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    c = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi?useSSL=false&serverTimezone=UTC", "root", "n0m3l0");
                                    
                                    // Total de sesiones
                                    ps = c.prepareStatement("SELECT COUNT(*) as total FROM sesiones_activas");
                                    rs = ps.executeQuery();
                                    if (rs.next()) totalSesiones = rs.getInt("total");
                                    rs.close(); ps.close();
                                    
                                    // Sesiones activas
                                    ps = c.prepareStatement("SELECT COUNT(*) as activas FROM sesiones_activas WHERE expires_at > NOW()");
                                    rs = ps.executeQuery();
                                    if (rs.next()) sesionesActivas = rs.getInt("activas");
                                    rs.close(); ps.close();
                                    
                                    // Sesiones expiradas
                                    ps = c.prepareStatement("SELECT COUNT(*) as expiradas FROM sesiones_activas WHERE expires_at <= NOW()");
                                    rs = ps.executeQuery();
                                    if (rs.next()) sesionesExpiradas = rs.getInt("expiradas");
                                    rs.close(); ps.close();
                                    
                                    // Sesiones por tipo
                                    ps = c.prepareStatement("SELECT user_type, COUNT(*) as count FROM sesiones_activas WHERE expires_at > NOW() GROUP BY user_type");
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                        sessionsByType.put(rs.getString("user_type"), rs.getInt("count"));
                                    }
                                    rs.close(); ps.close();
                                    
                                } catch (Exception e) {
                                    out.println("<div class='alert alert-danger'>Error al obtener estadísticas: " + e.getMessage() + "</div>");
                                }
                            %>
                            
                            <div class="col-md-3">
                                <div class="card bg-primary text-white">
                                    <div class="card-body">
                                        <h5>Total Sesiones</h5>
                                        <h3><%= totalSesiones %></h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card bg-success text-white">
                                    <div class="card-body">
                                        <h5>Sesiones Activas</h5>
                                        <h3><%= sesionesActivas %></h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card bg-warning text-white">
                                    <div class="card-body">
                                        <h5>Sesiones Expiradas</h5>
                                        <h3><%= sesionesExpiradas %></h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card bg-info text-white">
                                    <div class="card-body">
                                        <h5>Por Tipo</h5>
                                        <small>
                                            Admin: <%= sessionsByType.getOrDefault("ADMIN", 0) %><br>
                                            Tutor: <%= sessionsByType.getOrDefault("TUTOR", 0) %><br>
                                            Usuario: <%= sessionsByType.getOrDefault("USUARIO", 0) %>
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Tabla de sesiones -->
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Usuario</th>
                                        <th>Tipo</th>
                                        <th>IP</th>
                                        <th>Navegador</th>
                                        <th>Creada</th>
                                        <th>Expira</th>
                                        <th>Última Actividad</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        try {
                                            String query = "SELECT s.*, " +
                                                    "CASE " +
                                                    "  WHEN s.user_type = 'ADMIN' THEN a.CORREO_A " +
                                                    "  WHEN s.user_type = 'TUTOR' THEN t.CORREO_T " +
                                                    "  WHEN s.user_type = 'USUARIO' THEN u.CORREO_U " +
                                                    "END as email " +
                                                    "FROM sesiones_activas s " +
                                                    "LEFT JOIN ADMIN_ a ON s.user_type = 'ADMIN' AND s.user_id = a.ID_A " +
                                                    "LEFT JOIN TUTOR t ON s.user_type = 'TUTOR' AND s.user_id = t.ID_T " +
                                                    "LEFT JOIN USUARIO u ON s.user_type = 'USUARIO' AND s.user_id = u.ID_U " +
                                                    "ORDER BY s.created_at DESC";
                                            
                                            ps = c.prepareStatement(query);
                                            rs = ps.executeQuery();
                                            
                                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                                            
                                            while (rs.next()) {
                                                int id = rs.getInt("id");
                                                String userType = rs.getString("user_type");
                                                String email = rs.getString("email");
                                                String ip = rs.getString("ip_address");
                                                String userAgent = rs.getString("user_agent");
                                                Timestamp created = rs.getTimestamp("created_at");
                                                Timestamp expires = rs.getTimestamp("expires_at");
                                                Timestamp lastActivity = rs.getTimestamp("last_activity");
                                                
                                                boolean isActive = expires.after(new java.util.Date());
                                                boolean isExpiring = expires.before(new java.util.Date(System.currentTimeMillis() + 60*60*1000)); // 1 hora
                                                
                                                String rowClass = "";
                                                if (isActive) {
                                                    rowClass = isExpiring ? "session-expiring" : "session-active";
                                                }
                                                
                                                // Simplificar user agent
                                                String browserInfo = "";
                                                if (userAgent != null) {
                                                    if (userAgent.contains("Chrome")) browserInfo = "Chrome";
                                                    else if (userAgent.contains("Firefox")) browserInfo = "Firefox";
                                                    else if (userAgent.contains("Safari")) browserInfo = "Safari";
                                                    else if (userAgent.contains("Edge")) browserInfo = "Edge";
                                                    else browserInfo = "Otro";
                                                }
                                    %>
                                    <tr class="<%= rowClass %>">
                                        <td><%= id %></td>
                                        <td>
                                            <strong><%= email != null ? email : "N/A" %></strong><br>
                                            <small>ID: <%= rs.getInt("user_id") %></small>
                                        </td>
                                        <td>
                                            <span class="badge badge-<%= userType.toLowerCase() %>">
                                                <%= userType %>
                                            </span>
                                        </td>
                                        <td><%= ip %></td>
                                        <td><%= browserInfo %></td>
                                        <td><%= sdf.format(created) %></td>
                                        <td><%= sdf.format(expires) %></td>
                                        <td><%= sdf.format(lastActivity) %></td>
                                        <td>
                                            <% if (isActive) { %>
                                                <span class="badge bg-success">Activa</span>
                                            <% } else { %>
                                                <span class="badge bg-danger">Expirada</span>
                                            <% } %>
                                        </td>
                                        <td>
                                            <button class="btn btn-danger btn-sm" 
                                                    onclick="eliminarSesion(<%= id %>)">
                                                Eliminar
                                            </button>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.println("<tr><td colspan='10' class='text-center text-danger'>Error: " + e.getMessage() + "</td></tr>");
                                        } finally {
                                            if (rs != null) rs.close();
                                            if (ps != null) ps.close();
                                            if (c != null) c.close();
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function eliminarSesion(sessionId) {
            if (confirm('¿Está seguro de que desea eliminar esta sesión?')) {
                window.location.href = '?action=eliminar&sessionId=' + sessionId;
            }
        }
        
        function limpiarExpiradas() {
            if (confirm('¿Desea limpiar todas las sesiones expiradas?')) {
                window.location.href = '?action=limpiar';
            }
        }
        
        // Auto-refresh cada 30 segundos
        setInterval(function() {
            location.reload();
        }, 30000);
    </script>
</body>
</html>