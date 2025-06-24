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
int idUsuario = 0;

// Obtener información del usuario actual
    PreparedStatement psUser = c.prepareStatement("SELECT ID_U FROM USUARIO WHERE CORREO_U = ?");
    psUser.setString(1, userEmail);
    ResultSet rsUser = psUser.executeQuery();
    if (rsUser.next()) {
        idUsuario = rsUser.getInt("ID_U");
    }
    rsUser.close();
    psUser.close();
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kidi - Gestor de Actividades</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            :root {
                --primary-color: #667eea;
                --secondary-color: #764ba2;
                --accent-color: #f093fb;
                --success-color: #4ecdc4;
                --warning-color: #feca57;
                --danger-color: #ff6b6b;
                --dark-color: #2c3e50;
                --light-color: #ffffff;
                --text-primary: #2c3e50;
                --text-secondary: #6c757d;
                --text-muted: #8e9297;
                --background-primary: #f8f9fa;
                --background-secondary: #ffffff;
                --border-light: #e9ecef;
                --math-color: #667eea;
                --spanish-color: #ff6b6b;
                --english-color: #4ecdc4;
                --gradient-primary: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                --gradient-math: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                --gradient-spanish: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
                --gradient-english: linear-gradient(135deg, #4ecdc4 0%, #44a08d 100%);
                --gradient-background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
                --shadow-light: 0 2px 10px rgba(0,0,0,0.08);
                --shadow-medium: 0 8px 30px rgba(0,0,0,0.12);
                --shadow-heavy: 0 15px 40px rgba(0,0,0,0.15);
                --border-radius: 16px;
                --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background: var(--gradient-background);
                min-height: 100vh;
                color: var(--text-primary);
                line-height: 1.6;
            }

            .container {
                max-width: 1200px;
                padding: 0 20px;
            }

            /* Header Styles */
            .page-header {
                text-align: center;
                margin: 2rem 0 3rem;
                padding: 2rem;
                background: var(--background-secondary);
                border-radius: var(--border-radius);
                box-shadow: var(--shadow-light);
                position: relative;
                overflow: hidden;
                border: 1px solid var(--border-light);
            }

            .page-header::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: var(--gradient-primary);
            }

            .page-header h1 {
                font-size: clamp(2rem, 5vw, 3rem);
                font-weight: 700;
                background: var(--gradient-primary);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                margin-bottom: 0.5rem;
            }

            .page-header .lead {
                font-size: clamp(1rem, 2.5vw, 1.2rem);
                color: var(--text-secondary);
                font-weight: 400;
                margin: 0;
            }

            /* Tab Navigation */
            .tab-buttons {
                display: flex;
                justify-content: center;
                gap: 1rem;
                margin-bottom: 2rem;
                padding: 0 1rem;
                flex-wrap: wrap;
            }

            .tab-btn {
                background: var(--background-secondary);
                border: 1px solid var(--border-light);
                padding: 1rem 2rem;
                border-radius: 50px;
                font-weight: 600;
                font-size: 1rem;
                color: var(--text-primary);
                cursor: pointer;
                transition: var(--transition);
                box-shadow: var(--shadow-light);
                position: relative;
                overflow: hidden;
                min-width: 120px;
                flex: 1;
                max-width: 200px;
            }

            .tab-btn::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: var(--gradient-primary);
                transition: var(--transition);
                z-index: -1;
            }

            .tab-btn:hover::before,
            .tab-btn.active::before {
                left: 0;
            }

            .tab-btn:hover,
            .tab-btn.active {
                color: white;
                transform: translateY(-2px);
                box-shadow: var(--shadow-medium);
                border-color: transparent;
            }

            /* Tab Content */
            .tab-content {
                margin: 2rem 0;
            }

            .tab-pane {
                display: none;
                animation: fadeIn 0.5s ease-in-out;
            }

            .tab-pane.active {
                display: block;
            }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(20px); }
                to { opacity: 1; transform: translateY(0); }
            }

            /* Activity Cards */
            .activity-card {
                background: var(--background-secondary);
                border: 1px solid var(--border-light);
                border-radius: var(--border-radius);
                padding: 1.5rem;
                box-shadow: var(--shadow-light);
                cursor: pointer;
                transition: var(--transition);
                height: 100%;
                display: flex;
                flex-direction: column;
                position: relative;
                overflow: hidden;
            }

            .activity-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: var(--gradient-primary);
                transition: var(--transition);
            }

            .activity-card:hover {
                transform: translateY(-8px);
                box-shadow: var(--shadow-heavy);
                border-color: var(--primary-color);
            }

            .activity-card:hover::before {
                height: 100%;
                opacity: 0.03;
            }

            .activity-icon {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 1rem;
                font-size: 1.5rem;
                color: white;
                background: var(--gradient-math);
                position: relative;
                overflow: hidden;
            }

            .espanol-icon {
                background: var(--gradient-spanish);
            }

            .ingles-icon {
                background: var(--gradient-english);
            }

            .activity-info {
                flex: 1;
                margin-bottom: 1rem;
            }

            .activity-info h3 {
                font-size: 1.25rem;
                font-weight: 600;
                color: var(--text-primary);
                margin-bottom: 0.5rem;
                line-height: 1.3;
            }

            .activity-info p {
                color: var(--text-secondary);
                font-size: 0.9rem;
                margin-bottom: 1rem;
            }

            .activity-progress {
                margin-top: auto;
            }

            .progress {
                height: 8px;
                background-color: var(--border-light);
                border-radius: 4px;
                overflow: hidden;
                margin-bottom: 0.5rem;
            }

            .progress-bar {
                height: 100%;
                background: var(--gradient-primary);
                border-radius: 4px;
                transition: width 0.6s ease;
            }

            .activity-progress span {
                font-size: 0.85rem;
                color: var(--text-secondary);
                font-weight: 500;
            }

            .activity-action {
                display: flex;
                justify-content: flex-end;
                margin-top: 1rem;
            }

            .btn-start {
                width: 50px;
                height: 50px;
                border: none;
                border-radius: 50%;
                background: var(--gradient-primary);
                color: white;
                font-size: 1.2rem;
                cursor: pointer;
                transition: var(--transition);
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .btn-start:hover {
                transform: scale(1.1);
                box-shadow: var(--shadow-medium);
            }

            /* Info Card */
            .info-card {
                background: var(--background-secondary);
                border: 1px solid var(--border-light);
                border-radius: var(--border-radius);
                padding: 2rem;
                box-shadow: var(--shadow-light);
                margin: 3rem 0;
                position: relative;
                overflow: hidden;
                border-left: 4px solid var(--warning-color);
            }

            .info-card h3 {
                color: var(--text-primary);
                font-weight: 600;
                margin-bottom: 1rem;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .info-card h3 i {
                color: var(--warning-color);
                font-size: 1.5rem;
            }

            .info-card p {
                color: var(--text-secondary);
                margin: 0;
                line-height: 1.7;
            }

            /* Alert Styles */
            .alert-danger {
                background-color: #fff5f5;
                border: 1px solid #fed7d7;
                color: #c53030;
                border-radius: var(--border-radius);
                padding: 1rem;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .container {
                    padding: 0 15px;
                }

                .page-header {
                    margin: 1rem 0 2rem;
                    padding: 1.5rem;
                }

                .tab-buttons {
                    gap: 0.5rem;
                    margin-bottom: 1.5rem;
                }

                .tab-btn {
                    padding: 0.8rem 1.5rem;
                    font-size: 0.9rem;
                    min-width: 100px;
                }

                .activity-card {
                    padding: 1.25rem;
                    margin-bottom: 1rem;
                }

                .activity-icon {
                    width: 50px;
                    height: 50px;
                    font-size: 1.25rem;
                }

                .activity-info h3 {
                    font-size: 1.1rem;
                }

                .btn-start {
                    width: 45px;
                    height: 45px;
                    font-size: 1.1rem;
                }

                .info-card {
                    padding: 1.5rem;
                    margin: 2rem 0;
                }
            }

            @media (max-width: 480px) {
                .tab-buttons {
                    flex-direction: column;
                    align-items: center;
                }

                .tab-btn {
                    width: 100%;
                    max-width: 300px;
                }

                .activity-card {
                    text-align: center;
                }

                .activity-action {
                    justify-content: center;
                }
            }

            /* Loading Animation */
            .loading {
                display: inline-block;
                width: 20px;
                height: 20px;
                border: 3px solid rgba(255,255,255,.3);
                border-radius: 50%;
                border-top-color: #fff;
                animation: spin 1s ease-in-out infinite;
            }

            @keyframes spin {
                to { transform: rotate(360deg); }
            }

            /* Hover Effects */
            .activity-card:hover .activity-icon {
                transform: scale(1.1);
                box-shadow: var(--shadow-medium);
            }

            .activity-card:hover .btn-start {
                animation: pulse 2s infinite;
            }

            @keyframes pulse {
                0% { transform: scale(1); }
                50% { transform: scale(1.05); }
                100% { transform: scale(1); }
            }

            /* Light mode optimizations */
            .tab-btn:not(.active):hover {
                background-color: #f8f9fa;
                border-color: var(--primary-color);
            }

            .activity-card:hover {
                background-color: #ffffff;
            }

            /* Remove dark mode support to keep it light */
            @media (prefers-color-scheme: dark) {
                /* Override dark mode preferences to maintain light theme */
                body {
                    background: var(--gradient-background);
                    color: var(--text-primary);
                }

                .page-header,
                .activity-card,
                .info-card,
                .tab-btn {
                    background: var(--background-secondary);
                    color: var(--text-primary);
                    border-color: var(--border-light);
                }

                .activity-info p,
                .activity-progress span,
                .info-card p,
                .page-header .lead {
                    color: var(--text-secondary);
                }
            }

            /* Additional light theme enhancements */
            .activity-card::after {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(255, 255, 255, 0.5);
                opacity: 0;
                transition: var(--transition);
                pointer-events: none;
            }

            .activity-card:hover::after {
                opacity: 1;
            }
        </style>
    </head>
    <body>
        <!-- Barra de Navegación -->
        <jsp:include page="../Sistema/BarraNavegacion.jsp" />
        
        <div class="container mt-4">
            <!-- Header principal -->
            <div class="page-header">
                <h1><i class="fas fa-graduation-cap"></i> Gestor de Actividades</h1>
                <p class="lead">Selecciona una actividad para comenzar a practicar y mejorar tus habilidades</p>
            </div>
            
            <!-- Pestañas de navegación para las materias -->
            <div class="tab-buttons">
                <button class="tab-btn active" data-tab="matematicas">
                    <i class="fas fa-calculator"></i> Matemáticas
                </button>
                <button class="tab-btn" data-tab="espanol">
                    <i class="fas fa-book"></i> Español
                </button>
                <button class="tab-btn" data-tab="ingles">
                    <i class="fas fa-language"></i> Inglés
                </button>
            </div>
            
            <!-- Contenedor de tabs -->
            <div class="tab-content">
                <!-- Tab de Matemáticas -->
                <div id="matematicas" class="tab-pane active">
                    <div class="row g-4">
                        <%
                        try {                                                  
                            PreparedStatement ps = c.prepareStatement(
                                "SELECT A.ID_ACT, A.DESC_ACT, COALESCE(R.PUNTAJE_ACT, -1) AS PUNTAJE " +
                                "FROM ACTIVIDADES A " +
                                "LEFT JOIN REALIZA R ON A.ID_ACT = R.ID_ACT AND R.ID_U = ? " +
                                "WHERE A.ID_MAT = 3"
                            );
                            ps.setInt(1, idUsuario);
                            ResultSet rs = ps.executeQuery();

                            while(rs.next()) {
                                int idActividad = rs.getInt("ID_ACT");
                                String descActividad = rs.getString("DESC_ACT");
                                double puntaje = rs.getDouble("PUNTAJE");
                        %>
                            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                <div class="activity-card" onclick="abrirMates(<%= idActividad %>)">
                                    <div class="activity-icon">
                                        <i class="fas fa-calculator"></i>
                                    </div>
                                    <div class="activity-info">
                                        <h3><%= descActividad %></h3>
                                        <p>Practica tus habilidades matemáticas y mejora tu razonamiento lógico</p>
                                        <div class="activity-progress">
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" 
                                                     style="width: <%= (puntaje >= 0) ? (puntaje * 10) : 0 %>%"></div>
                                            </div>
                                            <span>
                                                <%= (puntaje >= 0) ? "Puntaje " + String.format("%.1f", puntaje) + "/10" : "Sin elaborar" %>
                                            </span>
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
                            out.println("<div class='col-12'><div class='alert alert-danger'>Error: " + e.getMessage() + "</div></div>");
                        }
                        %>
                    </div>
                </div>
                
                <!-- Tab de Español -->
                <div id="espanol" class="tab-pane">
                    <div class="row g-4">
                        <%
                        try {                                                  
                            PreparedStatement ps = c.prepareStatement(
                                "SELECT A.ID_ACT, A.DESC_ACT, COALESCE(R.PUNTAJE_ACT, -1) AS PUNTAJE " +
                                "FROM ACTIVIDADES A " +
                                "LEFT JOIN REALIZA R ON A.ID_ACT = R.ID_ACT AND R.ID_U = ? " +
                                "WHERE A.ID_MAT = 1"
                            );
                            ps.setInt(1, idUsuario);
                            ResultSet rs = ps.executeQuery();

                            while(rs.next()) {
                                int idActividad = rs.getInt("ID_ACT");
                                String descActividad = rs.getString("DESC_ACT");
                                double puntaje = rs.getDouble("PUNTAJE");
                        %>
                                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                    <div class="activity-card" onclick="abrirEsp(<%= idActividad %>)">
                                        <div class="activity-icon espanol-icon">
                                            <i class="fas fa-book"></i>
                                        </div>
                                        <div class="activity-info">
                                            <h3><%= descActividad %></h3>
                                            <p>Mejora tus habilidades de lenguaje y comprensión lectora</p>
                                            <div class="activity-progress">
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" 
                                                     style="width: <%= (puntaje >= 0) ? (puntaje * 10) : 0 %>%"></div>
                                            </div>
                                            <span>
                                                <%= (puntaje >= 0) ? "Puntaje " + String.format("%.1f", puntaje) + "/10" : "Sin elaborar" %>
                                            </span>
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
                            out.println("<div class='col-12'><div class='alert alert-danger'>Error: " + e.getMessage() + "</div></div>");
                        }
                        %>
                    </div>
                </div>
                
                <!-- Tab de Inglés -->
                <div id="ingles" class="tab-pane">
                    <div class="row g-4">
                        <%
                        try {                                                  
                            PreparedStatement ps = c.prepareStatement(
                                "SELECT A.ID_ACT, A.DESC_ACT, COALESCE(R.PUNTAJE_ACT, -1) AS PUNTAJE " +
                                "FROM ACTIVIDADES A " +
                                "LEFT JOIN REALIZA R ON A.ID_ACT = R.ID_ACT AND R.ID_U = ? " +
                                "WHERE A.ID_MAT = 2"
                            );
                            ps.setInt(1, idUsuario);
                            ResultSet rs = ps.executeQuery();

                            while(rs.next()) {
                                int idActividad = rs.getInt("ID_ACT");
                                String descActividad = rs.getString("DESC_ACT");
                                double puntaje = rs.getDouble("PUNTAJE");
                        %>
                                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                    <div class="activity-card" onclick="abrirIngl(<%= idActividad %>)">
                                        <div class="activity-icon ingles-icon">
                                            <i class="fas fa-language"></i>
                                        </div>
                                        <div class="activity-info">
                                            <h3><%= descActividad %></h3>
                                            <p>Aprende vocabulario, gramática y mejora tu inglés</p>
                                            <div class="activity-progress">
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" 
                                                     style="width: <%= (puntaje >= 0) ? (puntaje * 10) : 0 %>%"></div>
                                            </div>
                                            <span>
                                                <%= (puntaje >= 0) ? "Puntaje " + String.format("%.1f", puntaje) + "/10" : "Sin elaborar" %>
                                            </span>
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
                            out.println("<div class='col-12'><div class='alert alert-danger'>Error: " + e.getMessage() + "</div></div>");
                        }
                        %>
                    </div>
                </div>
            </div>
            
            <!-- Tarjeta de información -->
            <div class="info-card">
                <h3><i class="fas fa-lightbulb"></i> Consejos para aprender</h3>
                <p>Para mejorar tu aprendizaje, recomendamos practicar al menos 15 minutos diarios en cada materia. ¡La constancia es clave para el éxito! Recuerda tomar descansos regulares y celebrar tus logros.</p>
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

                // Agregar efectos de hover mejorados
                const activityCards = document.querySelectorAll('.activity-card');
                activityCards.forEach(card => {
                    card.addEventListener('mouseenter', function() {
                        this.style.transform = 'translateY(-8px) scale(1.02)';
                    });
                    
                    card.addEventListener('mouseleave', function() {
                        this.style.transform = 'translateY(0) scale(1)';
                    });
                });
            });
            
            // Función para iniciar una actividad
            function abrirMates(idActividad) {
                // Añadir efecto de loading
                const card = event.currentTarget;
                const btn = card.querySelector('.btn-start');
                const originalContent = btn.innerHTML;
                btn.innerHTML = '<div class="loading"></div>';
                
                // Simular pequeño delay para mejor UX
                setTimeout(() => {
                    window.location.href = 'Act'+idActividad+'.jsp';
                }, 300);
            }
            
            function abrirEsp(idActividad) {
                const card = event.currentTarget;
                const btn = card.querySelector('.btn-start');
                const originalContent = btn.innerHTML;
                btn.innerHTML = '<div class="loading"></div>';
                
                setTimeout(() => {
                    window.location.href = 'Act'+idActividad+'.jsp';
                }, 300);
            }
            
            function abrirIngl(idActividad) {
                const card = event.currentTarget;
                const btn = card.querySelector('.btn-start');
                const originalContent = btn.innerHTML;
                btn.innerHTML = '<div class="loading"></div>';
                
                setTimeout(() => {
                    window.location.href = 'Act'+idActividad+'.jsp';
                }, 300);
            }
        </script>
    </body>
</html>