<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>¡Aventura Matemática: Multiplicaciones!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css" />
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="estilosEjerc.css" />
    <style>
        body {
            font-family: 'Comic Neue', cursive, sans-serif;
        }
        .number-box {
            display: inline-block;
            min-width: 40px;
            font-size: 1.5rem;
            font-weight: 700;
            padding: 0.25rem 0.5rem;
            text-align: center;
            border: 2px solid #2563EB;
            border-radius: 8px;
            user-select: none;
            background-color: #f0f8ff;
        }
        .operator {
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0 0.5rem;
            user-select: none;
        }
        .feedback {
            margin-top: 0.5rem;
            font-weight: 600;
        }
        .feedback.correct {
            color: #198754; /* Bootstrap success green */
        }
        .feedback.incorrect {
            color: #dc3545; /* Bootstrap danger red */
        }
        .hidden {
            display: none !important;
        }
        .action-buttons {
            margin-top: 1.5rem;
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            justify-content: center;
        }
        /* Confetti style */
        .confetti {
            position: fixed;
            width: 10px;
            height: 10px;
            background-color: red;
            top: 0;
            animation-name: fall;
            animation-timing-function: linear;
            animation-iteration-count: 1;
            opacity: 0.8;
            z-index: 1050;
            border-radius: 2px;
        }
        @keyframes fall {
            0% {
                transform: translateY(-10vh) rotate(0deg);
            }
            100% {
                transform: translateY(110vh) rotate(360deg);
            }
        }
        /* Responsive tweaks */
        @media (max-width: 576px) {
            .d-flex.align-items-center.mb-3 {
                flex-wrap: wrap;
                gap: 0.5rem;
            }
            .number-box {
                min-width: 35px;
                font-size: 1.25rem;
                padding: 0.2rem 0.4rem;
            }
            .operator {
                font-size: 1.25rem;
            }
            input.form-control {
                width: 100%;
                max-width: 100px;
                font-size: 1.1rem;
            }
            button.btn {
                margin-top: 0.5rem;
                width: 100%;
                max-width: 130px;
            }
        }
        
    </style>
    <link rel="stylesheet" href="../Sistema/Estilos.css" />

