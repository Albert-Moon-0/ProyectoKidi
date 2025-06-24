<%-- 
    Document   : P-Español
    Created on : 18 oct. 2024, 11:25:34
    Author     : Usuario
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Español</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <style>
/* Colores más vibrantes y amigables para niños */
:root {
    --primary-color: #FF9E00;    /* Naranja alegre */
    --secondary-color: #4ECDC4;  /* Turquesa */
    --accent-color: #FFD166;     /* Amarillo suave */
    --accent2-color: #FF6B6B;    /* Coral */
    --accent3-color: #8A4FFF;    /* Púrpura */
    --text-color: #2D3047;       /* Azul oscuro */
    --background-light: #F9F7F3; /* Crema suave */
}

* {
    box-sizing: border-box;
}

body {
    font-family: 'Nunito', sans-serif;
    color: var(--text-color);
    background-color: var(--background-light);
    background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%234ecdc4' fill-opacity='0.1' fill-rule='evenodd'/%3E%3C/svg%3E");
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    padding: 0;
    margin: 0;
}

/* Header más divertido y llamativo - Completamente responsivo */
.header-title {
    font-size: clamp(2rem, 5vw, 3.5rem);
    font-weight: 800;
    color: var(--primary-color);
    text-shadow: 3px 3px 0 var(--accent-color), 
                 5px 5px 0 rgba(0, 0, 0, 0.1);
    margin: 1.5rem 0;
    position: relative;
    padding: 1rem;
    letter-spacing: clamp(1px, 0.5vw, 2px);
    text-align: center;
    word-wrap: break-word;
}

.header-title:before {
    content: "✏️";
    margin-right: clamp(5px, 2vw, 15px);
    font-size: clamp(1.5rem, 4vw, 3rem);
}

.header-title:after {
    content: "📚";
    margin-left: clamp(5px, 2vw, 15px);
    font-size: clamp(1.5rem, 4vw, 3rem);
}

/* Botón de regreso estilizado - Responsivo */
.back-button-container {
    display: flex;
    justify-content: center;
    width: 100%;
    margin: 1rem auto;
    padding: 0 1rem;
}

.back-btn {
    font-size: clamp(2rem, 6vw, 3.5rem);
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

/* Contenedor principal - Responsivo */
.main-container {
    flex: 1;
    width: 100%;
    padding: 0 clamp(15px, 3vw, 140px);
}

.container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 15px;
}

/* Tarjetas con formas divertidas y efectos - Completamente responsivas */
.card {
    height: 100%;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.4s ease, box-shadow 0.4s ease;
    border: none;
    position: relative;
    margin-bottom: 2rem;
    max-width: 100%;
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
    height: clamp(180px, 25vw, 220px);
    object-fit: cover;
    transition: transform 0.5s ease;
    border-bottom: 5px solid var(--accent-color);
}

.card:hover .card-img-top {
    transform: scale(1.08);
}

.card-body {
    padding: clamp(1rem, 3vw, 1.8rem);
    background: white;
    border-top: 5px dashed var(--accent-color);
}

.card-title {
    font-weight: 400;
    color: var(--text-color);
    margin-bottom: 0.75rem;
    font-size: clamp(1rem, 2.5vw, 1.1rem);
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 0.5rem;
}

