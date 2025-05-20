<%-- 
    Document   : Tiempo y dinero
    Created on : 19 may. 2025, 17:30:15
    Author     : KIDI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Tiempo y Dinero</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="estilosMate.css">
    
    <style>
        /* Estilos específicos para la lección de tiempo y dinero */
        .floating-clock {
            position: absolute;
            opacity: 0.1;
            font-size: 3rem;
            z-index: -1;
        }
        
        .clock-1 {
            top: 15%;
            left: 10%;
            transform: rotate(-15deg);
        }
        
        .floating-coin {
            position: absolute;
            opacity: 0.1;
            font-size: 3rem;
            z-index: -1;
        }
        
        .coin-1 {
            top: 30%;
            right: 10%;
            transform: rotate(10deg);
        }
        
        .coin-2 {
            bottom: 20%;
            left: 15%;
            transform: rotate(-5deg);
        }
        
        .time-card, .money-card {
            border: 2px solid #ffc107;
            border-radius: 10px;
            padding: 15px;
            margin: 10px;
            text-align: center;
            background-color: #fff9e6;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .time-card:hover, .money-card:hover {
            transform: translateY(-5px);
        }
        
        .clock-image, .coin-image {
            max-width: 150px;
            margin: 0 auto 15px;
        }
        
        .practice-item {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            position: relative;
            cursor: pointer;
        }
        
        .practice-item .answer {
            visibility: hidden;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            border-radius: 6px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            margin-left: -60px;
            opacity: 0;
            transition: opacity 0.3s;
        }
        
        .practice-item:hover .answer {
            visibility: visible;
            opacity: 1;
        }
    </style>
