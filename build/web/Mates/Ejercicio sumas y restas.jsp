<%-- 
    Document   : Ejercicio sumas y restas
    Created on : 5 nov. 2024, 17:09:34
    Author     : P500
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>¡Aventura Matemática: Suma y Resta!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #FF5733;
            --secondary-color: #33C4FF;
            --accent-color: #FFD133;
            --correct-color: #4CAF50;
            --incorrect-color: #FF5252;
            --background-color: #F8F9FA;
        }
        
        body {
            font-family: 'Comic Neue', cursive;
            background-color: #E8F4FF;
            background-size: 80px;
            background-repeat: space;
            background-opacity: 0.1;
        }
        
        .header {
            text-align: center;
            font-size: 2.8rem;
            font-weight: bold;
            margin: 15px 0;
            color: #2E86C1;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            background-color: #F0F8FF;
            padding: 15px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .exercise-card {
            border-radius: 20px;
            border: none;
            margin-bottom: 25px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            animation: fadeIn 0.5s;
        }
        
        .exercise-card:hover {
            transform: translateY(-5px);
        }
        
        .exercise-card h3 {
            color: #fff;
            padding: 15px;
            margin: -16px -16px 15px -16px;
            border-radius: 20px 20px 0 0;
            font-size: 1.6rem;
            font-weight: bold;
            text-align: center;
        }
        
        .suma-card {
            background-color: #FFFFFF;
        }
        
        .suma-card h3 {
            background-color: #FF9F45;
        }
        
        .resta-card {
            background-color: #FFFFFF;
        }
        
        .resta-card h3 {
            background-color: #5DADE2;
        }
        
        .d-flex {
            font-size: 1.8rem;
            justify-content: center;
        }
        
        .number-box {
            display: inline-block;
            background-color: #F0F8FF;
            border-radius: 10px;
            padding: 5px 15px;
            margin: 0 10px;
            min-width: 50px;
            text-align: center;
            font-weight: bold;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
            color: #2E4053;
        }
        
        .operator {
            font-size: 2rem;
            font-weight: bold;
            color: #566573;
        }
        
        .form-control {
            font-size: 1.6rem;
            border-radius: 10px;
            border: 3px solid #85C1E9;
            text-align: center;
            width: 80px !important;
            height: 50px;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #FF9F45;
            box-shadow: 0 0 10px rgba(255, 159, 69, 0.5);
        }
        
        .btn-primary {
            background-color: #FF9F45;
            border: none;
            border-radius: 10px;
            font-size: 1.2rem;
            font-weight: bold;
            padding: 8px 20px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .btn-primary:hover {
            background-color: #FF7F00;
            transform: scale(1.05);
        }
        
        .feedback {
            font-weight: bold;
            font-size: 1.4rem;
            margin-top: 15px;
            text-align: center;
            padding: 10px;
            border-radius: 10px;
            animation: bounceIn 0.5s;
        }
        
        .correct {
            background-color: rgba(76, 175, 80, 0.2);
            color: var(--correct-color);
        }
        
        .incorrect {
            background-color: rgba(255, 82, 82, 0.2);
            color: var(--incorrect-color);
        }
        
        .hidden {
            display: none;
        }
        
        .action-buttons {
            text-align: center;
            margin-top: 30px;
        }
        
        .btn-secondary {
            background-color: #5DADE2;
            border: none;
            border-radius: 10px;
            font-size: 1.3rem;
            font-weight: bold;
            padding: 10px 25px;
            margin: 0 10px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .btn-secondary:hover {
            background-color: #3498DB;
            transform: scale(1.05);
        }
        
        .btn-return {
            background-color: #82E0AA;
            color: #fff;
        }
        
        .btn-return:hover {
            background-color: #58D68D;
        }
        
        .confetti {
            position: fixed;
            width: 10px;
            height: 10px;
            background-color: #f00;
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
        
        @keyframes bounceIn {
            0% {
                transform: scale(0.8);
                opacity: 0;
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
        
        .progress-container {
            margin-bottom: 30px;
        }
        
        .progress {
            height: 20px;
            border-radius: 10px;
            background-color: #D6EAF8;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
        }
        
        .progress-bar {
            background-color: #3498DB;
            border-radius: 10px;
            transition: width 0.5s ease;
        }
        
        .animal-mascot {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 150px;
            height: 150px;
            background-image: url('/api/placeholder/150/150');
            background-size: contain;
            background-repeat: no-repeat;
            z-index: 100;
        }
        
        .mascot-speech {
            position: absolute;
            top: -80px;
            left: -120px;
            background-color: white;
            border-radius: 20px;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 200px;
            display: none;
        }
        
        .mascot-speech:after {
            content: '';
            position: absolute;
            bottom: -10px;
            right: 30px;
            border-width: 10px 10px 0;
            border-style: solid;
            border-color: white transparent;
        }
    </style>
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />

    <header>
        <h1 class="header">¡Aventura Matemática: Sumas y Restas!</h1>
    </header>

    <main class="container my-5">
        <div class="progress-container">
            <h4>¡Tu progreso matemático!</h4>
            <div class="progress">
                <div id="progress-bar" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
            </div>
        </div>
        
        <!-- Ejercicios de Suma -->
        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 1: ¡A Sumar!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="suma-num1" class="number-box"></span>
                <span class="operator">+</span>
                <span id="suma-num2" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="suma-respuesta" class="form-control ms-2">
                <button onclick="verificarSuma()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="suma-feedback" class="feedback hidden"></p>
        </section>
        
        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 2: ¡Sigue Sumando!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="suma-num3" class="number-box"></span>
                <span class="operator">+</span>
                <span id="suma-num4" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="suma-respuesta2" class="form-control ms-2">
                <button onclick="verificarSuma2()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="suma-feedback2" class="feedback hidden"></p>
        </section>

        <!-- Ejercicios de Resta -->
        <section class="card p-4 mb-4 exercise-card resta-card">
            <h3>Ejercicio 3: ¡A Restar!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="resta-num1" class="number-box"></span>
                <span class="operator">-</span>
                <span id="resta-num2" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="resta-respuesta" class="form-control ms-2">
                <button onclick="verificarResta()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="resta-feedback" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card resta-card">
            <h3>Ejercicio 4: ¡Sigue Restando!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="resta-num3" class="number-box"></span>
                <span class="operator">-</span>
                <span id="resta-num4" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="resta-respuesta2" class="form-control ms-2">
                <button onclick="verificarResta2()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="resta-feedback2" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card resta-card">
            <h3>Ejercicio 5: ¡Más Restas!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="resta-num5" class="number-box"></span>
                <span class="operator">-</span>
                <span id="resta-num6" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="resta-respuesta3" class="form-control ms-2">
                <button onclick="verificarResta3()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="resta-feedback3" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card resta-card">
            <h3>Ejercicio 6: ¡Último Reto!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="resta-num7" class="number-box"></span>
                <span class="operator">-</span>
                <span id="resta-num8" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="resta-respuesta4" class="form-control ms-2">
                <button onclick="verificarResta4()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="resta-feedback4" class="feedback hidden"></p>
        </section>

        <!-- Botones de acción -->
        <div class="action-buttons">
            <button onclick="repetirTodos()" class="btn btn-secondary">¡Nuevos Ejercicios!</button>
            <button onclick="window.location.href='Mates-Ejercicios.jsp'" class="btn btn-secondary btn-return">Regresar</button>
        </div>
    </main>

    <!-- Mascota animada -->
    <div class="animal-mascot">
        <div class="mascot-speech" id="mascot-speech">¡Hola! ¡Resuelve los ejercicios!</div>
    </div>

<script>
    let correctAnswers = 0;
    const totalExercises = 6;
    
    // Genera números aleatorios para los ejercicios de suma y resta
    function generarEjercicioSuma() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        document.getElementById('suma-num1').textContent = num1;
        document.getElementById('suma-num2').textContent = num2;
        document.getElementById('suma-respuesta').value = '';
        document.getElementById('suma-feedback').classList.add('hidden');
    }

    function generarEjercicioSuma2() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        document.getElementById('suma-num3').textContent = num1;
        document.getElementById('suma-num4').textContent = num2;
        document.getElementById('suma-respuesta2').value = '';
        document.getElementById('suma-feedback2').classList.add('hidden');
    }

    function generarEjercicioResta() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * num1) + 1;
        document.getElementById('resta-num1').textContent = num1;
        document.getElementById('resta-num2').textContent = num2;
        document.getElementById('resta-respuesta').value = '';
        document.getElementById('resta-feedback').classList.add('hidden');
    }

    function generarEjercicioResta2() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * num1) + 1;
        document.getElementById('resta-num3').textContent = num1;
        document.getElementById('resta-num4').textContent = num2;
        document.getElementById('resta-respuesta2').value = '';
        document.getElementById('resta-feedback2').classList.add('hidden');
    }

    function generarEjercicioResta3() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * num1) + 1;
        document.getElementById('resta-num5').textContent = num1;
        document.getElementById('resta-num6').textContent = num2;
        document.getElementById('resta-respuesta3').value = '';
        document.getElementById('resta-feedback3').classList.add('hidden');
    }

    function generarEjercicioResta4() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * num1) + 1;
        document.getElementById('resta-num7').textContent = num1;
        document.getElementById('resta-num8').textContent = num2;
        document.getElementById('resta-respuesta4').value = '';
        document.getElementById('resta-feedback4').classList.add('hidden');
    }

    // Crear confeti
    function createConfetti() {
        const colors = ['#FF5733', '#33C4FF', '#FFD133', '#33FF57', '#D633FF'];
        
        for (let i = 0; i < 50; i++) {
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

    // Actualizar barra de progreso
    function updateProgress() {
        const progressPercent = (correctAnswers / totalExercises) * 100;
        const progressBar = document.getElementById('progress-bar');
        progressBar.style.width = progressPercent + '%';
        progressBar.textContent = Math.round(progressPercent) + '%';
        
        // Si el progreso es 100%, mostrar confeti
        if (progressPercent === 100) {
            createConfetti();
            showMascotMessage('¡Felicidades! ¡Has completado todos los ejercicios! 🎉');
        }
    }

    // Mostrar mensaje de la mascota
    function showMascotMessage(message) {
        const mascotSpeech = document.getElementById('mascot-speech');
        mascotSpeech.textContent = message;
        mascotSpeech.style.display = 'block';
        
        setTimeout(() => {
            mascotSpeech.style.display = 'none';
        }, 5000);
    }

    // Verificación de respuestas
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
        feedback.classList.remove('hidden');
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
        feedback.classList.remove('hidden');
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
        feedback.classList.remove('hidden');
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
        feedback.classList.remove('hidden');
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
        feedback.classList.remove('hidden');
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
        feedback.classList.remove('hidden');
    }

    // Función para repetir todos los ejercicios
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

    // Inicializa ejercicios al cargar la página
    window.onload = function() {
        generarEjercicioSuma();
        generarEjercicioSuma2();
        generarEjercicioResta();
        generarEjercicioResta2();
        generarEjercicioResta3();
        generarEjercicioResta4();
        
        // Mostrar mensaje inicial de la mascota
        setTimeout(() => {
            showMascotMessage('¡Hola! ¡Vamos a practicar matemáticas!');
        }, 1000);
    };
</script>
</body>
</html>