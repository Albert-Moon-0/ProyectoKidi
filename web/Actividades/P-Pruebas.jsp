<%-- 
    Document   : P-Pruebas
    Created on : 10 abr. 2025, 10:30:15
    Author     : P500
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kidi - Gestor de Actividades</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="estilosActividades.css">
    </head>
    <body>
        <!-- Barra de Navegación -->
        <jsp:include page="../Sistema/BarraNavegacion.jsp" />
        
        <div class="container mt-4">
            <!-- Header principal -->
            <div class="page-header">
                <h1>Gestor de Actividades</h1>
                <p class="lead">Selecciona una actividad para comenzar a practicar</p>
            </div>
            
            <!-- Pestañas de navegación para las materias -->
            <div class="tab-buttons">
                <button class="tab-btn active" data-tab="matematicas">Matemáticas</button>
                <button class="tab-btn" data-tab="espanol">Español</button>
                <button class="tab-btn" data-tab="ingles">Inglés</button>
            </div>
            
            <!-- Contenedor de tabs -->
            <div class="tab-content">
                <!-- Tab de Matemáticas -->
                <div id="matematicas" class="tab-pane active">
                    <div class="row">
                        <%
                        try {
                            PreparedStatement ps = c.prepareStatement("SELECT ID_ACT, DESC_ACT FROM ACTIVIDADES WHERE ID_MAT = 3");
                            ResultSet rs = ps.executeQuery();
                            
                            while(rs.next()) {
                                int idActividad = rs.getInt("ID_ACT");
                                String descActividad = rs.getString("DESC_ACT");
                        %>
                                <div class="col-md-4 col-sm-6 mb-4">
                                    <div class="activity-card" onclick="abrirMates(<%= idActividad %>)">
                                        <div class="activity-icon">
                                            <i class="fas fa-calculator"></i>
                                        </div>
                                        <div class="activity-info">
                                            <h3><%= descActividad %></h3>
                                            <p>Practica tus habilidades matemáticas</p>
                                            <div class="activity-progress">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 75%"></div>
                                                </div>
                                                <span>Puntaje 7.7/10</span>
                                            </div>
                                        </div>
                                        <div class="activity-action">
                                            <button class="btn-start">
                                                <i class="fas fa-play"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                        <%
                            }
                            rs.close();
                            ps.close();
                        } catch(Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                        %>
                    </div>
                </div>
                
                <!-- Tab de Español -->
                <div id="espanol" class="tab-pane">
                    <div class="row">
                        <%
                        try {
                            PreparedStatement ps = c.prepareStatement("SELECT ID_ACT, DESC_ACT FROM ACTIVIDADES WHERE ID_MAT = 1");
                            ResultSet rs = ps.executeQuery();
                            
                            while(rs.next()) {
                                int idActividad = rs.getInt("ID_ACT");
                                String descActividad = rs.getString("DESC_ACT");
                        %>
                                <div class="col-md-4 col-sm-6 mb-4">
                                    <div class="activity-card" onclick="abrirEsp(<%= idActividad %>)">
                                        <div class="activity-icon espanol-icon">
                                            <i class="fas fa-book"></i>
                                        </div>
                                        <div class="activity-info">
                                            <h3><%= descActividad %></h3>
                                            <p>Mejora tus habilidades de lenguaje</p>
                                            <div class="activity-progress">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 60%"></div>
                                                </div>
                                                <span>60% completado</span>
                                            </div>
                                        </div>
                                        <div class="activity-action">
                                            <button class="btn-start">
                                                <i class="fas fa-play"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                        <%
                            }
                            rs.close();
                            ps.close();
                        } catch(Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                        %>
                    </div>
                </div>
                
                <!-- Tab de Inglés -->
                <div id="ingles" class="tab-pane">
                    <div class="row">
                        <%
                        try {
                            PreparedStatement ps = c.prepareStatement("SELECT ID_ACT, DESC_ACT FROM ACTIVIDADES WHERE ID_MAT = 2");
                            ResultSet rs = ps.executeQuery();
                            
                            while(rs.next()) {
                                int idActividad = rs.getInt("ID_ACT");
                                String descActividad = rs.getString("DESC_ACT");
                        %>
                                <div class="col-md-4 col-sm-6 mb-4">
                                    <div class="activity-card" onclick="abrirIngl(<%= idActividad %>)">
                                        <div class="activity-icon ingles-icon">
                                            <i class="fas fa-language"></i>
                                        </div>
                                        <div class="activity-info">
                                            <h3><%= descActividad %></h3>
                                            <p>Aprende vocabulario y gramática</p>
                                            <div class="activity-progress">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 45%"></div>
                                                </div>
                                                <span>45% completado</span>
                                            </div>
                                        </div>
                                        <div class="activity-action">
                                            <button class="btn-start">
                                                <i class="fas fa-play"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                        <%
                            }
                            rs.close();
                            ps.close();
                        } catch(Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                        %>
                    </div>
                </div>
            </div>
            
            <!-- Tarjeta de información -->
            <div class="info-card mb-4">
                <h3><i class="fas fa-lightbulb"></i> Consejos para aprender</h3>
                <p>Para mejorar tu aprendizaje, recomendamos practicar al menos 15 minutos diarios en cada materia. ¡La constancia es clave para el éxito!</p>
            </div>
        </div>
        
        <!-- Script de Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Script para manejar las pestañas y actividades -->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Manejar clicks en las pestañas
                const tabButtons = document.querySelectorAll('.tab-btn');
                const tabPanes = document.querySelectorAll('.tab-pane');
                
                tabButtons.forEach(button => {
                    button.addEventListener('click', function() {
                        // Remover clase active de todos los botones
                        tabButtons.forEach(btn => btn.classList.remove('active'));
                        
                        // Agregar clase active al botón clicado
                        this.classList.add('active');
                        
                        // Mostrar el panel correspondiente
                        const tabId = this.getAttribute('data-tab');
                        
                        tabPanes.forEach(pane => {
                            pane.classList.remove('active');
                            if (pane.id === tabId) {
                                pane.classList.add('active');
                            }
                        });
                    });
                });
            });
            
            // Función para iniciar una actividad
            function abrirMates(idActividad) {
                // Redirigir a la página de la actividad seleccionada
                window.location.href = 'Act'+idActividad+'.jsp' ;
            }
            
            function abrirEsp(idActividad) {
                // Redirigir a la página de la actividad seleccionada
                window.location.href = 'Act'+idActividad+'.jsp' ;
            }
            
            function abrirIngl(idActividad) {
                // Redirigir a la página de la actividad seleccionada
                window.location.href = 'Act'+idActividad+'.jsp' ;
            }
        </script>
    </body>
</html>