</head>
<body>
    <!-- Elementos flotantes de fondo -->
    <div class="floating-clock clock-1">🕒</div>
    <div class="floating-coin coin-1">💰</div>
    <div class="floating-coin coin-2">💵</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header y botón de volver -->
    <div class="position-relative">
        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button></a>
        <h1 class="header-title">¡Tiempo y Dinero!</h1>
        <h3 class="greeting">Aprendiendo a leer el reloj y contar monedas</h3>
    </div>

    <!-- Contenedor principal -->
    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>El Tiempo: ¿Qué hora es?</h3>
            <p>El tiempo es muy importante en nuestra vida diaria. Nos ayuda a saber cuándo ir a la escuela, cuándo comer y cuándo es hora de dormir. Para medir el tiempo, usamos <strong>relojes</strong>.</p>
            <h4>Partes de un Reloj</h4>
            <p>Un reloj tiene <strong>dos manecillas principales</strong>:</p>
            <ul>
                <li>La <strong>manecilla corta</strong> indica la <strong>hora</strong>.</li>
                <li>La <strong>manecilla larga</strong> indica los <strong>minutos</strong>.</li>
            </ul>
            <p>Hay <strong>12 horas</strong> en un reloj y <strong>60 minutos</strong> en una hora.</p>
        </section>
        
        <!-- Video sobre cómo leer el reloj -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/3Posbu-VKxU" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>Leyendo el Reloj</h3>
            <p>Para leer la hora en un reloj, primero miramos dónde apunta la <strong>manecilla corta</strong> para saber la hora, y luego miramos dónde apunta la <strong>manecilla larga</strong> para saber los minutos.</p>
            <div class="d-flex flex-wrap justify-content-around">
                <div class="time-card">
                    <img src="../Imagenes/reloj_3.png" alt="Reloj marcando las 3 en punto" class="img-fluid clock-image">
                    <p class="time-example">3:00</p>
                    <p>Las tres en punto</p>
                </div>
                <div class="time-card">
                    <img src="../Imagenes/reloj_530.png" alt="Reloj marcando las 5 y media" class="img-fluid clock-image">
                    <p class="time-example">5:30</p>
                    <p>Las cinco y media</p>
                </div>
                <div class="time-card">
                    <img src="../Imagenes/reloj_945.png" alt="Reloj marcando las 9:45" class="img-fluid clock-image">
                    <p class="time-example">9:45</p>
                    <p>Las diez menos cuarto</p>
                </div>
            </div>
        </section>
        
        <section class="card p-4 mb-4">
            <h3>El Dinero: ¡A contar monedas!</h3>
            <p>El dinero nos permite comprar cosas que necesitamos o queremos. Aprender a contar dinero es una habilidad muy importante para la vida.</p>
            <h4>Conociendo las Monedas</h4>
            <p>Cada moneda tiene un valor diferente. Es importante conocerlas para poder contar correctamente.</p>
        </section>
        
        <!-- Video sobre conteo de monedas -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/JOdc1az2aJ8" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>Valor de las Monedas</h3>
            <p>Cada moneda tiene un valor específico. Veamos algunas monedas comunes:</p>
            <div class="d-flex flex-wrap justify-content-around">
                <div class="money-card">
                    <img src="../Imagenes/moneda_1cent.png" alt="Moneda de 1 céntimo" class="img-fluid coin-image">
                    <p class="money-example">1 céntimo</p>
                    <p>La moneda más pequeña</p>
                </div>
                <div class="money-card">
                    <img src="../Imagenes/moneda_10cent.png" alt="Moneda de 10 céntimos" class="img-fluid coin-image">
                    <p class="money-example">10 céntimos</p>
                    <p>Vale 10 monedas de 1 céntimo</p>
                </div>
                <div class="money-card">
                    <img src="../Imagenes/moneda_1euro.png" alt="Moneda de 1 euro" class="img-fluid coin-image">
                    <p class="money-example">1 euro</p>
                    <p>Vale 100 céntimos</p>
                </div>
            </div>
        </section>

        <section class="card p-4 mb-4">
            <h3>Sumando Dinero</h3>
            <p>Para saber cuánto dinero tenemos, debemos sumar el valor de todas nuestras monedas.</p>
            <div class="numeric-line-container">
                <img src="../Imagenes/sumando_monedas.png" alt="Ejemplo de suma de monedas" class="img-fluid" style="max-width: 100%; border-radius: 10px;">
            </div>
            <p class="mt-3">Por ejemplo, si tenemos 2 monedas de 1 euro y 3 monedas de 10 céntimos, tenemos en total 2 euros y 30 céntimos, o 2,30€.</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>¡Practica Tú Mismo!</h3>
            <p>Aquí tienes algunos ejercicios para practicar. (¡Pasa el cursor sobre cada ejercicio para ver la respuesta!)</p>
            
            <h4>Hora</h4>
            <div class="mt-4">
                <div class="practice-item">
                    <p>Si la manecilla corta apunta al 4 y la larga al 12, ¿qué hora es? <span class="answer">Las 4:00 (cuatro en punto)</span></p>
                </div>
                <div class="practice-item">
                    <p>Si la manecilla corta está entre el 7 y el 8, y la larga apunta al 6, ¿qué hora es? <span class="answer">Las 7:30 (siete y media)</span></p>
                </div>
            </div>
            
            <h4>Dinero</h4>
            <div class="mt-4">
                <div class="practice-item">
                    <p>Si tienes 3 monedas de 1 euro, ¿cuánto dinero tienes? <span class="answer">3 euros</span></p>
                </div>
                <div class="practice-item">
                    <p>Si tienes 2 monedas de 50 céntimos, ¿cuánto dinero tienes? <span class="answer">1 euro</span></p>
                </div>
                <div class="practice-item">
                    <p>Si tienes 1 moneda de 2 euros y 2 monedas de 20 céntimos, ¿cuánto dinero tienes en total? <span class="answer">2,40 euros</span></p>
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
            <p class="text-center">© 2024 KIDI, Inc ¡Aprendiendo sobre el tiempo y el dinero!</p>
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