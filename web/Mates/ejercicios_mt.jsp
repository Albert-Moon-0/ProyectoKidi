<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Juego Adivina el Número</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&display=swap" rel="stylesheet">

        <style>
            :root {
                --primary-color: #FF6B6B;
                --secondary-color: #4ECDC4;
                --accent-color: #FFD166;
                --bg-color: #F7FFF7;
                --text-color: #2E3440;
                --correct-color: #6BFF74;
                --hint-color: #FFB347;
            }

            body {
                font-family: 'Comic Neue', cursive;
                background-color: var(--bg-color);
                background-image: url('/api/placeholder/300/300');
                background-size: 200px;
                background-repeat: space;
                text-align: center;
                margin: 0;
                padding: 0;
                padding-top: 20px;
                color: var(--text-color);
            }

            /* Estilos de la barra de navegación */
            .flex-shrink-0 {
                width: 200px;
                background-color: #E5F0FA;
                height: 100vh;
                padding-top: 20px;
                color: #555;
                font-family: 'Comic Neue', cursive;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
                border-right: 5px solid var(--accent-color);
                box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
            }

            .container {
                margin-left: 250px;
                padding: 20px;
            }

            h1 {
                color: var(--primary-color);
                font-size: 3.5rem;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
                margin-bottom: 20px;
                font-weight: bold;
                letter-spacing: 2px;
                animation: bounce 2s infinite;
            }

            @keyframes bounce {
                0%, 100% {
                    transform: translateY(0);
                }
                50% {
                    transform: translateY(-10px);
                }
            }

            .game-container {
                max-width: 550px;
                margin: 20px auto;
                padding: 30px;
                border-radius: 20px;
                background-color: white;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
                border: 5px solid var(--secondary-color);
                position: relative;
                overflow: hidden;
            }

            .game-container::before {
                content: "";
                position: absolute;
                top: -50px;
                left: -50px;
                width: 100px;
                height: 100px;
                background-color: var(--accent-color);
                border-radius: 50%;
                opacity: 0.5;
                z-index: 0;
            }

            .game-container::after {
                content: "";
                position: absolute;
                bottom: -50px;
                right: -50px;
                width: 100px;
                height: 100px;
                background-color: var(--primary-color);
                border-radius: 50%;
                opacity: 0.5;
                z-index: 0;
            }

            .game-instructions {
                font-size: 1.5rem;
                margin: 20px 0;
                color: var(--text-color);
                font-weight: bold;
                position: relative;
                z-index: 1;
            }

            .input-box {
                margin: 30px 0;
                position: relative;
                z-index: 1;
            }

            input[type="number"] {
                padding: 15px;
                font-size: 1.3rem;
                border: 3px solid var(--secondary-color);
                border-radius: 15px;
                width: 120px;
                text-align: center;
                background-color: rgba(255, 255, 255, 0.9);
                box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
                font-family: 'Comic Neue', cursive;
                font-weight: bold;
            }

            input[type="number"]:focus {
                outline: none;
                border-color: var(--primary-color);
                box-shadow: 0 0 10px rgba(255, 107, 107, 0.5);
                transform: scale(1.05);
            }

            .guess-btn {
                padding: 15px 25px;
                font-size: 1.3rem;
                color: #fff;
                background-color: var(--primary-color);
                border: none;
                border-radius: 15px;
                cursor: pointer;
                margin-left: 15px;
                transition: all 0.3s ease;
                font-family: 'Comic Neue', cursive;
                font-weight: bold;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .guess-btn:hover {
                background-color: #FF8787;
                transform: scale(1.05);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
            }

            .message {
                font-size: 1.4rem;
                margin-top: 25px;
                padding: 15px;
                border-radius: 15px;
                font-weight: bold;
                transition: all 0.5s ease;
                animation: fadeIn 0.5s;
                position: relative;
                z-index: 1;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .back-btn {
                font-size: 2.5rem;
                color: var(--text-color);
                background: none;
                border: 3px solid var(--secondary-color);
                border-radius: 50%;
                width: 60px;
                height: 60px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 20px;
                transition: all 0.3s ease;
                position: relative;
                z-index: 1;
            }

            .back-btn:hover {
                background-color: var(--secondary-color);
                color: white;
                transform: scale(1.1) rotate(-10deg);
            }

            .attempts-counter {
                font-size: 1.2rem;
                color: var(--text-color);
                margin-top: 20px;
                font-weight: bold;
            }

            .difficulty-selector {
                margin: 20px 0;
                position: relative;
                z-index: 1;
            }

            .difficulty-btn {
                padding: 10px 15px;
                margin: 0 5px;
                font-size: 1rem;
                border-radius: 10px;
                border: none;
                cursor: pointer;
                font-family: 'Comic Neue', cursive;
                font-weight: bold;
                transition: all 0.3s ease;
            }

            .easy-btn {
                background-color: #A8E6CF;
                color: #2E3440;
            }

            .medium-btn {
                background-color: #FFD3B6;
                color: #2E3440;
            }

            .hard-btn {
                background-color: #FFAAA5;
                color: #2E3440;
            }

            .difficulty-btn:hover {
                transform: scale(1.1);
            }

            .active-difficulty {
                transform: scale(1.1);
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            .hint-container {
                margin-top: 20px;
                font-size: 1.2rem;
                color: var(--hint-color);
                font-weight: bold;
                position: relative;
                z-index: 1;
            }

            .progress-container {
                width: 80%;
                height: 25px;
                background-color: #e0e0e0;
                border-radius: 12px;
                margin: 20px auto;
                overflow: hidden;
                box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
                position: relative;
                z-index: 1;
            }

            .progress-bar {
                height: 100%;
                background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
                border-radius: 12px;
                transition: width 0.5s ease;
                position: relative;
            }

            .progress-label {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: white;
                font-weight: bold;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            }

            .confetti {
                position: fixed;
                width: 10px;
                height: 10px;
                background-color: var(--primary-color);
                border-radius: 50%;
                animation: fall 5s ease-in infinite;
                z-index: 9999;
            }

            @keyframes fall {
                to {
                    transform: translateY(100vh) rotate(360deg);
                    opacity: 0;
                }
            }

            .mascot {
                position: fixed;
                bottom: 20px;
                right: 20px;
                width: 150px;
                height: 150px;
                background-image: url('/api/placeholder/150/150');
                background-size: contain;
                background-repeat: no-repeat;
                z-index: 100;
                animation: float 3s ease-in-out infinite;
            }

            @keyframes float {
                0%, 100% {
                    transform: translateY(0);
                }
                50% {
                    transform: translateY(-20px);
                }
            }

            .mascot-speech {
                position: absolute;
                top: -80px;
                left: -120px;
                background-color: white;
                border-radius: 20px;
                padding: 15px;
                max-width: 200px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                opacity: 0;
                transition: opacity 0.5s ease;
                font-size: 1rem;
                font-weight: bold;
            }

            .mascot-speech::after {
                content: "";
                position: absolute;
                bottom: -10px;
                right: 30px;
                border-width: 10px 10px 0;
                border-style: solid;
                border-color: white transparent;
            }

            .show-speech {
                opacity: 1;
            }

            .reset-btn {
                padding: 10px 20px;
                font-size: 1.1rem;
                color: white;
                background-color: var(--secondary-color);
                border: none;
                border-radius: 10px;
                cursor: pointer;
                margin-top: 15px;
                transition: all 0.3s ease;
                font-family: 'Comic Neue', cursive;
                font-weight: bold;
                display: none;
            }

            .reset-btn:hover {
                background-color: #3DBDAA;
                transform: scale(1.05);
            }

            .success-message {
                background-color: #6BFF74;
                color: white;
                padding: 15px;
            }
        </style>
    </head>
    <body>
        <h1>¡Adivina el Número Mágico!</h1>
        <button class="back-btn" onclick="window.history.back()">&larr;</button>

        <div class="game-container">
            <p class="game-instructions">¡Intenta adivinar el número mágico! ¿Cuál será?</p>
            
            <div class="difficulty-selector">
                <button onclick="setDifficulty('easy')" class="difficulty-btn easy-btn active-difficulty">Fácil (1-20)</button>
                <button onclick="setDifficulty('medium')" class="difficulty-btn medium-btn">Medio (1-50)</button>
                <button onclick="setDifficulty('hard')" class="difficulty-btn hard-btn">Difícil (1-100)</button>
            </div>
            
            <div class="progress-container">
                <div class="progress-bar" id="progressBar" style="width: 0%;">
                    <span class="progress-label" id="progressLabel">0%</span>
                </div>
            </div>
            
            <div class="input-box">
                <input type="number" id="guessInput" placeholder="?" min="1" max="100">
                <button onclick="checkGuess()" class="guess-btn">¡Adivinar!</button>
            </div>
            
            <p id="message" class="message"></p>
            <p id="attempts" class="attempts-counter">Intentos: 0</p>
            <div id="hint" class="hint-container"></div>
            
            <button onclick="resetGame()" id="resetBtn" class="reset-btn">¡Jugar de nuevo!</button>
        </div>

        <div class="mascot">
            <div class="mascot-speech" id="mascotSpeech">¡Hola! ¿Puedes adivinar mi número?</div>
        </div>

        <script>
            let secretNumber;
            let maxNumber = 20; // Valor predeterminado para dificultad fácil
            let minNumber = 1;
            let attempts = 0;
            let gameOver = false;
            let difficultyLevel = 'easy';
            
            // Inicializar el juego al cargar la página
            window.onload = function() {
                initGame();
                showMascotMessage("¡Hola! ¿Puedes adivinar mi número secreto entre 1 y 20?", 5000);
            };
            
            function initGame() {
                // Generar número secreto
                secretNumber = Math.floor(Math.random() * maxNumber) + minNumber;
                attempts = 0;
                gameOver = false;
                
                // Actualizar interfaz
                document.getElementById("guessInput").value = "";
                document.getElementById("guessInput").max = maxNumber;
                document.getElementById("message").textContent = "";
                document.getElementById("message").style.backgroundColor = "transparent";
                document.getElementById("attempts").textContent = "Intentos: 0";
                document.getElementById("hint").textContent = "";
                document.getElementById("resetBtn").style.display = "none";
                document.getElementById("progressBar").style.width = "0%";
                document.getElementById("progressLabel").textContent = "0%";
                
                // Habilitar input y botón
                document.getElementById("guessInput").disabled = false;
                document.querySelector(".guess-btn").disabled = false;
                
                // Actualizar instrucciones según dificultad
                document.querySelector(".game-instructions").textContent = 
                    `¡Intenta adivinar el número mágico entre ${minNumber} y ${maxNumber}!`;
                
                console.log("Número secreto generado:", secretNumber); // Para depuración
            }
            
            function setDifficulty(level) {
                difficultyLevel = level;
                
                // Eliminar clase activa de todos los botones
                document.querySelectorAll('.difficulty-btn').forEach(btn => {
                    btn.classList.remove('active-difficulty');
                });
                
                // Añadir clase activa al botón seleccionado
                document.querySelector(`.${level}-btn`).classList.add('active-difficulty');
                
                // Establecer rango según dificultad
                switch(level) {
                    case 'easy':
                        maxNumber = 20;
                        break;
                    case 'medium':
                        maxNumber = 50;
                        break;
                    case 'hard':
                        maxNumber = 100;
                        break;
                }
                
                // Reiniciar juego con nueva dificultad
                initGame();
                showMascotMessage(`¡Dificultad cambiada! Ahora adivina entre ${minNumber} y ${maxNumber}`, 3000);
            }
            
            function checkGuess() {
                if (gameOver) return;
                
                const guessInput = document.getElementById("guessInput");
                const guess = parseInt(guessInput.value);
                const message = document.getElementById("message");
                const attemptsDisplay = document.getElementById("attempts");
                const hintDisplay = document.getElementById("hint");
                
                if (isNaN(guess) || guess < minNumber || guess > maxNumber) {
                    message.textContent = `Por favor, ingresa un número entre ${minNumber} y ${maxNumber}.`;
                    message.style.color = "#ff5722";
                    message.style.backgroundColor = "#FFEEEE";
                    showMascotMessage(`¡Ups! Debes elegir un número entre ${minNumber} y ${maxNumber}`, 3000);
                    return;
                }
                
                attempts++;
                attemptsDisplay.textContent = `Intentos: ${attempts}`;
                
                // Actualizar barra de progreso - más cerca = más progreso
                const distance = Math.abs(guess - secretNumber);
                const maxDistance = maxNumber - minNumber;
                const progress = 100 - (distance / maxDistance * 100);
                document.getElementById("progressBar").style.width = `${progress}%`;
                document.getElementById("progressLabel").textContent = `${Math.round(progress)}%`;
                
                if (guess === secretNumber) {
                    message.textContent = `¡FELICIDADES! ¡Has adivinado el número ${secretNumber} en ${attempts} intentos!`;
                    message.style.color = "white";
                    message.classList.add("success-message");
                    hintDisplay.textContent = "";
                    gameOver = true;
                    
                    // Mostrar botón de reinicio
                    document.getElementById("resetBtn").style.display = "inline-block";
                    
                    // Desactivar input y botón
                    document.getElementById("guessInput").disabled = true;
                    document.querySelector(".guess-btn").disabled = true;
                    
                    // Celebración
                    createConfetti();
                    showMascotMessage("¡WOW! ¡Lo lograste! ¡Eres increíble!", 0);
                    
                } else if (guess < secretNumber) {
                    message.textContent = "¡El número es MAYOR! ¡Sigue intentando!";
                    message.style.color = "#ff5722";
                    message.style.backgroundColor = "#FFF0E6";
                    
                    // Dar pista
                    const difference = secretNumber - guess;
                    let hint = "";
                    
                    if (difference > maxNumber / 2) {
                        hint = "¡Estás muy lejos! Prueba con un número mucho mayor.";
                        showMascotMessage("¡Ups! Necesitas un número MUCHO más grande", 3000);
                    } else if (difference > maxNumber / 4) {
                        hint = "Estás algo lejos. Prueba con un número bastante mayor.";
                        showMascotMessage("¡Necesitas un número más grande!", 3000);
                    } else {
                        hint = "¡Estás cerca! Prueba con un número un poco mayor.";
                        showMascotMessage("¡Casi! Un poquito más grande", 3000);
                    }
                    
                    hintDisplay.textContent = hint;
                    
                } else {
                    message.textContent = "¡El número es MENOR! ¡Sigue intentando!";
                    message.style.color = "#ff5722";
                    message.style.backgroundColor = "#FFF0E6";
                    
                    // Dar pista
                    const difference = guess - secretNumber;
                    let hint = "";
                    
                    if (difference > maxNumber / 2) {
                        hint = "¡Estás muy lejos! Prueba con un número mucho menor.";
                        showMascotMessage("¡Ups! Necesitas un número MUCHO más pequeño", 3000);
                    } else if (difference > maxNumber / 4) {
                        hint = "Estás algo lejos. Prueba con un número bastante menor.";
                        showMascotMessage("¡Necesitas un número más pequeño!", 3000);
                    } else {
                        hint = "¡Estás cerca! Prueba con un número un poco menor.";
                        showMascotMessage("¡Casi! Un poquito más pequeño", 3000);
                    }
                    
                    hintDisplay.textContent = hint;
                }
                
                // Limpiar el campo de entrada
                guessInput.value = "";
                guessInput.focus();
            }
            
            function resetGame() {
                message.classList.remove("success-message");
                initGame();
                showMascotMessage("¡Juego reiniciado! ¿Podrás adivinar mi nuevo número secreto?", 3000);
            }
            
            function createConfetti() {
                const colors = ['#FF6B6B', '#4ECDC4', '#FFD166', '#FF8C42', '#6BFF74'];
                
                for (let i = 0; i < 100; i++) {
                    const confetti = document.createElement('div');
                    confetti.className = 'confetti';
                    confetti.style.left = Math.random() * 100 + 'vw';
                    confetti.style.animationDuration = (Math.random() * 3 + 2) + 's';
                    confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                    
                    document.body.appendChild(confetti);
                    
                    // Eliminar el confeti después de la animación
                    setTimeout(() => {
                        confetti.remove();
                    }, 5000);
                }
            }
            
            function showMascotMessage(message, duration) {
                const mascotSpeech = document.getElementById("mascotSpeech");
                mascotSpeech.textContent = message;
                mascotSpeech.classList.add("show-speech");
                
                if (duration > 0) {
                    setTimeout(() => {
                        mascotSpeech.classList.remove("show-speech");
                    }, duration);
                }
            }
            
            // Permite usar la tecla Enter para adivinar
            document.getElementById("guessInput").addEventListener("keyup", function(event) {
                if (event.key === "Enter") {
                    checkGuess();
                }
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>