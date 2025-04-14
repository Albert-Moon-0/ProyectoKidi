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
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="estilosMate.css">
    <style>
        .figure-img {
    width: 120px;
    height: 120px;
    object-fit: contain;
    margin-bottom: 10px;
}
    </style>
</head>
<body>
    <!-- Elementos flotantes de fondo -->
    <div class="floating-number number-1">△</div>
    <div class="floating-number number-2">□</div>
    <div class="floating-number number-3">○</div>
    <div class="floating-number number-4">◇</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header y botón de volver -->
    <div class="position-relative">
        <a href="P-Mates.jsp"><button class="back-btn">&larr;</button></a>
        <h1 class="header-title">¡Geometría!</h1>
        <h3 class="greeting">Conociendo las Figuras Geométricas</h3>
    </div>

    <!-- Contenedor principal -->
    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué es la Geometría?</h3>
            <p>La geometría es una rama de las matemáticas que estudia las formas y figuras. ¡La geometría está en todas partes! Observa a tu alrededor: todo tiene forma. Los libros, las ventanas, el balón con el que juegas.</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>Figuras Geométricas Básicas</h3>
            <p>Aquí están algunas de las figuras geométricas más importantes:</p>
            <div class="row text-center">
                <div class="col-md-3">
                    <div class="figure-card">
                        <img src="../Imagenes/Cuadrado.png" alt="Cuadrado" class="figure-img">
                        <p class="example-text">Cuadrado</p>
                        <p>Un cuadrado tiene <strong>4 lados iguales</strong> y <strong>4 esquinas</strong> rectas.</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="figure-card">
                        <img src="../Imagenes/Triangulo.png" alt="Triángulo" class="figure-img">
                        <p class="example-text">Triángulo</p>
                        <p>Un triángulo tiene <strong>3 lados</strong> y <strong>3 esquinas</strong>. Puede tener lados iguales o diferentes.</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="figure-card">
                        <img src="../Imagenes/Circulo.png" alt="Circulo" class="figure-img">
                        <p class="example-text">Círculo</p>
                        <p>Un círculo es redondo y no tiene lados ni esquinas. Todos sus puntos están a la misma distancia del centro.</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="figure-card">
                        <img src="../Imagenes/Rectangulo.png" alt="Rectángulo" class="figure-img">
                        <p class="example-text">Rectángulo</p>
                        <p>Un rectángulo tiene <strong>4 lados</strong>: 2 largos y 2 cortos, y también tiene 4 esquinas rectas.</p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Video mejorado con contenedor -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/SXONzObzFk0?si=1uk3ieWBFSDin6vJ" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        
        <section class="card p-4 mb-4">
            <h3>Partes de una Figura</h3>
            <p>Conozcamos algunas partes de las figuras geométricas:</p>
            <div class="number-card mx-auto" style="max-width: 500px;">
                <ul>
                    <li><strong>Lados:</strong> Las líneas que forman la figura.</li>
                    <li><strong>Esquinas:</strong> Los puntos donde se unen dos lados.</li>
                    <li><strong>Centro:</strong> El punto en el medio de una figura como el círculo.</li>
                </ul>
            </div>
        </section>
        
        <!-- Video mejorado con contenedor -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/kESdCbIz9Wc?si=JhxRttC0ZTYrQPGj" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        
        <section class="card p-4 mb-4">
            <h3>¡Observa las Figuras a Tu Alrededor!</h3>
            <p>Prueba a observar las figuras en objetos cercanos. Por ejemplo:</p>
            <div class="numeric-line-container">
                <div class="operation-example">
                    <div>Un balón es como un <strong>círculo</strong>.</div>
                    <div>La puerta es como un <strong>rectángulo</strong>.</div>
                    <div>La pizza puede cortarse en <strong>triángulos</strong> (las porciones).</div>
                </div>
            </div>
        </section>

        <!-- Sección de práctica interactiva -->
        <section class="card p-4 mb-4">
            <h3>¡Hora de Practicar!</h3>
            <p>¿Qué figura tiene...?</p>
            
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

    <!-- Footer mejorado -->
    <footer class="py-3 mt-5">
        <div class="container">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3"></ul>
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