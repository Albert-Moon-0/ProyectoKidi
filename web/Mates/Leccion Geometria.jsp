<%-- 
    Document   : Leccion Geometria
    Created on : 5 nov. 2024, 07:40:07
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Geometría Básica</title>
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
    font-size: clamp(2rem, 5vw, 3.5rem);
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
    content: "📐";
    margin-right: 10px;
}

.header-title:after {
    content: "🔺";
    margin-left: 10px;
}

.greeting {
    font-size: clamp(1.2rem, 3vw, 1.8rem);
    color: var(--secondary-color);
    text-align: center;
    margin-bottom: 2rem;
}

/* Botón de regreso estilizado */
.back-button-container {
    display: flex;
    justify-content: center;
    width: 100%;
    margin: 0.5rem auto 1rem;
    position: relative;
}

.back-btn {
    font-size: clamp(2rem, 5vw, 3.5rem);
    color: var(--secondary-color);
    background: none;
    border: none;
    cursor: pointer;
    transition: transform 0.4s ease;
    animation: float 4s ease-in-out infinite;
    padding: 0.5rem;
    position: absolute;
    left: 1rem;
    top: 50%;
    transform: translateY(-50%);
}

.back-btn:hover {
    transform: translateY(-50%) scale(1.2) rotate(-5deg);
    color: var(--primary-color);
}

/* Tarjetas con formas divertidas y efectos */
.card {
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.4s ease, box-shadow 0.4s ease;
    border: none;
    position: relative;
    margin-bottom: 1.5rem;
    background: white;
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
    opacity: 0.3;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
}

.figure-img {
    width: 120px;
    height: 120px;
    object-fit: contain;
    margin: 0 auto 15px;
    display: block;
    transition: transform 0.3s ease;
}

.figure-card:hover .figure-img {
    transform: scale(1.1);
}

.example-text {
    font-weight: 700;
    color: var(--primary-color);
    font-size: 1.2rem;
    margin-bottom: 0.5rem;
}

/* Videos responsivos */
.video-container {
    position: relative;
    padding-bottom: 56.25%; /* 16:9 */
    height: 0;
    overflow: hidden;
    margin: 2rem 0;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

.video-container iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: none;
}

/* Listas estilizadas */
.number-card ul {
    list-style-type: none;
    padding-left: 0;
}

.number-card li {
    padding: 0.8rem 1rem;
    margin-bottom: 0.5rem;
    background-color: rgba(78, 205, 196, 0.1);
    border-radius: 10px;
    position: relative;
    padding-left: 2.5rem;
}

.number-card li:before {
    content: "▹";
    position: absolute;
    left: 1rem;
    color: var(--primary-color);
}

.practice-item {
    padding: 1rem;
    margin-bottom: 1rem;
    background-color: rgba(255, 214, 102, 0.2);
    border-radius: 10px;
    border-left: 5px solid var(--accent-color);
}

