<%-- 
    Document   : P-graficos
    Created on : 7 abr. 2025, 17:20:26
    Author     : P500
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,org.json.simple.*"%>
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
        <title>Kidi - Gráficos de Logros</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <!-- ECharts -->
        <script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
        <style>
            :root {
                --primary-color: #6C8AE8;
                --primary-light: #E6EEFF;
                --secondary-color: #F4F9FC;
                --accent-color: #A5D6A7;
                --accent-hover: #8BC34A;
                --text-primary: #2C3E50;
                --text-secondary: #7D7D7D;
                --background-color: #EDF2F7;
                --hover-color: #5A7BE0;
                --card-shadow: 0 10px 25px rgba(108, 138, 232, 0.1);
                --card-hover-shadow: 0 15px 35px rgba(108, 138, 232, 0.15);
            }

            body {
                background-color: var(--background-color);
                font-family: 'Poppins', sans-serif;
                color: var(--text-primary);
                margin-left: 820px;
                padding: 20px;
                padding-left: 100px;
                background-image: linear-gradient(135deg, rgba(108, 138, 232, 0.05) 0%, rgba(165, 214, 167, 0.05) 100%);
                background-attachment: fixed;
            }

            .page-header {
                margin-bottom: 2rem;
                padding-bottom: 1rem;
                border-bottom: 2px solid var(--secondary-color);
                position: relative;
            }

            .page-header::after {
                content: '';
                position: absolute;
                bottom: -2px;
                left: 0;
                width: 100px;
                height: 3px;
                background-color: var(--primary-color);
            }

            .page-header h1 {
                color: var(--primary-color);
                font-weight: 600;
                font-size: 1.8rem;
            }

            .page-header .lead {
                color: var(--text-secondary);
                font-size: 1.1rem;
            }

            .chart-card {
                background-color: white;
                border-radius: 20px;
                box-shadow: var(--card-shadow);
                padding: 1.5rem;
                margin-bottom: 2rem;
                transition: all 0.3s ease;
                border-top: 4px solid var(--primary-color);
                height: 500px;
                width: 67.8vw;
                position: relative;
            }

            .chart-card:hover {
                box-shadow: var(--card-hover-shadow);
                transform: translateY(-5px);
            }

            .chart-container {
                height: 100%;
                width: 100%;
            }

            .chart-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1rem;
            }

            .chart-header h3 {
                font-size: 1.2rem;
                font-weight: 600;
                color: var(--text-primary);
                margin: 0;
            }

            .chart-actions {
                display: flex;
                gap: 0.5rem;
            }

            .chart-btn {
                background-color: var(--primary-light);
                color: var(--primary-color);
                border: none;
                border-radius: 50%;
                width: 32px;
                height: 32px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: all 0.2s;
            }

            .chart-btn:hover {
                background-color: var(--primary-color);
                color: white;
            }

            .filter-card {
                background-color: white;
                border-radius: 20px;
                box-shadow: var(--card-shadow);
                padding: 1.5rem;
                margin-bottom: 2rem;
                display: flex;
                gap: 1rem;
                flex-wrap: wrap;
                align-items: center;
            }

            .filter-select {
                flex-grow: 1;
                padding: 0.5rem 1rem;
                border: 2px solid #e9ecef;
                border-radius: 10px;
                font-size: 0.9rem;
                transition: all 0.3s;
                color: var(--text-primary);
                min-width: 150px;
                background-color: white;
            }

            .filter-select:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 3px rgba(108, 138, 232, 0.3);
                outline: none;
            }

            .filter-btn {
                background-color: var(--accent-color);
                color: white;
                border: none;
                border-radius: 10px;
                padding: 0.5rem 1.5rem;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.3s;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .filter-btn:hover {
                background-color: var(--accent-hover);
                box-shadow: 0 5px 15px rgba(165, 214, 167, 0.4);
                transform: translateY(-2px);
            }

            .stat-card {
                background-color: white;
                border-radius: 20px;
                box-shadow: var(--card-shadow);
                padding: 1.5rem;
                margin-bottom: 2rem;
                display: flex;
                align-items: center;
                transition: all 0.3s ease;
            }

            .stat-card:hover {
                box-shadow: var(--card-hover-shadow);
                transform: translateY(-3px);
            }

            .stat-icon {
                background-color: var(--primary-light);
                color: var(--primary-color);
                border-radius: 12px;
                min-width: 60px;
                height: 60px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 1rem;
                font-size: 1.5rem;
            }

            .stat-info {
                flex-grow: 1;
            }

            .stat-value {
                font-size: 1.8rem;
                font-weight: 600;
                color: var(--text-primary);
                margin: 0;
                line-height: 1;
            }

            .stat-label {
                font-size: 0.9rem;
                color: var(--text-secondary);
                margin: 0;
            }

            .stat-trend {
                font-size: 0.9rem;
                font-weight: 500;
                display: flex;
                align-items: center;
                gap: 0.25rem;
                margin-top: 0.25rem;
            }

            .trend-up {
                color: #28a745;
            }

            .trend-down {
                color: #dc3545;
            }

            .info-card {
                background-color: var(--primary-light);
                border-radius: 20px;
                padding: 1.5rem;
                margin-bottom: 2rem;
                border-left: 4px solid var(--primary-color);
            }

            .info-card h3 {
                font-size: 1.2rem;
                font-weight: 600;
                color: var(--primary-color);
                margin-top: 0;
            }

            .info-card p {
                font-size: 0.9rem;
                color: var(--text-primary);
                margin-bottom: 0;
            }

            .tab-buttons {
                display: flex;
                gap: 1rem;
                margin-bottom: 1.5rem;
                flex-wrap: wrap;
            }

            .tab-btn {
                background-color: white;
                color: var(--text-secondary);
                border: 2px solid #e9ecef;
                border-radius: 10px;
                padding: 0.75rem 1.5rem;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.3s;
                position: relative;
            }

            .tab-btn.active {
                color: var(--primary-color);
                border-color: var(--primary-color);
                background-color: var(--primary-light);
            }

            .tab-btn:hover {
                border-color: var(--primary-color);
            }

            .tab-btn.active::after {
                content: '';
                position: absolute;
                bottom: -5px;
                left: 50%;
                transform: translateX(-50%);
                width: 10px;
                height: 10px;
                background-color: var(--primary-color);
                border-radius: 50%;
            }

            @media (max-width: 992px) {
                .chart-card {
                    height: 350px;
                }
            }

            @media (max-width: 768px) {
                body {
                    margin-left: 0;
                }
                
                .chart-card {
                    height: 400px;
                }

                .stat-card {
                    margin-bottom: 1rem;
                }
            }

            /* Animations */
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(10px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .chart-card, .stat-card, .info-card {
                animation: fadeIn 0.5s ease-out forwards;
            }

            /* Loading indicator for charts */
            .chart-loading {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(255, 255, 255, 0.8);
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 20px;
                z-index: 10;
            }

            .spinner {
                width: 40px;
                height: 40px;
                border: 4px solid var(--primary-light);
                border-top: 4px solid var(--primary-color);
                border-radius: 50%;
                animation: spin 1s linear infinite;
            }

            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
        </style>
    </head>
    <body>
        <!-- Barra de Navegación -->
        <jsp:include page="../Sistema/BarraNavegacion.jsp" />
        
        <div class="container mt-4">
            <!-- Header principal -->
            <div class="page-header">
                <h1>Análisis de Progreso</h1>
                <p class="lead">Visualiza y analiza el rendimiento</p>
            </div>           
           
            
            <!-- Pestañas de navegación -->
            <div class="tab-buttons">
                <button class="tab-btn active" data-tab="rendimiento">Rendimiento</button>
                <button class="tab-btn" data-tab="actividades">Actividades</button>
                <button class="tab-btn" data-tab="logros">Logros</button>
            </div>
            
            <!-- Estadísticas generales -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <div class="stat-info">
                            <h3 class="stat-value">85%</h3>
                            <p class="stat-label">Promedio General</p>
                            <div class="stat-trend trend-up">
                                <i class="fas fa-arrow-up"></i> 3.2%
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-tasks"></i>
                        </div>
                        <div class="stat-info">
                            <h3 class="stat-value">42</h3>
                            <p class="stat-label">Actividades Completadas</p>
                            <div class="stat-trend trend-up">
                                <i class="fas fa-arrow-up"></i> 5 esta semana
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-award"></i>
                        </div>
                        <div class="stat-info">
                            <h3 class="stat-value">12</h3>
                            <p class="stat-label">Logros Obtenidos</p>
                            <div class="stat-trend trend-up">
                                <i class="fas fa-arrow-up"></i> 2 nuevos
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Tarjeta de información -->
            <div class="info-card mb-4">
                <h3><i class="fas fa-lightbulb"></i> Consejos para mejorar</h3>
                <p>Basado en tu desempeño reciente, te recomendamos enfocarte en mejorar tus habilidades en <div id="matBaja"></div>. Completar o repetir las actividades de práctica adicionales podría ayudarte a alcanzar un mejor rendimiento.</p>
            </div>
            
            <!-- Gráficos principales -->
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="chart-card">                        
                        <div id="actividadesChart" class="chart-container"></div>                        
                    </div>                    
                </div>                 
            </div>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="chart-card">                        
                        <div id="actividadesChart" class="chart-container"></div>                        
                    </div>                    
                </div>                 
            </div>
        </div>
        
        <!-- Script de Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Scripts para inicializar los gráficos -->
        <script src="ScriptGraficas.js?v=<%= System.currentTimeMillis() %>"></script>
    </body>
</html>