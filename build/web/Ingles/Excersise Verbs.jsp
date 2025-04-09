<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Common Basic Verbs Exercise</title>
            <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 

    <style>
       

        /* Main container */
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

        /* Titles and text */
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

        /* Buttons */
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

        /* Feedback */
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

        /* Back button */
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
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
 <br><br><br><br>
<center><h2>Common Basic Verbs Exercise</h2></center>

    <div class="container">
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

        <button onclick="checkAnswers()">Check Answers</button>

        <div id="feedback" class="feedback" style="display: none;"></div>
        <br>
        <button onclick="window.location.href='Ingles-EjerciciosGramatica.jsp'" class="btn btn-primary">Back </button>
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
                feedbackDiv.innerHTML = "Excellent! You got all the answers right!";
            } else {
                feedbackDiv.className = "feedback incorrect";
                feedbackDiv.innerHTML = `You got ${correct} out of ${totalQuestions} correct. Keep trying!`;
            }
        }
    </script>
</body>
</html>
