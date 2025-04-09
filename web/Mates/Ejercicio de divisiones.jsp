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
    <title>Ejercicios Interactivos: Divisiones</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <style>
        .header {
            text-align: center;
            font-size: 2.5rem;
            font-weight: bold;
            margin: 20px 0;
            color: var(--primary-color);
        }
        .feedback {
            font-weight: bold;
            font-size: 1.2rem;
            margin-top: 10px;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />

    <header>
        <h1 class="header">¡Practica tus Divisiones!</h1>
    </header>

    <main class="container my-5">
    <!-- Ejercicios de División -->
    <section class="card p-4 mb-4">
        <h3>Ejercicio 1: División</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="division-num1" class="me-2"></span> ÷
            <span id="division-num2" class="ms-2 me-2"></span> =
            <input type="number" id="division-respuesta" class="form-control w-auto ms-2">
            <button onclick="verificarDivision()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="division-feedback" class="feedback hidden"></p>
    </section>
    
    <section class="card p-4 mb-4">
        <h3>Ejercicio 2: División</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="division-num3" class="me-2"></span> ÷
            <span id="division-num4" class="ms-2 me-2"></span> =
            <input type="number" id="division-respuesta2" class="form-control w-auto ms-2">
            <button onclick="verificarDivision2()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="division-feedback2" class="feedback hidden"></p>
    </section>

    <!-- Ejercicios de División (más) -->
    <section class="card p-4 mb-4">
        <h3>Ejercicio 3: División</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="division-num5" class="me-2"></span> ÷
            <span id="division-num6" class="ms-2 me-2"></span> =
            <input type="number" id="division-respuesta3" class="form-control w-auto ms-2">
            <button onclick="verificarDivision3()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="division-feedback3" class="feedback hidden"></p>
    </section>

    <section class="card p-4 mb-4">
        <h3>Ejercicio 4: División</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="division-num7" class="me-2"></span> ÷
            <span id="division-num8" class="ms-2 me-2"></span> =
            <input type="number" id="division-respuesta4" class="form-control w-auto ms-2">
            <button onclick="verificarDivision4()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="division-feedback4" class="feedback hidden"></p>
    </section>

    <section class="card p-4 mb-4">
        <h3>Ejercicio 5: División</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="division-num9" class="me-2"></span> ÷
            <span id="division-num10" class="ms-2 me-2"></span> =
            <input type="number" id="division-respuesta5" class="form-control w-auto ms-2">
            <button onclick="verificarDivision5()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="division-feedback5" class="feedback hidden"></p>
    </section>

    <section class="card p-4 mb-4">
        <h3>Ejercicio 6: División</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="division-num11" class="me-2"></span> ÷
            <span id="division-num12" class="ms-2 me-2"></span> =
            <input type="number" id="division-respuesta6" class="form-control w-auto ms-2">
            <button onclick="verificarDivision6()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="division-feedback6" class="feedback hidden"></p>
    </section>

    <!-- Botón para repetir todos los ejercicios -->
    <div class="text-center mt-4">
        <button onclick="repetirTodos()" class="btn btn-secondary">Repetir Todos</button>
    </div>

    <!-- Botón para regresar a la página anterior -->
    <div class="text-center mt-4">
        <button onclick="window.location.href='Mates-Ejercicios.jsp'" class="btn btn-primary">Regresar </button>
    </div>
</main>

<script>
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

    // Verificación de respuestas
    function verificarDivision() {
        const num1 = parseInt(document.getElementById('division-num1').textContent);
        const num2 = parseInt(document.getElementById('division-num2').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta').value);
        const feedback = document.getElementById('division-feedback');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 / num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarDivision2() {
        const num1 = parseInt(document.getElementById('division-num3').textContent);
        const num2 = parseInt(document.getElementById('division-num4').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta2').value);
        const feedback = document.getElementById('division-feedback2');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 / num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarDivision3() {
        const num1 = parseInt(document.getElementById('division-num5').textContent);
        const num2 = parseInt(document.getElementById('division-num6').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta3').value);
        const feedback = document.getElementById('division-feedback3');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 / num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarDivision4() {
        const num1 = parseInt(document.getElementById('division-num7').textContent);
        const num2 = parseInt(document.getElementById('division-num8').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta4').value);
        const feedback = document.getElementById('division-feedback4');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 / num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarDivision5() {
        const num1 = parseInt(document.getElementById('division-num9').textContent);
        const num2 = parseInt(document.getElementById('division-num10').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta5').value);
        const feedback = document.getElementById('division-feedback5');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 / num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarDivision6() {
        const num1 = parseInt(document.getElementById('division-num11').textContent);
        const num2 = parseInt(document.getElementById('division-num12').textContent);
        const respuesta = parseInt(document.getElementById('division-respuesta6').value);
        const feedback = document.getElementById('division-feedback6');

        if (respuesta === num1 / num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 / num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    // Función para repetir todos los ejercicios
    function repetirTodos() {
        generarEjercicioDivision();
        generarEjercicioDivision2();
        generarEjercicioDivision3();
        generarEjercicioDivision4();
        generarEjercicioDivision5();
        generarEjercicioDivision6();
    }

    // Inicializa ejercicios al cargar la página
    window.onload = function() {
        generarEjercicioDivision();
        generarEjercicioDivision2();
        generarEjercicioDivision3();
        generarEjercicioDivision4();
        generarEjercicioDivision5();
        generarEjercicioDivision6();
    };
</script>



</body>
</html>

