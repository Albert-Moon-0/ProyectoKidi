<%-- 
    Document   : Multiplicaciones
    Created on : 3 nov. 2024, 16:26:39
    Author     : P500
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Multiplicación</title>
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
        .example {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }
        .back-btn {
            font-size: 3rem;
            color: var(--colorTextoPrincipal);
            background: none;
            border: none;
            cursor: pointer;
        }  
    </style>
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    <header>
        <h1 class="header">¡Bienvenidos a la Lección de Multiplicación!</h1>
                        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button> </a>

    </header>

    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué es la Multiplicación?</h3>
            <p>La multiplicación es una forma rápida de sumar el mismo número varias veces. Por ejemplo, si tienes 3 cajas con 5 caramelos en cada una, en lugar de sumar 5 tres veces, puedes multiplicar: <strong>3 x 5</strong>.</p>
            
            <h4>Ejemplo:</h4>
            <p class="example text-center">3 x 5 = 15</p>
            <p>Imagina que tienes 3 bolsas y en cada una hay 5 canicas. Si contamos todas las canicas, tendríamos 15 en total. ¡Eso es multiplicar!</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>La Tabla de Multiplicar</h3>
            <p>Para aprender a multiplicar, usamos la <strong>tabla de multiplicar</strong>. Esta tabla muestra los resultados de multiplicar números entre sí. Practicar con la tabla de multiplicar te ayudará a resolver multiplicaciones rápidamente.</p>
            <div class="text-center">
                <img src="../Imagenes/tabla de multiplicar.png" alt="Tabla de Multiplicar" class="img-fluid" style="max-width: 500px;">
            </div>
        </section>

        <section class="card p-4 mb-4">
            <h3>¡Practica Multiplicando!</h3>
            <p>¿Cuántos hay en total?</p>
            <ul>
                <li>2 x 4 = <span class="answer">8</span></li>
                <li>5 x 3 = <span class="answer">15</span></li>
                <li>4 x 6 = <span class="answer">24</span></li>
            </ul>
        </section>
    </main>

    <footer class="text-center mt-5">
        <p>¡Sigue practicando tus multiplicaciones!</p>
    </footer>
</body>
</html>
