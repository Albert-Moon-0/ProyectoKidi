<%-- 
    Document   : Medidas básicas
    Created on : 19 may. 2025
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Medidas Básicas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="estilosMate.css">
    <link rel="stylesheet" href="../Sistema/Estilos.css" />
</head>
<body>
    <!-- Elementos flotantes de fondo -->
    <div class="floating-icon ruler">📏</div>
    <div class="floating-icon scale">⚖️</div>
    <div class="floating-icon cup">🥛</div>
    <div class="floating-icon tape">📐</div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Header y botón de volver -->
    <div class="position-relative">
        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button></a>
        <h1 class="header-title">¡El Mundo de las Medidas!</h1>
        <h3 class="greeting">Descubriendo cómo medir longitud, peso y capacidad</h3>
    </div>

    <!-- Contenedor principal -->
    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Por qué necesitamos medir?</h3>
            <p>Todos los días medimos cosas para entender el mundo que nos rodea. Medimos <strong>cuán largo</strong> es algo, <strong>cuánto pesa</strong> o <strong>cuánto líquido</strong> cabe en un recipiente.</p>
            <p>Para esto, usamos diferentes unidades de medida según lo que queramos medir:</p>
            <div class="row mt-4">
                <div class="col-md-4 mb-3">
                    <div class="measure-card">
                        <div class="measure-icon">📏</div>
                        <h4>Longitud</h4>
                        <p>Para medir lo largo, alto o ancho de las cosas</p>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="measure-card">
                        <div class="measure-icon">⚖️</div>
                        <h4>Peso</h4>
                        <p>Para medir cuánto pesan los objetos</p>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="measure-card">
                        <div class="measure-icon">🥛</div>
                        <h4>Capacidad</h4>
                        <p>Para medir cuánto líquido cabe en un recipiente</p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Sección de Longitud -->
        <section class="card p-4 mb-4 section-length">
            <h3>Midiendo Longitudes</h3>
            <p>La longitud nos dice cuán largo, alto o ancho es algo. Estas son las unidades de longitud más comunes:</p>
            
            <div class="units-container">
                <div class="unit-card">
                    <div class="unit-image">
                        <img src="../Imagenes/centimetro.png" alt="Regla con centímetros" class="img-fluid">
                    </div>
                    <h5>Centímetro (cm)</h5>
                    <p>Usamos centímetros para medir cosas pequeñas, como un lápiz o tu dedo.</p>
                    <div class="example">Por ejemplo: Un lápiz mide aproximadamente 15 cm de largo.</div>
                </div>
                
                <div class="unit-card">
                    <div class="unit-image">
                        <img src="../Imagenes/metro.png" alt="Cinta métrica" class="img-fluid">
                    </div>
                    <h5>Metro (m)</h5>
                    <p>Usamos metros para medir cosas más grandes, como la altura de una persona o el ancho de una habitación.</p>
                    <div class="example">Por ejemplo: La altura de un niño podría ser 1.25 m.</div>
                </div>
                
                <div class="unit-card">
                    <div class="unit-image">
                        <img src="../Imagenes/kilometro.png" alt="Señal de kilómetro" class="img-fluid">
                    </div>
                    <h5>Kilómetro (km)</h5>
                    <p>Usamos kilómetros para medir distancias largas, como la distancia entre ciudades.</p>
                    <div class="example">Por ejemplo: La distancia de tu casa a la escuela podría ser 2 km.</div>
                </div>
            </div>
            
            <div class="conversion-box">
                <h5>¿Cómo se relacionan estas unidades?</h5>
                <p>1 metro (m) = 100 centímetros (cm)</p>
                <p>1 kilómetro (km) = 1,000 metros (m)</p>
            </div>
        </section>
        
        <!-- Video sobre longitud -->
        <div class="video-container">
            <iframe src="https://www.youtube.com/embed/kzrplJ1jvko" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        
        <!-- Sección de Peso -->
        <section class="card p-4 mb-4 section-weight">
            <h3>Midiendo el Peso</h3>
            <p>El peso nos dice cuánta masa tiene un objeto. Estas son las unidades de peso más comunes:</p>
            
            <div class="units-container">
                <div class="unit-card">
                    <div class="unit-image">
                        <img src="../Imagenes/gramo.png" alt="Paquete de 100 gramos" class="img-fluid">
                    </div>
                    <h5>Gramo (g)</h5>
                    <p>Usamos gramos para medir el peso de cosas pequeñas, como una manzana o un lápiz.</p>
                    <div class="example">Por ejemplo: Una manzana pequeña pesa aproximadamente 150 g.</div>
                </div>
                
                <div class="unit-card">
                    <div class="unit-image">
                        <img src="../Imagenes/kilogramo.png" alt="Peso de 1 kilogramo" class="img-fluid">
                    </div>
                    <h5>Kilogramo (kg)</h5>
                    <p>Usamos kilogramos para medir el peso de cosas más pesadas, como una sandía o una persona.</p>
                    <div class="example">Por ejemplo: Un niño podría pesar 30 kg.</div>
                </div>
            </div>
            
            <div class="conversion-box">
                <h5>¿Cómo se relacionan estas unidades?</h5>
                <p>1 kilogramo (kg) = 1,000 gramos (g)</p>
            </div>
        </section>
        
        <!-- Video sobre peso -->
        <div class="video-container">
            <iframe src="https://www.youtube.com/embed/u3Yz4HCF4uQ" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        
        <!-- Sección de Capacidad -->
        <section class="card p-4 mb-4 section-capacity">
            <h3>Midiendo la Capacidad</h3>
            <p>La capacidad nos dice cuánto líquido puede contener un recipiente. Estas son las unidades de capacidad más comunes:</p>
            
            <div class="units-container">
                <div class="unit-card">
                    <div class="unit-image">
                        <img src="../Imagenes/mililitro.png" alt="Jeringa con mililitros" class="img-fluid">
                    </div>
                    <h5>Mililitro (ml)</h5>
                    <p>Usamos mililitros para medir pequeñas cantidades de líquido, como una cucharada de jarabe.</p>
                    <div class="example">Por ejemplo: Una cucharadita de medicina podría contener 5 ml.</div>
                </div>
                
                <div class="unit-card">
                    <div class="unit-image">
                        <img src="../Imagenes/litro.png" alt="Botella de un litro" class="img-fluid">
                    </div>
                    <h5>Litro (l)</h5>
                    <p>Usamos litros para medir cantidades más grandes de líquido, como agua en una botella.</p>
                    <div class="example">Por ejemplo: Una botella grande de agua contiene 1 litro.</div>
                </div>
            </div>
            
            <div class="conversion-box">
                <h5>¿Cómo se relacionan estas unidades?</h5>
                <p>1 litro (l) = 1,000 mililitros (ml)</p>
            </div>
        </section>
        
        <!-- Video sobre capacidad -->
        <div class="video-container">
            <iframe src="https://www.youtube.com/embed/laqFfrpZbx0" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>

        <section class="card p-4 mb-4">
            <h3>¡Practica Tú Mismo!</h3>
            <p>Aquí tienes algunos ejercicios para practicar con medidas. ¿Puedes seleccionar la unidad correcta para cada caso? (¡Pasa el cursor sobre cada ejercicio para ver la respuesta!)</p>
            <div class="mt-4">
                <div class="practice-item">
                    <div class="practice-question">
                        <img src="../Imagenes/lapiz_medir.png" alt="Lápiz para medir" class="practice-image">
                        <p>¿Qué unidad usarías para medir la longitud de un lápiz?</p>
                        <div class="options">
                            <span class="option">Centímetros (cm)</span>
                            <span class="option">Kilómetros (km)</span>
                            <span class="option">Kilogramos (kg)</span>
                        </div>
                    </div>
                    <p class="answer">¡Centímetros (cm)! Un lápiz es pequeño, así que usamos centímetros.</p>
                </div>
                
                <div class="practice-item">
                    <div class="practice-question">
                        <img src="../Imagenes/manzana_pesar.png" alt="Manzana para pesar" class="practice-image">
                        <p>¿Qué unidad usarías para medir el peso de una manzana?</p>
                        <div class="options">
                            <span class="option">Metros (m)</span>
                            <span class="option">Gramos (g)</span>
                            <span class="option">Litros (l)</span>
                        </div>
                    </div>
                    <p class="answer">¡Gramos (g)! Una manzana es ligera, así que usamos gramos para su peso.</p>
                </div>
                
                <div class="practice-item">
                    <div class="practice-question">
                        <img src="../Imagenes/botella_agua.png" alt="Botella de agua" class="practice-image">
                        <p>¿Qué unidad usarías para medir cuánta agua cabe en una botella grande?</p>
                        <div class="options">
                            <span class="option">Kilogramos (kg)</span>
                            <span class="option">Metros (m)</span>
                            <span class="option">Litros (l)</span>
                        </div>
                    </div>
                    <p class="answer">¡Litros (l)! Para medir la cantidad de agua en una botella grande usamos litros.</p>
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
            <p class="text-center">© 2024 KIDI, Inc ¡Diviértete explorando el mundo de las medidas!</p>
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
        /* Estilos específicos para la lección de medidas */
        .measure-card {
            text-align: center;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            height: 100%;
            transition: transform 0.3s ease;
        }
        
        .measure-card:hover {
            transform: translateY(-5px);
        }
        
        .measure-icon {
            font-size: 3rem;
            margin-bottom: 15px;
        }
        
        .section-length {
            border-left: 6px solid #4361EE;
        }
        
        .section-weight {
            border-left: 6px solid #F72585;
        }
        
        .section-capacity {
            border-left: 6px solid #4CC9F0;
        }
        
        .units-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin: 30px 0;
        }
        
        .unit-card {
            flex: 1 1 250px;
            max-width: 300px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .unit-card:hover {
            transform: translateY(-5px);
        }
        
        .unit-image {
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }
        
        .unit-image img {
            max-height: 100%;
            object-fit: contain;
        }
        
        .example {
            margin-top: 10px;
            padding: 10px;
            background-color: #e9ecef;
            border-radius: 5px;
            font-style: italic;
        }
        
        .conversion-box {
            margin-top: 30px;
            padding: 15px;
            background-color: #e9ecef;
            border-radius: 10px;
            text-align: center;
        }
        
        .conversion-box h5 {
            margin-bottom: 15px;
            color: #333;
        }
        
        .conversion-box p {
            font-weight: 700;
            margin: 10px 0;
        }
        
        .practice-item {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .practice-item:hover {
            transform: translateY(-5px);
        }
        
        .practice-question {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .practice-image {
            max-width: 150px;
            margin-bottom: 15px;
        }
        
        .options {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
        }
        
        .option {
            padding: 8px 15px;
            background-color: #e9ecef;
            border-radius: 20px;
            font-weight: 600;
        }
        
        .answer {
            color: transparent;
            font-weight: 700;
            text-align: center;
            transition: color 0.3s ease;
        }
        
        .practice-item:hover .answer {
            color: #4361EE;
        }
        
        /* Estilos para elementos flotantes */
        .floating-icon {
            font-size: 4rem;
            opacity: 0.1;
            position: fixed;
            z-index: -1;
        }
        
        .ruler {
            top: 10%;
            left: 5%;
        }
        
        .scale {
            top: 30%;
            right: 8%;
        }
        
        .cup {
            bottom: 20%;
            left: 8%;
        }
        
        .tape {
            bottom: 10%;
            right: 10%;
        }
    </style>
</body>
</html>