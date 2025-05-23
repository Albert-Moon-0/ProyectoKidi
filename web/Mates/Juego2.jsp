<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Operaciones Matem�ticas R�pidas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;600&display=swap" rel="stylesheet">

        <style>
            :root {
                --primary-color: #6A5ACD;
                --secondary-color: #32CD32;
                --accent-color: #FF69B4;
                --bg-color: #F0F8FF;
                --text-color: #333333;
                --correct-color: #00C853;
                --wrong-color: #FF3D00;
                --time-color: #FFD600;
            }

            body {
                font-family: 'Fredoka', sans-serif;
                background-color: var(--bg-color);
                background-image: radial-gradient(#8EC5FC 2px, transparent 2px), radial-gradient(#8EC5FC 2px, transparent 2px);
                background-size: 40px 40px;
                background-position: 0 0, 20px 20px;
                text-align: center;
                margin: 0;
                padding: 0;
                padding-top: 20px;
                color: var(--text-color);
            }

            h1 {
                color: var(--primary-color);
                font-size: 3rem;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                font-weight: 600;
                letter-spacing: 1px;
                animation: pop 1s ease-in-out;
            }

            @keyframes pop {
                0% {
                    transform: scale(0.5);
                    opacity: 0;
                }
                80% {
                    transform: scale(1.1);
                }
                100% {
                    transform: scale(1);
                    opacity: 1;
                }
            }

            .game-container {
                max-width: 650px;
                margin: 20px auto;
                padding: 30px;
                border-radius: 20px;
                background-color: white;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                border: 5px solid var(--accent-color);
                position: relative;
                transition: transform 0.3s ease;
            }

            .game-container:hover {
                transform: translateY(-5px);
            }

            .game-instructions {
                font-size: 1.2rem;
                margin: 20px 0;
                color: var(--text-color);
                line-height: 1.6;
            }

            .back-btn {
                font-size: 2rem;
                color: var(--text-color);
                background: none;
                border: 3px solid var(--secondary-color);
                border-radius: 50%;
                width: 50px;
                height: 50px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 20px;
                transition: all 0.3s ease;
            }

            .back-btn:hover {
                background-color: var(--secondary-color);
                color: white;
                transform: scale(1.1);
            }

            .operation-display {
                font-size: 3rem;
                font-weight: 600;
                margin: 25px 0;
                padding: 20px;
                background-color: rgba(106, 90, 205, 0.1);
                border-radius: 15px;
                display: inline-block;
                min-width: 300px;
                animation: fadeIn 0.5s;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            .answer-input {
                padding: 15px;
                font-size: 1.5rem;
                border: 3px solid var(--primary-color);
                border-radius: 15px;
                width: 120px;
                text-align: center;
                margin-right: 15px;
                transition: all 0.3s ease;
            }

            .answer-input:focus {
                outline: none;
                border-color: var(--accent-color);
                box-shadow: 0 0 10px rgba(255, 105, 180, 0.5);
                transform: scale(1.05);
            }

            .answer-btn {
                padding: 15px 25px;
                font-size: 1.2rem;
                color: white;
                background-color: var(--primary-color);
                border: none;
                border-radius: 15px;
                cursor: pointer;
                transition: all 0.3s ease;
                font-weight: 600;
            }

            .answer-btn:hover {
                background-color: #7B68EE;
                transform: scale(1.05);
            }

            .timer-container {
                margin: 20px auto;
                width: 80%;
                height: 20px;
                background-color: #e0e0e0;
                border-radius: 10px;
                overflow: hidden;
                position: relative;
            }

            .timer-bar {
                height: 100%;
                width: 100%;
                background: linear-gradient(to right, var(--time-color), var(--accent-color));
                border-radius: 10px;
                transition: width 0.1s linear;
            }

            .score-display {
                display: flex;
                justify-content: space-around;
                margin: 20px 0;
                font-size: 1.2rem;
                font-weight: 600;
            }

            .correct-count {
                color: var(--correct-color);
            }

            .wrong-count {
                color: var(--wrong-color);
            }

            .feedback {
                font-size: 1.5rem;
                margin: 15px 0;
                font-weight: 600;
                height: 30px;
                transition: all 0.3s ease;
            }

            .difficulty-selector {
                margin: 20px 0;
            }

            .difficulty-btn {
                padding: 10px 15px;
                margin: 0 5px;
                font-size: 1rem;
                border-radius: 10px;
                border: none;
                cursor: pointer;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .easy-btn {
                background-color: #BBDEFB;
                color: #333;
            }

            .medium-btn {
                background-color: #C8E6C9;
                color: #333;
            }

            .hard-btn {
                background-color: #FFCDD2;
                color: #333;
            }

            .difficulty-btn:hover {
                transform: scale(1.1);
            }

            .active-difficulty {
                transform: scale(1.05);
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .start-btn, .restart-btn {
                padding: 15px 30px;
                font-size: 1.3rem;
                color: white;
                background-color: var(--secondary-color);
                border: none;
                border-radius: 15px;
                cursor: pointer;
                margin: 20px 10px;
                transition: all 0.3s ease;
                font-weight: 600;
            }

            .start-btn:hover, .restart-btn:hover {
                background-color: #28A745;
                transform: scale(1.05);
            }

            .game-over {
                font-size: 2rem;
                color: var(--accent-color);
                font-weight: 600;
                margin: 20px 0;
                animation: pulse 1.5s infinite;
            }

            @keyframes pulse {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.05);
                }
                100% {
                    transform: scale(1);
                }
            }

            .stats-container {
                background-color: rgba(106, 90, 205, 0.1);
                border-radius: 15px;
                padding: 15px;
                margin: 20px 0;
                display: none;
            }

            .stats-title {
                font-size: 1.5rem;
                color: var(--primary-color);
                margin-bottom: 15px;
                font-weight: 600;
            }

            .stat-item {
                display: flex;
                justify-content: space-between;
                padding: 5px 0;
                font-size: 1.1rem;
            }

            .operation-type-selector {
                margin: 20px 0;
            }

            .type-btn {
                padding: 10px 15px;
                margin: 0 5px;
                font-size: 1rem;
                border-radius: 10px;
                border: none;
                cursor: pointer;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .addition-btn {
                background-color: #FFF59D;
                color: #333;
            }

            .subtraction-btn {
                background-color: #FFCC80;
                color: #333;
            }

            .multiplication-btn {
                background-color: #B39DDB;
                color: #333;
            }

            .division-btn {
                background-color: #80DEEA;
                color: #333;
            }

            .mixed-btn {
                background-color: #F48FB1;
                color: #333;
            }

            .type-btn:hover {
                transform: scale(1.1);
            }

            .active-type {
                transform: scale(1.05);
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .info-section {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 20px 0;
            }

            .level-display {
                font-size: 1.2rem;
                font-weight: 600;
                color: var(--primary-color);
            }

            .time-display {
                font-size: 1.2rem;
                font-weight: 600;
                color: var(--time-color);
            }

            .flying-number {
                position: absolute;
                font-size: 2rem;
                font-weight: bold;
                pointer-events: none;
                animation: flyUp 1.5s forwards;
            }

            @keyframes flyUp {
                0% {
                    transform: translateY(0);
                    opacity: 1;
                }
                100% {
                    transform: translateY(-100px);
                    opacity: 0;
                }
            }

            .correct-answer {
                color: var(--correct-color);
            }

            .wrong-answer {
                color: var(--wrong-color);
            }

            .hide {
                display: none;
            }

            .show {
                display: block;
            }

            .results-container {
                margin-top: 20px;
                padding: 20px;
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                display: none;
            }

            .results-title {
                font-size: 1.8rem;
                color: var(--primary-color);
                margin-bottom: 15px;
                font-weight: 600;
            }

            .results-stat {
                font-size: 1.2rem;
                margin: 10px 0;
            }

            .results-feedback {
                font-size: 1.4rem;
                margin: 20px 0;
                padding: 15px;
                border-radius: 10px;
                background-color: rgba(106, 90, 205, 0.1);
                color: var(--primary-color);
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <h1>�Operaciones Matem�ticas R�pidas!</h1>
        <button class="back-btn" onclick="window.history.back()">&larr;</button>

        <div class="game-container">
            <p class="game-instructions">Resuelve las operaciones matem�ticas lo m�s r�pido posible. �Cada respuesta correcta suma puntos y tiempo extra!</p>

            <div class="difficulty-selector" id="difficultySelector">
                <p>Selecciona la dificultad:</p>
                <button onclick="setDifficulty('easy')" class="difficulty-btn easy-btn active-difficulty">F�cil</button>
                <button onclick="setDifficulty('medium')" class="difficulty-btn medium-btn">Medio</button>
                <button onclick="setDifficulty('hard')" class="difficulty-btn hard-btn">Dif�cil</button>
            </div>

            <div class="operation-type-selector" id="operationTypeSelector">
                <p>Selecciona el tipo de operaci�n:</p>
                <button onclick="setOperationType('addition')" class="type-btn addition-btn active-type">Suma</button>
                <button onclick="setOperationType('subtraction')" class="type-btn subtraction-btn">Resta</button>
                <button onclick="setOperationType('multiplication')" class="type-btn multiplication-btn">Multiplicaci�n</button>
                <button onclick="setOperationType('division')" class="type-btn division-btn">Divisi�n</button>
                <button onclick="setOperationType('mixed')" class="type-btn mixed-btn">Mixto</button>
            </div>

            <button id="startBtn" class="start-btn">�Comenzar!</button>

            <div id="gameArea" class="hide">
                <div class="info-section">
                    <div class="level-display">Nivel: <span id="levelDisplay">1</span></div>
                    <div class="time-display">Tiempo: <span id="timeDisplay">30</span>s</div>
                </div>

                <div class="timer-container">
                    <div class="timer-bar" id="timerBar"></div>
                </div>

                <div class="operation-display" id="operationDisplay">8 + 4 = ?</div>

                <div>
                    <input type="number" id="answerInput" class="answer-input" placeholder="?">
                    <button onclick="checkAnswer()" id="answerBtn" class="answer-btn">Responder</button>
                </div>

                <div class="feedback" id="feedback"></div>

                <div class="score-display">
                    <div>Correctas: <span id="correctCount" class="correct-count">0</span></div>
                    <div>Incorrectas: <span id="wrongCount" class="wrong-count">0</span></div>
                </div>
            </div>

            <div id="gameOverArea" class="hide">
                <p class="game-over">�Juego Terminado!</p>
                <div class="results-container" id="resultsContainer">
                    <h3 class="results-title">Tus Resultados</h3>
                    <p class="results-stat">Nivel alcanzado: <span id="finalLevel"></span></p>
                    <p class="results-stat">Operaciones correctas: <span id="finalCorrect"></span></p>
                    <p class="results-stat">Operaciones incorrectas: <span id="finalWrong"></span></p>
                    <p class="results-stat">Precisi�n: <span id="accuracy"></span>%</p>
                    <p class="results-feedback" id="finalFeedback"></p>
                </div>
                <button id="restartBtn" class="restart-btn">Jugar de Nuevo</button>
            </div>
        </div>

        <script>
    // Variables del juego
    let difficulty = 'easy';
    let operationType = 'addition';
    let gameActive = false;
    let timeLeft = 30;
    let timerId;
    let correctCount = 0;
    let wrongCount = 0;
    let currentAnswer = 0;
    let level = 1;
    let timePerLevel = 30;
    
    // Referencias DOM
    const startBtn = document.getElementById('startBtn');
    const gameArea = document.getElementById('gameArea');
    const gameOverArea = document.getElementById('gameOverArea');
    const difficultySelector = document.getElementById('difficultySelector');
    const operationTypeSelector = document.getElementById('operationTypeSelector');
    const operationDisplay = document.getElementById('operationDisplay');
    const answerInput = document.getElementById('answerInput');
    const feedback = document.getElementById('feedback');
    const correctCountDisplay = document.getElementById('correctCount');
    const wrongCountDisplay = document.getElementById('wrongCount');
    const timerBar = document.getElementById('timerBar');
    const timeDisplay = document.getElementById('timeDisplay');
    const levelDisplay = document.getElementById('levelDisplay');
    const restartBtn = document.getElementById('restartBtn');
    const resultsContainer = document.getElementById('resultsContainer');
    const finalLevel = document.getElementById('finalLevel');
    const finalCorrect = document.getElementById('finalCorrect');
    const finalWrong = document.getElementById('finalWrong');
    const accuracy = document.getElementById('accuracy');
    const finalFeedback = document.getElementById('finalFeedback');
    
    // Event Listeners
    startBtn.addEventListener('click', startGame);
    answerInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            checkAnswer();
        }
    });
    restartBtn.addEventListener('click', resetGame);
    
    // Funciones para establecer dificultad y tipo de operaci�n
    function setDifficulty(level) {
        difficulty = level;
        
        // Quitar clase activa de todos los botones
        document.querySelectorAll('.difficulty-btn').forEach(btn => {
            btn.classList.remove('active-difficulty');
        });
        
        // A�adir clase activa al bot�n seleccionado
        document.querySelector(`.${level}-btn`).classList.add('active-difficulty');
    }
    
    function setOperationType(type) {
        operationType = type;
        
        // Quitar clase activa de todos los botones
        document.querySelectorAll('.type-btn').forEach(btn => {
            btn.classList.remove('active-type');
        });
        
        // A�adir clase activa al bot�n seleccionado
        document.querySelector(`.${type}-btn`).classList.add('active-type');
    }
    
    // Iniciar juego
    function startGame() {
        gameActive = true;
        startBtn.classList.add('hide');
        difficultySelector.classList.add('hide');
        operationTypeSelector.classList.add('hide');
        gameArea.classList.remove('hide');
        gameOverArea.classList.add('hide');
        
        correctCount = 0;
        wrongCount = 0;
        level = 1;
        
        // Ajustar tiempo seg�n dificultad
        switch(difficulty) {
            case 'easy':
                timePerLevel = 30;
                break;
            case 'medium':
                timePerLevel = 25;
                break;
            case 'hard':
                timePerLevel = 20;
                break;
        }
        
        timeLeft = timePerLevel;
        updateTimerDisplay();
        generateOperation();
        startTimer();
        
        answerInput.focus();
    }
    
    // Generar operaci�n matem�tica
function generateOperation() {
    let num1, num2, operation, symbol, answer;
    
    // Ajustar rango de n�meros seg�n nivel y dificultad
    let maxNum;
    switch(difficulty) {
        case 'easy':
            maxNum = 10 + (level * 2);
            break;
        case 'medium':
            maxNum = 20 + (level * 3);
            break;
        case 'hard':
            maxNum = 30 + (level * 4);
            break;
    }
    
    // Limitar el crecimiento m�ximo
    maxNum = Math.min(maxNum, 100);
    
    // Generar tipo de operaci�n
    if (operationType === 'mixed') {
        const operations = ['addition', 'subtraction', 'multiplication', 'division'];
        operation = operations[Math.floor(Math.random() * operations.length)];
    } else {
        operation = operationType;
    }
    
    switch(operation) {
        case 'addition':
            num1 = Math.floor(Math.random() * maxNum) + 1;
            num2 = Math.floor(Math.random() * maxNum) + 1;
            symbol = '+';
            answer = num1 + num2;
            break;
            
        case 'subtraction':
            num1 = Math.floor(Math.random() * maxNum) + 1;
            num2 = Math.floor(Math.random() * num1) + 1;  // Para asegurar resultado positivo
            symbol = '-';
            answer = num1 - num2;
            break;
            
        case 'multiplication':
            // Ajustar para multiplicaci�n
            let factor = difficulty === 'easy' ? 5 : (difficulty === 'medium' ? 10 : 12);
            num1 = Math.floor(Math.random() * factor) + 1;
            num2 = Math.floor(Math.random() * factor) + 1;
            symbol = '�';
            answer = num1 * num2;
            break;
            
        case 'division':
            // Ajustar para divisi�n (asegurar divisiones enteras)
            num2 = Math.floor(Math.random() * 10) + 1;  // Divisor entre 1 y 10
            answer = Math.floor(Math.random() * 10) + 1;  // Resultado entre 1 y 10
            num1 = num2 * answer;  // Para asegurar divisi�n exacta
            symbol = '�';
            break;
    }
    
    // Mostrar la operaci�n en el display
    operationDisplay.textContent = `${num1} ${symbol} ${num2} = ?`;
    operationDisplay.style.display = 'inline-block'; // Asegurar que sea visible
    currentAnswer = answer;
    answerInput.value = '';
    answerInput.focus();
}
        
        // Limitar el crecimiento m�ximo
        maxNum = Math.min(maxNum, 100);
        
        // Generar tipo de operaci�n
        if (operationType === 'mixed') {
            const operations = ['addition', 'subtraction', 'multiplication', 'division'];
            operation = operations[Math.floor(Math.random() * operations.length)];
        } else {
            operation = operationType;
        }
        
        switch(operation) {
            case 'addition':
                num1 = Math.floor(Math.random() * maxNum) + 1;
                num2 = Math.floor(Math.random() * maxNum) + 1;
                symbol = '+';
                answer = num1 + num2;
                break;
                
            case 'subtraction':
                num1 = Math.floor(Math.random() * maxNum) + 1;
                num2 = Math.floor(Math.random() * num1) + 1;  // Para asegurar resultado positivo
                symbol = '-';
                answer = num1 - num2;
                break;
                
            case 'multiplication':
                // Ajustar para multiplicaci�n
                let factor = difficulty === 'easy' ? 5 : (difficulty === 'medium' ? 10 : 12);
                num1 = Math.floor(Math.random() * factor) + 1;
                num2 = Math.floor(Math.random() * factor) + 1;
                symbol = '�';
                answer = num1 * num2;
                break;
                
            case 'division':
                // Ajustar para divisi�n (asegurar divisiones enteras)
                num2 = Math.floor(Math.random() * 10) + 1;  // Divisor entre 1 y 10
                answer = Math.floor(Math.random() * 10) + 1;  // Resultado entre 1 y 10
                num1 = num2 * answer;  // Para asegurar divisi�n exacta
                symbol = '�';
                break;
        }
        
        operationDisplay.textContent = `${num1} ${symbol} ${num2} = ?`;
        currentAnswer = answer;
        answerInput.value = '';
        answerInput.focus();
    }
    
    // Verificar respuesta
    function checkAnswer() {
        if (!gameActive) return;
        
        const userAnswer = parseInt(answerInput.value);
        
        if (isNaN(userAnswer)) {
            feedback.textContent = "Por favor ingresa un n�mero";
            feedback.style.color = "#FF9800";
            answerInput.focus();
            return;
        }
        
        if (userAnswer === currentAnswer) {
            correctCount++;
            correctCountDisplay.textContent = correctCount;
            feedback.textContent = "�Correcto!";
            feedback.style.color = getComputedStyle(document.documentElement).getPropertyValue('--correct-color');
            
            // A�adir tiempo bonus
            timeLeft += 2;
            updateTimerDisplay();
            
            // Mostrar n�mero volador
            createFlyingNumber("+2s", getComputedStyle(document.documentElement).getPropertyValue('--correct-color'));
            
            // Subir de nivel cada 5 respuestas correctas
            if (correctCount % 5 === 0) {
                level++;
                levelDisplay.textContent = level;
                feedback.textContent = `�Correcto! �Nivel ${level}!`;
                
                // A�adir tiempo bonus por subir de nivel
                timeLeft += 5;
                updateTimerDisplay();
                createFlyingNumber("+5s", getComputedStyle(document.documentElement).getPropertyValue('--correct-color'));
            }
        } else {
            wrongCount++;
            wrongCountDisplay.textContent = wrongCount;
            feedback.textContent = `Incorrecto. La respuesta era ${currentAnswer}`;
            feedback.style.color = getComputedStyle(document.documentElement).getPropertyValue('--wrong-color');
            
            // Reducir tiempo por respuesta incorrecta
            timeLeft -= 3;
            updateTimerDisplay();
            createFlyingNumber("-3s", getComputedStyle(document.documentElement).getPropertyValue('--wrong-color'));
        }
        
        // Generar nueva operaci�n
        setTimeout(() => {
            generateOperation();
            feedback.textContent = "";
        }, 1000);
    }
    
    // Iniciar temporizador
    function startTimer() {
        timerId = setInterval(() => {
            timeLeft -= 0.1;
            
            // Actualizar barra de tiempo
            const percentage = (timeLeft / timePerLevel) * 100;
            timerBar.style.width = `${Math.max(percentage, 0)}%`;
            
            // Actualizar display cada segundo completo
            if (Math.floor(timeLeft * 10) % 10 === 0) {
                timeDisplay.textContent = Math.ceil(timeLeft);
            }
            
            // Verificar fin de tiempo
            if (timeLeft <= 0) {
                endGame();
            }
        }, 100);
    }
    
    // Actualizar visualizaci�n del temporizador
    function updateTimerDisplay() {
        timeDisplay.textContent = Math.ceil(timeLeft);
        const percentage = (timeLeft / timePerLevel) * 100;
        timerBar.style.width = `${Math.max(percentage, 0)}%`;
    }
    
    // Terminar juego
    function endGame() {
        gameActive = false;
        clearInterval(timerId);
        
        gameArea.classList.add('hide');
        gameOverArea.classList.remove('hide');
        resultsContainer.style.display = 'block';
        
        // Mostrar resultados finales
        finalLevel.textContent = level;
        finalCorrect.textContent = correctCount;
        finalWrong.textContent = wrongCount;
        
        const totalAttempts = correctCount + wrongCount;
        const accuracyPercent = totalAttempts > 0 ? Math.round((correctCount / totalAttempts) * 100) : 0;
        accuracy.textContent = accuracyPercent;
        
        // Mensaje de retroalimentaci�n
        let feedback = '';
        if (level >= 5) {
            feedback = '�Excelente dominio matem�tico! Tienes habilidades impresionantes.';
        } else if (level >= 3) {
            feedback = '�Muy bien! Est�s mostrando buenas habilidades matem�ticas.';
        } else {
            feedback = 'Sigue practicando. �La pr�ctica hace al maestro!';
        }
        
        finalFeedback.textContent = feedback;
    }
    
    // Resetear juego
    function resetGame() {
        gameOverArea.classList.add('hide');
        startBtn.classList.remove('hide');
        difficultySelector.classList.remove('hide');
        operationTypeSelector.classList.remove('hide');
        
        correctCount = 0;
        wrongCount = 0;
        level = 1;
        
        correctCountDisplay.textContent = '0';
        wrongCountDisplay.textContent = '0';
        levelDisplay.textContent = '1';
        
        resultsContainer.style.display = 'none';
    }
    
    // Crear animaci�n de n�mero volador
    function createFlyingNumber(text, color) {
        const flyingNumber = document.createElement('div');
        flyingNumber.className = 'flying-number';
        flyingNumber.textContent = text;
        flyingNumber.style.color = color;
        
        // Posicionar cerca del input
        const inputRect = answerInput.getBoundingClientRect();
        const gameRect = gameArea.getBoundingClientRect();
        
        flyingNumber.style.left = `${inputRect.left - gameRect.left + (inputRect.width / 2)}px`;
        flyingNumber.style.top = `${inputRect.top - gameRect.top - 20}px`;
        
        gameArea.appendChild(flyingNumber);
        
        // Eliminar despu�s de la animaci�n
        setTimeout(() => {
            gameArea.removeChild(flyingNumber);
        }, 1500);
    }
    
    // Permitir usar la tecla Enter para enviar respuesta
    document.addEventListener('keyup', function(event) {
        if (event.key === 'Enter' && gameActive) {
            checkAnswer();
        }
    });
    
    // Hacer las funciones accesibles globalmente para los botones HTML
    window.setDifficulty = setDifficulty;
    window.setOperationType = setOperationType;
    window.checkAnswer = checkAnswer;
</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>