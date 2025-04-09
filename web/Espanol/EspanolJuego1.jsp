<%-- 
    Document   : EspanolJuego1
    Created on : 3 dic. 2024, 13:24:34
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Completa la Oración</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            padding-left: 180px;
        }
        h1 {
            color: #333;
        }
        .game-container {
            background-color: #e0f7fa;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 80%;
            max-width: 500px;
        }
        .question {
            font-size: 1.2em;
            margin-bottom: 15px;
        }
        .options {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        button {
            padding: 10px;
            font-size: 1em;
            color: #fff;
            background-color: #00796b;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #004d40;
        }
        .message {
            font-size: 1.2em;
            margin-top: 20px;
            color: #00796b;
        }
    </style>
</head>
<body>
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    

    <h1>Juego: Completa la Oración</h1>
    <a href="Espanol-JuegosPalabras.jsp"><button class="back-btn">&larr;</button> </a>
    <div class="game-container">
        <p id="question" class="question">Aquí aparecerá la oración</p>
        <div id="options" class="options"></div>
        <p id="message" class="message"></p>
        <button onclick="nextQuestion()">Siguiente</button>
    </div>

    <script>
        const questions = [
            {
                sentence: "El perro está muy ______.",
                options: ["alto", "feliz", "largo"],
                correct: "feliz"
            },
            {
                sentence: "La niña come una ______ roja.",
                options: ["mesa", "flor", "manzana"],
                correct: "manzana"
            },
            {
                sentence: "El cielo es de color ______.",
                options: ["azul", "grande", "pequeño"],
                correct: "azul"
            },
            {
                sentence: "El gato duerme en la ______.",
                options: ["cama", "pelota", "comida"],
                correct: "cama"
            }
        ];

        let currentQuestion = 0;

        function loadQuestion() {
            const questionElement = document.getElementById("question");
            const optionsContainer = document.getElementById("options");
            const messageElement = document.getElementById("message");
            
            // Limpia mensaje y opciones previas
            messageElement.textContent = '';
            optionsContainer.innerHTML = '';
            
            const question = questions[currentQuestion];
            questionElement.textContent = question.sentence;

            // Genera las opciones
            question.options.forEach(option => {
                const button = document.createElement("button");
                button.textContent = option;
                button.onclick = () => checkAnswer(option);
                optionsContainer.appendChild(button);
            });
        }

        function checkAnswer(selectedOption) {
            const messageElement = document.getElementById("message");
            const question = questions[currentQuestion];

            if (selectedOption === question.correct) {
                messageElement.textContent = "¡Correcto! 🎉";
                messageElement.style.color = "#4caf50";
            } else {
                messageElement.textContent = "Incorrecto, intenta de nuevo.";
                messageElement.style.color = "#f44336";
            }
        }

        function nextQuestion() {
            currentQuestion++;
            if (currentQuestion >= questions.length) {
                currentQuestion = 0;
                alert("¡Has completado todas las preguntas! Empezando de nuevo...");
            }
            loadQuestion();
        }

        // Carga la primera pregunta
        loadQuestion();
    </script>

</body>
</html>