/* Checkbox estilizado como estrella para niños - Responsivo */
input[type="checkbox"] {
    appearance: none;
    -webkit-appearance: none;
    width: clamp(25px, 5vw, 30px);
    height: clamp(25px, 5vw, 30px);
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
    font-size: clamp(16px, 4vw, 20px);
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

/* Grid responsivo mejorado */
.row {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 0 -15px;
    gap: 0;
}

.col-sm-6.col-md-4 {
    flex: 1 1 auto;
    max-width: 100%;
    padding: 0 15px;
    margin-bottom: 30px;
}

/* Footer infantil - Completamente responsivo */
footer {
    padding: clamp(1rem, 3vw, 2rem) 0 1rem;
    margin-top: auto !important;
    background-color: var(--accent-color);
    border-top: clamp(5px, 2vw, 10px) solid var(--primary-color);
    border-top-left-radius: 50% 30px;
    border-top-right-radius: 50% 30px;
    position: relative;
    width: 100%;
}

footer:before {
    content: "";
    position: absolute;
    top: clamp(-15px, -3vw, -20px);
    left: 50%;
    transform: translateX(-50%);
    width: clamp(30px, 6vw, 40px);
    height: clamp(30px, 6vw, 40px);
    background-color: var(--primary-color);
    border-radius: 50%;
    box-shadow: clamp(-40px, -8vw, -60px) clamp(-10px, -2vw, -15px) 0 clamp(-8px, -1.5vw, -10px) var(--accent2-color),
                clamp(40px, 8vw, 60px) clamp(-10px, -2vw, -15px) 0 clamp(-8px, -1.5vw, -10px) var(--accent3-color);
}

footer p {
    font-weight: 600;
    color: var(--text-color);
    font-size: clamp(0.9rem, 2.5vw, 1.1rem);
    margin: 0;
    padding: 0 1rem;
    text-align: center;
}

/* Animaciones para elementos */
@keyframes float {
    0% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
    100% { transform: translateY(0); }
}

.card {
    animation: float 5s ease-in-out infinite;
    animation-delay: calc(var(--animation-order, 0) * 0.5s);
}

/* Breakpoints específicos para mejor control */

/* Extra Large devices (large desktops, 1200px and up) */
@media (min-width: 1200px) {
    .col-sm-6.col-md-4 {
        flex: 0 0 33.333333%;
        max-width: 33.333333%;
    }
    
    body {
        padding-right: 140px;
    }
}

/* Large devices (desktops, 992px and up) */
@media (min-width: 992px) and (max-width: 1199.98px) {
    .col-sm-6.col-md-4 {
        flex: 0 0 33.333333%;
        max-width: 33.333333%;
    }
    
    body {
        padding-right: 80px;
    }
}

/* Medium devices (tablets, 768px and up) */
@media (min-width: 768px) and (max-width: 991.98px) {
    .col-sm-6.col-md-4 {
        flex: 0 0 50%;
        max-width: 50%;
    }
    
    body {
        padding-right: 40px;
    }
    
    .card:hover {
        transform: translateY(-10px) rotate(1deg);
    }
}

/* Small devices (landscape phones, 576px and up) */
@media (min-width: 576px) and (max-width: 767.98px) {
    .col-sm-6.col-md-4 {
        flex: 0 0 50%;
        max-width: 50%;
    }
    
    body {
        padding-right: 20px;
    }
    
    .card {
        margin-bottom: 1.5rem;
    }
    
    .card:hover {
        transform: translateY(-8px) rotate(0.5deg);
    }
}

/* Extra small devices (portrait phones, less than 576px) */
@media (max-width: 575.98px) {
    body {
        padding-right: 0;
        padding: 0 10px;
    }
    
    .main-container {
        padding: 0;
    }
    
    .container {
        padding: 0 10px;
    }
    
    .col-sm-6.col-md-4 {
        flex: 0 0 100%;
        max-width: 100%;
        padding: 0 5px;
    }
    
    .card {
        margin-bottom: 1.5rem;
        border-radius: 15px;
    }
    
    .card:hover {
        transform: translateY(-5px);
    }
    
    .card-title {
        flex-direction: column;
        align-items: center;
        text-align: center;
        gap: 0.75rem;
    }
    
    .header-title:before,
    .header-title:after {
        display: block;
        margin: 0.5rem 0;
    }
    
    .row {
        margin: 0 -5px;
    }
}

/* Landscape orientation adjustments */
@media (max-width: 768px) and (orientation: landscape) {
    .header-title {
        margin: 0.5rem 0;
        padding: 0.5rem;
    }
    
    .card-img-top {
        height: clamp(120px, 20vw, 160px);
    }
    
    .main-container {
        padding: 0 10px;
    }
}

/* High DPI displays */
@media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
    .card-img-top {
        image-rendering: -webkit-optimize-contrast;
    }
}

/* Focus and accessibility improvements */
@media (prefers-reduced-motion: reduce) {
    * {
        animation-duration: 0.01ms !important;
        animation-iteration-count: 1 !important;
        transition-duration: 0.01ms !important;
    }
    
    .card:hover {
        transform: none;
    }
}

/* Dark mode support removed - keeping original light theme */

/* Print styles */
@media print {
    .back-btn,
    footer:before {
        display: none;
    }
    
    .card {
        break-inside: avoid;
        box-shadow: none;
        border: 1px solid #ccc;
    }
    
    .card:hover {
        transform: none;
    }
    
    body {
        padding-right: 0;
        background-image: none;
    }
}
    </style>
    <!-- Fuente Nunito de Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Mini Header -->
    <div class="header-title text-center">Español</div>
    
    <!-- Contenido principal -->
    <div class="main-container">
        <div class="container">
            <div class="row text-center">
                <div class="col-sm-6 col-md-4 mb-4">
                    <a href="Espanol-EjerciciosGramatica.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/EjerciciosG.png" alt="Ejercicios de gramática" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <span>Ejercicios de gramática</span>
                                    <input type="checkbox" name="CheckEjerGramaEspañol" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-4 mb-4">
                    <a href="Espanol-JuegosPalabras.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/JuegosPalabrasEspanol.png" alt="Juegos de palabras" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <span>Juegos de palabras</span>
                                    <input type="checkbox" name="CheckJuegosPalaEspanol" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-4 mb-4">
                    <a href="Espanol-LecturaHistorias.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/LecturaHistoriasEspanol.png" alt="Lectura de historias" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <span>Lectura de historias</span>
                                    <input type="checkbox" name="CheckLecturaHistoriasEspanol" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="py-3">
        <div class="container">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3"></ul>
            <p class="text-center text-body-secondary">© 2024 KIDI, Inc Todos los derechos reservados</p>
        </div>
    </footer>
    
    <!-- Script de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>