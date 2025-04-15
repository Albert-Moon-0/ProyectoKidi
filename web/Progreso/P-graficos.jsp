<!DOCTYPE html>
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
                padding: 50px;
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

            .stat-card {
                background-color: white;
                border-radius: 20px;
                box-shadow: var(--card-shadow);
                padding: 1.5rem;
                margin-bottom: 2rem;
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

            /* Corrección para layout en dispositivos móviles */
            @media (max-width: 992px) {
                .chart-card {
                    height: 400px;
                }
            }

            @media (max-width: 768px) {
                .chart-card {
                    height: 350px;
                }
                
                .stat-card {
                    margin-bottom: 1rem;
                }
            }

            @media (max-width: 576px) {
                .chart-card {
                    height: 300px;
                }
            }
            
            /* Dashboard container */
            .dashboard-container {
                max-width: 1400px;
                margin: 0 auto;
            }
            
            /* Fix para el margen lateral */
            .main-content {
                margin-left: 0;
                transition: margin-left 0.3s;
            }
            
            @media (min-width: 992px) {
                .main-content {
                    margin-left: 250px; /* Ajustar según el ancho de tu barra lateral */
                }
            }
        </style>
    </head>
    <body>
        <!-- Barra de Navegación -->
        <jsp:include page="../Sistema/BarraNavegacion.jsp" />
        
        <div class="main-content">
            <div class="container-fluid dashboard-container">
                <!-- Header principal -->
                <div class="page-header">
                    <h1>Análisis de tu Progreso</h1>
                    <p class="lead">Visualiza y analiza tu rendimiento en nuestra app</p>
                </div> 
                
                <!-- Estadísticas generales -->
                <div class="row mb-4">
                    <div class="col-lg-4 col-md-6 mb-3">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <div class="stat-info">
                                <h3 class="stat-value"><span id="promG">8.7</span></h3>
                                <p class="stat-label">Promedio General</p>
                                <div class="stat-trend trend-up">
                                    <i class="fas fa-arrow-up"></i> 0.5 puntos
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6 mb-3">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-tasks"></i>
                            </div>
                            <div class="stat-info">
                                <h3 class="stat-value"><span id="numActvs">32</span></h3>
                                <p class="stat-label">Actividades Completadas</p>
                                <div class="stat-trend trend-up">
                                    <i class="fas fa-arrow-up"></i> <span id="numActvsSemana">5</span> esta semana
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6 mb-3">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-award"></i>
                            </div>
                            <div class="stat-info">
                                <h3 class="stat-value"><span id="numLogros">12</span></h3>
                                <p class="stat-label">Logros Obtenidos</p>
                                <div class="stat-trend trend-up">
                                    <i class="fas fa-arrow-up"></i> <span id="numLogrosSemana">2</span> nuevos
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Tarjeta de información -->
                <div class="info-card mb-4">
                    <h3><i class="fas fa-lightbulb"></i> Consejos para mejorar</h3>
                    <p>Basado en tu desempeño reciente, te recomendamos enfocarte en mejorar tus habilidades en <span id="matBaja">Matemáticas</span>. Completar o repetir las actividades de práctica adicionales podría ayudarte a alcanzar un mejor rendimiento.</p>
                </div>
                
                <!-- Gráfico principal (ahora ocupa el ancho completo) -->
                <div class="row">
                <div class="col-12">
                    <div class="chart-card">                        
                        <div id="actividadesChart" class="chart-container"></div>                        
                    </div>                    
                </div>                 
                </div>
                
            </div>
        </div>
        
        <!-- Script de Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="ScriptGraficas.js?v=<%= System.currentTimeMillis() %>"></script>        
       
    </body>
</html>