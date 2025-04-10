<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verb "To Be" Exercise</title>
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <style>
        :root {
            --primary-color: #4A6FFF;
            --secondary-color: #FF6F91;
            --accent-color: #FFC75F;
            --correct-color: #78E08F;
            --incorrect-color: #FF7979;
            --background-color: #F9F7FF;
            --question-bg: #FFFFFF;
            --font-title: 'Comic Sans MS', cursive, sans-serif;
            --font-text: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            font-family: var(--font-text);
            background-color: var(--background-color);
            background-image: 
                url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%234a6fff' fill-opacity='0.05' fill-rule='evenodd'/%3E%3C/svg%3E"),
                url("data:image/svg+xml,%3Csvg width='52' height='26' viewBox='0 0 52 26' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ff6f91' fill-opacity='0.05'%3E%3Cpath d='M10 10c0-2.21-1.79-4-4-4-3.314 0-6-2.686-6-6h2c0 2.21 1.79 4 4 4 3.314 0 6 2.686 6 6 0 2.21 1.79 4 4 4 3.314 0 6 2.686 6 6 0 2.21 1.79 4 4 4v2c-3.314 0-6-2.686-6-6 0-2.21-1.79-4-4-4-3.314 0-6-2.686-6-6zm25.464-1.95l8.486 8.486-1.414 1.414-8.486-8.486 1.414-1.414z' /%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
            min-height: 100vh;
        }
        /* Main container */
        .container {
            max-width: 700px;
            width: 90%;
            padding: 30px;
            background-color: var(--question-bg);
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1), 0 8px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            margin: 40px auto 80px auto;
            position: relative;
            overflow: hidden;
            border: 5px solid #E3E9FD;
        }
        .container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 15px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color), var(--accent-color));
            z-index: 1;
        }
        /* Title */
        h2 {
            font-family: var(--font-title);
            font-size: 2em;
            color: var(--primary-color);
            margin-bottom: 25px;
            text-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
            position: relative;
            padding-bottom: 15px;
        }
        h2::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border-radius: 2px;
        }
        /* Question blocks */
        .question-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top: 30px;
        }
        .question {
            background-color: #F8F9FF;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 2px dashed #E3E9FD;
            position: relative;
        }
        .question:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        .question-number {
            position: absolute;
            top: -15px;
            left: -15px;
            width: 35px;
            height: 35px;
            background-color: var(--primary-color);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 1.1em;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .question p {
            font-size: 1.2em;
            color: #444;
            margin: 0 0 15px 0;
            font-weight: 500;
        }
        /* Select styles */
        select {
            padding: 12px 15px;
            font-size: 1.1em;
            border-radius: 10px;
            border: 2px solid #E3E9FD;
            background-color: #fff;
            width: 100%;
            max-width: 250px;
            margin: 0 auto;
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%234A6FFF' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 20px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(74, 111, 255, 0.2);
        }
        /* Buttons */
        .button-container {
            margin-top: 35px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        button {
            background-color: var(--primary-color);
            color: white;
            padding: 15px 25px;
            border: none;
            border-radius: 12px;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            background-color: #3458e0;
        }
        button:active {
            transform: translateY(0);
        }
        .check-btn {
            background-color: var(--correct-color);
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .check-btn::before {
            content: "✓";
            font-size: 1.2em;
        }
        .check-btn:hover {
            background-color: #65c87f;
        }
        .back-btn {
            background-color: var(--secondary-color);
        }
        .back-btn:hover {
            background-color: #ff5c83;
        }
        /* Feedback */
        .feedback {
            margin-top: 30px;
            padding: 20px;
            border-radius: 15px;
            font-size: 1.2em;
            font-weight: bold;
            transform: scale(0.95);
            opacity: 0;
            transition: transform 0.5s ease, opacity 0.5s ease;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        .feedback.visible {
            transform: scale(1);
            opacity: 1;
        }
        .feedback.correct {
            background-color: rgba(120, 224, 143, 0.2);
            color: #217759;
            border: 2px solid rgba(120, 224, 143, 0.5);
        }
        .feedback.correct::before {
            content: "🎉 ";
        }
        .feedback.incorrect {
            background-color: rgba(255, 121, 121, 0.2);
            color: #c0392b;
            border: 2px solid rgba(255, 121, 121, 0.5);
        }
        .feedback.incorrect::before {
            content: "💪 ";
        }
        /* Confetti */
        .confetti {
            position: fixed;
            width: 10px;
            height: 10px;
            opacity: 0;
            animation: confetti-fall 3s ease-in-out forwards;
            z-index: 100;
        }
        @keyframes confetti-fall {
            0% {
                transform: translateY(-100vh) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0;
            }
        }
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 20px;
            }
            
            h2 {
                font-size: 1.6em;
            }
            
            .question p {
                font-size: 1.1em;
            }
            
            select {
                font-size: 1em;
            }
            
            button {
                padding: 12px 20px;
                font-size: 1em;
            }
            
            .feedback {
                font-size: 1.1em;
            }
        }
        @media (max-width: 480px) {
            .button-container {
                flex-direction: column;
                align-items: center;
            }
            
            button {
                width: 100%;
                max-width: 250px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <div class="container">
        <h2>Complete with "To Be" Verbs!</h2>
        <div class="question-container">
            <!-- Questions -->
            <div class="question">
                <div class="question-number">1</div>
                <p>I ____ a student.</p>
                <select id="question1">
                    <option value="">Choose a word</option>
                    <option value="am">am</option>
                    <option value="is">is</option>
                    <option value="are">are</option>
                </select>
            </div>
            <div class="question">
                <div class="question-number">2</div>
                <p>She ____ my sister.</p>
                <select id="question2">
                    <option value="">Choose a word</option>
                    <option value="am">am</option>
                    <option value="is">is</option>
                    <option value="are">are</option>
                </select>
            </div>
            <div class="question">
                <div class="question-number">3</div>
                <p>They ____ from Spain.</p>
                <select id="question3">
                    <option value="">Choose a word</option>
                    <option value="am">am</option>
                    <option value="is">is</option>
                    <option value="are">are</option>
                </select>
            </div>
            <div class="question">
                <div class="question-number">4</div>
                <p>We ____ happy today.</p>
                <select id="question4">
                    <option value="">Choose a word</option>
                    <option value="am">am</option>
                    <option value="is">is</option>
                    <option value="are">are</option>
                </select>
            </div>
            <div class="question">
                <div class="question-number">5</div>
                <p>You ____ my best friend.</p>
                <select id="question5">
                    <option value="">Choose a word</option>
                    <option value="am">am</option>
                    <option value="is">is</option>
                    <option value="are">are</option>
                </select>
            </div>
        </div>
        <div id="feedback" class="feedback" style="display: none;"></div>
        <div class="button-container">
            <button onclick="checkAnswers()" class="check-btn">Check Answers</button>
            <button onclick="window.location.href='Ingles-EjerciciosGramatica.jsp'" class="back-btn">Back to Exercises</button>
        </div>
    </div>
    <script>
        function checkAnswers() {
            const answers = {
                question1: "am",
                question2: "is",
                question3: "are",
                question4: "are",
                question5: "are"
            };
            let correct = 0;
            let totalQuestions = 5;
            let allAnswered = true;
            // Validate answers
            for (let key in answers) {
                const userAnswer = document.getElementById(key).value;
                
                // Check if all questions are answered
                if (userAnswer === "") {
                    allAnswered = false;
                }
                
                if (userAnswer === answers[key]) {
                    correct++;
                    document.getElementById(key).parentElement.style.borderColor = "#78E08F";
                } else if (userAnswer !== "") {
                    document.getElementById(key).parentElement.style.borderColor = "#FF7979";
                }
            }
            const feedbackDiv = document.getElementById("feedback");
            feedbackDiv.style.display = "block";
            
            if (!allAnswered) {
                feedbackDiv.className = "feedback incorrect visible";
                feedbackDiv.innerHTML = "Please answer all the questions!";
                return;
            }
            if (correct === totalQuestions) {
                feedbackDiv.className = "feedback correct visible";
                feedbackDiv.innerHTML = "¡Excelente! You got all the answers correct!";
                createConfetti();
            } else {
                feedbackDiv.className = "feedback incorrect visible";
                feedbackDiv.innerHTML = `You got ${correct} out of ${totalQuestions} correct. Keep trying!`;
            }
        }
        
        function createConfetti() {
            const colors = ['#4A6FFF', '#FF6F91', '#FFC75F', '#78E08F', '#74B9FF'];
            
            for (let i = 0; i < 100; i++) {
                const confetti = document.createElement('div');
                confetti.classList.add('confetti');
                confetti.style.left = `${Math.random() * 100}vw`;
                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                confetti.style.width = `${Math.random() * 10 + 5}px`;
                confetti.style.height = `${Math.random() * 10 + 5}px`;
                confetti.style.animationDuration = `${Math.random() * 3 + 2}s`;
                confetti.style.animationDelay = `${Math.random() * 2}s`;
                
                document.body.appendChild(confetti);
                
                // Eliminar después de la animación
                setTimeout(() => {
                    confetti.remove();
                }, 5000);
            }
        }
    </script>
</body>
</html>