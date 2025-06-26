<%-- 
    Document   : Suma y resta
    Created on : 3 nov. 2024, 13:13:42
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Sumas y Restas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="estilosMate.css">
    <link rel="stylesheet" href="../Sistema/Estilos.css" />
    <link rel="stylesheet" href="../Sistema/Estilos.css" />
</head>
<body>
    <!-- Elementos flotantes de fondo -->
    <div class="floating-number number-1">1</div>
    <div class="floating-number number-2">+</div>
    <div class="floating-number number-3">-</div>
    <div class="floating-number number-4">=</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header y botón de volver -->
    <div class="position-relative">
        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button></a>
        <h1 class="header-title">¡Sumas y Restas!</h1>
        <h3 class="greeting">Aprendiendo a combinar y separar números</h3>
    </div>

    <!-- Contenedor principal -->
    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué es la Suma?</h3>
            <p>La suma es el proceso de combinar dos o más números para obtener un total. Por ejemplo, si tienes un número de objetos y le agregas más, estás sumando.</p>
            <h4>Ejemplo:</h4>
            <div class="number-card mx-auto" style="max-width: 300px;">
                <p class="number-example">25 + 15 = 40</p>
                <p>Si tienes 25 manzanas y luego recibes 15 más, ¿cuántas manzanas tienes en total? ¡Tienes 40 manzanas!</p>
            </div>
        </section>
        
        <!-- Video mejorado con contenedor -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/oexd_Dfic_Q?si=EnwJZX-0CxXKVybw" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>Métodos de Suma</h3>
            <h4>Método Tradicional:</h4>
            <p>Para realizar una suma, escribe uno de los números debajo del otro, alineando los dígitos según su lugar (unidades, decenas, etc.) y suma comenzando desde la derecha.</p>
            <div class="numeric-line-container">
                <div class="operation-example">
                    <div>&nbsp;  25</div>
                    <div>+15</div>
                    <div class="border-top mt-2">40</div>
                </div>
            </div>
        </section>

        <section class="card p-4 mb-4">
            <h3>¿Qué es la Resta?</h3>
            <p>La resta es el proceso de quitar un número de otro para encontrar la diferencia. Es útil cuando necesitas saber cuánto te queda después de quitar algo.</p>
            <h4>Ejemplo:</h4>
            <div class="number-card mx-auto" style="max-width: 300px; border-color: var(--primary-color);">
                <p class="number-example">50 - 20 = 30</p>
                <p>Si tienes 50 galletas y comes 20, ¿cuántas galletas te quedan? ¡Te quedan 30 galletas!</p>
            </div>
        </section>

        <!-- Video mejorado con contenedor -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/42vjqtleG9E?si=uINBaoKj25GsXO8h" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        
        <section class="card p-4 mb-4">
            <h3>Métodos de Resta</h3>
            <h4>Método Tradicional:</h4>
            <p>Para realizar una resta, coloca los números uno debajo del otro, alineando correctamente los dígitos, y resta comenzando desde la derecha.</p>
            <div class="numeric-line-container">
                <div class="operation-example">
                    <div>&nbsp;  50</div>
                    <div>-20</div>
                    <div class="border-top mt-2">30</div>
                </div>
            </div>
        </section>
        
        <!-- Sección de práctica interactiva -->
        <section class="card p-4 mb-4">
            <h3>¡Practica con estos ejercicios!</h3>
            <p>Intenta resolver estos problemas de suma y resta. Pasa el cursor sobre cada ejercicio para ver la respuesta.</p>
            
            <div class="mt-4">
                <div class="practice-item">
                    <p>Si tienes 12 lápices y te dan 15 más. ¿Cuántos lápices tienes ahora? <span class="answer">12 + 15 = 27 lápices</span></p>
                </div>
                <div class="practice-item">
                    <p>Julia tiene 30 caramelos y le da 18 a su hermano. ¿Cuántos caramelos le quedan? <span class="answer">30 - 18 = 12 caramelos</span></p>
                </div>
                <div class="practice-item">
                    <p>En un autobús viajan 25 personas. En una parada suben 12 personas más. ¿Cuántas personas hay ahora en el autobús? <span class="answer">25 + 12 = 37 personas</span></p>
                </div>
                <div class="practice-item">
                    <p>Pedro tiene 45 cromos y pierde 13. ¿Cuántos cromos le quedan? <span class="answer">45 - 13 = 32 cromos</span></p>
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
            <p class="text-center">© 2024 KIDI, Inc ¡Suma, resta y diviértete!</p>
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