<%-- 
    Document   : JuegoMate1
    Created on : 28 mar. 2025, 08:05:22
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Juego Adivina el Número</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 

    <style>

        /* Estilos de la barra de navegación */
        .flex-shrink-0 {
            width: 200px;
            background-color: #E5F0FA;
            height: 100vh;
            padding-top: 20px;
            color: #555;
            font-family: Arial, sans-serif;
        }

        /* Título y logo */
        .flex-shrink-0 a {
            color: #3B7DDD;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .flex-shrink-0 .logo {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin: 20px auto;
            display: block;
        }

        /* Estilos de los botones y enlaces */
        .btn-toggle {
            color: #3B7DDD;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            padding: 8px 20px;
            display: block;
            text-align: left;
            width: 100%;
            border-radius: 5px;
            transition: background-color 0.2s, color 0.2s;
        }

        .btn-toggle:hover,
        .btn-toggle:focus {
            background-color: #C4E3FE;
            color: #3B7DDD;
        }

        /* Para mantener el mismo tamaño de fuente al seleccionarlo */
        .btn-toggle:focus {
            outline: none;
        }

        /* Estilos de los enlaces dentro de las secciones colapsables */
        .btn-toggle-nav a {
            color: #555;
            font-size: 16px;
            padding-left: 40px;
            display: block;
            transition: color 0.2s;
            text-decoration: none;
        }

        .btn-toggle-nav a:hover,
        .btn-toggle-nav a:focus {
            color: #3B7DDD;
            text-decoration: none;
        }

        /* Línea divisoria */
        .border-top {
            border-color: #C4E3FE !important;
        }

        /* Pie de la barra de navegación */
        .footer-text {
            font-size: 12px;
            text-align: center;
            color: #777;
            margin-top: 10px;
        }

        .flex-shrink-0 {
            width: 200px;
            background-color: #E5F0FA;
            height: 100vh;
            padding-top: 20px;
            color: #555;
            font-family: Arial, sans-serif;
            position: fixed; /* Fija la barra a la izquierda */
            top: 0; /* Alinea la barra con la parte superior */
            left: 0; /* Alinea la barra con el borde izquierdo */
        }

        body {
            margin-left: 15px; /* Deja espacio para la barra de navegación fija */
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            text-align: center;
            margin: 0;
            padding: 0;
            padding-top: 60px; /* Asegura que el contenido no quede debajo de la barra */
        }
        h1 {
            color: #333;
        }
        .game-container {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            background-color: #e0f7fa;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .input-box {
            margin: 20px 0;
        }
        input[type="number"] {
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100px;
        }
        button {
            padding: 10px 20px;
            font-size: 1em;
            color: #fff;
            background-color: #00796b;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #004d40;
        }
        .message {
            font-size: 1.2em;
            margin-top: 20px;
            color: #00796b;
        }

        /* Estilos para la barra de navegación */
        .flex-shrink-0 {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            background-color: #E5F0FA;
            height: 100vh;
            padding-top: 20px;
            color: #555;
            font-family: Arial, sans-serif;
            z-index: 1000;
        }

        .container {
            margin-left: 250px; /* Deja espacio a la izquierda para la barra */
            padding: 20px;
        }

        .footer-text {
            font-size: 12px;
            text-align: center;
            color: #777;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <jsp:include page="../Sistema/BarraNavegacion.jsp" />


    <h1>Juego: Adivina el Número</h1>
    <div class="game-container">
        <p>Intenta adivinar el número entre 1 y 100</p>
        <div class="input-box">
            <input type="number" id="guessInput" placeholder="Tu número" min="1" max="100">
            <button onclick="checkGuess()">Adivinar</button>
        </div>
        <p id="message" class="message"></p>
    </div>

    <script>
        // Número secreto aleatorio entre 1 y 100
        const secretNumber = Math.floor(Math.random() * 100) + 1;
        let attempts = 0;

        function checkGuess() {
            const guess = parseInt(document.getElementById("guessInput").value);
            const message = document.getElementById("message");

            if (isNaN(guess) || guess < 1 || guess > 100) {
                message.textContent = "Por favor, ingresa un número entre 1 y 100.";
                return;
            }

            attempts++;

            if (guess === secretNumber) {
                message.textContent = `¡Felicidades! Adivinaste el número ${secretNumber} en ${attempts} intentos.`;
                message.style.color = "#4caf50";
            } else if (guess < secretNumber) {
                message.textContent = "El número es mayor. ¡Intenta de nuevo!";
                message.style.color = "#ff5722";
            } else {
                message.textContent = "El número es menor. ¡Intenta de nuevo!";
                message.style.color = "#ff5722";
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
