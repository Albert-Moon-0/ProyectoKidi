<%-- 
    Document   : Divisiones
    Created on : 3 nov. 2024, 16:26:48
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: División</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="estilosMate.css">
    <link rel="stylesheet" href="../Sistema/Estilos.css" />
</head>
<body>
    <!-- Elementos flotantes de fondo -->
    <div class="floating-number number-1">÷</div>
    <div class="floating-number number-2">2</div>
    <div class="floating-number number-3">4</div>
    <div class="floating-number number-4">=</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header y botón de volver -->
    <div class="position-relative">
        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button></a>
        <h1 class="header-title">¡División!</h1>
        <h3 class="greeting">Aprendiendo a repartir en partes iguales</h3>
    </div>

    <!-- Contenedor principal -->
    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué es la División?</h3>
            <p>La división es el proceso de repartir o dividir un grupo en partes iguales. Si tienes 12 caramelos y quieres repartirlos entre 4 amigos, divides 12 entre 4 para saber cuántos caramelos le tocan a cada uno.</p>
            <h4>Ejemplo:</h4>
            <div class="number-card mx-auto" style="max-width: 300px;">
                <p class="number-example">12 ÷ 4 = 3</p>
                <p>Si tenemos 12 caramelos y los repartimos en 4 grupos, cada grupo recibe 3 caramelos.</p>
            </div>
        </section>
        
        <!-- Video mejorado con contenedor -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/iA0fP4tL67s?si=Q_aqCtvFgxsDlwmL" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>División como Inversa de la Multiplicación</h3>
            <p>La división es lo contrario de la multiplicación. Si sabes que <strong>4 x 3 = 12</strong>, entonces también puedes decir que <strong>12 ÷ 4 = 3</strong> o <strong>12 ÷ 3 = 4</strong>. Así, la multiplicación y la división están relacionadas.</p>
            <h4>¿Cómo se relacionan?</h4>
            <div class="numeric-line-container">
                <div class="operation-example">
                    <div>4 × 3 = 12</div>
                    <div>12 ÷ 4 = 3</div>
                    <div>12 ÷ 3 = 4</div>
                </div>
            </div>
        </section>
        
        <!-- Video mejorado con contenedor -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/A591Yn_E5Mw?si=OzvumjybnRcXKA-m" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        
       
        
        <!-- Sección de práctica interactiva -->
        <section class="card p-4 mb-4">
            <h3>¡Practica con estos ejercicios!</h3>
            <p>Intenta resolver estos problemas de división. Pasa el cursor sobre cada ejercicio para ver la respuesta.</p>
            
            <div class="mt-4">
                <div class="practice-item">
                    <p>Si tienes 20 galletas y quieres repartirlas entre 5 amigos. ¿Cuántas galletas recibe cada amigo? <span class="answer">20 ÷ 5 = 4 galletas</span></p>
                </div>
                <div class="practice-item">
                    <p>Hay 24 lápices de colores que se deben poner en cajas de 6 lápices cada una. ¿Cuántas cajas se necesitan? <span class="answer">24 ÷ 6 = 4 cajas</span></p>
                </div>
                <div class="practice-item">
                    <p>Un grupo de 8 niños quiere repartirse 32 cromos por igual. ¿Cuántos cromos recibirá cada niño? <span class="answer">32 ÷ 8 = 4 cromos</span></p>
                </div>
                <div class="practice-item">
                    <p>Laura tiene 45 canicas y quiere colocarlas en frascos con 9 canicas cada uno. ¿Cuántos frascos necesitará? <span class="answer">45 ÷ 9 = 5 frascos</span></p>
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
            <p class="text-center">© 2024 KIDI, Inc ¡Divide y diviértete!</p>
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