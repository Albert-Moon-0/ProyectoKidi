<%-- 
    Document   : Leccion Geometria
    Created on : 5 nov. 2024, 07:40:07
    Author     : Usuario
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Geometría Básica</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <style>
        .header {
            text-align: center;
            font-size: 2.5rem;
            font-weight: bold;
            margin: 20px 0;
            color: var(--primary-color);
        }
        .figure-card {
            padding: 20px;
            border: 2px solid var(--primary-color);
            border-radius: 10px;
            margin: 10px;
            text-align: center;
        }
        .figure-img {
            max-width: 150px;
            margin-bottom: 10px;
        }
        .example-text {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />

    <header>
        <h1 class="header">¡Bienvenidos a la Lección de Geometría!</h1>
        <h3 class="greeting">Conociendo las Figuras Geométricas</h3>
                            <a href="P-Mates.jsp"><button class="back-btn">&larr;</button> </a>
    </header>

    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué es la Geometría?</h3>
            <p>La geometría es una rama de las matemáticas que estudia las formas y figuras. ¡La geometría está en todas partes! Observa a tu alrededor: todo tiene forma. Los libros, las ventanas, el balón con el que juegas?</p>
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

        <section class="card p-4 mb-4">
            <h3>Partes de una Figura</h3>
            <p>Conozcamos algunas partes de las figuras geométricas:</p>
            <ul>
                <li><strong>Lados:</strong> Las líneas que forman la figura.</li>
                <li><strong>Esquinas:</strong> Los puntos donde se unen dos lados.</li>
                <li><strong>Centro:</strong> El punto en el medio de una figura como el círculo.</li>
            </ul>
        </section>

        <section class="card p-4 mb-4">
            <h3>¡Observa las Figuras a Tu Alrededor!</h3>
            <p>Prueba a observar las figuras en objetos cercanos. Por ejemplo:</p>
            <ul>
                <li>Un balón es como un <strong>círculo</strong>.</li>
                <li>La puerta es como un <strong>rectángulo</strong>.</li>
                <li>La pizza puede cortarse en <strong>triángulos</strong> (las porciones).</li>
            </ul>
        </section>

        <section class="card p-4 mb-4">
            <h3>¡Hora de Practicar!</h3>
            <p>¿Qué figura tiene??</p>
            <ul>
                <li><strong>4 lados iguales:</strong> <span class="answer">¡Un cuadrado!</span></li>
                <li><strong>3 lados:</strong> <span class="answer">¡Un triángulo!</span></li>
                <li><strong>Sin lados ni esquinas:</strong> <span class="answer">¡Un círculo!</span></li>
            </ul>
        </section>
    </main>

    <footer class="text-center mt-5">
        <p>¡Diviértete explorando la geometría en todas partes!</p>
    </footer>
</body>
</html>
