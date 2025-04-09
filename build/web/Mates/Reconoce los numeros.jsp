<%-- 
    Document   : Reconoce los n�meros
    Created on : 3 nov. 2024, 16:26:28
    Author     : P500
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lecci�n de Matem�ticas: Conociendo los N�meros</title>
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
        <h1 class="header">�Bienvenidos a la Lecci�n de Matem�ticas!</h1>
        <h3 class="greeting">Explorando el Mundo de los N�meros</h3>
        <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button> </a>

    </header>

    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>�Qu� son los N�meros?</h3>
            <p>Los n�meros son s�mbolos que usamos para contar, ordenar y medir cosas. Desde muy peque�os, los usamos todos los d�as, pero... �sabes cu�ntos n�meros existen y c�mo se organizan?</p>
            <h4>Los N�meros Naturales</h4>
            <p>Imagina que tienes muchas canicas y quieres contarlas. Empezamos con el n�mero <strong>1</strong>, luego <strong>2</strong>, <strong>3</strong>, y as� sucesivamente. Estos n�meros que usamos para contar cosas como canicas, personas o juguetes son llamados <strong>n�meros naturales</strong>.</p>
            
            <h4>N�meros en Nuestro D�a a D�a</h4>
            <p>Los n�meros est�n por todas partes: en los relojes para decir la hora, en los precios de las tiendas, en las p�ginas de los libros... �y en mucho m�s!</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>Ordenando N�meros</h3>
            <p>Es importante entender c�mo se relacionan los n�meros entre s�. Por ejemplo, si tienes <strong>3</strong> caramelos y luego tienes <strong>5</strong>, sabemos que <strong>5</strong> es mayor que <strong>3</strong>. Veamos algunos ejemplos:</p>
            <div class="d-flex justify-content-around">
                <div class="number-card">
                    <p class="number-example">3 < 5</p>
                    <p>El n�mero 3 es menor que el n�mero 5.</p>
                </div>
                <div class="number-card">
                    <p class="number-example">7 > 4</p>
                    <p>El n�mero 7 es mayor que el n�mero 4.</p>
                </div>
                <div class="number-card">
                    <p class="number-example">6 = 6</p>
                    <p>El n�mero 6 es igual a 6.</p>
                </div>
            </div>
        </section>

        <section class="card p-4 mb-4">
            <h3>La L�nea Num�rica</h3>
            <p>Para ver el orden de los n�meros, podemos usar una <strong>l�nea num�rica</strong>. Cada n�mero tiene un lugar en esta l�nea, y podemos ver cu�l n�mero viene antes y cu�l despu�s.</p>
            <div class="text-center">
                <img src="../Imagenes/Linea numerica.png" alt="L�nea Num�rica" class="img-fluid" style="max-width: 500px;">
            </div>
            <p>Por ejemplo, en la l�nea, el n�mero <strong>2</strong> est� antes que el n�mero <strong>3</strong>, y el n�mero <strong>5</strong> est� despu�s del n�mero <strong>4</strong>.</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>�Practica T� Mismo!</h3>
            <p>Aqu� tienes algunos ejercicios para practicar el orden de los n�meros. �Puedes decir cu�l n�mero es mayor?</p>
            <ul>
                <li>�Es <strong>8</strong> mayor que <strong>6</strong>? <span class="answer">�S�, 8 es mayor!</span></li>
                <li>�Es <strong>3</strong> menor que <strong>9</strong>? <span class="answer">�S�, 3 es menor!</span></li>
                <li>�Es <strong>7</strong> igual a <strong>7</strong>? <span class="answer">�S�, son iguales!</span></li>
            </ul>
        </section>
    </main>

    <footer class="text-center mt-5">
        <p>�Divi�rtete explorando los n�meros!</p>
    </footer>
</body>
</html>
