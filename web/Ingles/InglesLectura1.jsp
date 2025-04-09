<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reading: The Ugly Duckling</title>
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&family=Bubblegum+Sans&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Comic Neue', cursive;
            background-color: #f0f9ff;
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
            background-image: url('../Imagenes/fondo1.png');
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
            color: #ff6b6b;
            font-size: 3rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            background-color: #ffe8e8;
            padding: 15px;
            border-radius: 20px;
            border: 3px dashed #ffabab;
        }
        
        .back-btn {
            font-size: 2.5rem;
            color: #ff6b6b;
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
            background: linear-gradient(90deg, #ffd53e, #ff9a3e, #ff6b6b, #a685e2, #64c2a6);
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
        
        .story-image {
            text-align: center;
            margin: 30px 0;
        }
        
        .story-image img {
            max-width: 400px;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s;
        }
        
        .story-image img:hover {
            transform: scale(1.05);
        }
        
        .duck-decoration {
            position: absolute;
            width: 80px;
            height: auto;
            opacity: 0.6;
        }
        
        .duck1 {
            top: 20px;
            right: 30px;
            transform: rotate(15deg);
        }
        
        .duck2 {
            bottom: 30px;
            left: 40px;
            transform: rotate(-10deg);
        }
        
        footer {
            margin-top: 30px;
            background-color: #ffe8e8;
            padding: 15px;
            border-radius: 15px;
            text-align: center;
            font-size: 1rem;
            color: #666;
            border-top: 3px dashed #ffabab;
        }
        
        /* Fun interactive elements */
        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(5deg); }
            100% { transform: translateY(0px) rotate(0deg); }
        }
        
        .floating {
            animation: float 4s ease-in-out infinite;
        }
        
        .paragraph-highlight {
            background-color: rgba(255, 253, 130, 0.2);
            border-radius: 10px;
            padding: 15px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <div class="page-container">
        <h1 class="floating">The Ugly Duckling</h1>
        
        <center>
            <a href="Ingles-LecturaHistorias.jsp">
                <button class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </a>
        </center>
        
        <div class="story-container">
            <img src="../Imagenes/duck-icon.png" alt="Duck decoration" class="duck-decoration duck1">
            
            <div class="story-text">
                <p>On the farm, there was a great commotion: Mama Duck's ducklings were breaking out of their eggs.</p>
                
                <p>One by one, they began to hatch. Mama Duck was so excited about her adorable ducklings that she didn't notice that one of her eggs, the biggest of them all, remained unbroken.</p>
                
                <div class="paragraph-highlight">
                    <p>After a few hours, the last egg began to crack. Mama Duck, all the ducklings, and the animals of the farm were eagerly waiting to see the little one who had taken so long to hatch. Suddenly, a very cheerful duckling emerged from the shell.</p>
                </div>
                
                <p>When everyone saw it, they were surprised; this duckling was not small or yellow and was not covered in soft feathers. This duckling was large, gray, and instead of the expected quack, every time it spoke, it sounded like an old horn.</p>
                
                <p>Although no one said anything, everyone thought the same thing: "This duckling is too ugly."</p>
                
                <p>Days went by, and all the animals on the farm mocked him. The ugly duckling felt very sad, and one night, he escaped the farm to find a new home.</p>
                
                <p>The ugly duckling wandered through the deep forest, and when he was about to give up, he found the home of a humble old woman who lived with a cat and a chicken. The duckling stayed with them for a while, but since he wasn't happy, he soon left.</p>
                
                <p>As winter arrived, the poor ugly duckling nearly froze. Fortunately, a farmer took him to his house to live with his wife and children. But the duckling was terrified of the children, who screamed and jumped all the time, so he escaped again and spent the winter in a muddy pond.</p>
                
                <div class="paragraph-highlight">
                    <p>Finally, spring came. The ugly duckling saw a family of swans swimming in the pond and wanted to approach them. But he remembered how everyone had mocked him and lowered his head in shame. When he looked at his reflection in the water, he was astonished. He was not an ugly duckling, but a handsome young swan. Now he knew why he looked so different from his brothers and sisters. They were ducklings, but he was a swan! Happy, he swam towards his family.</p>
                </div>
            </div>
            
            <div class="story-image">
                <img src="../Imagenes/lect1.png" alt="The Ugly Duckling" class="floating">
            </div>
            
            <img src="../Imagenes/duck-icon.png" alt="Duck decoration" class="duck-decoration duck2">
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