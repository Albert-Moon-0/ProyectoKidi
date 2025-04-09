<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reading: Goldilocks and the Three Bears</title>
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&family=Bubblegum+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&family=Bubblegum+Sans&display=swap');
        body {
            font-family: 'Comic Neue', cursive;
            background-color: #f0f8ff;
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
            background: #ffde7c;
            color: #fff;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('../Imagenes/fondo3.png');
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
            color: #4682B4;
            font-size: 3rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            background-color: #e3f2fd;
            padding: 15px;
            border-radius: 20px;
            border: 3px dashed #bbdefb;
        }
        
        .back-btn {
            font-size: 2.5rem;
            color: #4682B4;
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
            background: linear-gradient(90deg, #bbdefb, #90caf9, #64b5f6, #42a5f5, #2196f3);
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
        
        .bear-speech {
            font-weight: bold;
            margin-left: 20px;
        }
        
        .papa-bear {
            color: #5D4037;
            font-size: 1.3rem;
        }
        
        .mama-bear {
            color: #8D6E63;
            font-size: 1.2rem;
        }
        
        .baby-bear {
            color: #A1887F;
            font-size: 1.1rem;
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
        
        .forest-decoration {
            position: absolute;
            width: 70px;
            height: auto;
            opacity: 0.6;
        }
        
        .tree1 {
            top: 30px;
            right: 40px;
            transform: rotate(5deg);
        }
        
        .tree2 {
            bottom: 40px;
            left: 30px;
            transform: rotate(-5deg);
        }
        
        footer {
            margin-top: 30px;
            background-color: #e3f2fd;
            padding: 15px;
            border-radius: 15px;
            text-align: center;
            font-size: 1rem;
            color: #666;
            border-top: 3px dashed #bbdefb;
        }
        
        /* Fun interactive elements */
        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(5deg); }
            100% { transform: translateY(0px) rotate(0deg); }
        }
        
        @keyframes sway {
            0% { transform: rotate(-3deg); }
            50% { transform: rotate(3deg); }
            100% { transform: rotate(-3deg); }
        }
        
        .floating {
            animation: float 4s ease-in-out infinite;
        }
        
        .swaying {
            animation: sway 3s ease-in-out infinite;
        }
        
        .paragraph-highlight {
            background-color: rgba(187, 222, 251, 0.3);
            border-radius: 10px;
            padding: 15px;
            margin: 20px 0;
        }
        
        .size-comparison {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
            padding: 10px;
            background-color: rgba(187, 222, 251, 0.2);
            border-radius: 15px;
        }
        
        .size-item {
            text-align: center;
            padding: 10px;
        }
        
        .size-item span {
            display: block;
            font-weight: bold;
            margin-top: 5px;
        }
        
        .big {
            font-size: 2.2rem;
        }
        
        .medium {
            font-size: 1.7rem;
        }
        
        .small {
            font-size: 1.2rem;
        }
        .back-btn {
                font-size: 2rem;
                width: 50px;
                height: 50px;
            }
    </style>
</head>
<body>
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <div class="page-container">
        <h1 class="floating">Goldilocks and the Three Bears</h1>
        
        <center>
            <a href="Ingles-LecturaHistorias.jsp">
                <button class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </a>
        </center>
        
        <div class="story-container">
            <img src="../Imagenes/tree-icon.png" alt="Forest tree decoration" class="forest-decoration tree1 swaying">
            
            <div class="story-text">
                <p>Once upon a time, there was a family of bears that lived in a little house in the forest. Papa Bear was very large, Mama Bear was medium-sized, and Baby Bear was small.</p>
                
                <div class="size-comparison">
                    <div class="size-item">
                        <span class="big">?</span>
                        <span>Papa Bear</span>
                    </div>
                    <div class="size-item">
                        <span class="medium">?</span>
                        <span>Mama Bear</span>
                    </div>  
                    <div class="size-item">
                        <span class="small">?</span>
                        <span>Baby Bear</span>
                    </div>
                </div>
                
                <p>One morning, Mama Bear made the most delicious porridge for breakfast, but it was too hot to eat. So, the three bears decided to go for a walk in the forest while it cooled down. A little while later, a girl named Goldilocks arrived at the bears' house and knocked on the door. When no one answered, she opened the door and entered the house without permission.</p>
                
                <div class="paragraph-highlight">
                    <p>In the kitchen, there was a table with three bowls of porridge: one large, one medium, and one small. Goldilocks was very hungry, and the porridge looked delicious.</p>
                    
                    <p>First, she tried the porridge in the large bowl, but it was too cold and she didn't like it. Then, she tried the porridge in the medium bowl, but it was too hot and she didn't like it either. Finally, she tried the porridge in the small bowl, and this time it was just right ? not too hot, not too cold! It was perfect! The porridge was so delicious that she ate it all, leaving not a single bite.</p>
                </div>
                
                <p>After eating the bears' breakfast, Goldilocks went into the living room. There were three chairs: one large, one medium, and one small. First, she sat in the large chair, but it was too high and she didn't like it. Then, she sat in the medium chair, but it was too wide and she didn't like that either. Finally, she found the small chair and sat in it, but the chair was fragile and broke under her weight.</p>
                
                <p>Looking for a place to rest, Goldilocks went upstairs. At the end of the hallway, there was a room with three beds: one large, one medium, and one small. First, she climbed into the large bed, but it was too hard and she didn't like it. Then, she climbed into the medium bed, but it was too soft and she didn't like it either. Then, she lay down on the small bed, and it was neither too hard nor too soft. In fact, it felt just perfect! Goldilocks fell into a deep sleep.</p>
                
                <div class="paragraph-highlight">
                    <p>Not long after, the three bears returned from their walk in the forest. Papa Bear immediately noticed that the door was open:</p>
                    
                    <p class="bear-speech papa-bear">?"Someone has been in our house without permission, sat in my chair, and tried my porridge," said Papa Bear in an angry voice.</p>
                    
                    <p class="bear-speech mama-bear">?"Someone sat in my chair and tried my porridge," said Mama Bear in a somewhat angry voice.</p>
                    
                    <p class="bear-speech baby-bear">Then, Baby Bear said in his small voice:<br>?"Someone ate all my porridge and broke my chair."</p>
                </div>
                
                <p>The three bears climbed the stairs. When they entered the bedroom, Papa Bear said:</p>
                
                <p class="bear-speech papa-bear">?"Someone has been lying in my bed!"</p>
                
                <p class="bear-speech mama-bear">And Mama Bear exclaimed:<br>?"Someone has been lying in my bed too!"</p>
                
                <p class="bear-speech baby-bear">And Baby Bear said:<br>?"Someone is sleeping in my bed!" And he began to cry inconsolably.</p>
                
                <p>Baby Bear's crying woke Goldilocks, who was startled and jumped out of bed. She ran downstairs and out into the forest, never to return to the bears' house again.</p>
            </div>
            
            <div class="story-image">
                <img src="../Imagenes/lect3.png" alt="Goldilocks and the Three Bears" class="floating">
            </div>
            
            <img src="../Imagenes/tree-icon.png" alt="Forest tree decoration" class="forest-decoration tree2 swaying">
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