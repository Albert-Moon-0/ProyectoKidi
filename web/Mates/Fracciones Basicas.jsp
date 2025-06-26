<%-- 
    Document   : Fracciones básicas
    Created on : 19 may. 2025
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Fracciones Básicas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="estilosMate.css">
    <link rel="stylesheet" href="../Sistema/Estilos.css" />
</head>
<body>
    <!-- Elementos flotantes de fondo -->
    <div class="floating-number number-1">½</div>
    <div class="floating-number number-2">¼</div>
    <div class="floating-number number-3">⅓</div>
    <div class="floating-number number-4">¾</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header y botón de volver -->
    <div class="position-relative">
        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button></a>
        <h1 class="header-title">¡Fracciones Básicas!</h1>
        <h3 class="greeting">Descubriendo las partes de un todo</h3>
    </div>

    <!-- Contenedor principal -->
    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué son las Fracciones?</h3>
            <p>Las fracciones son números que representan partes de un todo. Por ejemplo, si dividimos una pizza en 4 partes iguales y tomamos 1 parte, estamos tomando <strong>un cuarto</strong> de la pizza, que se escribe como <strong>1/4</strong>.</p>
            <h4>Las Partes de una Fracción</h4>
            <p>Una fracción tiene dos partes principales:</p>
            <div class="d-flex justify-content-center align-items-center my-4">
                <div class="fraction-illustration">
                    <div class="numerator">3</div>
                    <div class="fraction-line"></div>
                    <div class="denominator">4</div>
                    <div class="fraction-labels">
                        <div class="numerator-label">Numerador<br>(partes que tomamos)</div>
                        <div class="denominator-label">Denominador<br>(partes totales)</div>
                    </div>
                </div>
            </div>
            <p>El <strong>numerador</strong> (número de arriba) nos dice cuántas partes tomamos.</p>
            <p>El <strong>denominador</strong> (número de abajo) nos dice en cuántas partes iguales dividimos el todo.</p>
        </section>
        
        <!-- Video sobre fracciones -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/c9cTIjBqFTw" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>Fracciones en la Vida Diaria</h3>
            <p>Las fracciones están en todas partes en nuestra vida. Veamos algunos ejemplos:</p>
            <div class="d-flex flex-wrap justify-content-around">
                <div class="fraction-card">
                    <img src="../Imagenes/pizza.png" alt="Media pizza" class="img-fluid fraction-image">
                    <p class="fraction-example">1/2</p>
                    <p>La mitad de una pizza</p>
                </div>
                <div class="fraction-card">
                    <img src="../Imagenes/pastel.png" alt="Un cuarto de pastel" class="img-fluid fraction-image">
                    <p class="fraction-example">1/4</p>
                    <p>Un cuarto de pastel</p>
                </div>
                <div class="fraction-card">
                    <img src="../Imagenes/chocolate.png" alt="Tres cuartos de una barra de chocolate" class="img-fluid fraction-image">
                    <p class="fraction-example">3/4</p>
                    <p>Tres cuartos de chocolate</p>
                </div>
            </div>
        </section>
        
        <!-- Video sobre fracciones en la vida cotidiana -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/n0FZhQ_GkKw" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>Fracciones Básicas</h3>
            <p>Hay algunas fracciones que usamos con frecuencia. Aprendamos las más comunes:</p>
            <div class="row justify-content-center">
                <div class="col-md-4 mb-3">
                    <div class="fraction-block">
                        <div class="fraction-circle half"></div>
                        <h4>Un medio (1/2)</h4>
                        <p>Es cuando dividimos algo en 2 partes iguales y tomamos 1 parte.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="fraction-block">
                        <div class="fraction-circle third"></div>
                        <h4>Un tercio (1/3)</h4>
                        <p>Es cuando dividimos algo en 3 partes iguales y tomamos 1 parte.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="fraction-block">
                        <div class="fraction-circle quarter"></div>
                        <h4>Un cuarto (1/4)</h4>
                        <p>Es cuando dividimos algo en 4 partes iguales y tomamos 1 parte.</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="card p-4 mb-4">
            <h3>¡Practica Tú Mismo!</h3>
            <p>Aquí tienes algunos ejercicios para practicar con fracciones. ¿Puedes identificar qué fracción se muestra? (¡Pasa el cursor sobre cada ejercicio para ver la respuesta!)</p>
            <div class="mt-4">
                <div class="practice-item">
                    <img src="../Imagenes/tres_cuartos_circulo.png" alt="Círculo dividido en 4 partes con 3 coloreadas" class="img-fluid practice-image">
                    <p>¿Qué fracción representa la parte coloreada? <span class="answer">¡3/4 o tres cuartos!</span></p>
                </div>
                <div class="practice-item">
                    <img src="../Imagenes/un_tercio_rectangulo.png" alt="Rectángulo dividido en 3 partes con 1 coloreada" class="img-fluid practice-image">
                    <p>¿Qué fracción representa la parte coloreada? <span class="answer">¡1/3 o un tercio!</span></p>
                </div>
                <div class="practice-item">
                    <img src="../Imagenes/dos_sextos_barra.png" alt="Barra dividida en 6 partes con 2 coloreadas" class="img-fluid practice-image">
                    <p>¿Qué fracción representa la parte coloreada? <span class="answer">¡2/6 o dos sextos!</span></p>
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
            <p class="text-center">© 2024 KIDI, Inc ¡Diviértete explorando el mundo de las fracciones!</p>
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

    <style>
        /* Estilos específicos para la lección de fracciones */
        .fraction-illustration {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px auto;
            font-size: 3rem;
            font-weight: bold;
            width: 200px;
        }
        
        .numerator, .denominator {
            height: 60px;
            width: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #FFD166;
            border-radius: 50%;
            margin: 10px 0;
            color: #333;
        }
        
        .fraction-line {
            height: 6px;
            width: 80px;
            background-color: #333;
            border-radius: 3px;
        }
        
        .fraction-labels {
            position: absolute;
            width: 100%;
            display: flex;
            justify-content: space-between;
            top: 0;
            font-size: 0.9rem;
            font-weight: normal;
            color: #333;
        }
        
        .numerator-label {
            position: absolute;
            left: -130px;
            top: 10px;
            text-align: right;
        }
        
        .denominator-label {
            position: absolute;
            right: -130px;
            bottom: -40px;
            text-align: left;
        }
        
        .fraction-card {
            text-align: center;
            margin: 15px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            width: 200px;
        }
        
        .fraction-card:hover {
            transform: translateY(-5px);
        }
        
        .fraction-image {
            height: 120px;
            object-fit: contain;
            margin-bottom: 10px;
        }
        
        .fraction-example {
            font-size: 1.8rem;
            font-weight: 700;
            color: #EF476F;
            margin: 5px 0;
        }
        
        .fraction-block {
            text-align: center;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            height: 100%;
            transition: transform 0.3s ease;
        }
        
        .fraction-block:hover {
            transform: translateY(-5px);
        }
        
        .fraction-circle {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin: 0 auto 15px;
            background-color: #ccc;
            position: relative;
            overflow: hidden;
        }
        
        .half::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 50%;
            height: 100%;
            background-color: #26547C;
        }
        
        .third::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 33.33%;
            height: 100%;
            background-color: #06D6A0;
        }
        
        .quarter::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 25%;
            height: 100%;
            background-color: #FFD166;
        }
        
        .practice-item {
            margin-bottom: 30px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .practice-item:hover {
            transform: translateY(-5px);
        }
        
        .practice-image {
            max-width: 200px;
            margin: 0 auto 15px;
            display: block;
        }
        
        .answer {
            color: transparent;
            font-weight: 700;
            transition: color 0.3s ease;
        }
        
        .practice-item:hover .answer {
            color: #EF476F;
        }
        
        /* Estilos para elementos flotantes */
        .floating-number {
            font-family: 'Baloo 2', cursive;
            font-weight: 700;
            opacity: 0.1;
            position: fixed;
            z-index: -1;
        }
        
        .number-1 {
            top: 10%;
            left: 5%;
            font-size: 8rem;
            color: #26547C;
        }
        
        .number-2 {
            top: 30%;
            right: 8%;
            font-size: 10rem;
            color: #FFD166;
        }
        
        .number-3 {
            bottom: 20%;
            left: 8%;
            font-size: 9rem;
            color: #06D6A0;
        }
        
        .number-4 {
            bottom: 10%;
            right: 10%;
            font-size: 7rem;
            color: #EF476F;
        }
    </style>
</body>
</html>