<%-- 
    Document   : Multiplicaciones
    Created on : 3 nov. 2024, 16:26:39
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Multiplicación</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="estilosMate.css">
</head>
<body>
    <!-- Elementos flotantes de fondo -->
    <div class="floating-number number-1">×</div>
    <div class="floating-number number-2">2</div>
    <div class="floating-number number-3">3</div>
    <div class="floating-number number-4">=</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header y botón de volver -->
    <div class="position-relative">
        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button></a>
        <h1 class="header-title">¡Multiplicación!</h1>
        <h3 class="greeting">Aprendiendo a sumar rápidamente grupos iguales</h3>
    </div>

    <!-- Contenedor principal -->
    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué es la Multiplicación?</h3>
            <p>La multiplicación es una forma rápida de sumar el mismo número varias veces. Por ejemplo, si tienes 3 cajas con 5 caramelos en cada una, en lugar de sumar 5 tres veces, puedes multiplicar.</p>
            <h4>Ejemplo:</h4>
            <div class="number-card mx-auto" style="max-width: 300px;">
                <p class="number-example">3 × 5 = 15</p>
                <p>Si tienes 3 bolsas y en cada una hay 5 canicas. Si contamos todas las canicas, tendríamos 15 en total. ¡Eso es multiplicar!</p>
            </div>
        </section>
        
        <!-- Video mejorado con contenedor -->
        <div class="video-container">
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/YFtEaVw5k1A?si=OErcHSXEoTJe4aKo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>        </div>

        <section class="card p-4 mb-4">
            <h3>La Tabla de Multiplicar</h3>
            <p>Para aprender a multiplicar, usamos la <strong>tabla de multiplicar</strong>. Esta tabla muestra los resultados de multiplicar números entre sí. Practicar con la tabla de multiplicar te ayudará a resolver multiplicaciones rápidamente.</p>
            <div class="text-center">
                <img src="../Imagenes/tabla de multiplicar.png" alt="Tabla de Multiplicar" class="img-fluid" style="max-width: 500px;">
            </div>
        </section>

        <section class="card p-4 mb-4">
            <h3>Métodos de Multiplicación</h3>
            <h4>Método Tradicional:</h4>
            <p>Para realizar una multiplicación, colocamos un número debajo del otro y multiplicamos dígito por dígito.</p>
            <div class="numeric-line-container">
                <div class="operation-example">
                    <div>&nbsp;  24</div>
                    <div>× 3</div>
                    <div class="border-top mt-2">72</div>
                </div>
            </div>
        </section>
        
        <!-- Video mejorado con contenedor -->
        <div class="video-container">
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/Go3w9-d5ybM?si=9esOf32lvwik4uj8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>        </div>
        
        <!-- Sección de práctica interactiva -->
        <section class="card p-4 mb-4">
            <h3>¡Practica con estos ejercicios!</h3>
            <p>Intenta resolver estos problemas de multiplicación. Pasa el cursor sobre cada ejercicio para ver la respuesta.</p>
            
            <div class="mt-4">
                <div class="practice-item">
                    <p>Si tienes 4 cajas con 6 chocolates en cada una. ¿Cuántos chocolates tienes en total? <span class="answer">4 × 6 = 24 chocolates</span></p>
                </div>
                <div class="practice-item">
                    <p>Un grupo de 7 amigos tiene 5 cromos cada uno. ¿Cuántos cromos tienen entre todos? <span class="answer">7 × 5 = 35 cromos</span></p>
                </div>
                <div class="practice-item">
                    <p>En una granja hay 8 gallinas y cada una pone 3 huevos por día. ¿Cuántos huevos recogen en un día? <span class="answer">8 × 3 = 24 huevos</span></p>
                </div>
                <div class="practice-item">
                    <p>Carlos compra 9 bolsas con 4 caramelos en cada una. ¿Cuántos caramelos compró en total? <span class="answer">9 × 4 = 36 caramelos</span></p>
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
            <p class="text-center">© 2024 KIDI, Inc ¡Multiplica y diviértete!</p>
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