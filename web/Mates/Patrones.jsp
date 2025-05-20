<%-- 
    Document   : Patrones y secuencias numéricas
    Created on : 19 may. 2025, 18:15:20
    Author     : KIDI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Patrones y Secuencias Numéricas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="estilosMate.css">
    
    <style>
        /* Estilos específicos para la lección de patrones y secuencias */
        .pattern-element {
            position: absolute;
            opacity: 0.1;
            font-size: 3rem;
            z-index: -1;
        }
        
        .pattern-1 {
            top: 10%;
            left: 15%;
            transform: rotate(-10deg);
        }
        
        .pattern-2 {
            top: 35%;
            right: 10%;
            transform: rotate(15deg);
        }
        
        .pattern-3 {
            bottom: 25%;
            left: 20%;
            transform: rotate(5deg);
        }
        
        .pattern-4 {
            bottom: 40%;
            right: 20%;
            transform: rotate(-5deg);
        }
        
        .sequence-card {
            border: 2px solid #4CAF50;
            border-radius: 10px;
            padding: 15px;
            margin: 10px;
            text-align: center;
            background-color: #f1f8e9;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .sequence-card:hover {
            transform: translateY(-5px);
        }
        
        .sequence-example {
            font-size: 1.5rem;
            font-weight: bold;
            color: #2E7D32;
            margin-bottom: 10px;
        }
        
        .pattern-blocks {
            display: flex;
            justify-content: center;
            margin: 20px 0;
            flex-wrap: wrap;
        }
        
        .pattern-block {
            width: 50px;
            height: 50px;
            margin: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .block-red {
            background-color: #ffcdd2;
            border: 2px solid #e57373;
        }
        
        .block-blue {
            background-color: #bbdefb;
            border: 2px solid #64b5f6;
        }
        
        .block-yellow {
            background-color: #fff9c4;
            border: 2px solid #fff176;
        }
        
        .block-green {
            background-color: #c8e6c9;
            border: 2px solid #81c784;
        }
        
        .block-purple {
            background-color: #e1bee7;
            border: 2px solid #ba68c8;
        }
        
        .pattern-question {
            font-size: 1.8rem;
            font-weight: bold;
            color: #1976D2;
            margin: 10px;
        }
        
        .pattern-space {
            width: 50px;
            height: 50px;
            border: 2px dashed #757575;
            border-radius: 8px;
            margin: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            background-color: #f5f5f5;
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
    <div class="pattern-element pattern-1">○□△</div>
    <div class="pattern-element pattern-2">123</div>
    <div class="pattern-element pattern-3">246</div>
    <div class="pattern-element pattern-4">□○□</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header y botón de volver -->
    <div class="position-relative">
        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button></a>
        <h1 class="header-title">¡Patrones y Secuencias Numéricas!</h1>
        <h3 class="greeting">Descubriendo el orden mágico en los números</h3>
    </div>

    <!-- Contenedor principal -->
    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué son los Patrones?</h3>
            <p>Los <strong>patrones</strong> son diseños o secuencias que se repiten siguiendo una regla. Están por todas partes: en los dibujos de tu ropa, en las baldosas del suelo, ¡y por supuesto en las matemáticas!</p>
            <h4>Patrones en la Vida Diaria</h4>
            <p>Seguramente has visto muchos patrones sin darte cuenta:</p>
            <ul>
                <li>Los días de la semana: lunes, martes, miércoles... ¡y vuelve a empezar!</li>
                <li>Las estaciones del año: primavera, verano, otoño, invierno, y otra vez primavera.</li>
                <li>Las rayas de colores en tu camiseta favorita.</li>
            </ul>
            <p>Encontrar patrones nos ayuda a predecir qué viene después y a entender mejor el mundo.</p>
        </section>
        
        <!-- Video sobre patrones -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/MaVgBjVh4b8" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>Patrones de Formas y Colores</h3>
            <p>Antes de hablar de números, vamos a ver patrones con formas y colores:</p>
            
            <h4>Patrones de Repetición</h4>
            <div class="pattern-blocks">
                <div class="pattern-block block-red">🔴</div>
                <div class="pattern-block block-blue">🔵</div>
                <div class="pattern-block block-red">🔴</div>
                <div class="pattern-block block-blue">🔵</div>
                <div class="pattern-block block-red">🔴</div>
                <div class="pattern-block block-blue">🔵</div>
            </div>
            <p>En este patrón, los colores rojo y azul se repiten: rojo, azul, rojo, azul...</p>
            
            <h4>Patrones de Formas</h4>
            <div class="pattern-blocks">
                <div class="pattern-block block-yellow">○</div>
                <div class="pattern-block block-green">□</div>
                <div class="pattern-block block-purple">△</div>
                <div class="pattern-block block-yellow">○</div>
                <div class="pattern-block block-green">□</div>
                <div class="pattern-block block-purple">△</div>
            </div>
            <p>¿Puedes ver el patrón? Círculo, cuadrado, triángulo, y se repite.</p>
            
            <h4>¿Qué sigue?</h4>
            <div class="pattern-blocks">
                <div class="pattern-block block-red">🔴</div>
                <div class="pattern-block block-red">🔴</div>
                <div class="pattern-block block-blue">🔵</div>
                <div class="pattern-block block-red">🔴</div>
                <div class="pattern-block block-red">🔴</div>
                <div class="pattern-block block-blue">🔵</div>
                <div class="pattern-space">?</div>
            </div>
            <p>Si observas con atención, podrás adivinar qué color sigue en el patrón.</p>
            <p class="text-center pattern-question">¿Rojo o azul? <span style="font-size: 1rem;">(Pasa el cursor para ver la respuesta)</span> <span class="answer">¡Rojo! El patrón es: rojo, rojo, azul...</span></p>
        </section>
        
        <section class="card p-4 mb-4">
            <h3>Secuencias Numéricas</h3>
            <p>Una <strong>secuencia numérica</strong> es un conjunto de números que siguen un patrón. Veamos algunos ejemplos:</p>
            <div class="d-flex flex-wrap justify-content-around">
                <div class="sequence-card">
                    <p class="sequence-example">2, 4, 6, 8, 10, ...</p>
                    <p>Estos son los números pares. Cada número aumenta en 2.</p>
                </div>
                <div class="sequence-card">
                    <p class="sequence-example">1, 3, 5, 7, 9, ...</p>
                    <p>Estos son los números impares. También aumentan de 2 en 2.</p>
                </div>
                <div class="sequence-card">
                    <p class="sequence-example">5, 10, 15, 20, 25, ...</p>
                    <p>En esta secuencia, cada número aumenta en 5.</p>
                </div>
            </div>
        </section>
        
        <!-- Video sobre secuencias numéricas -->
        <div class="video-container">
            <iframe src="https://www.youtube-nocookie.com/embed/Mk6ZR3h8Q-I" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>Encontrando la Regla</h3>
            <p>Para continuar una secuencia numérica, primero debemos encontrar la <strong>regla</strong> que siguen los números.</p>
            
            <h4>Ejemplo 1:</h4>
            <div class="sequence-card">
                <p class="sequence-example">3, 6, 9, 12, ___</p>
                <p>¿Cuál es el siguiente número?</p>
                <p>Si observamos, cada número aumenta en 3: 3+3=6, 6+3=9, 9+3=12, así que el siguiente será 12+3=15.</p>
            </div>
            
            <h4>Ejemplo 2:</h4>
            <div class="sequence-card">
                <p class="sequence-example">2, 4, 8, 16, ___</p>
                <p>¿Cuál es el siguiente número?</p>
                <p>En esta secuencia, cada número se multiplica por 2: 2×2=4, 4×2=8, 8×2=16, así que el siguiente será 16×2=32.</p>
            </div>
            
            <div class="numeric-line-container mt-4">
                <img src="../Imagenes/secuencia_numerica.png" alt="Ejemplo de secuencia numérica" class="img-fluid" style="max-width: 100%; border-radius: 10px;">
            </div>
        </section>

        <section class="card p-4 mb-4">
            <h3>¡Practica Tú Mismo!</h3>
            <p>Aquí tienes algunos ejercicios para practicar con patrones y secuencias. (¡Pasa el cursor sobre cada ejercicio para ver la respuesta!)</p>
            
            <h4>Completa la secuencia:</h4>
            <div class="mt-4">
                <div class="practice-item">
                    <p>5, 10, 15, 20, ____ <span class="answer">25 (sumamos 5 cada vez)</span></p>
                </div>
                <div class="practice-item">
                    <p>1, 3, 6, 10, ____ <span class="answer">15 (sumamos 2, luego 3, luego 4...)</span></p>
                </div>
                <div class="practice-item">
                    <p>100, 90, 80, 70, ____ <span class="answer">60 (restamos 10 cada vez)</span></p>
                </div>
            </div>
            
            <h4>¿Cuál es la regla?</h4>
            <div class="mt-4">
                <div class="practice-item">
                    <p>2, 4, 6, 8, 10. ¿Cuál es la regla de esta secuencia? <span class="answer">Sumamos 2 cada vez</span></p>
                </div>
                <div class="practice-item">
                    <p>1, 2, 4, 8, 16. ¿Cuál es la regla de esta secuencia? <span class="answer">Multiplicamos por 2 cada vez</span></p>
                </div>
                <div class="practice-item">
                    <p>1, 4, 9, 16, 25. ¿Cuál es la regla de esta secuencia? <span class="answer">Son los números al cuadrado: 1², 2², 3², 4², 5²</span></p>
                </div>
            </div>
        </section>

        <section class="card p-4 mb-4">
            <h3>Creando tus Propios Patrones</h3>
            <p>¡También puedes inventar tus propios patrones y secuencias! Prueba con estas ideas:</p>
            <ul>
                <li>Crea un patrón con objetos de colores como botones o bloques</li>
                <li>Dibuja un patrón de formas: estrella, círculo, cuadrado, estrella, círculo, cuadrado...</li>
                <li>Inventa una secuencia numérica y pídele a un amigo o familiar que adivine el siguiente número</li>
            </ul>
        </section>
    </main>

    <!-- Botón flotante para volver arriba -->
    <a href="#" class="back-to-top">↑</a>

    <!-- Footer mejorado -->
    <footer class="py-3 mt-5">
        <div class="container">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3"></ul>
            <p class="text-center">© 2024 KIDI, Inc ¡Explora el mágico mundo de los patrones y secuencias!</p>
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