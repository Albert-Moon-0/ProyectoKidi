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
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kidi - Informes de Progreso</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <!-- ECharts para gráficos -->
        <script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
        <!-- jsPDF para generar PDF -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
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
                --sidebar-width: 200px;
            }

            body {
                background-color: var(--background-color);
                font-family: 'Poppins', sans-serif;
                color: var(--text-primary);
                background-image: linear-gradient(135deg, rgba(108, 138, 232, 0.05) 0%, rgba(165, 214, 167, 0.05) 100%);
                background-attachment: fixed;
                margin-left: var(--sidebar-width);
            }

            .container {
                max-width: 1200px;
                padding: 30px;
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

            /* Selector de estudiante */
            .student-selector {
                background-color: white;
                border-radius: 15px;
                box-shadow: var(--card-shadow);
                padding: 1.5rem;
                margin-bottom: 2rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
            }

            .selector-label {
                font-weight: 500;
                color: var(--text-primary);
                margin-right: 1rem;
            }

            .selector-container {
                display: flex;
                align-items: center;
                flex: 1;
                max-width: 500px;
            }

            .student-select {
                flex-grow: 1;
                padding: 0.5rem 1rem;
                border-radius: 10px;
                border: 2px solid var(--primary-light);
                background-color: white;
                color: var(--text-primary);
                font-family: 'Poppins', sans-serif;
                transition: all 0.3s ease;
                margin-right: 1rem;
            }

            .student-select:focus {
                outline: none;
                border-color: var(--primary-color);
                box-shadow: 0 0 0 3px rgba(108, 138, 232, 0.2);
            }

            .download-btn {
                background-color: var(--primary-color);
                color: white;
                border: none;
                border-radius: 10px;
                padding: 0.5rem 1.2rem;
                font-family: 'Poppins', sans-serif;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .download-btn:hover {
                background-color: var(--hover-color);
                transform: translateY(-2px);
            }

            /* Tarjetas de estadísticas */
            .stat-card {
                background-color: white;
                border-radius: 15px;
                box-shadow: var(--card-shadow);
                padding: 1.5rem;
                margin-bottom: 1.5rem;
                display: flex;
                align-items: center;
                transition: all 0.3s ease;
                height: 100%;
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

            /* Tarjetas de gráficos */
            .chart-card {
                background-color: white;
                border-radius: 20px;
                box-shadow: var(--card-shadow);
                padding: 1.5rem;
                margin-bottom: 2rem;
                transition: all 0.3s ease;
                border-top: 4px solid var(--primary-color);
                height: 400px;
                width: 100%;
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

            /* Sección de pestañas */
            .tab-buttons {
                display: flex;
                background-color: white;
                border-radius: 15px;
                padding: 0.5rem;
                margin-bottom: 2rem;
                box-shadow: var(--card-shadow);
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }

            .tab-btn {
                padding: 0.75rem 1.5rem;
                background: none;
                border: none;
                border-radius: 10px;
                margin-right: 0.5rem;
                font-family: 'Poppins', sans-serif;
                font-weight: 500;
                color: var(--text-secondary);
                cursor: pointer;
                transition: all 0.3s ease;
                white-space: nowrap;
            }

            .tab-btn:last-child {
                margin-right: 0;
            }

            .tab-btn.active {
                background-color: var(--primary-color);
                color: white;
            }

            .tab-btn:hover:not(.active) {
                background-color: var(--primary-light);
                color: var(--primary-color);
            }

            .tab-content {
                display: none;
            }

            .tab-content.active {
                display: block;
                animation: fadeIn 0.5s ease-out forwards;
            }

            /* Info card */
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
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .info-card p {
                font-size: 0.9rem;
                color: var(--text-primary);
                margin-bottom: 0;
            }

            /* Tabla de actividades */
            .activities-table {
                background-color: white;
                border-radius: 15px;
                overflow: hidden;
                box-shadow: var(--card-shadow);
                margin-bottom: 2rem;
            }

            .activities-table table {
                width: 100%;
                border-collapse: collapse;
            }

            .activities-table th {
                background-color: var(--primary-light);
                color: var(--primary-color);
                font-weight: 600;
                text-align: left;
                padding: 1rem;
                font-size: 0.95rem;
            }

            .activities-table td {
                padding: 1rem;
                border-top: 1px solid var(--primary-light);
                color: var(--text-primary);
                font-size: 0.9rem;
            }

            .activities-table tr:hover {
                background-color: rgba(108, 138, 232, 0.05);
            }

            .status-badge {
                padding: 0.25rem 0.75rem;
                border-radius: 20px;
                font-size: 0.8rem;
                font-weight: 500;
                display: inline-flex;
                align-items: center;
                gap: 5px;
            }

            .status-completed {
                background-color: rgba(40, 167, 69, 0.1);
                color: #28a745;
            }

            .status-pending {
                background-color: rgba(255, 193, 7, 0.1);
                color: #ffc107;
            }

            .score-badge {
                background-color: var(--primary-light);
                color: var(--primary-color);
                padding: 0.25rem 0.5rem;
                border-radius: 5px;
                font-weight: 600;
                min-width: 40px;
                text-align: center;
            }

            .activity-icon {
                width: 40px;
                height: 40px;
                background-color: var(--primary-light);
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: var(--primary-color);
                margin-right: 10px;
            }

            .activity-info {
                display: flex;
                align-items: center;
            }

            /* Tarjetas de materias */
            .subject-card {
                background-color: white;
                border-radius: 15px;
                padding: 1.5rem;
                margin-bottom: 1.5rem;
                box-shadow: var(--card-shadow);
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
            }

            .subject-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 8px;
                height: 100%;
                background-color: var(--subject-color, var(--primary-color));
            }

            .subject-card:hover {
                box-shadow: var(--card-hover-shadow);
                transform: translateY(-3px);
            }

            .subject-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1rem;
            }

            .subject-name {
                font-weight: 600;
                font-size: 1.1rem;
                color: var(--text-primary);
                margin: 0;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .subject-score {
                font-size: 1.8rem;
                font-weight: 700;
                color: var(--subject-color, var(--primary-color));
            }

            .progress-title {
                font-size: 0.9rem;
                color: var(--text-secondary);
                margin-bottom: 0.5rem;
            }

            .progress-bar-wrapper {
                height: 10px;
                background-color: var(--primary-light);
                border-radius: 5px;
                overflow: hidden;
                margin-bottom: 0.5rem;
            }

            .progress-bar-inner {
                height: 100%;
                background-color: var(--subject-color, var(--primary-color));
                border-radius: 5px;
            }

            .progress-info {
                display: flex;
                justify-content: space-between;
                font-size: 0.8rem;
                color: var(--text-secondary);
            }

            .recommendations {
                margin-top: 1rem;
                font-size: 0.9rem;
                color: var(--text-secondary);
                background-color: var(--primary-light);
                padding: 0.75rem;
                border-radius: 10px;
            }

            .recommendations strong {
                color: var(--subject-color, var(--primary-color));
            }

            /* Animaciones */
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(10px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .chart-card, .stat-card, .info-card, .activities-table, .subject-card {
                animation: fadeIn 0.5s ease-out forwards;
                animation-delay: calc(var(--animation-order) * 0.1s);
            }

            /* Diseño Responsive */
            @media (max-width: 992px) {
                body {
                    margin-left: 0;
                }
                
                .container {
                    padding: 20px;
                }
                
                .chart-card {
                    height: 350px;
                }
            }

            @media (max-width: 768px) {
                .chart-card {
                    height: 300px;
                }
                
                .student-selector {
                    flex-direction: column;
                    align-items: flex-start;
                }
                
                .selector-container {
                    margin-top: 1rem;
                    max-width: 100%;
                    width: 100%;
                }
                
                .download-btn {
                    margin-top: 1rem;
                    width: 100%;
                    justify-content: center;
                }
            }

            @media (max-width: 576px) {
                .container {
                    padding: 15px;
                }
                
                .tab-buttons {
                    padding: 0.3rem;
                }
                
                .tab-btn {
                    padding: 0.5rem 1rem;
                    font-size: 0.9rem;
                }
            }

            /* Estilos para impresión/PDF */
            @media print {
                body {
                    margin: 0;
                    padding: 0;
                    background-color: white;
                    background-image: none;
                }
                
                .container {
                    max-width: 100%;
                    width: 100%;
                    padding: 0;
                }
                
                .chart-card, .stat-card, .info-card, .activities-table, .subject-card {
                    box-shadow: none;
                    border: 1px solid #ddd;
                    page-break-inside: avoid;
                }
                
                .download-btn, .tab-buttons {
                    display: none;
                }
                
                .tab-content {
                    display: block !important;
                }
            }
        </style>
    </head>
    <body>
        <!-- Barra de Navegación -->
        <jsp:include page="../Sistema/BarraNavegacion.jsp" />
        
        <div class="container mt-4" id="reportContainer">
            <!-- Header principal -->
            <div class="page-header">
                <h1>Informe de Progreso</h1>
                <p class="lead">Análisis detallado del rendimiento académico</p>
            </div>
            
            <!-- Selector de estudiante -->
            <div class="student-selector">
                <div>
                    <span class="selector-label">Estudiante:</span>
                </div>
                <div class="selector-container">
                    <select id="studentSelect" class="student-select">
                        <!-- Aquí se agregarán los niños con un ciclo for desde JSP -->
                        <option value="1">Juan Pérez González</option>
                        <option value="2">María López Sánchez</option>
                    </select>
                    <button id="downloadPDF" class="download-btn">
                        <i class="fas fa-file-pdf"></i> Descargar PDF
                    </button>
                </div>
            </div>
            
            <!-- Pestañas de navegación -->
            <div class="tab-buttons">
                <button class="tab-btn active" data-tab="resumen">Resumen General</button>
                <button class="tab-btn" data-tab="materias">Materias</button>
                <button class="tab-btn" data-tab="actividades">Actividades</button>
                <button class="tab-btn" data-tab="recomendaciones">Recomendaciones</button>
            </div>
            
            <!-- TAB: Resumen general -->
            <div id="resumen" class="tab-content active">
                <!-- Estadísticas generales -->
                <div class="row mb-4">
                    <div class="col-lg-4 col-md-6 mb-3" style="--animation-order: 1">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <div class="stat-info">
                                <h3 class="stat-value">92%</h3>
                                <p class="stat-label">Promedio General</p>
                                <div class="stat-trend trend-up">
                                    <i class="fas fa-arrow-up"></i> 2.5% desde el mes pasado
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6 mb-3" style="--animation-order: 2">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-tasks"></i>
                            </div>
                            <div class="stat-info">
                                <h3 class="stat-value">24</h3>
                                <p class="stat-label">Actividades Completadas</p>
                                <div class="stat-trend trend-up">
                                    <i class="fas fa-arrow-up"></i> 6 esta semana
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6 mb-3" style="--animation-order: 3">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-award"></i>
                            </div>
                            <div class="stat-info">
                                <h3 class="stat-value">8</h3>
                                <p class="stat-label">Logros Obtenidos</p>
                                <div class="stat-trend trend-up">
                                    <i class="fas fa-arrow-up"></i> 2 nuevos este mes
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Tarjeta de información -->
                <div class="info-card mb-4" style="--animation-order: 4">
                    <h3><i class="fas fa-lightbulb"></i> Análisis de Progreso</h3>
                    <p>Juan ha mostrado un excelente rendimiento académico general. Sus fortalezas están en Matemáticas y Ciencias Naturales, donde mantiene promedios superiores al 90%. Se recomienda reforzar Lengua y Literatura para mejorar la comprensión lectora.</p>
                </div>
                
                <!-- Gráfico principal de rendimiento -->
                <div class="row" style="--animation-order: 5">
                    <div class="col-12">
                        <div class="chart-card">
                            <div class="chart-header">
                                <h3>Evolución de Rendimiento por Materia</h3>
                            </div>
                            <div id="rendimientoChart" class="chart-container"></div>
                        </div>
                    </div>
                </div>
                
                <!-- Gráfico de actividades completadas -->
                <div class="row" style="--animation-order: 6">
                    <div class="col-lg-6 mb-4">
                        <div class="chart-card">
                            <div class="chart-header">
                                <h3>Actividades Completadas por Materia</h3>
                            </div>
                            <div id="actividadesChart" class="chart-container"></div>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="chart-card">
                            <div class="chart-header">
                                <h3>Distribución de Calificaciones</h3>
                            </div>
                            <div id="calificacionesChart" class="chart-container"></div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- TAB: Materias -->
            <div id="materias" class="tab-content">
                <div class="row">
                    <!-- Matemáticas -->
                    <div class="col-lg-6 mb-4" style="--animation-order: 1">
                        <div class="subject-card" style="--subject-color: #4CAF50;">
                            <div class="subject-header">
                                <h3 class="subject-name">
                                    <i class="fas fa-calculator"></i>
                                    Matemáticas
                                </h3>
                                <div class="subject-score">95%</div>
                            </div>
                            <div class="progress-title">Progreso del curso</div>
                            <div class="progress-bar-wrapper">
                                <div class="progress-bar-inner" style="width: 80%;"></div>
                            </div>
                            <div class="progress-info">
                                <span>24 actividades completadas</span>
                                <span>80% del curso</span>
                            </div>
                            <div class="recommendations">
                                <strong>Fortalezas:</strong> Operaciones aritméticas, resolución de problemas.<br>
                                <strong>Áreas de mejora:</strong> Geometría.
                            </div>
                        </div>
                    </div>
                    
                    <!-- Lengua y Literatura -->
                    <div class="col-lg-6 mb-4" style="--animation-order: 2">
                        <div class="subject-card" style="--subject-color: #FF9800;">
                            <div class="subject-header">
                                <h3 class="subject-name">
                                    <i class="fas fa-book"></i>
                                    Español
                                </h3>
                                <div class="subject-score">84%</div>
                            </div>
                            <div class="progress-title">Progreso del curso</div>
                            <div class="progress-bar-wrapper">
                                <div class="progress-bar-inner" style="width: 60%; background-color: #FF9800;"></div>
                            </div>
                            <div class="progress-info">
                                <span>18 actividades completadas</span>
                                <span>60% del curso</span>
                            </div>
                            <div class="recommendations">
                                <strong>Fortalezas:</strong> Escritura creativa, vocabulario.<br>
                                <strong>Áreas de mejora:</strong> Comprensión lectora, gramática.
                            </div>
                        </div>
                    </div>
                    
                    <!-- Ciencias Naturales -->
                    <div class="col-lg-6 mb-4" style="--animation-order: 3">
                        <div class="subject-card" style="--subject-color: #2196F3;">
                            <div class="subject-header">
                                <h3 class="subject-name">
                                    <i class="fas fa-flask"></i>
                                    Ingles
                                </h3>
                                <div class="subject-score">93%</div>
                            </div>
                            <div class="progress-title">Progreso del curso</div>
                            <div class="progress-bar-wrapper">
                                <div class="progress-bar-inner" style="width: 75%; background-color: #2196F3;"></div>
                            </div>
                            <div class="progress-info">
                                <span>22 actividades completadas</span>
                                <span>75% del curso</span>
                            </div>
                            <div class="recommendations">
                                <strong>Fortalezas:</strong> Clasificación de seres vivos, experimentación.<br>
                                <strong>Áreas de mejora:</strong> Ciclos naturales.
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
            
            <!-- TAB: Actividades -->
            <div id="actividades" class="tab-content">
                <div class="activities-table" style="--animation-order: 1">
                    <table>
                        <thead>
                            <tr>
                                <th>Actividad</th>
                                <th>Materia</th>
                                <th>Fecha</th>
                                <th>Estado</th>
                                <th>Calificación</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Las actividades se generarían dinámicamente en un bucle JSP -->
                            <tr>
                                <td>
                                    <div class="activity-info">
                                        <div class="activity-icon">
                                            <i class="fas fa-calculator"></i>
                                        </div>
                                        <div>Sumas y restas</div>
                                    </div>
                                </td>
                                <td>Matemáticas</td>
                                <td>20/Abr/2025</td>
                                <td><span class="status-badge status-completed"><i class="fas fa-check-circle"></i> Completado</span></td>
                                <td><span class="score-badge">9.5</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
    </body>
</html>
                          