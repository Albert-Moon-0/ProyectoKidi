<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <title>Common Basic Verbs Exercise</title>
        <style>
            /* Estilos generales solo para el contenido específico del ejercicio */
            body {
                font-family: "Comic Sans MS", "Bubblegum Sans", "Marker Felt", cursive;
                background: linear-gradient(135deg, #ffdde1 0%, #ee9ca7 100%);
                background-attachment: fixed;
                color: #3a3a3a;
                font-size: 1.8em;
                color: #ee9ca7;
                margin-bottom: 25px;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
                font-weight: bold;
                letter-spacing: 0.5px;
            }
            .header-title {
                font-size: 2.5rem;
                font-weight: 900;
                color: #fff;
                text-shadow: 2px 2px 5px #ee9ca7;
                padding: 1rem 1.5rem;
            }



            /* Contenedor principal */
            .ejercicio-container {
                max-width: 650px;
                width: 90%;
                padding: 30px;
                background-color: #fff;
                border-radius: 25px;
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15), 0 0 40px rgba(238, 156, 167, 0.2);
                text-align: center;
                margin: 30px auto 80px auto;
                border: 8px solid #ffb6b9;
                position: relative;
            }

            .ejercicio-container::before {
                content: "Learn English!";
                position: absolute;
                top: -20px;
                left: 50%;
                transform: translateX(-50%);
                background-color: #ffb6b9;
                color: #5a5a5a;
                padding: 5px 20px;
                border-radius: 15px;
                font-weight: bold;
                font-size: 1rem;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Títulos y textos */
            .ejercicio-container h2 {
                font-size: 1.8em;
                color: #ee9ca7;
                margin-bottom: 25px;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
                font-weight: bold;
                letter-spacing: 0.5px;
            }

            .question {
                background-color: #fdf9ff;
                border-radius: 20px;
                padding: 15px;
                margin-bottom: 20px;
                border: 3px dashed #ee9ca7;
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
                border: 3px solid #ee9ca7;
                background-color: #fff;
                width: 100%;
                max-width: 250px;
                margin: 0 auto;
                cursor: pointer;
                transition: all 0.3s ease;
                appearance: none;
                background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23ee9ca7%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
                background-repeat: no-repeat;
                background-position: right 15px top 50%;
                background-size: 12px auto;
                text-align: center;
                font-weight: 500;
            }

            .ejercicio-container select:focus {
                border-color: #e67a85;
                outline: none;
                box-shadow: 0 0 0 3px rgba(238, 156, 167, 0.25);
            }

            /* Botones */
            .ejercicio-container .check-btn {
                background: linear-gradient(to right, #ee9ca7, #ffdde1);
                color: white;
                padding: 12px 25px;
                border: none;
                border-radius: 50px;
                font-size: 1.1em;
                font-weight: bold;
                cursor: pointer;
                margin-top: 25px;
                transition: all 0.3s ease;
                box-shadow: 0 4px 10px rgba(238, 156, 167, 0.4);
            }

            .ejercicio-container .check-btn:hover {
                background: linear-gradient(to right, #e67a85, #ffcbd0);
                transform: translateY(-3px);
                box-shadow: 0 7px 15px rgba(238, 156, 167, 0.45);
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
                0% {
                    transform: scale(0.95);
                    opacity: 0;
                }
                70% {
                    transform: scale(1.05);
                }
                100% {
                    transform: scale(1);
                    opacity: 1;
                }
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
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'%3E%3Cpath fill='%23ffb6b9' d='M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.3 0-200-89.7-200-200S145.7 56 256 56s200 89.7 200 200-89.7 200-200 200zm-32-316c0 17.7-14.3 32-32 32s-32-14.3-32-32 14.3-32 32-32 32 14.3 32 32zm128 0c0 17.7-14.3 32-32 32s-32-14.3-32-32 14.3-32 32-32 32 14.3 32 32zm-96 96c35.3 0 64 28.7 64 64v48c0 8.8-7.2 16-16 16h-96c-8.8 0-16-7.2-16-16v-48c0-35.3 28.7-64 64-64z'/%3E%3C/svg%3E");
                background-size: contain;
                transform: rotate(15deg);
                z-index: 1;
            }

            /* Botón de regresar personalizado */
            .ejercicio-container .return-btn {
                margin-top: 20px;
                background: linear-gradient(to right, #a6c0fe, #f68084);
                border: none;
                border-radius: 50px;
                box-shadow: 0 4px 10px rgba(166, 192, 254, 0.4);
                padding: 10px 20px;
                font-weight: bold;
                color: white;
            }

            .ejercicio-container .return-btn:hover {
                background: linear-gradient(to right, #8ab0fe, #e67a85);
                transform: translateY(-3px);
                box-shadow: 0 7px 15px rgba(166, 192, 254, 0.45);
            }

            /* Efectos especiales para niños */
            @keyframes float {
                0% {
                    transform: translateY(0px) rotate(0deg);
                }
                50% {
                    transform: translateY(-10px) rotate(5deg);
                }
                100% {
                    transform: translateY(0px) rotate(0deg);
                }
            }

            .ejercicio-container h2::first-letter {
                font-size: 1.5em;
                color: #e67a85;
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

        <br><br><br><br>
        <div class="header-title text-center">Common Basic Verbs Exercise</div>    
        <div class="ejercicio-container">
            <h2>Complete the Sentences with the Correct Verb!</h2>

            <!-- Questions -->
            <div class="question">
                <p>1. I ____ a student.</p>
                <select id="question1">
                    <option value="">Choose a verb</option>
                    <option value="am">am</option>
                    <option value="is">is</option>
                    <option value="are">are</option>
                </select>
            </div>

            <div class="question">
                <p>2. She ____ a teacher.</p>
                <select id="question2">
                    <option value="">Choose a verb</option>
                    <option value="am">am</option>
                    <option value="is">is</option>
                    <option value="are">are</option>
                </select>
            </div>

            <div class="question">
                <p>3. We ____ going to the park.</p>
                <select id="question3">
                    <option value="">Choose a verb</option>
                    <option value="go">go</option>
                    <option value="are">are</option>
                    <option value="goes">goes</option>
                </select>
            </div>

            <div class="question">
                <p>4. They ____ an important meeting.</p>
                <select id="question4">
                    <option value="">Choose a verb</option>
                    <option value="do">do</option>
                    <option value="make">make</option>
                    <option value="does">does</option>
                </select>
            </div>

            <div class="question">
                <p>5. I ____ an apple every morning.</p>
                <select id="question5">
                    <option value="">Choose a verb</option>
                    <option value="eat">eat</option>
                    <option value="eats">eats</option>
                    <option value="eating">eating</option>
                </select>
            </div>

            <div class="question">
                <p>6. You ____ very well!</p>
                <select id="question6">
                    <option value="">Choose a verb</option>
                    <option value="speak">speak</option>
                    <option value="speaks">speaks</option>
                    <option value="speaking">speaking</option>
                </select>
            </div>

            <div class="question">
                <p>7. They ____ the movie yesterday.</p>
                <select id="question7">
                    <option value="">Choose a verb</option>
                    <option value="see">see</option>
                    <option value="saw">saw</option>
                    <option value="sees">sees</option>
                </select>
            </div>

            <button onclick="checkAnswers()" class="check-btn">Check Answers!</button>

            <div id="feedback" class="feedback" style="display: none;"></div>
            <br>
            <button onclick="window.location.href = 'Ingles-EjerciciosGramatica.jsp'" class="return-btn">Back to Exercises</button>
        </div>

        <script>
            function checkAnswers() {
                const answers = {
                    question1: "am",
                    question2: "is",
                    question3: "are",
                    question4: "make",
                    question5: "eat",
                    question6: "speak",
                    question7: "saw"
                };

                let correct = 0;
                let totalQuestions = 7;

                // Check answers
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
                    feedbackDiv.innerHTML = "FANTASTIC! You've completed all sentences correctly! You're an English expert!";
                } else {
                    feedbackDiv.className = "feedback incorrect";
                    feedbackDiv.innerHTML = `You got ${correct} out of ${totalQuestions} correct! Keep practicing and you'll soon master English verbs!`;
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>