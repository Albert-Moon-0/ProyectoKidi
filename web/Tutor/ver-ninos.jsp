<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
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
        } else {
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
    <title>Mis Niños Registrados - Kidi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
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
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            padding: 30px;
        }

        .header-section {
            background-color: white;
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            padding: 2rem;
            margin-bottom: 3rem;
            position: relative;
            overflow: hidden;
        }

        .header-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 8px;
            height: 100%;
            background-color: var(--primary-color);
        }

        .header-title {
            color: var(--primary-color);
            font-weight: 600;
            font-size: 2rem;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .header-title i {
            background-color: var(--primary-light);
            color: var(--primary-color);
            border-radius: 12px;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .subtitle {
            color: var(--text-secondary);
            font-size: 1rem;
            margin-top: 0.5rem;
            margin-left: 65px;
        }

        .users-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }

        .user-card {
            background: white;
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            padding: 2rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            border-left: 6px solid var(--primary-color);
        }

        .user-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--card-hover-shadow);
        }

        .user-card::after {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(108, 138, 232, 0.05), transparent);
            transform: rotate(45deg);
            transition: all 0.5s ease;
            opacity: 0;
        }

        .user-card:hover::after {
            opacity: 1;
            top: -10%;
            right: -10%;
        }

        .user-content {
            display: flex;
            align-items: center;
            gap: 2rem;
            position: relative;
            z-index: 2;
        }

        .user-avatar {
            position: relative;
            flex-shrink: 0;
        }

        .user-avatar img {
            width: 100px;
            height: 100px;
            border-radius: 20px;
            object-fit: cover;
            border: 4px solid var(--primary-light);
            transition: all 0.3s ease;
        }

        .user-card:hover .user-avatar img {
            border-color: var(--primary-color);
            transform: scale(1.05);
        }

        .avatar-badge {
            position: absolute;
            bottom: -5px;
            right: -5px;
            background: linear-gradient(135deg, var(--primary-color), var(--hover-color));
            color: white;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            border: 3px solid white;
            box-shadow: 0 3px 10px rgba(0,0,0,0.2);
        }

        .user-info {
            flex-grow: 1;
        }

        .user-name {
            font-size: 1.4rem;
            font-weight: 600;
            color: var(--text-primary);
            margin: 0 0 10px 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-name i {
            color: var(--primary-color);
            font-size: 1.2rem;
        }

        .user-email {
            color: var(--text-secondary);
            font-size: 1rem;
            margin: 0 0 15px 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-email i {
            color: var(--accent-color);
            font-size: 0.9rem;
        }

        .user-stats {
            display: flex;
            gap: 15px;
            margin-top: 15px;
        }

        .stat-item {
            background-color: var(--primary-light);
            padding: 8px 15px;
            border-radius: 15px;
            font-size: 0.85rem;
            color: var(--primary-color);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .stat-item i {
            font-size: 0.8rem;
        }

        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            background: white;
            border-radius: 20px;
            box-shadow: var(--card-shadow);
        }

        .empty-state i {
            font-size: 4rem;
            color: var(--primary-light);
            margin-bottom: 2rem;
        }

        .empty-state h3 {
            color: var(--text-primary);
            font-weight: 500;
            margin-bottom: 1rem;
        }

        .empty-state p {
            color: var(--text-secondary);
            margin-bottom: 2rem;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: linear-gradient(135deg, var(--primary-color), var(--hover-color));
            color: white;
            padding: 12px 30px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(108, 138, 232, 0.3);
            margin-top: 2rem;
        }

        .back-button:hover {
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(108, 138, 232, 0.4);
        }

        .back-button i {
            font-size: 1rem;
        }

        .stats-summary {
            background: white;
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            padding: 2rem;
            margin-bottom: 3rem;
            display: flex;
            justify-content: space-around;
            text-align: center;
        }

        .summary-item {
            flex: 1;
        }

        .summary-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            display: block;
        }

        .summary-label {
            color: var(--text-secondary);
            font-size: 0.9rem;
            margin-top: 0.5rem;
        }

        /* Animaciones */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .user-card {
            animation: fadeInUp 0.6s ease-out forwards;
            animation-delay: calc(var(--animation-order) * 0.1s);
        }

        /* Responsive */
        @media (max-width: 992px) {
            body {
                margin-left: 0;
            }
            
            .users-grid {
                grid-template-columns: 1fr;
            }
            
            .container {
                padding: 20px;
            }
        }

        @media (max-width: 768px) {
            .user-content {
                flex-direction: column;
                text-align: center;
                gap: 1.5rem;
            }
            
            .user-avatar img {
                width: 80px;
                height: 80px;
            }
            
            .avatar-badge {
                width: 30px;
                height: 30px;
                font-size: 0.9rem;
            }
            
            .user-stats {
                justify-content: center;
                flex-wrap: wrap;
            }
            
            .stats-summary {
                flex-direction: column;
                gap: 1.5rem;
            }
        }

        @media (max-width: 576px) {
            .container {
                padding: 15px;
            }
            
            .header-title {
                font-size: 1.6rem;
                flex-direction: column;
                text-align: center;
                gap: 10px;
            }
            
            .subtitle {
                margin-left: 0;
                text-align: center;
            }
            
            .user-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="BarraNavTutor.jsp" />
    
    <div class="container">
        <!-- Header Section -->
        <div class="header-section">
            <h1 class="header-title">
                <i class="fas fa-users"></i>
                Mis Niños Registrados
            </h1>
            <p class="subtitle">Administra y supervisa a todos los niños bajo tu cuidado</p>
        </div>

        <%
        PreparedStatement ps = null;
        ResultSet rs = null;
        int totalNinos = 0;
        boolean hayNinos = false;
        
        try {
            // Primero contamos el total de niños
            ps = c.prepareStatement("SELECT COUNT(*) as total FROM USUARIO WHERE ID_T = ?");
            ps.setInt(1, IdT);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalNinos = rs.getInt("total");
            }
            rs.close();
            ps.close();
            
            if (totalNinos > 0) {
                hayNinos = true;
        %>
        
        <!-- Stats Summary -->
        <div class="stats-summary">
            <div class="summary-item">
                <span class="summary-number"><%= totalNinos %></span>
                <div class="summary-label">Niños Registrados</div>
            </div>
            <div class="summary-item">
                <span class="summary-number">
                    <%
                    // Calcular actividades de esta semana
                    ps = c.prepareStatement(
                        "SELECT COUNT(*) as actividades FROM REALIZA R " +
                        "JOIN USUARIO U ON R.ID_U = U.ID_U " +
                        "WHERE U.ID_T = ? AND R.FECHA_REALIZA >= DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY)"
                    );
                    ps.setInt(1, IdT);
                    rs = ps.executeQuery();
                    int actividadesSemana = 0;
                    if (rs.next()) {
                        actividadesSemana = rs.getInt("actividades");
                    }
                    rs.close();
                    ps.close();
                    %>
                    <%= actividadesSemana %>
                </span>
                <div class="summary-label">Actividades esta semana</div>
            </div>
            <div class="summary-item">
                <span class="summary-number">100%</span>
                <div class="summary-label">Progreso general</div>
            </div>
        </div>

        <!-- Users Grid -->
        <div class="users-grid">
            <%
            // Ahora obtenemos los usuarios con sus detalles
            String sql = "SELECT U.NOMBRE_U, U.CORREO_U, F.NOMBRE_FOTO, U.ID_U " +
                         "FROM USUARIO U " +
                         "LEFT JOIN FOTO_PERFIL F ON U.ID_FOTO = F.ID_FOTO " +
                         "WHERE U.ID_T = ? " +
                         "ORDER BY U.NOMBRE_U";
            ps = c.prepareStatement(sql);
            ps.setInt(1, IdT);
            rs = ps.executeQuery();

            int cardIndex = 0;
            while (rs.next()) {
                String nombreFoto = rs.getString("NOMBRE_FOTO");
                if (nombreFoto == null || nombreFoto.isEmpty()) {
                    nombreFoto = "default.png";
                }
                String nombreUsuario = rs.getString("NOMBRE_U");
                String correoUsuario = rs.getString("CORREO_U");
                int idUsuario = rs.getInt("ID_U");
                
                // Obtener estadísticas del usuario
                PreparedStatement psStats = c.prepareStatement(
                    "SELECT COUNT(*) as total_actividades FROM REALIZA WHERE ID_U = ?"
                );
                psStats.setInt(1, idUsuario);
                ResultSet rsStats = psStats.executeQuery();
                int totalActividades = 0;
                if (rsStats.next()) {
                    totalActividades = rsStats.getInt("total_actividades");
                }
                rsStats.close();
                psStats.close();
            %>
            <div class="user-card" style="--animation-order: <%= cardIndex %>">
    <div class="user-content">
        <div class="user-avatar">
            <img src="../ImgPerfil/<%= nombreFoto %>" alt="Foto de <%= nombreUsuario %>">
            <div class="avatar-badge">
                <i class="fas fa-star"></i>
            </div>
        </div>
        <div class="user-info">
            <h3 class="user-name">
                <i class="fas fa-user"></i>
                <%= nombreUsuario %>
            </h3>
            <p class="user-email">
                <i class="fas fa-envelope"></i>
                <%= correoUsuario %>
            </p>
            <div class="user-stats">
                <div class="stat-item">
                    <i class="fas fa-trophy"></i>
                    <%= totalActividades %> actividades
                </div>
                <div class="stat-item">
                    <i class="fas fa-clock"></i>
                    Activo
                </div>
            </div>

            <!-- Formulario para eliminar -->
            <form method="post" action="EliminarUsuario.jsp"
                  onsubmit="return confirm('¿Estás seguro de eliminar este perfil? Esta acción no se puede deshacer.');">
                <input type="hidden" name="idUsuario" value="<%= idUsuario %>">
                <button type="submit" class="btn btn-danger mt-3">
                    <i class="fas fa-trash-alt"></i> Eliminar
                </button>
            </form>
        </div>
    </div>
</div>

            <%
                cardIndex++;
            }
            %>
        </div>
        
        <%
            } else {
        %>
        <!-- Empty State -->
        <div class="empty-state">
            <i class="fas fa-user-plus"></i>
            <h3>¡Aún no tienes niños registrados!</h3>
            <p>Comienza agregando tu primer niño para empezar a supervisar su progreso educativo.</p>
            <a href="P-AnadirN.jsp" class="back-button">
                <i class="fas fa-plus"></i>
                Agregar Primer Niño
            </a>
        </div>
        <%
            }
        } catch (SQLException e) {
            out.println("<div class='alert alert-danger'>Error al obtener los usuarios: " + e.getMessage() + "</div>");
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        }
        %>

        <!-- Back Button -->
        <div class="text-center">
            <a class="back-button" href="menu_T.jsp">
                <i class="fas fa-arrow-left"></i>
                Volver al menú principal
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>