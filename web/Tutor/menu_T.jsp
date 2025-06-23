<%-- 
    Document   : menu_T
    Created on : 11 abr. 2025, 18:51:58
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../Sistema/ConexionBD.jsp" %>

<%
    ResultSet r = null;
    int IdT =1;
    try {
        PreparedStatement p = c.prepareStatement("SELECT * FROM TUTOR WHERE CORREO_T = ?");
        p.setString(1, userEmail);
        r = p.executeQuery();
        if (r.next()) {
            IdT = r.getInt("ID_T");
            Nombre = r.getString("NOMBRE_T");
            Correo = r.getString("CORREO_T");
%>
<script>
                alert("Bienvenido <%=Nombre%>, tu correo es <%=Correo%>");
            </script>

<%
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
        <title>Kidi - Inicio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        
        <!-- Intro.js CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intro.js/7.2.0/introjs.min.css">
        
        <link rel="stylesheet" href="EstilosPMaterias.css">
        
        <style>
    /* Estilos para las tarjetas de actividad del estudiante */
    .student-activity-card, .student-progress-card {
        background-color: white;
        border-radius: 15px;
        box-shadow: var(--card-shadow);
        padding: 1.5rem;
        transition: all 0.3s ease;
        height: 100%;
        display: flex;
        border-left: 4px solid var(--primary-color);
    }
    
    .student-activity-card:hover, .student-progress-card:hover {
        box-shadow: var(--card-hover-shadow);
        transform: translateY(-5px);
    }
    
    .student-avatar {
        background-color: var(--primary-light);
        border-radius: 12px;
        min-width: 70px;
        height: 70px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 1.5rem;
        font-size: 2rem;
        color: var(--primary-color);
        position: relative;
    }
    
    .activity-badge {
        position: absolute;
        top: -8px;
        right: -8px;
        background-color: #FF5722;
        color: white;
        border-radius: 50%;
        width: 24px;
        height: 24px;
        font-size: 0.8rem;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
    }
    
    .student-info {
        flex-grow: 1;
    }
    
    .student-name {
        font-weight: 600;
        color: var(--primary-color);
        margin-bottom: 0.5rem;
    }
    
    .activity-summary {
        font-size: 0.95rem;
        color: var(--text-secondary);
        margin-bottom: 1rem;
    }
    
    .activities-list {
        background-color: var(--primary-light);
        border-radius: 10px;
        padding: 0.8rem;
    }
    
    .activity-item {
        display: flex;
        align-items: center;
        padding: 0.5rem 0;
        border-bottom: 1px solid rgba(108, 138, 232, 0.1);
    }
    
    .activity-item:last-child {
        border-bottom: none;
    }
    
    .activity-item i {
        color: var(--primary-color);
        margin-right: 10px;
        font-size: 0.9rem;
        width: 20px;
    }
    
    .activity-date {
        margin-left: auto;
        font-size: 0.8rem;
        color: var(--text-secondary);
        background-color: rgba(108, 138, 232, 0.1);
        padding: 2px 8px;
        border-radius: 10px;
    }
    
    /* Estilos para la tarjeta de progreso */
    .student-progress-card {
        flex-direction: column;
    }
    
    .progress-header {
        margin-bottom: 1.5rem;
        padding-bottom: 0.8rem;
        border-bottom: 1px solid var(--primary-light);
    }
    
    .progress-header h5 {
        color: var(--primary-color);
        font-weight: 600;
        margin: 0;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    
    .student-progress-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 1rem;
    }
    
    .student-progress-info {
        display: flex;
        align-items: center;
        gap: 15px;
        flex-grow: 1;
        max-width: 80%;
    }
    
    .student-avatar-sm {
        background-color: var(--primary-light);
        border-radius: 10px;
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.2rem;
        color: var(--primary-color);
    }
    
    .progress {
        height: 10px;
        border-radius: 5px;
        background-color: var(--primary-light);
        margin-top: 5px;
        width: 100%;
    }
    
    .progress-bar {
        background-color: var(--primary-color);
        border-radius: 5px;
    }
    
    .progress-value {
        font-size: 1.8rem;
        font-weight: 700;
        color: var(--primary-color);
    }
    
    .performance-indicator {
        display: flex;
        align-items: center;
        gap: 8px;
        background-color: var(--primary-light);
        padding: 0.7rem;
        border-radius: 10px;
        margin-top: 0.5rem;
        font-size: 0.9rem;
    }
    
    .performance-indicator i {
        color: #4CAF50;
    }
    
    @media (max-width: 768px) {
        .student-activity-card, .student-progress-card {
            padding: 1.2rem;
        }
        
        .student-avatar {
            min-width: 60px;
            height: 60px;
            margin-right: 1rem;
        }
        
        .progress-value {
            font-size: 1.5rem;
        }
    }
    
    /* Estilos personalizados para el tour */
    .tour-btn {
        position: fixed;
        bottom: 30px;
        right: 30px;
        background: linear-gradient(135deg, var(--primary-color), var(--hover-color));
        color: white;
        border: none;
        border-radius: 50px;
        padding: 15px 25px;
        font-size: 16px;
        font-weight: 600;
        box-shadow: 0 4px 15px rgba(108, 138, 232, 0.3);
        cursor: pointer;
        transition: all 0.3s ease;
        z-index: 1000;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    
    .tour-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(108, 138, 232, 0.4);
    }
    
    .tour-btn i {
        font-size: 18px;
    }
    
    /* Personalización de Intro.js */
    .introjs-tooltip {
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        border: none;
        font-family: 'Poppins', sans-serif;
    }
    
    .introjs-tooltiptext {
        font-size: 16px;
        line-height: 1.5;
        color: #333;
    }
    
    .introjs-button {
        border-radius: 25px;
        padding: 8px 20px;
        font-weight: 500;
        font-family: 'Poppins', sans-serif;
        border: none;
        transition: all 0.3s ease;
    }
    
    .introjs-nextbutton {
        background-color: var(--primary-color);
        color: white;
    }
    
    .introjs-nextbutton:hover {
        background-color: var(--hover-color);
        transform: translateY(-1px);
    }
    
    .introjs-prevbutton {
        background-color: #f8f9fa;
        color: #6c757d;
        border: 1px solid #dee2e6;
    }
    
    .introjs-skipbutton {
        color: var(--text-secondary);
    }
    
    .introjs-skipbutton:hover {
        color: var(--primary-color);
    }
</style>
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

            .header-title {
                margin-bottom: 0.5rem;
                position: relative;
            }

            .header-title h1 {
                color: var(--primary-color);
                font-weight: 600;
                font-size: 1.8rem;
                position: relative;
                display: inline-block;
                padding-bottom: 0.5rem;
            }

            .header-title h1::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 80px;
                height: 3px;
                background-color: var(--primary-color);
            }

            .greeting {
                margin-bottom: 3rem;
                animation: fadeIn 0.8s ease-out forwards;
            }

            .greeting h2 {
                font-size: 2.5rem;
                font-weight: 500;
                color: var(--text-primary);
            }

            .greeting span {
                color: var(--primary-color);
                font-weight: 600;
            }

            .content-section {
                margin-bottom: 3rem;
                animation: fadeIn 0.5s ease-out forwards;
                background-color: white;
                border-radius: 20px;
                box-shadow: var(--card-shadow);
                padding: 2rem;
                position: relative;
                overflow: hidden;
            }

            .content-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 8px;
                height: 100%;
                background-color: var(--primary-color);
            }

            .content-section h2 {
                color: var(--text-primary);
                font-weight: 600;
                font-size: 1.5rem;
                margin-bottom: 1.5rem;
                display: flex;
                align-items: center;
            }

            .content-section h2:before {
                content: '\f0a1';
                font-family: 'Font Awesome 6 Free';
                font-weight: 900;
                color: var(--primary-color);
                margin-right: 10px;
                font-size: 1.2rem;
            }

            .card {
                border: none;
                border-radius: 15px;
                transition: all 0.3s ease;
                overflow: hidden;
                height: 100%;
                border-top: 4px solid transparent;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: var(--card-hover-shadow);
                border-top-color: var(--primary-color);
            }

            .card-title {
                font-weight: 600;
                color: var(--primary-color);
                font-size: 1.1rem;
                display: flex;
                align-items: center;
            }

            .card-title::before {
                font-family: 'Font Awesome 6 Free';
                font-weight: 900;
                margin-right: 10px;
                font-size: 1rem;
            }

            .card:nth-child(1) .card-title::before {
                content: '\f1ec'; /* Matemáticas - gráfico */
                color: #FF9800;
            }

            .card:nth-child(2) .card-title::before {
                content: '\f02d'; /* Lecturas - libro */
                color: #4CAF50;
            }

            .card:nth-child(3) .card-title::before {
                content: '\f11c'; /* Juegos de palabras - teclado */
                color: #9C27B0;
            }

            .card-text {
                color: var(--text-secondary);
                font-size: 0.95rem;
            }

            /* Quick Stats Section */
            .stats-container {
                margin-bottom: 3rem;
            }

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
                border-left: 4px solid var(--primary-color);
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
                font-size: 1.6rem;
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

            /* Enlaces dentro de las tarjetas */
            .card-link {
                display: inline-block;
                margin-top: 1rem;
                color: var(--primary-color);
                font-weight: 500;
                font-size: 0.9rem;
                text-decoration: none;
                transition: all 0.2s ease;
            }

            .card-link:hover {
                color: var(--hover-color);
                text-decoration: underline;
            }

            .card-link i {
                margin-left: 5px;
                font-size: 0.8rem;
            }

            /* Animaciones */
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(10px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .stat-card, .card {
                animation: fadeIn 0.5s ease-out forwards;
                animation-delay: calc(var(--animation-order) * 0.1s);
            }

            /* Media queries */
            @media (max-width: 992px) {
                body {
                    margin-left: 0;
                }
                
                .container {
                    padding: 20px;
                }
                
                .greeting h2 {
                    font-size: 2rem;
                }
            }

            @media (max-width: 768px) {
                .greeting h2 {
                    font-size: 1.8rem;
                }
                
                .content-section {
                    padding: 1.5rem;
                }
            }

            @media (max-width: 576px) {
                .container {
                    padding: 15px;
                }
                
                .greeting h2 {
                    font-size: 1.5rem;
                }
                
                .header-title h1 {
                    font-size: 1.6rem;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="BarraNavTutor.jsp" />
        
        <!-- Botón flotante para iniciar el tour -->
        <button class="tour-btn" onclick="startTour()" title="Iniciar tour guiado">
            <i class="fas fa-question-circle"></i>
            Tour Guiado
        </button>
        
        <div class="container mt-4">
            <div class="header-title" data-intro="¡Bienvenido a Kidi! Esta es tu página principal donde puedes ver toda la información importante." data-step="1">
                <h1>Bienvenido a Kidi</h1>
            </div>
            <div class="greeting mb-4" data-intro="Aquí aparece tu saludo personalizado con tu nombre de usuario." data-step="2">
                <h2>Hola de nuevo, <span><%= Nombre %></span></h2>
            </div>            

<section class="content-section" data-intro="En esta sección puedes ver toda la actividad reciente de los niños que tienes registrados. Cada tarjeta muestra las actividades completadas en la última semana." data-step="3">
    <h2>Actividad de tus niños</h2>
    
        
    <div class="row">
        <%
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean hayNinos = false;
        
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
                hayNinos= true;
                
        %>
        <div class="col-lg-6 mb-4" style="--animation-order: 4">            
            <div class="student-activity-card">
                <div class="student-avatar">
                    <%
                    // Consulta para obtener cantidad de actividades en la última semana
                    try (PreparedStatement ps2 = c.prepareStatement(
                            "SELECT COUNT(*) as numActividades FROM REALIZA " +
                            "WHERE ID_U = ? AND FECHA_REALIZA >= DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY)")) {
                        
                        ps2.setInt(1, idUser);
                        try (ResultSet rs2 = ps2.executeQuery()) {
                            int actividadesSemana = 0;
                            if (rs2.next()) {
                                actividadesSemana = rs2.getInt("numActividades");
                            }
                    %>
                    <i class="fas fa-user-graduate"></i>
                    <span class="activity-badge"><%= actividadesSemana %></span>
                </div>
                <div class="student-info">
                    <h5 class="student-name"><%= nombreUsuario %></h5>
                    <p class="activity-summary">Ha completado <strong><%= actividadesSemana %> actividades</strong> esta semana</p>
                    <div class="activities-list">
                        <%
                        }
                    }
                    
                    // Consulta para obtener detalles de actividades en la última semana
                    try (PreparedStatement ps3 = c.prepareStatement(
                            "SELECT A.DESC_ACT, R.FECHA_REALIZA " +
                            "FROM REALIZA R " +
                            "JOIN ACTIVIDADES A ON R.ID_ACT = A.ID_ACT " +
                            "WHERE R.ID_U = ? AND R.FECHA_REALIZA >= DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY)" +
                            "ORDER BY R.FECHA_REALIZA DESC")) {
                        
                        ps3.setInt(1, idUser);
                        try (ResultSet rs3 = ps3.executeQuery()) {
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                            
                            while (rs3.next()) {
                                String nombreActividad = rs3.getString("DESC_ACT");
                                java.sql.Date fecha = rs3.getDate("FECHA_REALIZA");
                        %>
                        <div class="activity-item">
                            <i class="fas fa-check-circle"></i>
                            <span><%= nombreActividad %></span>
                            <span class="activity-date"><%= dateFormat.format(fecha) %></span>
                        </div>
                        <%
                            }
                        }
                    } catch (SQLException e) {
                        // Log el error en lugar de mostrarlo al usuario
                        // logger.error("Error al obtener actividades del estudiante", e);
                    }
                    %>
                    </div>
                </div>
            </div>
        </div>
                    
        
        <%
            // Fin del while para cada usuario
            }
            if (!hayNinos) {
                %>
                <div class="col-12 text-center">
                    <div class="alert alert-info">
                        No se encontraron niños asociados.
                    </div>
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
                    Ocurrió un error al cargar la información. Por favor intenta más tarde.
                </div>
            </div>
            <%
        } finally {
            // Cerrar recursos adecuadamente
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                // No cerramos c porque podría ser utilizado después
            } catch (SQLException e) {
                // logger.error("Error al cerrar recursos", e);
            }
        }
        %>
    </div>
</section>


            
            <!-- Acciones Rápidas -->
            <section class="content-section" data-intro="Estas son las acciones rápidas que puedes realizar desde aquí. Cada tarjeta te lleva a una funcionalidad específica de la plataforma." data-step="4">
                <h2>Acciones Rápidas</h2>
                <div class="row">
                    <div class="col-lg-3 col-md-6 mb-4" style="--animation-order: 7" data-intro="Haz clic aquí para registrar un nuevo niño en tu cuenta. Podrás agregar su información y comenzar a hacer seguimiento de su progreso." data-step="5">
                        <div class="card p-4 shadow-sm text-center h-100">
                            <div class="mb-3">
                                <i class="fas fa-user-plus fa-3x text-primary"></i>
                            </div>
                            <h5 class="card-title text-center">Añadir Niño</h5>
                            <p class="card-text">Registra un nuevo niño a tu cuenta</p>
                            <a href="P-AnadirN.jsp" class="card-link">Registrar <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-4" style="--animation-order: 8" data-intro="Aquí puedes ver la lista completa de todos los niños que tienes registrados en tu cuenta." data-step="6">
                        <div class="card p-4 shadow-sm text-center h-100">
                            <div class="mb-3">
                                <i class="fas fa-eye fa-3x text-success"></i>
                            </div>
                            <h5 class="card-title text-center">Ver Mis Niños</h5>
                            <p class="card-text">Consulta la lista de niños registrados</p>
                            <a href="ver-ninos.jsp" class="card-link">Ver lista <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-4" style="--animation-order: 9" data-intro="En esta sección puedes revisar informes detallados del progreso académico de cada niño, con gráficos y estadísticas." data-step="7">
                        <div class="card p-4 shadow-sm text-center h-100">
                            <div class="mb-3">
                                <i class="fas fa-file-alt fa-3x text-warning"></i>
                            </div>
                            <h5 class="card-title text-center">Informes</h5>
                            <p class="card-text">Revisa el progreso académico</p>
                            <a href="../Tutor/P-graficosT.jsp" class="card-link">Ver informes <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-4" style="--animation-order: 10" data-intro="Desde aquí puedes administrar tu información personal, cambiar tu contraseña y actualizar tus datos de contacto." data-step="8">
                        <div class="card p-4 shadow-sm text-center h-100">
                            <div class="mb-3">
                                <i class="fas fa-user-circle fa-3x text-info"></i>
                            </div>
                            <h5 class="card-title text-center">Mi Perfil</h5>
                            <p class="card-text">Administra tu información personal</p>
                            <a href="../Tutor/P-perfilT.jsp" class="card-link">Editar perfil <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        
        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Intro.js JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intro.js/7.2.0/intro.min.js"></script>
        
        <script>
            function startTour() {
                introJs().setOptions({
                    nextLabel: 'Siguiente →',
                    prevLabel: '← Anterior',
                    skipLabel: 'Omitir',
                    doneLabel: '¡Terminado!',
                    exitOnOverlayClick: false,
                    showStepNumbers: true,
                    scrollToElement: true,
                    overlayOpacity: 0.8,
                    tooltipPosition: 'auto',
                    positionPrecedence: ['bottom', 'top', 'right', 'left']
                }).start();
            }
            
            // Verificar si es la primera visita del usuario
            function checkFirstVisit() {
                // Verificar si existe una marca en sessionStorage para saber si ya vio el tour
                if (!sessionStorage.getItem('tourCompleted')) {
                    // Mostrar el tour automáticamente después de 2 segundos
                    setTimeout(function() {
                        startTour();
                    }, 2000);
                }
            }
            
            // Marcar que el usuario completó el tour
            function markTourCompleted() {
                sessionStorage.setItem('tourCompleted', 'true');
            }
            
            // Función mejorada para iniciar el tour
            function startTour() {
                introJs().setOptions({
                    nextLabel: 'Siguiente →',
                    prevLabel: '← Anterior',
                    skipLabel: 'Omitir',
                    doneLabel: '¡Terminado!',
                    exitOnOverlayClick: false,
                    showStepNumbers: true,
                    scrollToElement: true,
                    overlayOpacity: 0.8,
                    tooltipPosition: 'auto',
                    positionPrecedence: ['bottom', 'top', 'right', 'left'],
                    disableInteraction: true,
                    highlightClass: 'introjs-custom-highlight'
                }).oncomplete(function() {
                    // Cuando el tour se completa
                    markTourCompleted();
                    showCompletionMessage();
                }).onexit(function() {
                    // Cuando el usuario sale del tour
                    markTourCompleted();
                }).start();
            }
            
            // Mostrar mensaje de completación
            function showCompletionMessage() {
                // Crear un elemento de notificación
                const notification = document.createElement('div');
                notification.innerHTML = `
                    <div style="
                        position: fixed;
                        top: 20px;
                        right: 20px;
                        background: linear-gradient(135deg, #6C8AE8, #5A7BE0);
                        color: white;
                        padding: 15px 25px;
                        border-radius: 15px;
                        box-shadow: 0 4px 15px rgba(108, 138, 232, 0.3);
                        z-index: 9999;
                        font-family: 'Poppins', sans-serif;
                        font-weight: 500;
                        display: flex;
                        align-items: center;
                        gap: 10px;
                        animation: slideIn 0.5s ease-out;
                    ">
                        <i class="fas fa-check-circle"></i>
                        ¡Tour completado! Ya conoces todas las funcionalidades principales.
                    </div>
                `;
                
                document.body.appendChild(notification);
                
                // Remover la notificación después de 4 segundos
                setTimeout(() => {
                    notification.style.animation = 'slideOut 0.5s ease-out';
                    setTimeout(() => {
                        if (notification.parentNode) {
                            notification.parentNode.removeChild(notification);
                        }
                    }, 500);
                }, 4000);
            }
            
            // Agregar animaciones CSS para las notificaciones
            const style = document.createElement('style');
            style.textContent = `
                @keyframes slideIn {
                    from {
                        transform: translateX(100%);
                        opacity: 0;
                    }
                    to {
                        transform: translateX(0);
                        opacity: 1;
                    }
                }
                
                @keyframes slideOut {
                    from {
                        transform: translateX(0);
                        opacity: 1;
                    }
                    to {
                        transform: translateX(100%);
                        opacity: 0;
                    }
                }
                
                .introjs-custom-highlight {
                    box-shadow: 0 0 0 4px rgba(108, 138, 232, 0.4) !important;
                    border-radius: 15px !important;
                }
                
                /* Efecto pulsante en el botón del tour */
                @keyframes pulse {
                    0% {
                        box-shadow: 0 4px 15px rgba(108, 138, 232, 0.3);
                    }
                    50% {
                        box-shadow: 0 4px 25px rgba(108, 138, 232, 0.6);
                        transform: translateY(-2px);
                    }
                    100% {
                        box-shadow: 0 4px 15px rgba(108, 138, 232, 0.3);
                    }
                }
                
                .tour-btn-pulse {
                    animation: pulse 2s infinite;
                }
            `;
            document.head.appendChild(style);
            
            // Ejecutar cuando la página esté lista
            document.addEventListener('DOMContentLoaded', function() {
                // Verificar si es primera visita después de un pequeño delay
                setTimeout(checkFirstVisit, 1000);
                
                // Agregar efecto pulsante al botón del tour si no ha completado el tour
                if (!sessionStorage.getItem('tourCompleted')) {
                    setTimeout(() => {
                        const tourBtn = document.querySelector('.tour-btn');
                        if (tourBtn) {
                            tourBtn.classList.add('tour-btn-pulse');
                        }
                    }, 5000);
                }
            });
            
            // Función para resetear el tour (útil para testing)
            function resetTour() {
                sessionStorage.removeItem('tourCompleted');
                location.reload();
            }
        </script>
        
    </body>
</html>