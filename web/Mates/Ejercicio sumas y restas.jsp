<%-- 
    Document   : Ejercicio sumas y restas
    Created on : 5 nov. 2024, 17:09:34
    Author     : P500
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>¡Aventura Matemática: Suma y Resta!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css" />
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="estilosEjerc.css" />
    <style>
        body {
            font-family: 'Comic Neue', cursive, sans-serif;
            background-color: #f9f7e8;
            padding: 15px;
        }
        .header {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 2.5rem;
            color: #2c3e50;
        }
        .progress-container h4 {
            margin-bottom: 10px;
            color: #34495e;
        }
        .exercise-card {
            border-radius: 15px;
            box-shadow: 0 4px 10px rgb(0 0 0 / 0.1);
        }
        .number-box {
            display: inline-block;
            min-width: 40px;
            padding: 10px 15px;
            margin: 0 5px;
            font-size: 1.8rem;
            font-weight: 700;
            background-color: #e3f2fd;
            border-radius: 10px;
            text-align: center;
            user-select: none;
        }
        .operator {
            font-size: 1.8rem;
            font-weight: 700;
            margin: 0 5px;
        }
        .form-control {
            max-width: 120px;
            font-size: 1.2rem;
        }
        button.btn-primary {
            white-space: nowrap;
        }
        .feedback {
            margin-top: 10px;
            font-weight: 600;
            font-size: 1.1rem;
        }
        .feedback.correct {
            color: green;
        }
        .feedback.incorrect {
            color: red;
        }
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
            flex-wrap: wrap;
        }
        .btn-return {
            background-color: #6c757d;
            border-color: #6c757d;
            color: white;
        }

        /* Responsividad */

        @media (max-width: 768px) {
            .header {
                font-size: 2rem;
            }
            .number-box {
                min-width: 30px;
                padding: 8px 10px;
                font-size: 1.5rem;
            }
            .operator {
                font-size: 1.5rem;
            }
            .form-control {
                max-width: 100px;
                font-size: 1rem;
            }
            button.btn-primary {
                font-size: 0.9rem;
                padding: 6px 10px;
            }
        }

        @media (max-width: 480px) {
            .header {
                font-size: 1.6rem;
                margin-bottom: 20px;
            }
            .number-box {
                min-width: 25px;
                padding: 6px 8px;
                font-size: 1.2rem;
            }
            .operator {
                font-size: 1.2rem;
            }
            .form-control {
                max-width: 90px;
                font-size: 0.9rem;
            }
            button.btn-primary {
                font-size: 0.8rem;
                padding: 5px 8px;
            }
            .action-buttons {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />

    <header>
        <h1 class="header">¡Aventura Matemática: Sumas y Restas!</h1>
    </header>

    <main class="container my-5">
        <div class="progress-container mb-4">
            <h4>¡Tu progreso matemático!</h4>
            <div class="progress" role="progressbar" aria-label="Progreso de ejercicios">
                <div id="progress-bar" class="progress-bar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
            </div>
        </div>
        
        <!-- Ejercicios de Suma -->
        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 1: ¡A Sumar!</h3>
            <div class="d-flex flex-wrap align-items-center gap-2 mb-3">
                <span id="suma-num1" class="number-box"></span>
                <span class="operator">+</span>
                <span id="suma-num2" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="suma-respuesta" class="form-control ms-2" />
                <button onclick="verificarSuma()" class="btn btn-primary ms-3 mt-2 mt-sm-0">¡Comprobar!</button>
            </div>
            <p id="suma-feedback" class="feedback visually-hidden"></p>
        </section>
        
        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 2: ¡Sigue Sumando!</h3>
            <div class="d-flex flex-wrap align-items-center gap-2 mb-3">
                <span id="suma-num3" class="number-box"></span>
                <span class="operator">+</span>
                <span id="suma-num4" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="suma-respuesta2" class="form-control ms-2" />
                <button onclick="verificarSuma2()" class="btn btn-primary ms-3 mt-2 mt-sm-0">¡Comprobar!</button>
            </div>
            <p id="suma-feedback2" class="feedback visually-hidden"></p>
        </section>

        <!-- Ejercicios de Resta -->
        <section class="card p-4 mb-4 exercise-card resta-card">
            <h3>Ejercicio 3: ¡A Restar!</h3>
            <div class="d-flex flex-wrap align-items-center gap-2 mb-3">
                <span id="resta-num1" class="number-box"></span>
                <span class="operator">-</span>
                <span id="resta-num2" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="resta-respuesta" class="form-control ms-2" />
                <button onclick="verificarResta()" class="btn btn-primary ms-3 mt-2 mt-sm-0">¡Comprobar!</button>
            </div>
            <p id="resta-feedback" class="feedback visually-hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card resta-card">
            <h3>Ejercicio 4: ¡Sigue Restando!</h3>
            <div class="d-flex flex-wrap align-items-center gap-2 mb-3">
                <span id="resta-num3" class="number-box"></span>
                <span class="operator">-</span>
                <span id="resta-num4" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="resta-respuesta2" class="form-control ms-2" />
                <button onclick="verificarResta2()" class="btn btn-primary ms-3 mt-2 mt-sm-0">¡Comprobar!</button>
            </div>
            <p id="resta-feedback2" class="feedback visually-hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card resta-card">
            <h3>Ejercicio 5: ¡Más Restas!</h3>
            <div class="d-flex flex-wrap align-items-center gap-2 mb-3">
                <span id="resta-num5" class="number-box"></span>
                <span class="operator">-</span>
                <span id="resta-num6" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="resta-respuesta3" class="form-control ms-2" />
                <button onclick="verificarResta3()" class="btn btn-primary ms-3 mt-2 mt-sm-0">¡Comprobar!</button>
            </div>
            <p id="resta-feedback3" class="feedback visually-hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card resta-card">
            <h3>Ejercicio 6: ¡Último Reto!</h3>
            <div class="d-flex flex-wrap align-items-center gap-2 mb-3">
                <span id="resta-num7" class="number-box"></span>
                <span class="operator">-</span>
                <span id="resta-num8" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="resta-respuesta4" class="form-control ms-2" />
                <button onclick="verificarResta4()" class="btn btn-primary ms-3 mt-2 mt-sm-0">¡Comprobar!</button>
            </div>
            <p id="resta-feedback4" class="feedback visually-hidden"></p>
        </section>

        <!-- Botones de acción -->
        <div class="action-buttons">
            <button onclick="repetirTodos()" class="btn btn-secondary">¡Nuevos Ejercicios!</button>
            <button onclick="window.location.href='Mates-Ejercicios.jsp'" class="btn btn-secondary btn-return">Regresar</button>
        </div>
    </main>

<script>
    let correctAnswers = 0;
    const totalExercises = 6;
    
    function generarEjercicioSuma() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        document.getElementById('suma-num1').textContent = num1;
        document.getElementById('suma-num2').textContent = num2;
        document.getElementById('suma-respuesta').value = '';
        document.getElementById('suma-feedback').classList.add('visually-hidden');
    }
    function generarEjercicioSuma2() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        document.getElementById('suma-num3').textContent = num1;
        document.getElementById('suma-num4').textContent = num2;
        document.getElementById('suma-respuesta2').value = '';
        document.getElementById('suma-feedback2').classList.add('visually-hidden');
    }
    function generarEjercicioResta() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * num1) + 1;
        document.getElementById('resta-num1').textContent = num1;
        document.getElementById('resta-num2').textContent = num2;
        document.getElementById('resta-respuesta').value = '';
        document.getElementById('resta-feedback').classList.add('visually-hidden');
    }
    function generarEjercicioResta2() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * num1) + 1;
        document.getElementById('resta-num3').textContent = num1;
        document.getElementById('resta-num4').textContent = num2;
        document.getElementById('resta-respuesta2').value = '';
        document.getElementById('resta-feedback2').classList.add('visually-hidden');
    }
    function generarEjercicioResta3() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * num1) + 1;
        document.getElementById('resta-num5').textContent = num1;
        document.getElementById('resta-num6').textContent = num2;
        document.getElementById('resta-respuesta3').value = '';
        document.getElementById('resta-feedback3').classList.add('visually-hidden');
    }
    function generarEjercicioResta4() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * num1) + 1;
        document.getElementById('resta-num7').textContent = num1;
        document.getElementById('resta-num8').textContent = num2;
        document.getElementById('resta-respuesta4').value = '';
        document.getElementById('resta-feedback4').classList.add('visually-hidden');
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
            setTimeout(() => { confetti.remove(); }, 5000);
        }
    }
    function updateProgress() {
        const progressPercent = (correctAnswers / totalExercises) * 100;
        const progressBar = document.getElementById('progress-bar');
        progressBar.style.width = progressPercent + '%';
        progressBar.textContent = Math.round(progressPercent) + '%';
        if (progressPercent === 100) {
            createConfetti();
            showMascotMessage('¡Felicidades! ¡Has completado todos los ejercicios! 🎉');
        }
    }
    function showMascotMessage(message) {
        const mascotSpeech = document.getElementById('mascot-speech');
        if (!mascotSpeech) return;
        mascotSpeech.textContent = message;
        mascotSpeech.style.display = 'block';
        setTimeout(() => {
            mascotSpeech.style.display = 'none';
        }, 5000);
    }
    function verificarSuma() {
        const num1 = parseInt(document.getElementById('suma-num1').textContent);
        const num2 = parseInt(document.getElementById('suma-num2').textContent);
        const respuesta = parseInt(document.getElementById('suma-respuesta').value);
        const feedback = document.getElementById('suma-feedback');
        if (respuesta === num1 + num2) {
            feedback.textContent = '¡Correcto! ¡Eres genial! 🎉';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Muy bien! ¡Sigue así!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 + num2) + '. ¡Inténtalo de nuevo!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡No te rindas! ¡Tú puedes!');
        }
        feedback.classList.remove('visually-hidden');
    }
    function verificarSuma2() {
        const num1 = parseInt(document.getElementById('suma-num3').textContent);
        const num2 = parseInt(document.getElementById('suma-num4').textContent);
        const respuesta = parseInt(document.getElementById('suma-respuesta2').value);
        const feedback = document.getElementById('suma-feedback2');
        if (respuesta === num1 + num2) {
            feedback.textContent = '¡Correcto! ¡Eres súper inteligente! 🌟';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Excelente suma!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 + num2) + '. ¡Sigue practicando!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Sigue intentando!');
        }
        feedback.classList.remove('visually-hidden');
    }
    function verificarResta() {
        const num1 = parseInt(document.getElementById('resta-num1').textContent);
        const num2 = parseInt(document.getElementById('resta-num2').textContent);
        const respuesta = parseInt(document.getElementById('resta-respuesta').value);
        const feedback = document.getElementById('resta-feedback');
        if (respuesta === num1 - num2) {
            feedback.textContent = '¡Correcto! ¡Eres un campeón de las restas! 🏆';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Eres muy bueno restando!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 - num2) + '. ¡Sigue adelante!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Las restas son divertidas!');
        }
        feedback.classList.remove('visually-hidden');
    }
    function verificarResta2() {
        const num1 = parseInt(document.getElementById('resta-num3').textContent);
        const num2 = parseInt(document.getElementById('resta-num4').textContent);
        const respuesta = parseInt(document.getElementById('resta-respuesta2').value);
        const feedback = document.getElementById('resta-feedback2');
        if (respuesta === num1 - num2) {
            feedback.textContent = '¡Correcto! ¡Eres increíble con las matemáticas! 🌈';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Wow! ¡Qué bien lo haces!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 - num2) + '. ¡No te rindas!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Un poco más de práctica!');
        }
        feedback.classList.remove('visually-hidden');
    }
    function verificarResta3() {
        const num1 = parseInt(document.getElementById('resta-num5').textContent);
        const num2 = parseInt(document.getElementById('resta-num6').textContent);
        const respuesta = parseInt(document.getElementById('resta-respuesta3').value);
        const feedback = document.getElementById('resta-feedback3');
        if (respuesta === num1 - num2) {
            feedback.textContent = '¡Correcto! ¡Eres un matemático experto! 🧠';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Eres un genio de las matemáticas!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 - num2) + '. ¡Sigue practicando!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Intenta una vez más!');
        }
        feedback.classList.remove('visually-hidden');
    }
    function verificarResta4() {
        const num1 = parseInt(document.getElementById('resta-num7').textContent);
        const num2 = parseInt(document.getElementById('resta-num8').textContent);
        const respuesta = parseInt(document.getElementById('resta-respuesta4').value);
        const feedback = document.getElementById('resta-feedback4');
        if (respuesta === num1 - num2) {
            feedback.textContent = '¡Correcto! ¡Eres un verdadero héroe de las matemáticas! 🦸';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Lo lograste! ¡Eres asombroso!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 - num2) + '. ¡Sigue intentando!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Estás muy cerca!');
        }
        feedback.classList.remove('visually-hidden');
    }
    function repetirTodos() {
        correctAnswers = 0;
        updateProgress();
        generarEjercicioSuma();
        generarEjercicioSuma2();
        generarEjercicioResta();
        generarEjercicioResta2();
        generarEjercicioResta3();
        generarEjercicioResta4();
        showMascotMessage('¡Nuevos ejercicios! ¡A resolver!');
    }
    window.onload = function() {
        repetirTodos();
        setTimeout(() => {
            showMascotMessage('¡Hola! ¡Vamos a practicar matemáticas!');
        }, 1000);
    };
</script>
</body>
</html>
