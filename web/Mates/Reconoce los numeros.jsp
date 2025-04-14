<%-- 
    Document   : Reconoce los números
    Created on : 3 nov. 2024, 16:26:28
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Conociendo los Números</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="estilosMate.css">
    
   
</head>
<body>
    <!-- Elementos flotantes de fondo -->
    <div class="floating-number number-1">1</div>
    <div class="floating-number number-2">2</div>
    <div class="floating-number number-3">3</div>
    <div class="floating-number number-4">4</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header y botón de volver -->
    <div class="position-relative">
        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button></a>
        <h1 class="header-title">¡Conociendo los Números!</h1>
        <h3 class="greeting">Explorando el fascinante mundo numérico</h3>
    </div>

    <!-- Contenedor principal -->
    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué son los Números?</h3>
            <p>Los números son símbolos que usamos para contar, ordenar y medir cosas. Desde muy pequeños, los usamos todos los días, pero... ¿sabes cuántos números existen y cómo se organizan?</p>
            <h4>Los Números Naturales</h4>
            <p>Imagina que tienes muchas canicas y quieres contarlas. Empezamos con el número <strong>1</strong>, luego <strong>2</strong>, <strong>3</strong>, y así sucesivamente. Estos números que usamos para contar cosas como canicas, personas o juguetes son llamados <strong>números naturales</strong>.</p>
            
            <h4>Números en Nuestro Día a Día</h4>
            <p>Los números están por todas partes: en los relojes para decir la hora, en los precios de las tiendas, en las páginas de los libros... ¡y en mucho más!</p>
        </section>
        
        <!-- Video mejorado con contenedor -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/qHkEDhTaPnk?si=0J7VFJXGo7R7KlkC" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>Ordenando Números</h3>
            <p>Es importante entender cómo se relacionan los números entre sí. Por ejemplo, si tienes <strong>3</strong> caramelos y luego tienes <strong>5</strong>, sabemos que <strong>5</strong> es mayor que <strong>3</strong>. Veamos algunos ejemplos:</p>
            <div class="d-flex flex-wrap justify-content-around">
                <div class="number-card">
                    <p class="number-example">3 < 5</p>
                    <p>El número 3 es menor que el número 5.</p>
                </div>
                <div class="number-card">
                    <p class="number-example">7 > 4</p>
                    <p>El número 7 es mayor que el número 4.</p>
                </div>
                <div class="number-card">
                    <p class="number-example">6 = 6</p>
                    <p>El número 6 es igual a 6.</p>
                </div>
            </div>
        </section>
        
        <!-- Video mejorado con contenedor -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/3yyHrrKmzRE?si=BleSnpDCS24XNAKI" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>La Línea Numérica</h3>
            <p>Para ver el orden de los números, podemos usar una <strong>línea numérica</strong>. Cada número tiene un lugar en esta línea, y podemos ver cuál número viene antes y cuál después.</p>
            <div class="numeric-line-container">
                <img src="../Imagenes/Linea numerica.png" alt="Línea Numérica" class="img-fluid" style="max-width: 100%; border-radius: 10px;">
            </div>
            <p class="mt-3">Por ejemplo, en la línea, el número <strong>2</strong> está antes que el número <strong>3</strong>, y el número <strong>5</strong> está después del número <strong>4</strong>.</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>¡Practica Tú Mismo!</h3>
            <p>Aquí tienes algunos ejercicios para practicar el orden de los números. ¿Puedes decir cuál número es mayor? (¡Pasa el cursor sobre cada ejercicio para ver la respuesta!)</p>
            <div class="mt-4">
                <div class="practice-item">
                    <p>¿Es <strong>8</strong> mayor que <strong>6</strong>? <span class="answer">¡Sí, 8 es mayor!</span></p>
                </div>
                <div class="practice-item">
                    <p>¿Es <strong>3</strong> menor que <strong>9</strong>? <span class="answer">¡Sí, 3 es menor!</span></p>
                </div>
                <div class="practice-item">
                    <p>¿Es <strong>7</strong> igual a <strong>7</strong>? <span class="answer">¡Sí, son iguales!</span></p>
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
            <p class="text-center">© 2024 KIDI, Inc ¡Diviértete explorando el mundo de los números!</p>
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