</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />

    <header class="text-center my-4">
        <h1 class="header">¡Aventura Matemática: Multiplicaciones!</h1>
    </header>

    <main class="container my-4">
        <div class="progress-container mb-4 text-center">
            <h4>¡Tu progreso matemático!</h4>
            <div class="progress" role="progressbar" aria-label="Progreso de ejercicios" aria-valuemin="0" aria-valuemax="100">
                <div id="progress-bar" class="progress-bar" style="width: 0%;">0%</div>
            </div>
        </div>

        <!-- Ejercicios -->
        <%-- Repetir sección para cada ejercicio --%>
        <section class="card p-3 mb-4 exercise-card suma-card">
            <h3>Ejercicio 1: ¡A Multiplicar!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num1" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num2" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta" class="form-control ms-2" aria-label="Respuesta ejercicio 1" />
                <button onclick="verificarMulti()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback" class="feedback hidden" aria-live="polite"></p>
        </section>

        <section class="card p-3 mb-4 exercise-card suma-card">
            <h3>Ejercicio 2: ¡Sigue Multiplicando!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num3" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num4" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta2" class="form-control ms-2" aria-label="Respuesta ejercicio 2" />
                <button onclick="verificarMulti2()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback2" class="feedback hidden" aria-live="polite"></p>
        </section>

        <section class="card p-3 mb-4 exercise-card suma-card">
            <h3>Ejercicio 3: ¡Multiplica Más!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num5" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num6" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta3" class="form-control ms-2" aria-label="Respuesta ejercicio 3" />
                <button onclick="verificarMulti3()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback3" class="feedback hidden" aria-live="polite"></p>
        </section>

        <section class="card p-3 mb-4 exercise-card suma-card">
            <h3>Ejercicio 4: ¡Tablas de Multiplicar!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num7" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num8" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta4" class="form-control ms-2" aria-label="Respuesta ejercicio 4" />
                <button onclick="verificarMulti4()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback4" class="feedback hidden" aria-live="polite"></p>
        </section>

        <section class="card p-3 mb-4 exercise-card suma-card">
            <h3>Ejercicio 5: ¡Multiplica con Cuidado!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num9" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num10" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta5" class="form-control ms-2" aria-label="Respuesta ejercicio 5" />
                <button onclick="verificarMulti5()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback5" class="feedback hidden" aria-live="polite"></p>
        </section>

        <section class="card p-3 mb-4 exercise-card suma-card">
            <h3>Ejercicio 6: ¡Último Desafío!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num11" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num12" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta6" class="form-control ms-2" aria-label="Respuesta ejercicio 6" />
                <button onclick="verificarMulti6()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback6" class="feedback hidden" aria-live="polite"></p>
        </section>

        <div class="action-buttons">
            <button onclick="repetirTodos()" class="btn btn-secondary">¡Nuevos Ejercicios!</button>
            <button onclick="window.location.href='Mates-Ejercicios.jsp'" class="btn btn-secondary btn-return">Regresar</button>
        </div>

        <div id="mascot-speech" class="alert alert-info mt-4 text-center" style="display:none;"></div>
    </main>

    <script>
        let correctAnswers = 0;
        const totalExercises = 6;

        function generarEjercicioMulti() {
            const num1 = Math.floor(Math.random() * 10) + 1;
            const num2 = Math.floor(Math.random() * 10) + 1;
            document.getElementById('multi-num1').textContent = num1;
            document.getElementById('multi-num2').textContent = num2;
            document.getElementById('multi-respuesta').value = '';
            document.getElementById('multi-feedback').classList.add('hidden');
        }
        function generarEjercicioMulti2() {
            const num1 = Math.floor(Math.random() * 10) + 1;
            const num2 = Math.floor(Math.random() * 10) + 1;
            document.getElementById('multi-num3').textContent = num1;
            document.getElementById('multi-num4').textContent = num2;
            document.getElementById('multi-respuesta2').value = '';
            document.getElementById('multi-feedback2').classList.add('hidden');
        }
        function generarEjercicioMulti3() {
            const num1 = Math.floor(Math.random() * 10) + 1;
            const num2 = Math.floor(Math.random() * 10) + 1;
            document.getElementById('multi-num5').textContent = num1;
            document.getElementById('multi-num6').textContent = num2;
            document.getElementById('multi-respuesta3').value = '';
            document.getElementById('multi-feedback3').classList.add('hidden');
        }
        function generarEjercicioMulti4() {
            const num1 = Math.floor(Math.random() * 10) + 1;
            const num2 = Math.floor(Math.random() * 10) + 1;
            document.getElementById('multi-num7').textContent = num1;
            document.getElementById('multi-num8').textContent = num2;
            document.getElementById('multi-respuesta4').value = '';
            document.getElementById('multi-feedback4').classList.add('hidden');
        }
        function generarEjercicioMulti5() {
            const num1 = Math.floor(Math.random() * 10) + 1;
            const num2 = Math.floor(Math.random() * 10) + 1;
            document.getElementById('multi-num9').textContent = num1;
            document.getElementById('multi-num10').textContent = num2;
            document.getElementById('multi-respuesta5').value = '';
            document.getElementById('multi-feedback5').classList.add('hidden');
        }
        function generarEjercicioMulti6() {
            const num1 = Math.floor(Math.random() * 10) + 1;
            const num2 = Math.floor(Math.random() * 10) + 1;
            document.getElementById('multi-num11').textContent = num1;
            document.getElementById('multi-num12').textContent = num2;
            document.getElementById('multi-respuesta6').value = '';
            document.getElementById('multi-feedback6').classList.add('hidden');
        }

        function createConfetti() {
            const colors = ['#FF5733', '#33C4FF', '#FFD133', '#33FF57', '#D633FF'];
            for (let i = 0; i < 50; i++) {
                const confetti = document.createElement('div');
                confetti.className = 'confetti';
                confetti.style.left = Math.random() * 100 + 'vw';
                confetti.style.animationDuration = (Math.random() * 3 + 2) + 's';
                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                document.body.appendChild(confetti);
                setTimeout(() => confetti.remove(), 5000);
            }
        }

        function updateProgress() {
            const progressPercent = (correctAnswers / totalExercises) * 100;
            const progressBar = document.getElementById('progress-bar');
            progressBar.style.width = progressPercent + '%';
            progressBar.textContent = Math.round(progressPercent) + '%';
            if (progressPercent === 100) {
                createConfetti();
                showMascotMessage('¡Felicidades! ¡Has completado todos los ejercicios de multiplicación! 🎉');
            }
        }

        function showMascotMessage(message) {
            const mascotSpeech = document.getElementById('mascot-speech');
            mascotSpeech.textContent = message;
            mascotSpeech.style.display = 'block';
            setTimeout(() => mascotSpeech.style.display = 'none', 5000);
        }

        function verificarRespuesta(numId1, numId2, respuestaId, feedbackId, mensajeCorrecto, mensajeError) {
            const num1 = parseInt(document.getElementById(numId1).textContent);
            const num2 = parseInt(document.getElementById(numId2).textContent);
            const respuesta = parseInt(document.getElementById(respuestaId).value);
            const feedback = document.getElementById(feedbackId);
            if (respuesta === num1 * num2) {
                feedback.textContent = mensajeCorrecto;
                feedback.className = 'feedback correct';
                correctAnswers++;
                updateProgress();
                showMascotMessage(mensajeCorrecto);
            } else {
                feedback.textContent = mensajeError + ' La respuesta correcta es ' + (num1 * num2) + '.';
                feedback.className = 'feedback incorrect';
                showMascotMessage(mensajeError);
            }
            feedback.classList.remove('hidden');
        }

        // Usamos la función genérica para cada verificación:
        function verificarMulti() {
            verificarRespuesta('multi-num1', 'multi-num2', 'multi-respuesta', 'multi-feedback',
                '¡Correcto! ¡Eres genial multiplicando! 🎉',
                '¡Casi! ¡Inténtalo de nuevo! ¡Las multiplicaciones son divertidas!');
        }
        function verificarMulti2() {
            verificarRespuesta('multi-num3', 'multi-num4', 'multi-respuesta2', 'multi-feedback2',
                '¡Correcto! ¡Eres un experto en tablas de multiplicar! 🌟',
                '¡Casi! Sigue practicando con las tablas.');
        }
        function verificarMulti3() {
            verificarRespuesta('multi-num5', 'multi-num6', 'multi-respuesta3', 'multi-feedback3',
                '¡Correcto! ¡Eres un campeón de las multiplicaciones! 🏆',
                '¡Casi! ¡Las multiplicaciones son un reto divertido!');
        }
        function verificarMulti4() {
            verificarRespuesta('multi-num7', 'multi-num8', 'multi-respuesta4', 'multi-feedback4',
                '¡Correcto! ¡Eres increíble con las matemáticas! 🌈',
                '¡Casi! Un poco más de práctica con las tablas.');
        }
        function verificarMulti5() {
            verificarRespuesta('multi-num9', 'multi-num10', 'multi-respuesta5', 'multi-feedback5',
                '¡Correcto! ¡Eres un matemático experto! 🧠',
                '¡Casi! ¡Sigue practicando!');
        }
        function verificarMulti6() {
            verificarRespuesta('multi-num11', 'multi-num12', 'multi-respuesta6', 'multi-feedback6',
                '¡Correcto! ¡Eres un verdadero héroe de las multiplicaciones! 🦸',
                '¡Casi! Estás muy cerca de dominar las multiplicaciones.');
        }

        function repetirTodos() {
            correctAnswers = 0;
            updateProgress();
            generarEjercicioMulti();
            generarEjercicioMulti2();
            generarEjercicioMulti3();
            generarEjercicioMulti4();
            generarEjercicioMulti5();
            generarEjercicioMulti6();
            showMascotMessage('¡Nuevos ejercicios de multiplicación! ¡A resolver!');
        }

        window.onload = function() {
            repetirTodos();
            setTimeout(() => showMascotMessage('¡Hola! ¡Vamos a practicar las tablas de multiplicar!'), 1000);
        };
    </script>
</body>
</html>
