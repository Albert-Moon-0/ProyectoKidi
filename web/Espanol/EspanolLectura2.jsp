<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lectura: La Bella Durmiente</title>
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
    <!-- Barra de Navegaci�n -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <div class="page-container">
        <h1 class="floating">La Bella Durmiente</h1>
        
        <center>
            <a href="Espanol-LecturaHistorias.jsp">
                <button class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </a>
        </center>
        
        <div class="story-container">
            <img src="../Imagenes/wand-icon.png" alt="Magic wand decoration" class="magic-decoration wand1 sparkling">
            
            <div class="story-text">
                <div class="castle-border">
                    <p>Hab�a una vez un rey y una reina que viv�an felices, pero anhelaban tener hijos. Despu�s de muchos a�os de espera, la reina dio a luz a una hermosa ni�a, y todo el reino celebr� su felicidad. Hubo un gran banquete, y todas las hadas del reino fueron invitadas. Sin embargo, el rey olvid� invitar a una de ellas. Sinti�ndose muy resentida, el hada olvidada apareci� en el palacio.</p>
                </div>
                
                <p>Pronto, lleg� el momento en que las hadas otorgar�an sus mejores deseos a la peque�a princesa:</p>
                
                <div class="paragraph-highlight">
                    <p class="fairy-speech">"Que crezca para ser la mujer m�s hermosa del mundo", dijo la primera hada.</p>
                    
                    <p class="fairy-speech">"Que cante con la voz m�s dulce y melodiosa", dijo la segunda hada.</p>
                    
                    <p class="fairy-speech">"Que siempre se comporte con gracia y elegancia", dijo la tercera hada.</p>
                    
                    <p class="fairy-speech">"Que sea amable y paciente", dijo la siguiente hada.</p>
                </div>
                
                <p>Cada una de las hadas colm� a la ni�a con hermosos deseos hasta que fue el turno del hada que el rey hab�a olvidado invitar:</p>
                
                <p class="fairy-speech">"Cuando la princesa cumpla diecis�is a�os, se pinchar� el dedo con un huso, y ese ser� su fin", dijo el hada con todo el resentimiento que su coraz�n pod�a contener en sus palabras.</p>
                
                <p>El rey, la reina y toda la corte quedaron conmocionados. Le suplicaron al hada que los perdonara por no invitarla y que retirara lo que hab�a dicho, pero el hada rechaz� ambas peticiones.</p>
                
                <p>Quedaba un hada que a�n no hab�a dado su deseo. Queriendo ayudar a la princesa, le dijo al rey y a la reina:</p>
                
                <p class="fairy-speech">"No puedo deshacer las palabras pronunciadas, pero puedo cambiar el curso de los acontecimientos: la princesa no morir� cuando se pinche el dedo, sino que caer� en un profundo sue�o durante cien a�os. Entonces, un pr�ncipe vendr� y la despertar�."</p>
                
                <p>Al escuchar esto, el rey y la reina se sintieron un poco mejor. Creyendo que podr�a haber una manera de detener el destino, el rey orden� que nadie en el reino usara husos.</p>
                
                <p>La princesa creci� hasta convertirse en una ni�a amable y de buen coraz�n. Cuando cumpli� diecis�is a�os, vio a una anciana hilando:</p>
                
                <p class="fairy-speech">"�Puedo intentarlo?", pregunt�.</p>
                
                <p>La anciana respondi�:</p>
                
                <p class="fairy-speech">"�Por supuesto, mi ni�a!"</p>
                
                <div class="paragraph-highlight">
                    <p>La princesa tom� el huso e intent� enhebrar la aguja. En ese preciso momento, se pinch� el dedo y cay� en un profundo sue�o. La anciana, que en realidad era el hada resentida, la llev� de vuelta al palacio, y el rey y la reina la acostaron en su cama.</p>
                    
                    <p>El reino, que una vez se hab�a unido en su felicidad, ahora se un�a en su desgracia; todos cayeron en un profundo sue�o.</p>
                </div>
                
                <p>Pasaron cien a�os. Un d�a, por voluntad del destino, un pr�ncipe lleg� al palacio. Apenas pod�a creer lo que ve�an sus ojos: los guardias, los sirvientes, los gatos e incluso las vacas, todos dorm�an y roncaban.</p>
                
                <div class="castle-border">
                    <p>Al acercarse a la princesa, pens� que era el ser m�s hermoso del mundo y la bes� en la mejilla. Inmediatamente, la princesa despert�, y con ella, el rey, la reina, los guardias, los sirvientes, los gatos e incluso las vacas abrieron los ojos.</p>
                    
                    <p>El pr�ncipe y la princesa se casaron y vivieron felices para siempre.</p>
                </div>
            </div>
            
            <div class="story-image">
                <img src="../Imagenes/lect2.png" alt="La Bella Durmiente" class="floating">
            </div>
            
            <img src="../Imagenes/wand-icon.png" alt="Magic wand decoration" class="magic-decoration wand2 sparkling">
        </div>
        
        <footer>
            <p>&copy; 2024 Proyecto de Lecturas Infantiles KIDI</p>
            <p>
            <i class="fas fa-book"></i> �Sigue leyendo para m�s aventuras! <i class="fas fa-star"></i>
        </p>
        </footer>
    </div>
</body>
</html>