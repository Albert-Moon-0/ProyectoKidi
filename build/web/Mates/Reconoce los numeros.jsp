<%-- 
    Document   : Reconoce los números
    Created on : 3 nov. 2024, 16:26:28
    Author     : P500
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Conociendo los Números</title>
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
        .number-card {
            padding: 15px;
            border: 2px solid var(--primary-color);
            border-radius: 10px;
            margin: 10px;
            text-align: center;
        }
        .number-example {
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
        <h1 class="header">¡Bienvenidos a la Lección de Matemáticas!</h1>
        <h3 class="greeting">Explorando el Mundo de los Números</h3>
        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button> </a>

    </header>

    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué son los Números?</h3>
            <p>Los números son símbolos que usamos para contar, ordenar y medir cosas. Desde muy pequeños, los usamos todos los días, pero... ¿sabes cuántos números existen y cómo se organizan?</p>
            <h4>Los Números Naturales</h4>
            <p>Imagina que tienes muchas canicas y quieres contarlas. Empezamos con el número <strong>1</strong>, luego <strong>2</strong>, <strong>3</strong>, y así sucesivamente. Estos números que usamos para contar cosas como canicas, personas o juguetes son llamados <strong>números naturales</strong>.</p>
            
            <h4>Números en Nuestro Día a Día</h4>
            <p>Los números están por todas partes: en los relojes para decir la hora, en los precios de las tiendas, en las páginas de los libros... ¡y en mucho más!</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>Ordenando Números</h3>
            <p>Es importante entender cómo se relacionan los números entre sí. Por ejemplo, si tienes <strong>3</strong> caramelos y luego tienes <strong>5</strong>, sabemos que <strong>5</strong> es mayor que <strong>3</strong>. Veamos algunos ejemplos:</p>
            <div class="d-flex justify-content-around">
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

        <section class="card p-4 mb-4">
            <h3>La Línea Numérica</h3>
            <p>Para ver el orden de los números, podemos usar una <strong>línea numérica</strong>. Cada número tiene un lugar en esta línea, y podemos ver cuál número viene antes y cuál después.</p>
            <div class="text-center">
                <img src="../Imagenes/Linea numerica.png" alt="Línea Numérica" class="img-fluid" style="max-width: 500px;">
            </div>
            <p>Por ejemplo, en la línea, el número <strong>2</strong> está antes que el número <strong>3</strong>, y el número <strong>5</strong> está después del número <strong>4</strong>.</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>¡Practica Tú Mismo!</h3>
            <p>Aquí tienes algunos ejercicios para practicar el orden de los números. ¿Puedes decir cuál número es mayor?</p>
            <ul>
                <li>¿Es <strong>8</strong> mayor que <strong>6</strong>? <span class="answer">¡Sí, 8 es mayor!</span></li>
                <li>¿Es <strong>3</strong> menor que <strong>9</strong>? <span class="answer">¡Sí, 3 es menor!</span></li>
                <li>¿Es <strong>7</strong> igual a <strong>7</strong>? <span class="answer">¡Sí, son iguales!</span></li>
            </ul>
        </section>
    </main>

    <footer class="text-center mt-5">
        <p>¡Diviértete explorando los números!</p>
    </footer>
</body>
</html>
