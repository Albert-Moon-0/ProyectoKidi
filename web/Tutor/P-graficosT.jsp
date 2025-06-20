<%-- 
    Document   : P-graficos
    Created on : 7 abr. 2025, 17:20:26
    Author     : P500
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,org.json.simple.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>

<%
    ResultSet r = null;
    int IdT = 1;
    try {
        PreparedStatement p = c.prepareStatement("SELECT * FROM TUTOR WHERE CORREO_T = ?");
        p.setString(1, userEmail);
        r = p.executeQuery();
        if (r.next()) {
            IdT = r.getInt("ID_T");
            Nombre = r.getString("NOMBRE_T");
            Correo = r.getString("CORREO_T");             
        }
        else{
       out.println("<script>alert('Usuario no encontrado');window.location='../iniciodesesion.jsp';</script>"); 
    }
    } catch (SQLException error) {
        out.print(error.toString());
    }
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

            /* Animaciones y efectos */
            @keyframes slideInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .stat-card, .chart-card, .info-card {
                animation: slideInUp 0.6s ease-out;
                animation-delay: calc(var(--animation-order, 0) * 0.1s);
                animation-fill-mode: both;
            }

            /* Tarjetas de estadísticas */
            .stat-card {
                background: linear-gradient(135deg, white 0%, var(--primary-light) 100%);
                border-radius: 15px;
                padding: 1.5rem;
                box-shadow: var(--card-shadow);
                transition: all 0.3s ease;
                border: 1px solid rgba(108, 138, 232, 0.1);
                height: 100%;
                position: relative;
                overflow: hidden;
            }

            .stat-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, var(--primary-color) 0%, var(--accent-color) 100%);
            }

            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: var(--card-hover-shadow);
            }

            .stat-icon {
                width: 50px;
                height: 50px;
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--hover-color) 100%);
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 1rem;
                box-shadow: 0 4px 15px rgba(108, 138, 232, 0.3);
            }

            .stat-icon i {
                color: white;
                font-size: 1.5rem;
            }

            .stat-value {
                font-size: 2rem;
                font-weight: 700;
                color: var(--primary-color);
                margin: 0;
                line-height: 1;
            }

            .stat-label {
                color: var(--text-secondary);
                font-size: 0.9rem;
                margin: 0.5rem 0;
                font-weight: 500;
            }

            .stat-trend {
                font-size: 0.8rem;
                font-weight: 500;
                padding: 0.25rem 0.5rem;
                border-radius: 20px;
                display: inline-block;
            }

            .trend-up {
                color: #4CAF50;
                background-color: rgba(76, 175, 80, 0.1);
            }

            .trend-down {
                color: #F44336;
                background-color: rgba(244, 67, 54, 0.1);
            }

            .trend-neutral {
                color: #FF9800;
                background-color: rgba(255, 152, 0, 0.1);
            }

            /* Tarjetas de gráficos */
            .chart-card, .info-card {
                background: white;
                border-radius: 15px;
                padding: 1.5rem;
                box-shadow: var(--card-shadow);
                margin-bottom: 1.5rem;
                border: 1px solid rgba(108, 138, 232, 0.1);
                transition: all 0.3s ease;
            }

            .chart-card:hover {
                transform: translateY(-2px);
                box-shadow: var(--card-hover-shadow);
            }

            .chart-header {
                border-bottom: 2px solid var(--secondary-color);
                margin-bottom: 1rem;
                padding-bottom: 0.5rem;
                position: relative;
            }

            .chart-header::after {
                content: '';
                position: absolute;
                bottom: -2px;
                left: 0;
                width: 50px;
                height: 2px;
                background-color: var(--primary-color);
            }

            .chart-header h3 {
                color: var(--primary-color);
                font-weight: 600;
                margin: 0;
                font-size: 1.1rem;
            }

            .chart-container {
                height: 400px;
                width: 100%;
                position: relative;
            }

            /* Tarjeta de información */
            .info-card {
                background: linear-gradient(135deg, var(--accent-color) 0%, var(--accent-hover) 100%);
                color: white;
                border: none;
            }

            .info-card h3 {
                color: white;
                font-weight: 600;
                margin-bottom: 1rem;
                display: flex;
                align-items: center;
            }

            .info-card h3 i {
                margin-right: 0.5rem;
                font-size: 1.3rem;
            }

            .info-card p {
                margin: 0;
                line-height: 1.6;
                opacity: 0.95;
            }

            /* Sección de estudiante */
            .student-section {
                border-left: 4px solid var(--primary-color);
                padding-left: 1.5rem;
                margin-bottom: 3rem;
                position: relative;
            }

            .student-section::before {
                content: '';
                position: absolute;
                left: -8px;
                top: 0;
                width: 8px;
                height: 30px;
                background: var(--accent-color);
                border-radius: 0 4px 4px 0;
            }

            .student-name {
                color: var(--primary-color);
                font-weight: 600;
                font-size: 1.4rem;
                margin-bottom: 1.5rem;
                display: flex;
                align-items: center;
            }

            .student-name i {
                margin-right: 0.5rem;
                font-size: 1.2rem;
            }

            /* Efectos responsive */
            @media (max-width: 768px) {
                body {
                    margin-left: 0;
                }
                
                .container {
                    padding: 15px;
                }
                
                .stat-card {
                    margin-bottom: 1rem;
                }
                
                .chart-container {
                    height: 300px;
                }
            }

            /* Loading state para gráficos */
            .chart-loading {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 400px;
                color: var(--text-secondary);
            }

            .chart-loading i {
                font-size: 2rem;
                margin-right: 0.5rem;
                animation: spin 1s linear infinite;
            }

            @keyframes spin {
                from { transform: rotate(0deg); }
                to { transform: rotate(360deg); }
            }

            /* Estado vacío */
            .empty-state {
                text-align: center;
                padding: 3rem;
                color: var(--text-secondary);
            }

            .empty-state i {
                font-size: 3rem;
                margin-bottom: 1rem;
                color: var(--primary-color);
                opacity: 0.5;
            }

            .empty-state h4 {
                color: var(--text-primary);
                margin-bottom: 0.5rem;
            }
        </style>
    </head>
    <body>
        <!-- Barra de Navegación -->
        <jsp:include page="BarraNavTutor.jsp" />
        
        <div class="container mt-4" id="reportContainer">
            <!-- Header principal -->
            <div class="page-header">
                <h1>Informe de Progreso Académico</h1>
                <p class="lead">Análisis detallado del rendimiento de tus estudiantes</p>
            </div>     
            
            <%
                Connection conn = null;
                conn = c; // Guardar la conexión en una variable local
                PreparedStatement ps = null;
                ResultSet rs = null;
                ResultSet rs2 = null;
                PreparedStatement ps2 = null;
                boolean hayNinos = false;
                int contadorEstudiante = 0;

                try {
                    // Mostrar el ID del tutor para depuración
                    System.out.println("ID del Tutor para consulta: " + IdT);

                    // Obtenemos los usuarios asociados al tutor
                    ps = c.prepareStatement("SELECT ID_U, NOMBRE_U FROM USUARIO WHERE ID_T=?");
                    ps.setInt(1, IdT);
                    rs = ps.executeQuery();

                    // Verificar si hay resultados
                    while (rs.next()) {
                        int idUser = rs.getInt("ID_U");
                        String nombreUsuario = rs.getString("NOMBRE_U");
                        hayNinos = true;
                        contadorEstudiante++;
            %>
            
            <!-- Sección por estudiante -->
            <div class="student-section" style="--animation-order: <%= contadorEstudiante %>">
                <div class="student-name">
                    <i class="fas fa-user-graduate"></i>
                    <%= nombreUsuario %>
                </div>
                
                <!-- Estadísticas del estudiante -->
                <div class="row mb-3">
                    <div class="col-lg-4 col-md-6 mb-3" style="--animation-order: <%= contadorEstudiante * 3 + 1 %>">
                        <%                                
                            int ID_U = rs.getInt("ID_U");
                            int[] sumas = {0, 0, 0};
                            int[] contadores = {0, 0, 0};
                            double[] promedios = {0, 0, 0};
                            // 1 español, 2 ingles, 3 matematicas
                            String[] materias = {"Español", "Inglés", "Matemáticas"};

                            // Cerrar el ResultSet antes de reutilizar
                            if (rs2 != null) try { rs2.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (ps2 != null) try { ps2.close(); } catch (SQLException e) { e.printStackTrace(); }

                            int actividadesT = 0;
                            int actividadesSemana = 0;

                            for (int i = 0; i < 3; i++) {
                                int materia = i + 1;

                                String queryActividades = "SELECT COUNT(*) as numActividades FROM REALIZA " +
                                               "WHERE ID_U = ?";
                                ps2 = conn.prepareStatement(queryActividades);
                                ps2.setInt(1, ID_U);
                                rs2 = ps2.executeQuery();

                                if (rs2.next()) {
                                    actividadesT = rs2.getInt("numActividades");
                                }

                                // Cerrar recursos
                                rs2.close();
                                ps2.close();

                                String queryActividadesSemana = "SELECT COUNT(*) as numActividades FROM REALIZA " +
                                               "WHERE ID_U = ? AND FECHA_REALIZA >= DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY)";
                                ps2 = conn.prepareStatement(queryActividadesSemana);
                                ps2.setInt(1, ID_U);
                                rs2 = ps2.executeQuery();
                                if (rs2.next()) {
                                    actividadesSemana = rs2.getInt("numActividades");
                                }

                                // Cerrar recursos
                                rs2.close();
                                ps2.close();

                                String query2 = "SELECT r.PUNTAJE_ACT FROM REALIZA r " +
                               "JOIN ACTIVIDADES a ON a.ID_ACT = r.ID_ACT " +
                               "WHERE r.ID_U = ? AND a.ID_MAT = ?";
                                ps2 = conn.prepareStatement(query2);
                                ps2.setInt(1, ID_U);
                                ps2.setInt(2, materia);
                                rs2 = ps2.executeQuery();

                                while (rs2.next()) {
                                    sumas[i] = sumas[i] + rs2.getInt("PUNTAJE_ACT");
                                    contadores[i] = contadores[i] + 1;
                                }

                                // Cerrar recursos antes de reutilizar
                                rs2.close();
                                ps2.close();

                                if (contadores[i] == 0) {
                                    promedios[i] = 0;
                                } else {
                                    promedios[i] = (double)sumas[i] / contadores[i];
                                }
                            }

                            // Calcular promedio general
                            double sumaG = 0;
                            int materiasConDatos = 0;

                            for (int j = 0; j < 3; j++) {
                                if (contadores[j] > 0) {
                                    sumaG += promedios[j];
                                    materiasConDatos++;
                                }
                            }

                            double promG2 = (materiasConDatos > 0) ? sumaG / materiasConDatos : 0;   
                            double promG = promG2 * 10;
                        %>
                        
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <div class="stat-info">
                                <h3 class="stat-value"><%= String.format("%.2f", promG) %>%</h3>
                                <p class="stat-label">Promedio General</p>
                                <div class="stat-trend <%= promG >= 80 ? "trend-up" : promG >= 60 ? "trend-neutral" : "trend-down" %>">
                                    <i class="fas fa-<%= promG >= 80 ? "arrow-up" : promG >= 60 ? "minus" : "arrow-down" %>"></i> 
                                    <%= promG >= 80 ? "Excelente rendimiento" : promG >= 60 ? "Rendimiento moderado" : "Necesita mejorar" %>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6 mb-3" style="--animation-order: <%= contadorEstudiante * 3 + 2 %>">                        
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-tasks"></i>
                            </div>
                            <div class="stat-info">
                                <h3 class="stat-value"><%= actividadesT %></h3>
                                <p class="stat-label">Actividades Completadas</p>
                                <div class="stat-trend <%= actividadesSemana > 0 ? "trend-up" : "trend-neutral" %>">
                                    <i class="fas fa-<%= actividadesSemana > 0 ? "arrow-up" : "minus" %>"></i> 
                                    <%= actividadesSemana %> esta semana
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tarjeta de análisis personalizado -->
                <div class="info-card mb-4" style="--animation-order: <%= contadorEstudiante * 3 + 4 %>">
                    <h3><i class="fas fa-lightbulb"></i> Análisis de Progreso - <%= nombreUsuario %></h3>
                    <p>
                        <%= nombreUsuario %> ha mostrado un 
                        <%= promG >= 80 ? "excelente" : promG >= 60 ? "buen" : "moderado" %> 
                        rendimiento académico con un promedio de <%= String.format("%.2f", promG) %>%. 
                        Ha completado <%= actividadesT %> actividades en total
                        <%= actividadesSemana > 0 ? ", incluyendo " + actividadesSemana + " en la última semana" : "" %>.
                        <%= promG >= 80 ? "¡Mantén el excelente trabajo!" : 
                            promG >= 60 ? "Sigue esforzándote para alcanzar la excelencia." : 
                            "Se recomienda brindar apoyo adicional para mejorar el rendimiento." %>
                    </p>
                </div>
                
                <!-- Gráfico del estudiante -->
                <div class="row" style="--animation-order: <%= contadorEstudiante * 3 + 5 %>">
                    <div class="col-12">
                        <div class="chart-card">
                            <div class="chart-header">
                                <h3>Desempeño por Materias - <%= nombreUsuario %></h3>
                            </div>
                            <div id="actividadesChart<%= idUser %>" class="chart-container" style="height: 400px; width: 100%;"></div>
                        </div>
                    </div>
                </div>

                <!-- Script específico para este estudiante -->
                <script type="text/javascript">
                    // Datos para el estudiante <%= idUser %>
                    window.chartData<%= idUser %> = [
                        {"materia": "Español", "promedio": <%= String.format("%.2f", promedios[0]) %>},
                        {"materia": "Inglés", "promedio": <%= String.format("%.2f", promedios[1]) %>},
                        {"materia": "Matemáticas", "promedio": <%= String.format("%.2f", promedios[2]) %>}
                    ];

                    // Función para inicializar el gráfico del estudiante <%= idUser %>
                    function initChart<%= idUser %>() {
                        const chartElement = document.getElementById('actividadesChart<%= idUser %>');
                        if (!chartElement) {
                            console.error('No se encontró el elemento del gráfico para el estudiante <%= idUser %>');
                            return;
                        }

                        if (typeof echarts === 'undefined') {
                            console.error('ECharts no está cargado');
                            return;
                        }

                        const chart = echarts.init(chartElement);
                        
                        const datos = window.chartData<%= idUser %>;
                        const materias = datos.map(item => item.materia);
                        const promedios = datos.map(item => item.promedio);

                        const option = {
                            title: {
                                text: 'Desempeño por Materias',
                                left: 'center',
                                textStyle: {
                                    fontSize: 16
                                }
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'shadow'
                                },
                                formatter: function(params) {
                                    return params[0].name + '<br/>' + 
                                           params[0].seriesName + ': ' + 
                                           params[0].value + '/10';
                                }
                            },
                            toolbox: {
                                feature: {
                                    saveAsImage: {
                                        title: 'Guardar como imagen'
                                    }
                                }
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            xAxis: {
                                type: 'category',
                                data: materias,
                                axisLabel: {
                                    interval: 0,
                                    rotate: 0
                                }
                            },
                            yAxis: {
                                type: 'value',
                                min: 0,
                                max: 10,
                                axisLabel: {
                                    formatter: '{value}/10'
                                }
                            },
                            series: [{
                                name: 'Promedio',
                                type: 'bar',
                                data: promedios,
                                itemStyle: {
                                    color: function(params) {
                                        const colors = ['#6C8AE8', '#E8766C', '#6CE8A4'];
                                        return colors[params.dataIndex % colors.length];
                                    }
                                },
                                label: {
                                    show: true,
                                    position: 'top',
                                    formatter: '{c}/10'
                                },
                                barWidth: '60%'
                            }]
                        };

                        chart.setOption(option);

                        // Redimensionar gráfico cuando cambie el tamaño de la ventana
                        window.addEventListener('resize', function() {
                            chart.resize();
                        });

                        console.log('Gráfico inicializado para estudiante <%= idUser %>');
                    }

                    // Inicializar el gráfico cuando el DOM esté listo
                    if (document.readyState === 'loading') {
                        document.addEventListener('DOMContentLoaded', function() {
                            setTimeout(initChart<%= idUser %>, 100);
                        });
                    } else {
                        setTimeout(initChart<%= idUser %>, 100);
                    }
                </script>
            </div>
            
            <%
                // Fin del while para cada usuario
                }
                
                if (!hayNinos) {
            %>
                    <div class="empty-state">
                        <i class="fas fa-user-graduate"></i>
                        <h4>No hay estudiantes registrados</h4>
                        <p>Aún no tienes estudiantes asignados para generar informes.</p>
                    </div>
            <%
                }
                
            } catch(Exception e) {
                // Log el error en lugar de mostrarlo directamente al usuario
                System.out.println("Error al obtener datos de estudiantes: " + e.getMessage());
                e.printStackTrace();
            %>
                <div class="col-12">
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        Ocurrió un error al cargar la información. Por favor intenta más tarde.
                    </div>
                </div>
            <%
            } finally {
                // Cerrar recursos adecuadamente
                try {
                    if (rs2 != null) rs2.close();
                    if (ps2 != null) ps2.close();
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    // No cerramos c porque podría ser utilizado después
                } catch (SQLException e) {
                    System.out.println("Error al cerrar recursos: " + e.getMessage());
                }
            }
            %>
        </div>

        <!-- Asegurar que ECharts esté disponible -->
        <script>
            // Verificar que ECharts esté cargado
            if (typeof echarts === 'undefined') {
                console.error('ECharts no está disponible. Asegúrate de incluir el script de ECharts antes de este código.');
            } else {
                console.log('ECharts está disponible y listo para usar.');
            }
        </script>
    </body>
    
</html>