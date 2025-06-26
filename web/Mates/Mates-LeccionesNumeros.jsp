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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <style>
/* Colores vibrantes y amigables para niños */
:root {
    --primary-color: #FF9E00;    /* Naranja alegre */
    --secondary-color: #4ECDC4;  /* Turquesa */
    --accent-color: #FFD166;     /* Amarillo suave */
    --accent2-color: #FF6B6B;    /* Coral */
    --accent3-color: #8A4FFF;    /* Púrpura */
    --text-color: #2D3047;       /* Azul oscuro */
    --background-light: #F9F7F3; /* Crema suave */
}

body {
    font-family: 'Nunito', sans-serif;
    color: var(--text-color);
    background-color: var(--background-light);
    background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%234ecdc4' fill-opacity='0.1' fill-rule='evenodd'/%3E%3C/svg%3E");
    transition: all 0.3s ease;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    overflow-x: hidden;
}

/* Header divertido y llamativo */
.header-title {
    font-size: clamp(2rem, 5vw, 3.5rem); /* Tamaño responsivo */
    font-weight: 800;
    color: var(--primary-color);
    text-shadow: 3px 3px 0 var(--accent-color), 
                 5px 5px 0 rgba(0, 0, 0, 0.1);
    margin: 1rem 0;
    position: relative;
    padding-bottom: 1rem;
    letter-spacing: 1px;
    text-align: center;
    word-wrap: break-word;
}

.header-title:before {
    content: "🔢";
    margin-right: 10px;
}

.header-title:after {
    content: "🧮";
    margin-left: 10px;
}

/* Botón de regreso estilizado */
.back-button-container {
    display: flex;
    justify-content: center;
    width: 100%;
    margin: 0.5rem auto 1rem;
}

.back-btn {
    font-size: clamp(2rem, 5vw, 3.5rem); /* Tamaño responsivo */
    color: var(--secondary-color);
    background: none;
    border: none;
    cursor: pointer;
    transition: transform 0.4s ease;
    animation: float 4s ease-in-out infinite;
    padding: 0.5rem;
}

.back-btn:hover {
    transform: scale(1.2) rotate(-5deg);
    color: var(--primary-color);
}

/* Tarjetas con formas divertidas y efectos */
.card {
    height: 100%;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.4s ease, box-shadow 0.4s ease;
    border: none;
    position: relative;
    margin-bottom: 1.5rem;
    animation: float 5s ease-in-out infinite;
    animation-delay: calc(var(--animation-order) * 0.5s);
}

.card:before {
    content: "";
    position: absolute;
    top: -5px;
    left: -5px;
    right: -5px;
    bottom: -5px;
    z-index: -1;
    background: linear-gradient(45deg, var(--accent-color), var(--accent2-color), var(--accent3-color), var(--secondary-color));
    border-radius: 25px;
    opacity: 0;
    transition: opacity 0.4s ease;
}

.card:hover:before {
    opacity: 1;
}

.card:hover {
    transform: translateY(-15px) rotate(2deg);
    box-shadow: 0 20px 30px rgba(0, 0, 0, 0.15);
}

.card-img-top {
    width: 100%;
    height: 180px;
    object-fit: cover;
    transition: transform 0.5s ease;
    border-bottom: 5px solid var(--accent-color);
}

.card:hover .card-img-top {
    transform: scale(1.08);
}

.card-body {
    padding: 1.5rem;
    background: white;
    border-top: 5px dashed var(--accent-color);
}

.card-title {
    font-weight: 700;
    color: var(--text-color);
    margin-bottom: 0.75rem;
    font-size: 1.2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 0.5rem;
}

/* Checkbox estilizado como estrella para niños */
input[type="checkbox"] {
    appearance: none;
    -webkit-appearance: none;
    width: 25px;
    height: 25px;
    background: #f0f0f0;
    border-radius: 50%;
    position: relative;
    cursor: not-allowed;
    transition: all 0.3s;
    box-shadow: inset 0 0 0 2px #ddd;
    flex-shrink: 0;
}

input[type="checkbox"]:before {
    content: "★";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 16px;
    color: #ccc;
    transition: all 0.3s;
}

input[type="checkbox"]:checked {
    background: var(--accent-color);
}

input[type="checkbox"]:checked:before {
    content: "★";
    color: var(--primary-color);
}

/* Enlaces sin subrayado */
a {
    text-decoration: none !important;
    color: inherit;
    display: block;
    position: relative;
}

