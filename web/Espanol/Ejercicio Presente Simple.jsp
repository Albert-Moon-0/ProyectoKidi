<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio de Futuro Simple</title>
    <style>
        /* Estilos generales para el cuerpo y diseño */
        body {
            font-family: "Comic Sans MS", Arial, sans-serif;
            background-color: #eaf7f9;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            min-height: 100vh;
            color: #333;
            padding-left: 180px;
        }

        /* Contenedor principal */
        .container {
            max-width: 600px;
            width: 90%;
            padding: 20px;
            background-color: #fffbf0;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 20px;
            margin-bottom: 80px;
        }

        /* Títulos y textos */
        h2 {
            font-size: 1.6em;
            color: #5a5a5a;
            margin-bottom: 20px;
        }

        .question p {
            font-size: 1.1em;
            color: #444;
            margin: 12px 0;
        }

        select {
            padding: 8px;
            font-size: 1em;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #fff;
            width: 100%;
            max-width: 250px;
            margin: 0 auto;
        }

        /* Botones */
        button {
            background-color: #6fcf97;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #82d5a5;
        }

        /* Retroalimentación */
        .feedback {
            margin-top: 18px;
            padding: 16px;
            border-radius: 10px;
            font-size: 1em;
        }

        .feedback.correct {
            background-color: #dafaf0;
            color: #217759;
        }

        .feedback.incorrect {
            background-color: #ffe6e6;
            color: #a94442;
        }

        /* Botón de regresar */
        #backButton {
            background-color: #ffb6b9;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 0.9em;
            cursor: pointer;
            position: fixed;
            bottom: 20px;
            right: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        #backButton:hover {
            background-color: #ff999d;
        }
    </style>
</head>
<body>
    
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
        <div class="container">
        <h2>Completa las Oraciones en Futuro Simple</h2>
        
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

        <button onclick="checkAnswers()">¡Revisar Respuestas!</button>

        <div id="feedback" class="feedback" style="display: none;"></div>
        <br>
        <button onclick="window.location.href='Espanol-EjerciciosGramatica.jsp'" class="btn btn-primary">Regresar </button
    </div>

    <!-- Botón de regresar al inicio -->
    

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
                feedbackDiv.innerHTML = "¡Excelente! ¡Tienes todas las respuestas correctas!";
            } else {
                feedbackDiv.className = "feedback incorrect";
                feedbackDiv.innerHTML = `Tienes ${correct} de ${totalQuestions} correctas. ¡Sigue intentándolo!`;
            }
        }

    </script>
</body>
</html>