.answer {
    font-weight: 700;
    color: var(--accent3-color);
    animation: fadeIn 0.5s ease-in;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
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
    display: none;
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

/* Animaciones para elementos */
@keyframes float {
    0% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
    100% { transform: translateY(0); }
}

/* Figuras flotantes */
.floating-number {
    position: fixed;
    font-family: 'Nunito', sans-serif;
    font-weight: bold;
    opacity: 0.3;
    animation: float 6s infinite ease-in-out;
    z-index: -1;
    font-size: 3rem;
    display: none;
}

.number-1 {
    top: 15%;
    left: 5%;
    color: var(--accent-color);
    animation-delay: 0s;
}

.number-2 {
    top: 10%;
    right: 10%;
    color: var(--primary-color);
    animation-delay: 1s;
}

.number-3 {
    bottom: 20%;
    left: 8%;
    color: var(--accent2-color);
    animation-delay: 2s;
}

.number-4 {
    bottom: 15%;
    right: 5%;
    color: var(--accent3-color);
    animation-delay: 3s;
}

/* Responsividad mejorada */
@media (min-width: 768px) {
    .floating-number {
        display: block;
        font-size: 4rem;
    }
    
    .figure-img {
        width: 150px;
        height: 150px;
    }
}

@media (max-width: 576px) {
    .header-title:before,
    .header-title:after {
        margin: 0 5px;
    }
    
    .col-md-3 {
        margin-bottom: 1.5rem;
    }
}

/* Pequeños ajustes para pantallas muy pequeñas */
@media (max-width: 400px) {
    .figure-img {
        width: 100px;
        height: 100px;
    }
}
    </style>
    <!-- Fuente Nunito de Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Figuras flotantes de fondo -->
    <div class="floating-number number-1">△</div>
    <div class="floating-number number-2">□</div>
    <div class="floating-number number-3">○</div>
    <div class="floating-number number-4">◇</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header -->
    <div class="back-button-container">
        <a href="P-Mates.jsp"><button class="back-btn">&larr;</button></a>
        <div class="header-title">¡Geometría!</div>
    </div>
    <h3 class="greeting">Conociendo las Figuras Geométricas</h3>

    <!-- Contenedor principal -->
    <main class="container my-4">
        <section class="card p-4 mb-4">
            <h3 class="text-center mb-3">¿Qué es la Geometría?</h3>
            <p class="text-center">La geometría es una rama de las matemáticas que estudia las formas y figuras. ¡La geometría está en todas partes! Observa a tu alrededor: todo tiene forma. Los libros, las ventanas, el balón con el que juegas.</p>
        </section>

        <section class="card p-4 mb-4">
            <h3 class="text-center mb-4">Figuras Geométricas Básicas</h3>
            <p class="text-center mb-4">Aquí están algunas de las figuras geométricas más importantes:</p>
            <div class="row">
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="figure-card text-center p-3">
                        <img src="../Imagenes/Cuadrado.png" alt="Cuadrado" class="figure-img">
                        <p class="example-text">Cuadrado</p>
                        <p>Un cuadrado tiene <strong>4 lados iguales</strong> y <strong>4 esquinas</strong> rectas.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="figure-card text-center p-3">
                        <img src="../Imagenes/Triangulo.png" alt="Triángulo" class="figure-img">
                        <p class="example-text">Triángulo</p>
                        <p>Un triángulo tiene <strong>3 lados</strong> y <strong>3 esquinas</strong>. Puede tener lados iguales o diferentes.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="figure-card text-center p-3">
                        <img src="../Imagenes/Circulo.png" alt="Circulo" class="figure-img">
                        <p class="example-text">Círculo</p>
                        <p>Un círculo es redondo y no tiene lados ni esquinas. Todos sus puntos están a la misma distancia del centro.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="figure-card text-center p-3">
                        <img src="../Imagenes/Rectangulo.png" alt="Rectángulo" class="figure-img">
                        <p class="example-text">Rectángulo</p>
                        <p>Un rectángulo tiene <strong>4 lados</strong>: 2 largos y 2 cortos, y también tiene 4 esquinas rectas.</p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Video -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/SXONzObzFk0?si=1uk3ieWBFSDin6vJ" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        
        <section class="card p-4 mb-4">
            <h3 class="text-center mb-3">Partes de una Figura</h3>
            <p class="text-center mb-4">Conozcamos algunas partes de las figuras geométricas:</p>
            <div class="number-card mx-auto" style="max-width: 500px;">
                <ul>
                    <li><strong>Lados:</strong> Las líneas que forman la figura.</li>
                    <li><strong>Esquinas:</strong> Los puntos donde se unen dos lados.</li>
                    <li><strong>Centro:</strong> El punto en el medio de una figura como el círculo.</li>
                </ul>
            </div>
        </section>
        
        <!-- Video -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/kESdCbIz9Wc?si=JhxRttC0ZTYrQPGj" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        
        <section class="card p-4 mb-4">
            <h3 class="text-center mb-3">¡Observa las Figuras a Tu Alrededor!</h3>
            <p class="text-center mb-4">Prueba a observar las figuras en objetos cercanos. Por ejemplo:</p>
            <div class="numeric-line-container text-center">
                <div class="operation-example">
                    <div class="mb-2">Un balón es como un <strong>círculo</strong>.</div>
                    <div class="mb-2">La puerta es como un <strong>rectángulo</strong>.</div>
                    <div>La pizza puede cortarse en <strong>triángulos</strong> (las porciones).</div>
                </div>
            </div>
        </section>

        <!-- Sección de práctica interactiva -->
        <section class="card p-4 mb-4">
            <h3 class="text-center mb-3">¡Hora de Practicar!</h3>
            <p class="text-center mb-4">¿Qué figura tiene...?</p>
            
            <div class="mt-4">
                <div class="practice-item">
                    <p><strong>4 lados iguales:</strong> <span class="answer">¡Un cuadrado!</span></p>
                </div>
                <div class="practice-item">
                    <p><strong>3 lados:</strong> <span class="answer">¡Un triángulo!</span></p>
                </div>
                <div class="practice-item">
                    <p><strong>Sin lados ni esquinas:</strong> <span class="answer">¡Un círculo!</span></p>
                </div>
                <div class="practice-item">
                    <p><strong>4 lados: 2 largos y 2 cortos:</strong> <span class="answer">¡Un rectángulo!</span></p>
                </div>
            </div>
        </section>
    </main>

    <!-- Botón flotante para volver arriba -->
    <a href="#" class="back-to-top">↑</a>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p class="text-center">© 2024 KIDI, Inc ¡Diviértete explorando la geometría en todas partes!</p>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Script para manejar el botón de volver arriba
        document.addEventListener('DOMContentLoaded', function() {
            const backToTopButton = document.querySelector('.back-to-top');
            
            window.addEventListener('scroll', function() {
                if (window.pageYOffset > 300) {
                    backToTopButton.style.display = 'flex';
                } else {
                    backToTopButton.style.display = 'none';
                }
            });
            
            backToTopButton.addEventListener('click', function(e) {
                e.preventDefault();
                window.scrollTo({top: 0, behavior: 'smooth'});
            });
        });
    </script>
</body>
</html>