/* Mejoras para el contenedor principal */
.container {
    width: 100%;
    max-width: 1140px;
    margin: 0 auto;
    padding: 0 15px;
}

.lessons-container {
    margin: 1rem auto 2rem;
    text-align: center;
    width: 100%;
    padding: 0 10px;
}

/* Footer infantil */
footer {
    padding: 1.5rem 0;
    margin-top: auto !important;
    background-color: var(--accent-color);
    border-top: 8px solid var(--primary-color);
    border-top-left-radius: 50% 20px;
    border-top-right-radius: 50% 20px;
    position: relative;
    width: 100%;
}

footer:before {
    content: "";
    position: absolute;
    top: -15px;
    left: 50%;
    transform: translateX(-50%);
    width: 30px;
    height: 30px;
    background-color: var(--primary-color);
    border-radius: 50%;
    box-shadow: -40px -10px 0 -8px var(--accent2-color),
                40px -10px 0 -8px var(--accent3-color);
}

footer p {
    font-weight: 600;
    color: var(--text-color);
    font-size: clamp(0.9rem, 3vw, 1.1rem);
    margin-bottom: 0;
    text-align: center;
}

/* Animaciones para elementos */
@keyframes float {
    0% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
    100% { transform: translateY(0); }
}

/* Estructura de la cuadrícula */
.row {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-right: -10px;
    margin-left: -10px;
}

.col-sm-6.col-md-3 {
    flex: 0 0 auto;
    width: 25%;
    padding: 0 10px;
    margin-bottom: 20px;
}

/* Responsividad mejorada */
@media (max-width: 992px) {
    .col-sm-6.col-md-3 {
        width: 33.333%;
    }
    
    .card-img-top {
        height: 160px;
    }
}

@media (max-width: 768px) {
    .header-title:before,
    .header-title:after {
        margin: 0 5px;
    }
    
    .card-title {
        font-size: 1.1rem;
    }
    
    .card:hover {
        transform: translateY(-10px) rotate(1deg);
    }
    
    .col-sm-6.col-md-3 {
        width: 50%;
    }
    
    .card-img-top {
        height: 140px;
    }
    
    .card-body {
        padding: 1rem;
    }
}

@media (max-width: 576px) {
    .header-title:before,
    .header-title:after {
        content: "";
        margin: 0;
    }
    
    .col-sm-6.col-md-3 {
        width: 100%;
        max-width: 350px;
        margin-left: auto;
        margin-right: auto;
    }
    
    footer:before {
        width: 25px;
        height: 25px;
        box-shadow: -30px -8px 0 -6px var(--accent2-color),
                    30px -8px 0 -6px var(--accent3-color);
    }
    
    .card-img-top {
        height: 200px;
    }
    
    .back-button-container {
        margin: 0.5rem auto;
    }
}

/* Pequeños ajustes para pantallas muy pequeñas */
@media (max-width: 400px) {
    .card-img-top {
        height: 160px;
    }
    
    .card-title {
        flex-direction: column;
        align-items: flex-start;
    }
    
    input[type="checkbox"] {
        margin-top: 0.5rem;
        align-self: flex-end;
    }
}
    </style>
    <!-- Fuente Nunito de Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/Estilos.css" />
</head>
<body>
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Título principal -->
    <div class="header-title">¡Lecciones de Números!</div>
    
    <!-- Botón de regreso con animación -->
    <div class="back-button-container">
        <a href="P-Mates.jsp"><button class="back-btn">&larr;</button></a>
    </div>
    
    <!-- Contenedor principal de lecciones -->
    <div class="container lessons-container">
        <div class="row">
            <%
                ResultSet r = null;
                String leccion;
                int counter = 0;
                try {
                    String queryStr = "SELECT NOMBRE_LM FROM LECCIONES_M";
                    r = s.executeQuery(queryStr);
                    while (r.next()) {
                        leccion = r.getString("NOMBRE_LM");
                        counter++;
            %>
            <div class="col-sm-6 col-md-3" style="--animation-order: <%= counter %>;">
                <a href="<%=leccion%>.jsp">
                    <div class="card">
                        <img class="card-img-top" src="../Imagenes/<%=leccion%>.png" alt="<%=leccion%>" loading="lazy">
                        <div class="card-body">
                            <h5 class="card-title">
                                <span><%= leccion %></span>
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
    <footer>
        <div class="container">
            <p class="text-center">© 2024 KIDI, Inc ¡Aprendiendo matemáticas es divertido!</p>
        </div>
    </footer>
    
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>