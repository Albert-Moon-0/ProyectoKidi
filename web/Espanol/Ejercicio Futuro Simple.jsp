<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Ejercicio de Futuro Simple</title>
    <style>
        /* Estilos generales solo para el contenido específico del ejercicio */
        body {
            font-family: "Comic Sans MS", "Bubblegum Sans", "Marker Felt", cursive;
            background: linear-gradient(135deg, #c2e9fb 0%, #a1c4fd 100%);
            background-attachment: fixed;
            color: #3a3a3a;
        }

        /* Contenedor principal */
        .ejercicio-container {
            max-width: 650px;
            width: 90%;
            padding: 30px;
            background-color: #fff;
            border-radius: 25px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15), 0 0 40px rgba(71, 146, 245, 0.2);
            text-align: center;
            margin: 30px auto 80px auto;
            border: 8px solid #ffde59;
            position: relative;
        }

        .ejercicio-container::before {
            content: "¡Aprende español!";
            position: absolute;
            top: -20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #ffde59;
            color: #ff6b6b;
            padding: 5px 20px;
            border-radius: 15px;
            font-weight: bold;
            font-size: 1rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Títulos y textos */
        .ejercicio-container h2 {
            font-size: 1.8em;
            color: #ff6b6b;
            margin-bottom: 25px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
            font-weight: bold;
            letter-spacing: 0.5px;
        }

        .question {
            background-color: #f9f7ff;
            border-radius: 20px;
            padding: 15px;
            margin-bottom: 20px;
            border: 3px dashed #a1c4fd;
            transition: transform 0.3s ease;
        }

        .question:hover {
            transform: scale(1.02);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .question p {
            font-size: 1.2em;
            color: #444;
            margin: 12px 0;
            font-weight: 600;
        }

        .ejercicio-container select {
            padding: 10px 15px;
            font-size: 1.1em;
            border-radius: 15px;
            border: 3px solid #a1c4fd;
            background-color: #fff;
            width: 100%;
            max-width: 250px;
            margin: 0 auto;
            cursor: pointer;
            transition: all 0.3s ease;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23a1c4fd%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
            background-repeat: no-repeat;
            background-position: right 15px top 50%;
            background-size: 12px auto;
            text-align: center;
            font-weight: 500;
        }

        .ejercicio-container select:focus {
            border-color: #ff6b6b;
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 107, 107, 0.25);
        }

        /* Botones */
        .ejercicio-container .check-btn {
            background: linear-gradient(to right, #ff6b6b, #ff8e8e);
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 50px;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            margin-top: 25px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(255, 107, 107, 0.4);
        }

        .ejercicio-container .check-btn:hover {
            background: linear-gradient(to right, #ff5151, #ff7676);
            transform: translateY(-3px);
            box-shadow: 0 7px 15px rgba(255, 107, 107, 0.45);
        }

        .ejercicio-container .check-btn:active {
            transform: translateY(1px);
        }

        /* Retroalimentación */
        .feedback {
            margin-top: 25px;
            padding: 20px;
            border-radius: 20px;
            font-size: 1.1em;
            font-weight: bold;
            transform: scale(0.95);
            animation: popIn 0.5s forwards;
        }

        @keyframes popIn {
            0% {transform: scale(0.95); opacity: 0;}
            70% {transform: scale(1.05);}
            100% {transform: scale(1); opacity: 1;}
        }

        .feedback.correct {
            background-color: #d4ffea;
            color: #00a676;
            border: 3px solid #6de3b5;
        }

        .feedback.incorrect {
            background-color: #ffeeee;
            color: #ff5151;
            border: 3px solid #ffb6b9;
        }

        /* Decoraciones infantiles */
        .ejercicio-container::after {
            content: '';
            position: absolute;
            top: -45px;
            right: -25px;
            width: 70px;
            height: 70px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'%3E%3Cpath fill='%23ffde59' d='M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.3 0-200-89.7-200-200S145.7 56 256 56s200 89.7 200 200-89.7 200-200 200zm-32-316c0 17.7-14.3 32-32 32s-32-14.3-32-32 14.3-32 32-32 32 14.3 32 32zm128 0c0 17.7-14.3 32-32 32s-32-14.3-32-32 14.3-32 32-32 32 14.3 32 32zm-96 96c35.3 0 64 28.7 64 64v48c0 8.8-7.2 16-16 16h-96c-8.8 0-16-7.2-16-16v-48c0-35.3 28.7-64 64-64z'/%3E%3C/svg%3E");
            background-size: contain;
            transform: rotate(15deg);
            z-index: 1;
        }

        /* Botón de regresar personalizado */
        .ejercicio-container .return-btn {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            border: none;
            border-radius: 50px;
            box-shadow: 0 4px 10px rgba(79, 172, 254, 0.4);
            padding: 10px 20px;
            font-weight: bold;
            color: white;
        }

        .ejercicio-container .return-btn:hover {
            background: linear-gradient(to right, #3a8fdd, #00d4e0);
            transform: translateY(-3px);
            box-shadow: 0 7px 15px rgba(79, 172, 254, 0.45);
        }

        /* Efectos especiales para niños */
        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(5deg); }
            100% { transform: translateY(0px) rotate(0deg); }
        }

        .ejercicio-container h2::first-letter {
            font-size: 1.5em;
            color: #4facfe;
        }

        /* Adaptación para dispositivos móviles */
        @media (max-width: 768px) {
            .ejercicio-container {
                width: 95%;
                padding: 20px;
            }
            
            .ejercicio-container h2 {
                font-size: 1.5em;
            }
            
            .question p {
                font-size: 1.1em;
            }
        }
    </style>
    <link rel="stylesheet" href="../Sistema/Estilos.css" />
</head>
<body>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />

    
    <div class="ejercicio-container">
        <h2>¡Completa las Oraciones en Futuro Simple!</h2>
        
        <!-- Questions -->
        <div class="question">
            <p>1. Mañana yo ____ (estudiar) para el examen de matemáticas.</p>
            <select id="question1">
                <option value="">Elige una palabra</option>
                <option value="estudiaré">estudiaré</option>
                <option value="estudiarás">estudiarás</option>
                <option value="estudiará">estudiará</option>
            </select>
        </div>

        <div class="question">
            <p>2. Nosotros ____ (visitar) a nuestros abuelos el próximo fin de semana.</p>
            <select id="question2">
                <option value="">Elige una palabra</option>
                <option value="visitaremos">visitaremos</option>
                <option value="visitarán">visitarán</option>
                <option value="visitaré">visitaré</option>
            </select>
        </div>

        <div class="question">
            <p>3. Ellos ____ (salir) de viaje el próximo mes.</p>
            <select id="question3">
                <option value="">Elige una palabra</option>
                <option value="saldrán">saldrán</option>
                <option value="saldrá">saldrá</option>
                <option value="saldré">saldré</option>
            </select>
        </div>

        <div class="question">
            <p>4. Tú ____ (comprar) los boletos para el concierto esta semana.</p>
            <select id="question4">
                <option value="">Elige una palabra</option>
                <option value="comprarás">comprarás</option>
                <option value="compraré">compraré</option>
                <option value="comprará">comprará</option>
            </select>
        </div>

        <div class="question">
            <p>5. Ella ____ (trabajar) en el nuevo proyecto a partir de la próxima semana.</p>
            <select id="question5">
                <option value="">Elige una palabra</option>
                <option value="trabajará">trabajará</option>
                <option value="trabajarán">trabajarán</option>
                <option value="trabajaré">trabajaré</option>
            </select>
        </div>

        <button onclick="checkAnswers()" class="check-btn">¡Revisar Respuestas!</button>

        <div id="feedback" class="feedback" style="display: none;"></div>
        <br>
        <button onclick="window.location.href='Espanol-EjerciciosGramatica.jsp'" class="return-btn">Regresar</button>
    </div>

   
    <script>
        function checkAnswers() {
            const answers = {
                question1: "estudiaré",
                question2: "visitaremos",
                question3: "saldrán",
                question4: "comprarás",
                question5: "trabajará"
            };

            let correct = 0;
            let totalQuestions = 5;

            // Validar respuestas
            for (let key in answers) {
                const userAnswer = document.getElementById(key).value;
                if (userAnswer === answers[key]) {
                    correct++;
                }
            }

            const feedbackDiv = document.getElementById("feedback");
            feedbackDiv.style.display = "block";

            if (correct === totalQuestions) {
                feedbackDiv.className = "feedback correct";
                feedbackDiv.innerHTML = "¡FANTÁSTICO! ? ¡Has completado todas las oraciones correctamente! ¡Eres un/a campeón/a del futuro simple!";
            } else {
                feedbackDiv.className = "feedback incorrect";
                feedbackDiv.innerHTML = `¡Has acertado ${correct} de ${totalQuestions}! ? ¡Sigue practicando y pronto serás experto/a en el futuro simple!`;
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>