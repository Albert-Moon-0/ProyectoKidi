<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reading: The Sleeping Beauty</title>
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&family=Bubblegum+Sans&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Comic Neue', cursive;
            background-color: #fef6ff;
            color: #333;
            margin: 0;
            padding: 0;
            font-size: 18px;
        }
        .back-btn {
                font-size: 2rem;
                width: 50px;
                height: 50px;
            }
        .back-btn {
            font-size: 2.5rem;
            color: #ff6b97;
            background: #ffde7c;
            border: none;
            border-radius: 50%;
            width: 70px;
            height: 70px;
            cursor: pointer;
            margin: 20px auto;
            display: block;
            transition: all 0.3s;
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
        }
        
        .back-btn:hover {
            transform: scale(1.1);
            background: #7b1fa2;
            color: #fff;
        }
        
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('../Imagenes/fondo2.png');
            background-size: cover; 
            background-repeat: no-repeat;
            opacity: 0.15;
            z-index: -1;
        }
        
        .page-container {
            max-width: 950px;
            margin: 0 auto;
            padding: 20px;
        }
        
        h1 {
            font-family: 'Bubblegum Sans', cursive;
            text-align: center;
            color: #9b59b6;
            font-size: 3rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            background-color: #f3e5f5;
            padding: 15px;
            border-radius: 20px;
            border: 3px dashed #d1c4e9;
        }
        
        .back-btn {
            font-size: 2.5rem;
            color: #9b59b6;
            background: none;
            border: none;
            cursor: pointer;
            transition: transform 0.3s;
            margin-bottom: 20px;
        }
        
        .back-btn:hover {
            transform: scale(1.2);
        }
        
        .story-container {
            background-color: white;
            border: none;
            border-radius: 20px;
            padding: 25px;
            margin: 20px auto;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }
        
        .story-container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 15px;
            background: linear-gradient(90deg, #e1bee7, #ce93d8, #ba68c8, #9c27b0, #7b1fa2);
            border-radius: 20px 20px 0 0;
        }
        
        .story-text {
            font-size: 1.2rem;
            line-height: 1.6;
            margin-bottom: 30px;
        }
        
        .story-text p {
            margin-bottom: 15px;
            text-indent: 20px;
        }
        
        .fairy-speech {
            color: #7b1fa2;
            font-style: italic;
            margin-left: 20px;
        }
        
        .story-image {
            text-align: center;
            margin: 30px 0;
        }
        
        .story-image img {
            max-width: 500px;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s;
        }
        
        .story-image img:hover {
            transform: scale(1.05);
        }
        
        .magic-decoration {
            position: absolute;
            width: 60px;
            height: auto;
            opacity: 0.6;
        }
        
        .wand1 {
            top: 30px;
            right: 40px;
            transform: rotate(15deg);
        }
        
        .wand2 {
            bottom: 40px;
            left: 30px;
            transform: rotate(-10deg);
        }
        
        footer {
            margin-top: 30px;
            background-color: #f3e5f5;
            padding: 15px;
            border-radius: 15px;
            text-align: center;
            font-size: 1rem;
            color: #666;
            border-top: 3px dashed #d1c4e9;
        }
        
        /* Fun interactive elements */
        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(5deg); }
            100% { transform: translateY(0px) rotate(0deg); }
        }
        
        @keyframes sparkle {
            0% { opacity: 0.4; }
            50% { opacity: 0.8; }
            100% { opacity: 0.4; }
        }
        
        .floating {
            animation: float 4s ease-in-out infinite;
        }
        
        .sparkling {
            animation: sparkle 2s ease-in-out infinite;
        }
        
        .paragraph-highlight {
            background-color: rgba(233, 207, 236, 0.3);
            border-radius: 10px;
            padding: 15px;
            margin: 20px 0;
        }
        
        .castle-border {
            border: 2px dashed #ce93d8;
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            position: relative;
        }
        
        .castle-border::after {
            content: "?";
            position: absolute;
            top: -15px;
            right: 15px;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <div class="page-container">
        <h1 class="floating">The Sleeping Beauty</h1>
        
        <center>
            <a href="Ingles-LecturaHistorias.jsp">
                <button class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </a>
        </center>
        
        <div class="story-container">
            <img src="../Imagenes/wand-icon.png" alt="Magic wand decoration" class="magic-decoration wand1 sparkling">
            
            <div class="story-text">
                <div class="castle-border">
                    <p>Once upon a time, there was a king and queen who lived happily, but they longed to have children. After many years of waiting, the queen gave birth to a beautiful baby girl, and the entire kingdom celebrated their happiness. There was a grand feast, and all the fairies of the kingdom were invited. However, the king forgot to invite one of them. Feeling very resentful, the forgotten fairy appeared at the palace.</p>
                </div>
                
                <p>Soon, the moment arrived for the fairies to bestow their best wishes upon the little princess:</p>
                
                <div class="paragraph-highlight">
                    <p class="fairy-speech">?"May she grow up to be the most beautiful woman in the world," said the first fairy.</p>
                    
                    <p class="fairy-speech">?"May she sing with the sweetest and most melodious voice," said the second fairy.</p>
                    
                    <p class="fairy-speech">?"May she always behave with grace and elegance," said the third fairy.</p>
                    
                    <p class="fairy-speech">?"May she be kind and patient," said the next fairy.</p>
                </div>
                
                <p>Each of the fairies showered the little girl with beautiful wishes until it was the turn of the fairy that the king had forgotten to invite:</p>
                
                <p class="fairy-speech">?"When the princess turns sixteen, she will prick her finger on a spindle, and that will be her end," said the fairy with all the resentment that her heart could hold in her words.</p>
                
                <p>The king, the queen, and the entire court were shocked. They begged the fairy to forgive them for not inviting her and to take back what she had said, but the fairy refused both requests.</p>
                
                <p>There was one last fairy who had yet to give her wish. Wanting to help the princess, she said to the king and queen:</p>
                
                <p class="fairy-speech">?"I cannot undo the words spoken, but I can change the course of events: the princess will not die when she pricks her finger, but she will fall into a deep sleep for one hundred years. Then, a prince will come and wake her up."</p>
                
                <p>Hearing this, the king and queen felt a bit better. Believing that there might be a way to stop the fate, the king ordered that no one in the kingdom use spindles.</p>
                
                <p>The princess grew up to be a kind and sweet-hearted girl. When she turned sixteen, she saw an old woman spinning:</p>
                
                <p class="fairy-speech">?"Can I try?" she asked.</p>
                
                <p>The old woman replied:</p>
                
                <p class="fairy-speech">?"Of course, my little girl!"</p>
                
                <div class="paragraph-highlight">
                    <p>The princess took the spindle and tried to thread the needle. At that very moment, she pricked her finger and fell into a deep sleep. The old woman, who was actually the resentful fairy, took her back to the palace, and the king and queen laid her in her bed.</p>
                    
                    <p>The kingdom, which had once joined in their happiness, now joined in their misfortune; everyone fell into a deep sleep.</p>
                </div>
                
                <p>One hundred years passed. One day, by the will of fate, a prince arrived at the palace. He could hardly believe his eyes: the guards, servants, cats, and even the cows were all sleeping and snoring.</p>
                
                <div class="castle-border">
                    <p>As he approached the princess, he thought she was the most beautiful being in the world and kissed her on the cheek. Immediately, the princess woke up, and with her, the king, the queen, the guards, the servants, the cats, and even the cows opened their eyes.</p>
                    
                    <p>The prince and the princess got married and lived happily ever after.</p>
                </div>
            </div>
            
            <div class="story-image">
                <img src="../Imagenes/lect2.png" alt="The Sleeping Beauty" class="floating">
            </div>
            
            <img src="../Imagenes/wand-icon.png" alt="Magic wand decoration" class="magic-decoration wand2 sparkling">
        </div>
        
        <footer>
            <p>&copy; 2024 Children's Readings Project KIDI</p>
            <p>
            <i class="fas fa-book"></i> Keep reading for more adventures! <i class="fas fa-star"></i>
        </p>
        </footer>
    </div>
</body>
</html>