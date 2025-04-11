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
    <title>¡Completa la Oración!</title>
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(135deg, #c2e9fb 0%, #a1c4fd 100%);
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }
        
        /* Burbujas flotantes de fondo */
        .bubble {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.3);
            animation: float 30s infinite ease-in-out;
            z-index: 1;
        }
        
        .bubble:nth-child(1) {
            width: 80px;
            height: 80px;
            left: 10%;
            top: 20%;
        }
        
        .bubble:nth-child(2) {
            width: 50px;
            height: 50px;
            left: 20%;
            top: 60%;
            animation-delay: 5s;
        }
        
        .bubble:nth-child(3) {
            width: 70px;
            height: 70px;
            right: 15%;
            top: 30%;
            animation-delay: 2s;
        }
        
        .bubble:nth-child(4) {
            width: 60px;
            height: 60px;
            right: 25%;
            bottom: 20%;
            animation-delay: 7s;
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(10deg);
            }
        }
        
        .content-wrap {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 40px 20px;
            position: relative;
            z-index: 10;
        }
        
        h1 {
            font-family: 'Comic Neue', cursive;
            color: #ff6b6b;
            font-size: 2.8rem;
            text-align: center;
            margin: 30px 0 20px;
            text-shadow: 3px 3px 0 rgba(255, 107, 107, 0.2);
            position: relative;
            display: inline-block;
        }
        
        h1::before {
            content: "✏️";
            position: absolute;
            left: -50px;
            top: 0;
        }
        
        h1::after {
            content: "📚";
            position: absolute;
            right: -50px;
            top: 0;
        }
        
        .game-container {
            background-color: #ffffff;
            border-radius: 25px;
            padding: 30px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1), 
                        0 0 0 15px rgba(255, 255, 255, 0.2);
            text-align: center;
            width: 90%;
            max-width: 600px;
            position: relative;
            overflow: hidden;
            margin-top: 20px;
            border: 5px solid #fff;
        }
        
        .game-container::before {
            content: "";
            position: absolute;
            width: 200%;
            height: 10px;
            background: linear-gradient(90deg, #ff9a9e, #fad0c4, #fad0c4, #ffecd2, #fcb69f, #ff9a9e);
            top: 0;
            left: -50%;
            animation: rainbow 4s linear infinite;
        }
        
        @keyframes rainbow {
            0% { transform: translateX(0); }
            100% { transform: translateX(50%); }
        }
        
        .game-header {
            margin-bottom: 20px;
            position: relative;
        }
        
        .stars {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }
        
        .star {
            color: #ffd166;
            font-size: 1.5rem;
            margin: 0 5px;
            animation: twinkle 1.5s infinite alternate;
        }
        
        .star:nth-child(2) { animation-delay: 0.3s; }
        .star:nth-child(3) { animation-delay: 0.6s; }
        .star:nth-child(4) { animation-delay: 0.9s; }
        .star:nth-child(5) { animation-delay: 1.2s; }
        
        @keyframes twinkle {
            0% { transform: scale(1); opacity: 0.7; }
            100% { transform: scale(1.2); opacity: 1; }
        }
        
        .question {
            font-size: 1.5em;
            margin-bottom: 25px;
            color: #444;
            font-weight: 600;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 15px;
            box-shadow: inset 0 0 8px rgba(0,0,0,0.05);
            position: relative;
        }
        
        .question::after {
            content: "";
            width: 100%;
            height: 5px;
            background: repeating-linear-gradient(90deg, #ddd, #ddd 5px, transparent 5px, transparent 10px);
            position: absolute;
            bottom: -5px;
            left: 0;
        }
        
        .options {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .option-btn {
            padding: 12px 15px;
            font-size: 1.2em;
            color: #fff;
            background-color: #74b9ff;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-family: 'Nunito', sans-serif;
            font-weight: 600;
            position: relative;
            overflow: hidden;
            box-shadow: 0 5px 0 #5a91c4;
        }
        
        .option-btn:hover {
            background-color: #0984e3;
            transform: translateY(-3px);
            box-shadow: 0 8px 0 #5a91c4;
        }
        
        .option-btn:active {
            transform: translateY(2px);
            box-shadow: 0 3px 0 #5a91c4;
        }
        
        .option-btn::after {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1);
            animation: ripple 1.5s infinite;
        }
        
        @keyframes ripple {
            0% {
                transform: scale(0);
                opacity: 1;
            }
            100% {
                transform: scale(20);
                opacity: 0;
            }
        }
        
        .message {
            font-size: 1.4em;
            margin: 20px 0;
            font-weight: bold;
            min-height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .message-correct {
            color: #27ae60;
            animation: popIn 0.5s forwards;
        }
        
        .message-incorrect {
            color: #e74c3c;
            animation: shake 0.5s forwards;
        }
        
        @keyframes popIn {
            0% { transform: scale(0); }
            70% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }
        
        .next-btn {
            padding: 12px 25px;
            font-size: 1.2em;
            color: #fff;
            background-color: #ff7675;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            font-family: 'Nunito', sans-serif;
            font-weight: 700;
            box-shadow: 0 5px 0 #e06867;
            position: relative;
            overflow: hidden;
        }
        
        .next-btn:hover {
            background-color: #e74c3c;
            transform: translateY(-3px);
            box-shadow: 0 8px 0 #c0392b;
        }
        
        .next-btn:active {
            transform: translateY(2px);
            box-shadow: 0 3px 0 #c0392b;
        }
        
        .back-btn {
            font-size: 2.5rem;
            color: #ff7675;
            background: #fff;
            border: none;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            position: absolute;
            left: 20px;
            top: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            z-index: 100;
        }
        
        .back-btn:hover {
            transform: scale(1.1) translateX(-5px);
            background-color: #ff7675;
            color: #fff;
        }
        
        .progress-container {
            width: 80%;
            margin: 20px auto;
            background-color: #f0f0f0;
            border-radius: 20px;
            height: 20px;
            overflow: hidden;
            position: relative;
        }
        
        .progress-bar {
            height: 100%;
            width: 0;
            background: linear-gradient(to right, #74b9ff, #0984e3);
            transition: width 0.5s ease;
            position: relative;
        }
        
        .progress-bar::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent 25%, rgba(255, 255, 255, 0.2) 25%, 
                rgba(255, 255, 255, 0.2) 50%, transparent 50%, transparent 75%, 
                rgba(255, 255, 255, 0.2) 75%, rgba(255, 255, 255, 0.2));
            background-size: 20px 20px;
            animation: moveStripes 1s linear infinite;
        }
        
        @keyframes moveStripes {
            0% { background-position: 0 0; }
            100% { background-position: 20px 0; }
        }
        
        .confetti {
            position: fixed;
            width: 10px;
            height: 10px;
            background-color: #f44336;
            opacity: 0;
            z-index: 1000;
            animation: confetti-fall 3s ease-in-out;
        }
        
        @keyframes confetti-fall {
            0% {
                opacity: 1;
                transform: translateY(-100vh) rotate(0deg);
            }
            100% {
                opacity: 0;
                transform: translateY(100vh) rotate(720deg);
            }
        }
        
        .score-display {
            background-color: #ffeaa7;
            border-radius: 50%;
            width: 70px;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: bold;
            color: #e17055;
            position: absolute;
            right: 20px;
            top: 20px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            border: 4px solid #fdcb6e;
        }
        
        /* Responsive styles */
        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }
            
            h1::before, h1::after {
                display: none;
            }
            
            .game-container {
                padding: 20px;
            }
            
            .question {
                font-size: 1.3em;
            }
            
            .option-btn, .next-btn {
                font-size: 1em;
            }
            
            .back-btn {
                width: 50px;
                height: 50px;
                font-size: 2rem;
                top: 10px;
                left: 10px;
            }
            
            .score-display {
                width: 60px;
                height: 60px;
                font-size: 1.2rem;
                top: 10px;
                right: 10px;
            }
        }
        
        /* Animations for character */
        .character {
            position: absolute;
            bottom: 20px;
            right: 20px;
            width: 100px;
            height: 100px;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="45" fill="%23FFCC80"/><circle cx="35" cy="40" r="5" fill="%23795548"/><circle cx="65" cy="40" r="5" fill="%23795548"/><path d="M35,60 Q50,70 65,60" stroke="%23795548" stroke-width="3" fill="none"/></svg>');
            background-size: contain;
            background-repeat: no-repeat;
            animation: bounce 3s infinite ease-in-out;
            z-index: 1;
        }
        
        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-20px);
            }
        }
    </style>
