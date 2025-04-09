<%-- 
    Document   : MPDC
    Created on : 3 dic. 2024, 13:46:37
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Memorama - Partes del Cuerpo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .game-container {
            display: grid;
            grid-template-columns: repeat(6, 1fr); /* Aumenta el número de columnas */
            grid-gap: 15px;
            max-width: 90%;
            width: 800px; /* Ajusta el ancho del contenedor */
        }
        .card {
            width: 100%;
            height: 120px;
            background-color: #ffcc80; /* Naranja pastel */
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            position: relative;
            transition: transform 0.2s, background-color 0.3s;
            text-align: center;
            padding: 10px;
            box-sizing: border-box;
        }
        .card.flip {
            background-color: #ffffff;
            color: #333;
            border: 2px solid #fb8c00; /* Naranja más oscuro para el borde */
        }
        .card.matched {
            background-color: #ffb74d; /* Naranja más claro */
            cursor: default;
        }
        .message {
            font-size: 1.2em;
            color: #00796b;
            margin-top: 20px;
            text-align: center;
            max-width: 600px;
        }
    </style>
</head>
<body>
    
    <!-- Barra de Navegación -->
    <jsp:include page="BarraNavegacion.jsp" />

    <h1>Memorama - Partes del Cuerpo</h1>
    <div class="game-container" id="gameContainer"></div>
    <p id="message" class="message">Encuentra los pares en Español e Inglés.</p>

    <script>
        const cardsArray = [
            { word: "Cabeza", translation: "Head" },
            { word: "Head", translation: "Cabeza" },
            { word: "Mano", translation: "Hand" },
            { word: "Hand", translation: "Mano" },
            { word: "Brazo", translation: "Arm" },
            { word: "Arm", translation: "Brazo" },
            { word: "Pierna", translation: "Leg" },
            { word: "Leg", translation: "Pierna" },
            { word: "Pie", translation: "Foot" },
            { word: "Foot", translation: "Pie" },
            { word: "Ojo", translation: "Eye" },
            { word: "Eye", translation: "Ojo" },
            { word: "Boca", translation: "Mouth" },
            { word: "Mouth", translation: "Boca" },
            { word: "Nariz", translation: "Nose" },
            { word: "Nose", translation: "Nariz" },
            { word: "Espalda", translation: "Back" },
            { word: "Back", translation: "Espalda" },
            { word: "Dedo", translation: "Finger" },
            { word: "Finger", translation: "Dedo" },
            { word: "Rodilla", translation: "Knee" },
            { word: "Knee", translation: "Rodilla" },
            { word: "Estómago", translation: "Stomach" },
            { word: "Stomach", translation: "Estómago" },
            { word: "Codo", translation: "Elbow" },
            { word: "Elbow", translation: "Codo" },
            { word: "Hombro", translation: "Shoulder" },
            { word: "Shoulder", translation: "Hombro" },
            { word: "Cuello", translation: "Neck" },
            { word: "Neck", translation: "Cuello" },
            { word: "Pecho", translation: "Chest" },
            { word: "Chest", translation: "Pecho" },
            { word: "Cadera", translation: "Hip" }, // Nueva parte
            { word: "Hip", translation: "Cadera" }, // Nueva parte
            { word: "Muñeca", translation: "Wrist" }, // Nueva parte
            { word: "Wrist", translation: "Muñeca" }  // Nueva parte
        ];

        let flippedCards = [];
        let matchedPairs = 0;
        let attempts = 0;

        function shuffle(array) {
            for (let i = array.length - 1; i > 0; i--) {
                const j = Math.floor(Math.random() * (i + 1));
                [array[i], array[j]] = [array[j], array[i]];
            }
            return array;
        }

        function createBoard() {
            const gameContainer = document.getElementById("gameContainer");
            gameContainer.innerHTML = '';
            shuffle(cardsArray).forEach(cardData => {
                const card = document.createElement("div");
                card.classList.add("card");
                card.dataset.word = cardData.word;
                card.dataset.translation = cardData.translation;
                card.textContent = ""; // Oculta el texto inicialmente
                card.addEventListener("click", flipCard);
                gameContainer.appendChild(card);
            });
        }

        function flipCard() {
            if (flippedCards.length < 2 && !this.classList.contains("flip") && !this.classList.contains("matched")) {
                this.classList.add("flip");
                this.textContent = this.dataset.word; // Muestra el texto al girar
                flippedCards.push(this);

                if (flippedCards.length === 2) {
                    checkForMatch();
                }
            }
        }

        function checkForMatch() {
            attempts++;
            const [card1, card2] = flippedCards;

            if (card1.dataset.translation === card2.dataset.word || card2.dataset.translation === card1.dataset.word) {
                card1.classList.add("matched");
                card2.classList.add("matched");
                matchedPairs++;
                if (matchedPairs === cardsArray.length / 2) {
                    document.getElementById("message").textContent = `¡Felicidades! Completaste el juego en ${attempts} intentos.`;
                }
            } else {
                setTimeout(() => {
                    card1.classList.remove("flip");
                    card2.classList.remove("flip");
                    card1.textContent = '';
                    card2.textContent = '';
                }, 1000);
            }
            flippedCards = [];
        }

        createBoard();
    </script>

</body>
</html>

