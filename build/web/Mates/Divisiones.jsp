<%-- 
    Document   : Divisiones
    Created on : 3 nov. 2024, 16:26:48
    Author     : P500
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: División</title>
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
        <h1 class="header">¡Bienvenidos a la Lección de División!</h1>
                                <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button> </a>

    </header>

    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué es la División?</h3>
            <p>La división es el proceso de repartir o dividir un grupo en partes iguales. Si tienes 12 caramelos y quieres repartirlos entre 4 amigos, divides 12 entre 4 para saber cuántos caramelos le tocan a cada uno.</p>
            
            <h4>Ejemplo:</h4>
            <p class="example text-center">12 ÷ 4 = 3</p>
            <p>Si tenemos 12 caramelos y los repartimos en 4 grupos, cada grupo recibe 3 caramelos.</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>División como Inversa de la Multiplicación</h3>
            <p>La división es lo contrario de la multiplicación. Si sabes que <strong>4 x 3 = 12</strong>, entonces también puedes decir que <strong>12 ÷ 4 = 3</strong> o <strong>12 ÷ 3 = 4</strong>. Así, la multiplicación y la división están relacionadas.</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>¡Practica Dividiendo!</h3>
            <p>Resuelve estas divisiones:</p>
            <ul>
                <li>10 ÷ 2 = <span class="answer">5</span></li>
                <li>16 ÷ 4 = <span class="answer">4</span></li>
                <li>18 ÷ 3 = <span class="answer">6</span></li>
            </ul>
        </section>
    </main>

    <footer class="text-center mt-5">
        <p>¡Sigue practicando tus divisiones!</p>
    </footer>
</body>
</html>