</head>
<body>
    <!-- Burbujas decorativas -->
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <div class="content-wrap">
        <h1>¡Completa la Oración!</h1>
        
        <a href="Espanol-JuegosPalabras.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i>
        </a>
        
        <div class="game-container">
            <div class="score-display">0</div>
            
            <div class="game-header">
                <div class="stars">
                    <div class="star"><i class="fas fa-star"></i></div>
                    <div class="star"><i class="fas fa-star"></i></div>
                    <div class="star"><i class="fas fa-star"></i></div>
                    <div class="star"><i class="fas fa-star"></i></div>
                    <div class="star"><i class="fas fa-star"></i></div>
                </div>
            </div>
            
            <div class="progress-container">
                <div class="progress-bar" id="progress-bar"></div>
            </div>
            
            <p id="question" class="question">Aquí aparecerá la oración</p>
            
            <div id="options" class="options"></div>
            
            <div id="message" class="message"></div>
            
            <button id="next-button" class="next-btn" onclick="nextQuestion()">Siguiente <i class="fas fa-arrow-right"></i></button>
            
            <div class="character"></div>
        </div>
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
        let score = 0;
        let hasAnsweredCurrentQuestion = false;

        function loadQuestion() {
            const questionElement = document.getElementById("question");
            const optionsContainer = document.getElementById("options");
            const messageElement = document.getElementById("message");
            const nextButton = document.getElementById("next-button");
            
            // Limpia mensaje y opciones previas
            messageElement.textContent = '';
            messageElement.className = 'message';
            optionsContainer.innerHTML = '';
            
            const question = questions[currentQuestion];
            questionElement.textContent = question.sentence;

            // Actualiza la barra de progreso
            const progressBar = document.getElementById("progress-bar");
            progressBar.style.width = `${(currentQuestion / questions.length) * 100}%`;
            
            // Genera las opciones
            question.options.forEach(option => {
                const button = document.createElement("button");
                button.textContent = option;
                button.className = "option-btn";
                button.onclick = () => checkAnswer(option, button);
                optionsContainer.appendChild(button);
            });
            
            // Reinicia el estado de la respuesta
            hasAnsweredCurrentQuestion = false;
            
            // Desactivar botón Siguiente hasta que respondan
            nextButton.style.opacity = "0.5";
            nextButton.style.cursor = "not-allowed";
        }

        function checkAnswer(selectedOption, button) {
            if (hasAnsweredCurrentQuestion) return;
            
            const messageElement = document.getElementById("message");
            const question = questions[currentQuestion];
            const nextButton = document.getElementById("next-button");
            
            // Marca que ya se respondió esta pregunta
            hasAnsweredCurrentQuestion = true;
            
            // Activar botón Siguiente
            nextButton.style.opacity = "1";
            nextButton.style.cursor = "pointer";

            if (selectedOption === question.correct) {
                // Respuesta correcta
                score++;
                document.querySelector('.score-display').textContent = score;
                
                messageElement.textContent = "¡Correcto! 🎉";
                messageElement.className = "message message-correct";
                button.style.backgroundColor = "#27ae60";
                
                // Añadir confeti
                createConfetti();
                
                // Animar personaje de celebración
                document.querySelector('.character').style.animation = 'bounce 0.5s 3';
                setTimeout(() => {
                    document.querySelector('.character').style.animation = 'bounce 3s infinite ease-in-out';
                }, 1500);
                
            } else {
                // Respuesta incorrecta
                messageElement.textContent = "¡Ups! Intenta de nuevo.";
                messageElement.className = "message message-incorrect";
                button.style.backgroundColor = "#e74c3c";
                
                // Encuentra y resalta la respuesta correcta
                const buttons = document.querySelectorAll('.option-btn');
                buttons.forEach(btn => {
                    if (btn.textContent === question.correct) {
                        btn.style.backgroundColor = "#27ae60";
                    }
                });
            }
            
            // Deshabilitar todos los botones de opciones
            const buttons = document.querySelectorAll('.option-btn');
            buttons.forEach(btn => {
                if (btn !== button && btn.textContent !== question.correct) {
                    btn.style.opacity = "0.5";
                }
                btn.style.cursor = "default";
            });
        }

        function nextQuestion() {
            if (!hasAnsweredCurrentQuestion) return;
            
            currentQuestion++;
            if (currentQuestion >= questions.length) {
                currentQuestion = 0;
                
                // Mostrar un mensaje de finalización más elaborado
                const gameContainer = document.querySelector('.game-container');
                gameContainer.innerHTML = `
                    <h2 style="color: #ff7675; margin-bottom: 20px;">¡Felicidades! Has completado todas las preguntas</h2>
                    <p style="font-size: 1.2em; margin-bottom: 15px;">Tu puntuación final es: <span style="font-weight: bold; color: #e17055;">${score}/${questions.length}</span></p>
                    <div style="font-size: 3em; margin: 20px 0;">🏆</div>
                    <button class="next-btn" onclick="resetGame()">Jugar de nuevo</button>
                `;
                
                // Mostrar muchos confetis para la celebración final
                for (let i = 0; i < 50; i++) {
                    setTimeout(() => {
                        createConfetti();
                    }, i * 100);
                }
                
                return;
            }
            
            loadQuestion();
        }
        
        function resetGame() {
            score = 0;
            currentQuestion = 0;
            document.querySelector('.score-display').textContent = "0";
            loadQuestion();
        }
        
        function createConfetti() {
            const colors = ['#f44336', '#e91e63', '#9c27b0', '#673ab7', '#3f51b5', '#2196f3', '#03a9f4', '#00bcd4', '#009688', '#4caf50', '#8bc34a', '#cddc39', '#ffeb3b', '#ffc107', '#ff9800', '#ff5722'];
            
            for (let i = 0; i < 20; i++) {
                const confetti = document.createElement('div');
                confetti.className = 'confetti';
                confetti.style.left = Math.random() * 100 + 'vw';
                confetti.style.width = Math.random() * 10 + 5 + 'px';
                confetti.style.height = Math.random() * 10 + 5 + 'px';
                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                confetti.style.transform = 'rotate(' + Math.random() * 360 + 'deg)';
                
                document.body.appendChild(confetti);
                
                setTimeout(() => {
                    document.body.removeChild(confetti);
                }, 3000);
            }
        }

        // Carga la primera pregunta
        loadQuestion();
        
        // Animación de entrada inicial
        document.addEventListener('DOMContentLoaded', function() {
            const gameContainer = document.querySelector('.game-container');
            gameContainer.style.opacity = "0";
            gameContainer.style.transform = "translateY(50px)";
            
            setTimeout(() => {
                gameContainer.style.transition = "all 0.8s ease";
                gameContainer.style.opacity = "1";
                gameContainer.style.transform = "translateY(0)";
            }, 300);
        });
    </script>
</body>
</html>