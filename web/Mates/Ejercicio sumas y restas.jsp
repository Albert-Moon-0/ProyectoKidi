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
    <title>Ejercicios Interactivos: Suma y Resta</title>
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
        <h1 class="header">¡Practica tus Sumas y Restas!</h1>
    </header>

    <main class="container my-5">
    <!-- Ejercicios de Suma -->
    <section class="card p-4 mb-4">
        <h3>Ejercicio 1: Suma</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="suma-num1" class="me-2"></span> +
            <span id="suma-num2" class="ms-2 me-2"></span> =
            <input type="number" id="suma-respuesta" class="form-control w-auto ms-2">
            <button onclick="verificarSuma()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="suma-feedback" class="feedback hidden"></p>
    </section>
    
    <section class="card p-4 mb-4">
        <h3>Ejercicio 2: Suma</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="suma-num3" class="me-2"></span> +
            <span id="suma-num4" class="ms-2 me-2"></span> =
            <input type="number" id="suma-respuesta2" class="form-control w-auto ms-2">
            <button onclick="verificarSuma2()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="suma-feedback2" class="feedback hidden"></p>
    </section>

    <!-- Ejercicios de Resta -->
    <section class="card p-4 mb-4">
        <h3>Ejercicio 3: Resta</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="resta-num1" class="me-2"></span> -
            <span id="resta-num2" class="ms-2 me-2"></span> =
            <input type="number" id="resta-respuesta" class="form-control w-auto ms-2">
            <button onclick="verificarResta()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="resta-feedback" class="feedback hidden"></p>
    </section>

    <section class="card p-4 mb-4">
        <h3>Ejercicio 4: Resta</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="resta-num3" class="me-2"></span> -
            <span id="resta-num4" class="ms-2 me-2"></span> =
            <input type="number" id="resta-respuesta2" class="form-control w-auto ms-2">
            <button onclick="verificarResta2()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="resta-feedback2" class="feedback hidden"></p>
    </section>

    <section class="card p-4 mb-4">
        <h3>Ejercicio 5: Resta</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="resta-num5" class="me-2"></span> -
            <span id="resta-num6" class="ms-2 me-2"></span> =
            <input type="number" id="resta-respuesta3" class="form-control w-auto ms-2">
            <button onclick="verificarResta3()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="resta-feedback3" class="feedback hidden"></p>
    </section>

    <section class="card p-4 mb-4">
        <h3>Ejercicio 6: Resta</h3>
        <div class="d-flex align-items-center mb-3">
            <span id="resta-num7" class="me-2"></span> -
            <span id="resta-num8" class="ms-2 me-2"></span> =
            <input type="number" id="resta-respuesta4" class="form-control w-auto ms-2">
            <button onclick="verificarResta4()" class="btn btn-primary ms-3">Verificar</button>
        </div>
        <p id="resta-feedback4" class="feedback hidden"></p>
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

    // Verificación de respuestas
    function verificarSuma() {
        const num1 = parseInt(document.getElementById('suma-num1').textContent);
        const num2 = parseInt(document.getElementById('suma-num2').textContent);
        const respuesta = parseInt(document.getElementById('suma-respuesta').value);
        const feedback = document.getElementById('suma-feedback');

        if (respuesta === num1 + num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 + num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarSuma2() {
        const num1 = parseInt(document.getElementById('suma-num3').textContent);
        const num2 = parseInt(document.getElementById('suma-num4').textContent);
        const respuesta = parseInt(document.getElementById('suma-respuesta2').value);
        const feedback = document.getElementById('suma-feedback2');

        if (respuesta === num1 + num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 + num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarResta() {
        const num1 = parseInt(document.getElementById('resta-num1').textContent);
        const num2 = parseInt(document.getElementById('resta-num2').textContent);
        const respuesta = parseInt(document.getElementById('resta-respuesta').value);
        const feedback = document.getElementById('resta-feedback');

        if (respuesta === num1 - num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 - num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarResta2() {
        const num1 = parseInt(document.getElementById('resta-num3').textContent);
        const num2 = parseInt(document.getElementById('resta-num4').textContent);
        const respuesta = parseInt(document.getElementById('resta-respuesta2').value);
        const feedback = document.getElementById('resta-feedback2');

        if (respuesta === num1 - num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 - num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarResta3() {
        const num1 = parseInt(document.getElementById('resta-num5').textContent);
        const num2 = parseInt(document.getElementById('resta-num6').textContent);
        const respuesta = parseInt(document.getElementById('resta-respuesta3').value);
        const feedback = document.getElementById('resta-feedback3');

        if (respuesta === num1 - num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 - num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    function verificarResta4() {
        const num1 = parseInt(document.getElementById('resta-num7').textContent);
        const num2 = parseInt(document.getElementById('resta-num8').textContent);
        const respuesta = parseInt(document.getElementById('resta-respuesta4').value);
        const feedback = document.getElementById('resta-feedback4');

        if (respuesta === num1 - num2) {
            feedback.textContent = '¡Correcto! 🎉';
            feedback.style.color = 'green';
        } else {
            feedback.textContent = 'Intenta de nuevo. La respuesta correcta es ' + (num1 - num2) + '.';
            feedback.style.color = 'red';
        }
        feedback.classList.remove('hidden');
    }

    // Función para repetir todos los ejercicios
    function repetirTodos() {
        generarEjercicioSuma();
        generarEjercicioSuma2();
        generarEjercicioResta();
        generarEjercicioResta2();
        generarEjercicioResta3();
        generarEjercicioResta4();
    }

    // Inicializa ejercicios al cargar la página
    window.onload = function() {
        generarEjercicioSuma();
        generarEjercicioSuma2();
        generarEjercicioResta();
        generarEjercicioResta2();
        generarEjercicioResta3();
        generarEjercicioResta4();
    };
</script>


</body>
</html>
