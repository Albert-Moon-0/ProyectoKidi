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
    <title>Ejercicios Interactivos: Multiplicaciones</title>
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
        <h1 class="header">¡Practica tus Multiplicaciones!</h1>
    </header>

    <main class="container my-5">
    <!-- Ejercicios de Multiplicación -->
    <section class="card p-4 mb-4">
        <h3>Ejercicio 1: Multiplicación</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="multiplicacion-num1" class="me-2"></span> ×
            <span id="multiplicacion-num2" class="ms-2 me-2"></span> =
            <input type="number" id="multiplicacion-respuesta" class="form-control w-auto ms-2">
            <button onclick="verificarMultiplicacion()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="multiplicacion-feedback" class="feedback hidden"></p>
    </section>
    
    <section class="card p-4 mb-4">
        <h3>Ejercicio 2: Multiplicación</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="multiplicacion-num3" class="me-2"></span> ×
            <span id="multiplicacion-num4" class="ms-2 me-2"></span> =
            <input type="number" id="multiplicacion-respuesta2" class="form-control w-auto ms-2">
            <button onclick="verificarMultiplicacion2()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="multiplicacion-feedback2" class="feedback hidden"></p>
    </section>

    <!-- Ejercicios de Multiplicación (más) -->
    <section class="card p-4 mb-4">
        <h3>Ejercicio 3: Multiplicación</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="multiplicacion-num5" class="me-2"></span> ×
            <span id="multiplicacion-num6" class="ms-2 me-2"></span> =
            <input type="number" id="multiplicacion-respuesta3" class="form-control w-auto ms-2">
            <button onclick="verificarMultiplicacion3()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="multiplicacion-feedback3" class="feedback hidden"></p>
    </section>

    <section class="card p-4 mb-4">
        <h3>Ejercicio 4: Multiplicación</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="multiplicacion-num7" class="me-2"></span> ×
            <span id="multiplicacion-num8" class="ms-2 me-2"></span> =
            <input type="number" id="multiplicacion-respuesta4" class="form-control w-auto ms-2">
            <button onclick="verificarMultiplicacion4()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="multiplicacion-feedback4" class="feedback hidden"></p>
    </section>

    <section class="card p-4 mb-4">
        <h3>Ejercicio 5: Multiplicación</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="multiplicacion-num9" class="me-2"></span> ×
            <span id="multiplicacion-num10" class="ms-2 me-2"></span> =
            <input type="number" id="multiplicacion-respuesta5" class="form-control w-auto ms-2">
            <button onclick="verificarMultiplicacion5()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="multiplicacion-feedback5" class="feedback hidden"></p>
    </section>

    <section class="card p-4 mb-4">
        <h3>Ejercicio 6: Multiplicación</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="multiplicacion-num11" class="me-2"></span> ×
            <span id="multiplicacion-num12" class="ms-2 me-2"></span> =
            <input type="number" id="multiplicacion-respuesta6" class="form-control w-auto ms-2">
            <button onclick="verificarMultiplicacion6()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="multiplicacion-feedback6" class="feedback hidden"></p>
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
    // Genera números aleatorios para los ejercicios de multiplicación
    function generarEjercicioMultiplicacion() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        document.getElementById('multiplicacion-num1').textContent = num1;
        document.getElementById('multiplicacion-num2').textContent = num2;
        document.getElementById('multiplicacion-respuesta').value = '';
        document.getElementById('multiplicacion-feedback').classList.add('hidden');
    }

    function generarEjercicioMultiplicacion2() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        document.getElementById('multiplicacion-num3').textContent = num1;
        document.getElementById('multiplicacion-num4').textContent = num2;
        document.getElementById('multiplicacion-respuesta2').value = '';
        document.getElementById('multiplicacion-feedback2').classList.add('hidden');
    }

    function generarEjercicioMultiplicacion3() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        document.getElementById('multiplicacion-num5').textContent = num1;
        document.getElementById('multiplicacion-num6').textContent = num2;
        document.getElementById('multiplicacion-respuesta3').value = '';
        document.getElementById('multiplicacion-feedback3').classList.add('hidden');
    }

    function generarEjercicioMultiplicacion4() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        document.getElementById('multiplicacion-num7').textContent = num1;
        document.getElementById('multiplicacion-num8').textContent = num2;
        document.getElementById('multiplicacion-respuesta4').value = '';
        document.getElementById('multiplicacion-feedback4').classList.add('hidden');
    }

    function generarEjercicioMultiplicacion5() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        document.getElementById('multiplicacion-num9').textContent = num1;
        document.getElementById('multiplicacion-num10').textContent = num2;
        document.getElementById('multiplicacion-respuesta5').value = '';
        document.getElementById('multiplicacion-feedback5').classList.add('hidden');
    }

    function generarEjercicioMultiplicacion6() {
        const num1 = Math.floor(Math.random() * 10) + 1;
        const num2 = Math.floor(Math.random() * 10) + 1;
        document.getElementById('multiplicacion-num11').textContent = num1;
        document.getElementById('multiplicacion-num12').textContent = num2;
        document.getElementById('multiplicacion-respuesta6').value = '';
        document.getElementById('multiplicacion-feedback6').classList.add('hidden');
    }

    // Verificación de respuestas
    function verificarMultiplicacion() {
        const num1 = parseInt(document.getElementById('multiplicacion-num1').textContent);
        const num2 = parseInt(document.getElementById('multiplicacion-num2').textContent);
        const respuesta = parseInt(document.getElementById('multiplicacion-respuesta').value);
        const feedback = document.getElementById('multiplicacion-feedback');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 * num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarMultiplicacion2() {
        const num1 = parseInt(document.getElementById('multiplicacion-num3').textContent);
        const num2 = parseInt(document.getElementById('multiplicacion-num4').textContent);
        const respuesta = parseInt(document.getElementById('multiplicacion-respuesta2').value);
        const feedback = document.getElementById('multiplicacion-feedback2');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 * num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarMultiplicacion3() {
        const num1 = parseInt(document.getElementById('multiplicacion-num5').textContent);
        const num2 = parseInt(document.getElementById('multiplicacion-num6').textContent);
        const respuesta = parseInt(document.getElementById('multiplicacion-respuesta3').value);
        const feedback = document.getElementById('multiplicacion-feedback3');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 * num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarMultiplicacion4() {
        const num1 = parseInt(document.getElementById('multiplicacion-num7').textContent);
        const num2 = parseInt(document.getElementById('multiplicacion-num8').textContent);
        const respuesta = parseInt(document.getElementById('multiplicacion-respuesta4').value);
        const feedback = document.getElementById('multiplicacion-feedback4');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 * num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarMultiplicacion5() {
        const num1 = parseInt(document.getElementById('multiplicacion-num9').textContent);
        const num2 = parseInt(document.getElementById('multiplicacion-num10').textContent);
        const respuesta = parseInt(document.getElementById('multiplicacion-respuesta5').value);
        const feedback = document.getElementById('multiplicacion-feedback5');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 * num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarMultiplicacion6() {
        const num1 = parseInt(document.getElementById('multiplicacion-num11').textContent);
        const num2 = parseInt(document.getElementById('multiplicacion-num12').textContent);
        const respuesta = parseInt(document.getElementById('multiplicacion-respuesta6').value);
        const feedback = document.getElementById('multiplicacion-feedback6');

        if (respuesta === num1 * num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 * num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    // Función para repetir todos los ejercicios
    function repetirTodos() {
        generarEjercicioMultiplicacion();
        generarEjercicioMultiplicacion2();
        generarEjercicioMultiplicacion3();
        generarEjercicioMultiplicacion4();
        generarEjercicioMultiplicacion5();
        generarEjercicioMultiplicacion6();
    }

    // Inicializa ejercicios al cargar la página
    window.onload = function() {
        generarEjercicioMultiplicacion();
        generarEjercicioMultiplicacion2();
        generarEjercicioMultiplicacion3();
        generarEjercicioMultiplicacion4();
        generarEjercicioMultiplicacion5();
        generarEjercicioMultiplicacion6();
    };
</script>


</body>
</html>
