<%-- 
    Document   : Mates-LeccionesNumeros
    Created on : 3 nov. 2024, 12:13:40
    Author     : P500
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*,java.io.*,java.util.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lecciones de Números</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <style>
        :root {
            --primary-color: #FF5757;
            --secondary-color: #4FC1E9;
            --accent-color: #FFDE59;
            --green-color: #A0E57D;
            --purple-color: #C990FF;
            --text-color: #333333;
            --background-color: #F7F9FC;
        }
        
        body {
            font-family: 'Nunito', sans-serif;
            color: var(--text-color);
            background-color: var(--background-color);
            background-image: url('data:image/svg+xml;utf8,<svg width="100" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><circle cx="10" cy="10" r="2" fill="%23FFDE59" opacity="0.3"/><text x="30" y="30" font-family="Arial" font-size="10" fill="%234FC1E9" opacity="0.3">1</text><text x="60" y="40" font-family="Arial" font-size="12" fill="%23FF5757" opacity="0.3">2</text><text x="20" y="70" font-family="Arial" font-size="14" fill="%23A0E57D" opacity="0.3">3</text><text x="80" y="85" font-family="Arial" font-size="11" fill="%23C990FF" opacity="0.3">4</text></svg>');
            transition: all 0.3s ease;
            padding-right: 120px;
            
        }
        
        /* Header animado y divertido */
        .header-title {
            font-family: 'Baloo 2', cursive;
            font-size: 3rem;
            font-weight: 700;
            color: var(--secondary-color);
            text-shadow: 3px 3px 0 var(--accent-color);
            margin: 1rem 0;
            position: relative;
            padding-bottom: 0.5rem;
            text-align: center;
            letter-spacing: 1px;
            animation: wiggle 3s infinite;
        }
        
        @keyframes wiggle {
            0%, 100% { transform: rotate(0); }
            25% { transform: rotate(-3deg); }
            75% { transform: rotate(3deg); }
        }
        
        /* Mejoras para las tarjetas */
        .card {
            height: 100%;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            position: relative;
            background: white;
            margin-bottom: 2rem;
        }
        
        .card:hover {
            transform: translateY(-10px) scale(1.03);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.5s ease;
            border-bottom: 5px solid var(--accent-color);
        }
        
        .card:nth-child(3n+1) .card-img-top {
            border-bottom-color: var(--primary-color);
        }
        
        .card:nth-child(3n+2) .card-img-top {
            border-bottom-color: var(--green-color);
        }
        
        .card:nth-child(3n+3) .card-img-top {
            border-bottom-color: var(--purple-color);
        }
        
        .card:hover .card-img-top {
            transform: scale(1.05);
        }
        
        .card-body {
            padding: 1.5rem;
            background: white;
        }
        
        .card-title {
            font-family: 'Baloo 2', cursive;
            font-weight: 700;
            color: var(--text-color);
            margin-bottom: 0.75rem;
            font-size: 1.3rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        /* Estilo para los checkboxes */
        input[type="checkbox"] {
            width: 22px;
            height: 22px;
            accent-color: var(--secondary-color);
            cursor: not-allowed;
            border-radius: 5px;
        }
        
        /* Mejoras en los enlaces */
        a {
            text-decoration: none;
            color: inherit;
            display: block;
        }
        
        /* Botón de volver atrás mejorado y centrado */
        .nav-container {
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            width: 100%;
            padding: 0 1rem;
            margin-top: 1.5rem;
        }
        
        .back-btn {
            font-size: 2.5rem;
            color: var(--primary-color);
            background: none;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            position: absolute;
            left: 1rem;
            z-index: 10;
            text-shadow: 2px 2px 0 var(--accent-color);
        }
        
        .back-btn:hover {
            transform: scale(1.2);
        }
        
        /* Números flotantes y animados */
        .floating-number {
            position: absolute;
            font-family: 'Baloo 2', cursive;
            font-weight: bold;
            opacity: 0.7;
            animation: float 6s infinite ease-in-out;
            z-index: -1;
        }
        
        .number-1 {
            top: 15%;
            left: 5%;
            font-size: 4rem;
            color: var(--accent-color);
            animation-delay: 0s;
        }
        
        .number-2 {
            top: 10%;
            right: 10%;
            font-size: 5rem;
            color: var(--primary-color);
            animation-delay: 1s;
        }
        
        .number-3 {
            bottom: 20%;
            left: 8%;
            font-size: 4.5rem;
            color: var(--green-color);
            animation-delay: 2s;
        }
        
        .number-4 {
            bottom: 15%;
            right: 5%;
            font-size: 3.5rem;
            color: var(--purple-color);
            animation-delay: 3s;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
        }
        
        /* Contenedor con efecto de borde divertido */
        .fun-container {
            border-radius: 20px;
            padding: 2rem;
            position: relative;
        }
        
        /* Footer colorido */
        footer {
            padding: 2rem 0 1rem;
            margin-top: 3rem !important;
            background-color: white;
            border-top: 4px dashed var(--accent-color);
        }
        
        footer p {
            font-weight: 600;
            color: var(--text-color);
            font-family: 'Baloo 2', cursive;
        }
        
        /* Botón flotante para volver arriba */
        .back-to-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--accent-color);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            font-size: 1.5rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            opacity: 0.8;
            z-index: 100;
        }
        
        .back-to-top:hover {
            transform: scale(1.1);
            opacity: 1;
        }
        
        /* Personalización del espacio central */
        .lessons-container {
            padding-top: 1rem;
            padding-bottom: 4rem;
        }
        
        /* Responsividad mejorada */
        @media (max-width: 768px) {
            .header-title {
                font-size: 2.5rem;
            }
            
            .card-title {
                font-size: 1.1rem;
            }
            
            .floating-number {
                font-size: 3rem;
            }
            
            .back-btn {
                font-size: 2rem;
            }
        }
        
        @media (max-width: 576px) {
            .header-title {
                font-size: 2rem;
            }
            
            .floating-number {
                display: none;
            }
            
            .back-btn {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <!-- Elementos flotantes de fondo -->
    <div class="floating-number number-1">1</div>
    <div class="floating-number number-2">2</div>
    <div class="floating-number number-3">3</div>
    <div class="floating-number number-4">4</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header y botón de volver mejorados y centrados -->
    <div class="nav-container">
        <a href="P-Mates.jsp"><button class="back-btn">&larr;</button></a>
        <div class="header-title text-center">¡Lecciones de Números!</div>
    </div>
    <br>
    <br>
    <br>
    <!-- Contenedor principal centrado -->
    <div class="lessons-container">
        <div class="container">
            <div class="row text-center g-4 justify-content-center">
                <%
                    ResultSet r = null;
                    String leccion;
                    try {
                        String queryStr = "SELECT NOMBRE_LM FROM LECCIONES_M";
                        r = s.executeQuery(queryStr);
                        while (r.next()) {
                            leccion = r.getString("NOMBRE_LM");
                %>
                            <div class="col-sm-6 col-md-3 mb-4">
                                <a href="<%=leccion%>.jsp">
                                    <div class="card">
                                        <img class="card-img-top" src="../Imagenes/<%=leccion%>.png" alt="<%=leccion%>" loading="lazy">
                                        <div class="card-body">
                                            <h5 class="card-title"><%= leccion %>
                                            <input type="checkbox" name="CheckLeccionNumerosMates" value="ON" disabled /></h5>
                                        </div>
                                    </div>
                                </a>
                            </div>
                <%
                        }
                    } catch (SQLException error) {
                        out.print(error.toString());
                    }
                %>
            </div>
        </div>
    </div>
    
    <!-- Botón flotante para volver arriba -->
    <a href="#" class="back-to-top">↑</a>
    
    <!-- Footer -->
    <footer class="py-3 mt-5">
        <div class="container">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3"></ul>
            <p class="text-center">© 2024 KIDI, Inc ¡Aprendiendo matemáticas es divertido!</p>
        </div>
    </footer>
    
    <!-- Script de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>