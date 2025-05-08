<%-- 
    Document   : Mates-LeccionesNumeros
    Created on : 3 nov. 2024, 12:13:40
    Author     : P500
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*,java.io.*,java.util.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>

<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ejercicios de Inglés</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 
        <style>
            /* Estilos generales y fuentes amigables para niños */
            @import url('https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&display=swap');

            body {
                background-color: #f9f7f0;
                background-image: url('data:image/svg+xml;utf8,<svg width="100" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><path d="M10,10 L20,20 M80,80 L90,90 M30,10 L40,20 M60,80 L70,90 M10,30 L20,40 M80,60 L90,70 M10,50 L20,60 M80,40 L90,30 M10,70 L20,80 M80,20 L90,10 M10,90 L20,80 M80,10 L90,20" stroke="%23f0e0a0" stroke-width="1" fill="none" /></svg>');
                font-family: 'Nunito', sans-serif;
                transition: all 0.3s ease;
                padding-right: 140px;
                display: flex;
                flex-direction: column;
                min-height: 100vh;

            }

            .header-title {
                font-size: 3.5rem;
                font-weight: 800;
                color: var(--primary-color);
                text-shadow: 3px 3px 0 var(--accent-color),
                    5px 5px 0 rgba(0, 0, 0, 0.1);
                margin: 1.5rem 0;
                position: relative;
                padding-bottom: 1rem;
                letter-spacing: 2px;
                text-align: center;
            }
            .header-title:after {
                content: "🎯";
                margin-left: 15px;
            }
            /* Estilos para las tarjetas */
            .card {
                height: 100%;
                border-radius: 20px;
                box-shadow: 0 8px 15px rgba(0,0,0,0.1);
                border: 3px solid #94d2bd;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                overflow: hidden;
                background-color: #fdfdff;
            }

            .card:hover {
                transform: translateY(-10px) scale(1.03);
                box-shadow: 0 15px 20px rgba(0,0,0,0.2);
                border-color: #ff9e7d;
            }

            .card-img-top {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-bottom: 3px solid #94d2bd;
                transition: all 0.3s ease;
            }

            .card:hover .card-img-top {
                border-bottom-color: #ff9e7d;
                filter: brightness(1.1);
            }

            .card-body {
                padding: 15px;
                background: linear-gradient(to bottom, #fdfdff, #e2f0f9);
            }

            .card-title {
                font-size: 1.4rem;
                color: #3d5a80;
                margin-bottom: 0;
                font-weight: bold;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
            }

            /* Estilo para el checkbox */
            input[type="checkbox"] {
                width: 25px;
                height: 25px;
                accent-color: #ff9e7d;
                cursor: pointer;
            }

            /* Botón de regreso */
            .back-btn {
                margin-top: -30px;
                font-size: 3.5rem;
                justify-content: center;
                color: var(--secondary-color);
                background: none;
                border: none;
                cursor: pointer;
                transition: transform 0.4s ease;
                animation: float 4s ease-in-out infinite;
                display: inline-block;
            }

            .back-btn:hover {
                transform: scale(1.2) rotate(-5deg);
                color: var(--primary-color);
            }

            /* Animaciones para elementos */
            @keyframes float {
                0% {
                    transform: translateY(0px);
                }
                50% {
                    transform: translateY(-10px);
                }
                100% {
                    transform: translateY(0px);
                }
            }

            .floating-element {
                animation: float 3s ease-in-out infinite;
            }

            /* Footer estilizado */
            footer {
                padding: 2rem 0 1rem;
                margin-top: auto !important;
                background-color: var(--accent-color);
                border-top: 10px solid var(--primary-color);
                border-top-left-radius: 50% 30px;
                border-top-right-radius: 50% 30px;
                position: relative;
                width: 100%;
            }

            footer:before {
                content: "";
                position: absolute;
                top: -20px;
                left: 50%;
                transform: translateX(-50%);
                width: 40px;
                height: 40px;
                background-color: var(--primary-color);
                border-radius: 50%;
                box-shadow: -60px -15px 0 -10px var(--accent2-color),
                    60px -15px 0 -10px var(--accent3-color);
            }

            footer p {
                font-weight: 600;
                color: var(--text-color);
                font-size: 1.1rem;
            }
            /* Decoraciones infantiles */
            .decorations {
                position: absolute;
                width: 100%;
                pointer-events: none;
                z-index: -1;
            }

            .decoration {
                position: absolute;
                font-size: 2rem;
                opacity: 0.5;
            }

            .container {
                position: relative;
                z-index: 1;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .header-title {
                    font-size: 2rem;
                }

                .back-btn {
                    font-size: 2.5rem;
                }

                .back-btn::after {
                    font-size: 1.2rem;
                    left: 60px;
                }

                .card-title {
                    font-size: 1.2rem;
                }
            }
        </style>
    </head>
    <body>
        <!-- Barra de Navegación -->
        <jsp:include page="../Sistema/BarraNavegacion.jsp" />

        <!-- Mini Header -->
        <div class="text-center">
            <div class="header-title floating-element">¡Ejercicios de Inglés!</div>
        </div>

        <!-- Botón de regreso -->
        <div class="container mt-3 text-center">
            <a href="P-Ingles.jsp"><button class="back-btn">&larr;</button></a>
        </div>

        <div class="container mt-5">
            <div class="row text-center">
                <%                    ResultSet rt = null;
                    String ejercicio;
                    try {
                        String queryStr = "SELECT DESC_EI FROM EJERCICIOS_I";
                        rt = s.executeQuery(queryStr);
                        while (rt.next()) {
                            ejercicio = rt.getString("DESC_EI");
                %>
                <div class="col-sm-6 col-md-3 mb-4">
                    <a href="<%=ejercicio%>.jsp" style="text-decoration: none;">
                        <div class="card">
                            <div class="position-relative">
                                <img class="card-img-top" src="../Imagenes/<%=ejercicio%>.png" alt="<%=ejercicio%>" loading="lazy">
                                <div class="position-absolute top-0 end-0 m-2">
                                    <span class="badge bg-warning text-dark p-2 rounded-pill">¡Divertido!</span>
                                </div>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">
                                    <%= ejercicio%>
                                    <input type="checkbox" name="CheckLeccionNumerosMates" value="ON" disabled />
                                </h5>
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

        <!-- Footer -->
        <footer class="py-3">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <p class="mb-0">© 2024 KIDI, Inc</p>
                        <p class="mb-0">Todos los derechos reservados 🎒</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Script de Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>