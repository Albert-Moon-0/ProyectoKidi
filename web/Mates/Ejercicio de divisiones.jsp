<%-- 
    Document   : Ejercicio de divisiones
    Created on : 5 nov. 2024, 18:17:47
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>¡Aventura Matemática: Divisiones!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="estilosEjerc.css">
    <link rel="stylesheet" href="../Sistema/Estilos.css" />
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />

    <header>
        <h1 class="header">¡Aventura Matemática: Divisiones!</h1>
    </header>

    <main class="container my-5">
        <div class="progress-container">
            <h4>¡Tu progreso matemático!</h4>
            <div class="progress">
                <div id="progress-bar" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
            </div>
        </div>
        
        <!-- Ejercicios de División -->
        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 1: ¡A Dividir!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="division-num1" class="number-box"></span>
                <span class="operator">÷</span>
                <span id="division-num2" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="division-respuesta" class="form-control ms-2">
                <button onclick="verificarDivision()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="division-feedback" class="feedback hidden"></p>
        </section>
        
        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 2: ¡Sigue Dividiendo!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="division-num3" class="number-box"></span>
                <span class="operator">÷</span>
                <span id="division-num4" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="division-respuesta2" class="form-control ms-2">
                <button onclick="verificarDivision2()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="division-feedback2" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 3: ¡Divide Más!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="division-num5" class="number-box"></span>
                <span class="operator">÷</span>
                <span id="division-num6" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="division-respuesta3" class="form-control ms-2">
                <button onclick="verificarDivision3()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="division-feedback3" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 4: ¡Problemas de División!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="division-num7" class="number-box"></span>
                <span class="operator">÷</span>
                <span id="division-num8" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="division-respuesta4" class="form-control ms-2">
                <button onclick="verificarDivision4()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="division-feedback4" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 5: ¡Divide con Cuidado!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="division-num9" class="number-box"></span>
                <span class="operator">÷</span>
                <span id="division-num10" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="division-respuesta5" class="form-control ms-2">
                <button onclick="verificarDivision5()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="division-feedback5" class="feedback hidden"></p>
        </section>

        <section class="card p-4 mb-4 exercise-card suma-card">
            <h3>Ejercicio 6: ¡Último Desafío!</h3>
            <div class="d-flex align-items-center mb-3">
                <span id="division-num11" class="number-box"></span>
                <span class="operator">÷</span>
                <span id="division-num12" class="number-box"></span>
                <span class="operator">=</span>
                <input type="number" id="division-respuesta6" class="form-control ms-2">
                <button onclick="verificarDivision6()" class="btn btn-primary ms-3">¡Comprobar!</button>
            </div>
            <p id="division-feedback6" class="feedback hidden"></p>
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
    
    // Genera números aleatorios para los ejercicios de división
    function generarEjercicioDivision() {
        const num2 = Math.floor(Math.random() * 10) + 1; // No puede ser cero
        const num1 = num2 * (Math.floor(Math.random() * 10) + 1); // Se asegura que num1 sea múltiplo de num2
        document.getElementById('division-num1').textContent = num1;
        document.getElementById('division-num2').textContent = num2;
        document.getElementById('division-respuesta').value = '';
        document.getElementById('division-feedback').classList.add('hidden');
    }

    function generarEjercicioDivision2() {
        const num2 = Math.floor(Math.random() * 10) + 1; // No puede ser cero
        const num1 = num2 * (Math.floor(Math.random() * 10) + 1); // Se asegura que num1 sea múltiplo de num2
        document.getElementById('division-num3').textContent = num1;
        document.getElementById('division-num4').textContent = num2;
        document.getElementById('division-respuesta2').value = '';
        document.getElementById('division-feedback2').classList.add('hidden');
    }

    function generarEjercicioDivision3() {
        const num2 = Math.floor(Math.random() * 10) + 1; // No puede ser cero
        const num1 = num2 * (Math.floor(Math.random() * 10) + 1); // Se asegura que num1 sea múltiplo de num2
        document.getElementById('division-num5').textContent = num1;
        document.getElementById('division-num6').textContent = num2;
        document.getElementById('division-respuesta3').value = '';
        document.getElementById('division-feedback3').classList.add('hidden');
    }

    function generarEjercicioDivision4() {
        const num2 = Math.floor(Math.random() * 10) + 1; // No puede ser cero
        const num1 = num2 * (Math.floor(Math.random() * 10) + 1); // Se asegura que num1 sea múltiplo de num2
        document.getElementById('division-num7').textContent = num1;
        document.getElementById('division-num8').textContent = num2;
        document.getElementById('division-respuesta4').value = '';
        document.getElementById('division-feedback4').classList.add('hidden');
    }

    function generarEjercicioDivision5() {
        const num2 = Math.floor(Math.random() * 10) + 1; // No puede ser cero
        const num1 = num2 * (Math.floor(Math.random() * 10) + 1); // Se asegura que num1 sea múltiplo de num2
        document.getElementById('division-num9').textContent = num1;
        document.getElementById('division-num10').textContent = num2;
        document.getElementById('division-respuesta5').value = '';
        document.getElementById('division-feedback5').classList.add('hidden');
    }

    function generarEjercicioDivision6() {
        const num2 = Math.floor(Math.random() * 10) + 1; // No puede ser cero
        const num1 = num2 * (Math.floor(Math.random() * 10) + 1); // Se asegura que num1 sea múltiplo de num2
        document.getElementById('division-num11').textContent = num1;
        document.getElementById('division-num12').textContent = num2;
        document.getElementById('division-respuesta6').value = '';
        document.getElementById('division-feedback6').classList.add('hidden');
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
            showMascotMessage('¡Felicidades! ¡Has completado todos los ejercicios de división! 🎉');
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
    function verificarDivision() {
        const num1 = parseInt(document.getElementById('division-num1').textContent);
        const num2 = parseInt(document.getElementById('division-num2').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta').value);
        const feedback = document.getElementById('division-feedback');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! ¡Eres genial dividiendo! 🎉';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Muy bien! ¡Sigue así con las divisiones!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 / num2) + '. ¡Inténtalo de nuevo!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡No te rindas! ¡Las divisiones son divertidas!');
        }
        feedback.classList.remove('hidden');
    }

    function verificarDivision2() {
        const num1 = parseInt(document.getElementById('division-num3').textContent);
        const num2 = parseInt(document.getElementById('division-num4').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta2').value);
        const feedback = document.getElementById('division-feedback2');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! ¡Eres un experto en divisiones! 🌟';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Excelente división!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 / num2) + '. ¡Sigue practicando!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Sigue intentando con las divisiones!');
        }
        feedback.classList.remove('hidden');
    }

    function verificarDivision3() {
        const num1 = parseInt(document.getElementById('division-num5').textContent);
        const num2 = parseInt(document.getElementById('division-num6').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta3').value);
        const feedback = document.getElementById('division-feedback3');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! ¡Eres un campeón de las divisiones! 🏆';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Eres muy bueno dividiendo!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 / num2) + '. ¡Sigue adelante!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Las divisiones son un reto divertido!');
        }
        feedback.classList.remove('hidden');
    }

    function verificarDivision4() {
        const num1 = parseInt(document.getElementById('division-num7').textContent);
        const num2 = parseInt(document.getElementById('division-num8').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta4').value);
        const feedback = document.getElementById('division-feedback4');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! ¡Eres increíble con las matemáticas! 🌈';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Wow! ¡Qué bien divides!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 / num2) + '. ¡No te rindas!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Un poco más de práctica con las divisiones!');
        }
        feedback.classList.remove('hidden');
    }

    function verificarDivision5() {
        const num1 = parseInt(document.getElementById('division-num9').textContent);
        const num2 = parseInt(document.getElementById('division-num10').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta5').value);
        const feedback = document.getElementById('division-feedback5');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! ¡Eres un matemático experto! 🧠';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Eres un genio dividiendo!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 / num2) + '. ¡Sigue practicando!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Intenta una vez más!');
        }
        feedback.classList.remove('hidden');
    }

    function verificarDivision6() {
        const num1 = parseInt(document.getElementById('division-num11').textContent);
        const num2 = parseInt(document.getElementById('division-num12').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta6').value);
        const feedback = document.getElementById('division-feedback6');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! ¡Eres un verdadero héroe de las divisiones! 🦸';
            feedback.className = 'feedback correct';
            correctAnswers++;
            updateProgress();
            showMascotMessage('¡Lo lograste! ¡Eres asombroso con las matemáticas!');
        } else {
            feedback.textContent = '¡Casi! La respuesta correcta es ' + (num1 / num2) + '. ¡Sigue intentando!';
            feedback.className = 'feedback incorrect';
            showMascotMessage('¡Estás muy cerca de dominar las divisiones!');
        }
        feedback.classList.remove('hidden');
    }

    // Función para repetir todos los ejercicios
    function repetirTodos() {
        correctAnswers = 0;
        updateProgress();
        generarEjercicioDivision();
        generarEjercicioDivision2();
        generarEjercicioDivision3();
        generarEjercicioDivision4();
        generarEjercicioDivision5();
        generarEjercicioDivision6();
        showMascotMessage('¡Nuevos ejercicios de división! ¡A resolver!');
    }

    // Inicializa ejercicios al cargar la página
    window.onload = function() {
        generarEjercicioDivision();
        generarEjercicioDivision2();
        generarEjercicioDivision3();
        generarEjercicioDivision4();
        generarEjercicioDivision5();
        generarEjercicioDivision6();
        
        // Mostrar mensaje inicial de la mascota
        setTimeout(() => {
            showMascotMessage('¡Hola! ¡Vamos a practicar las divisiones!');
        }, 1000);
    };
</script>
</body>
</html>