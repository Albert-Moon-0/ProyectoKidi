<%-- 
    Document   : Ejercicio multiplicaciones
    Created on : 5 nov. 2024, 18:14:23
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>¡Aventura Matemática: Multiplicaciones!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="estilosEjerc.css">    
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />

    <header>
        <h1 class="header">¡Aventura Matemática: Multiplicaciones!</h1>
    </header>

    <main class="container my-5">
        <div class="progress-container">
            <h4>¡Tu progreso matemático!</h4>
            <div class="progress">
                <div id="progress-bar" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
            </div>
        </div>
        
        <!-- Ejercicios de Multiplicación -->
        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 1: ¡A Multiplicar!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num1" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num2" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta" class="form-control ms-2">
                <button onclick="verificarMulti()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback" class="feedback hidden"></p>
        </section>
        
        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 2: ¡Sigue Multiplicando!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num3" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num4" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta2" class="form-control ms-2">
                <button onclick="verificarMulti2()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback2" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 3: ¡Multiplica Más!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num5" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num6" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta3" class="form-control ms-2">
                <button onclick="verificarMulti3()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback3" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 4: ¡Tablas de Multiplicar!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num7" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num8" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta4" class="form-control ms-2">
                <button onclick="verificarMulti4()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback4" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 5: ¡Multiplica con Cuidado!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num9" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num10" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta5" class="form-control ms-2">
                <button onclick="verificarMulti5()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback5" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 6: ¡Último Desafío!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="multi-num11" class="number-box"></span>
                <span class="operator">×</span>
                <span id="multi-num12" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="multi-respuesta6" class="form-control ms-2">
                <button onclick="verificarMulti6()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="multi-feedback6" class="feedback hidden"></p>
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
    
    // Genera números aleatorios para los ejercicios de multiplicación
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
            showMascotMessage('¡Felicidades! ¡Has completado todos los ejercicios de multiplicación! 🎉');
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
    function verificarMulti() {
        const num1 = parseInt(document.getElementById('multi-num1').textContent);
        const num2 = parseInt(document.getElementById('multi-num2').textContent);
        const respuesta = parseInt(document.getElementById('multi-respuesta').value);
        const feedback = document.getElementById('multi-feedback');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! ¡Eres genial multiplicando! 🎉';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Muy bien! ¡Sigue así con las multiplicaciones!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 * num2) + '. ¡Inténtalo de nuevo!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡No te rindas! ¡Las multiplicaciones son divertidas!');
        }
        feedback.classList.remove('hidden');
    }

    function verificarMulti2() {
        const num1 = parseInt(document.getElementById('multi-num3').textContent);
        const num2 = parseInt(document.getElementById('multi-num4').textContent);
        const respuesta = parseInt(document.getElementById('multi-respuesta2').value);
        const feedback = document.getElementById('multi-feedback2');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! ¡Eres un experto en tablas de multiplicar! 🌟';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Excelente multiplicación!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 * num2) + '. ¡Sigue practicando!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Sigue intentando con las tablas!');
        }
        feedback.classList.remove('hidden');
    }

    function verificarMulti3() {
        const num1 = parseInt(document.getElementById('multi-num5').textContent);
        const num2 = parseInt(document.getElementById('multi-num6').textContent);
        const respuesta = parseInt(document.getElementById('multi-respuesta3').value);
        const feedback = document.getElementById('multi-feedback3');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! ¡Eres un campeón de las multiplicaciones! 🏆';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Eres muy bueno multiplicando!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 * num2) + '. ¡Sigue adelante!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Las multiplicaciones son un reto divertido!');
        }
        feedback.classList.remove('hidden');
    }

    function verificarMulti4() {
        const num1 = parseInt(document.getElementById('multi-num7').textContent);
        const num2 = parseInt(document.getElementById('multi-num8').textContent);
        const respuesta = parseInt(document.getElementById('multi-respuesta4').value);
        const feedback = document.getElementById('multi-feedback4');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! ¡Eres increíble con las matemáticas! 🌈';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Wow! ¡Qué bien multiplicas!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 * num2) + '. ¡No te rindas!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Un poco más de práctica con las tablas!');
        }
        feedback.classList.remove('hidden');
    }

    function verificarMulti5() {
        const num1 = parseInt(document.getElementById('multi-num9').textContent);
        const num2 = parseInt(document.getElementById('multi-num10').textContent);
        const respuesta = parseInt(document.getElementById('multi-respuesta5').value);
        const feedback = document.getElementById('multi-feedback5');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! ¡Eres un matemático experto! 🧠';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Eres un genio multiplicando!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 * num2) + '. ¡Sigue practicando!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Intenta una vez más!');
        }
        feedback.classList.remove('hidden');
    }

    function verificarMulti6() {
        const num1 = parseInt(document.getElementById('multi-num11').textContent);
        const num2 = parseInt(document.getElementById('multi-num12').textContent);
        const respuesta = parseInt(document.getElementById('multi-respuesta6').value);
        const feedback = document.getElementById('multi-feedback6');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! ¡Eres un verdadero héroe de las multiplicaciones! 🦸';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Lo lograste! ¡Eres asombroso con las matemáticas!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 * num2) + '. ¡Sigue intentando!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Estás muy cerca de dominar las multiplicaciones!');
        }
        feedback.classList.remove('hidden');
    }

    // Función para repetir todos los ejercicios
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

    // Inicializa ejercicios al cargar la página
    window.onload = function() {
        generarEjercicioMulti();
        generarEjercicioMulti2();
        generarEjercicioMulti3();
        generarEjercicioMulti4();
        generarEjercicioMulti5();
        generarEjercicioMulti6();
        
        // Mostrar mensaje inicial de la mascota
        setTimeout(() => {
            showMascotMessage('¡Hola! ¡Vamos a practicar las tablas de multiplicar!');
        }, 1000);
    };
</script>
</body>
</html>