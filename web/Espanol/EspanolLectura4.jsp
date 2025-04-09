<%-- 
    Document   : EspanolLectura4
    Created on : 3 dic. 2024, 13:32:53
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lectura: LOS TRES CERDITOS</title>
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&family=Bubblegum+Sans&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Comic Neue', cursive;
            background-color: #f2f9fe;
            color: #333;
            margin: 0;
            padding: 0;
            font-size: 18px;
            text-align: justify;
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
            background: #4986e7;
            color: #fff;
        }
        
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('../Imagenes/fondo4.png');
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
            color: #ff6b97;
            font-size: 3rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            background-color: #ffefed;
            padding: 15px;
            border-radius: 20px;
            border: 3px dashed #ffcdd2;
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
            background: linear-gradient(90deg, #ffcdd2, #f8bbd0, #f48fb1, #f06292, #ec407a);
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
        
        .pig-speech {
            color: #d81b60;
            font-style: italic;
            margin-left: 20px;
            font-weight: bold;
        }
        
        .mama-pig {
            font-size: 1.25rem;
        }
        
        .little-pig {
            font-size: 1.1rem;
        }
        
        .wolf-speech {
            color: #7b1fa2;
            font-style: italic;
            margin-left: 20px;
            font-weight: bold;
            font-size: 1.2rem;
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
        
        .pig-decoration {
            position: absolute;
            width: 70px;
            height: auto;
            opacity: 0.6;
        }
        
        .pig1 {
            top: 30px;
            right: 40px;
            transform: rotate(15deg);
        }
        
        .pig2 {
            bottom: 40px;
            left: 30px;
            transform: rotate(-10deg);
        }
        
        footer {
            margin-top: 30px;
            background-color: #ffefed;
            padding: 15px;
            border-radius: 15px;
            text-align: center;
            font-size: 1rem;
            color: #666;
            border-top: 3px dashed #ffcdd2;
        }
        
        /* Fun interactive elements */
        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(5deg); }
            100% { transform: translateY(0px) rotate(0deg); }
        }
        
        @keyframes wiggle {
            0% { transform: rotate(0deg); }
            25% { transform: rotate(5deg); }
            50% { transform: rotate(0deg); }
            75% { transform: rotate(-5deg); }
            100% { transform: rotate(0deg); }
        }
        
        .floating {
            animation: float 4s ease-in-out infinite;
        }
        
        .wiggling {
            animation: wiggle 3s ease-in-out infinite;
        }
        
        .paragraph-highlight {
            background-color: rgba(255, 205, 210, 0.3);
            border-radius: 10px;
            padding: 15px;
            margin: 20px 0;
        }
        
        .straw-border {
            border: 2px dashed #ffd54f;
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            position: relative;
        }
        
        .straw-border::after {
            content: "🏠";
            position: absolute;
            top: -15px;
            right: 15px;
            font-size: 24px;
        }
        
        .wood-border {
            border: 2px dashed #a1887f;
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            position: relative;
        }
        
        .wood-border::after {
            content: "🪵";
            position: absolute;
            top: -15px;
            right: 15px;
            font-size: 24px;
        }
        
        .brick-border {
            border: 2px dashed #e57373;
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            position: relative;
        }
        
        .brick-border::after {
            content: "🧱";
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
        <h1 class="floating">Los Tres Cerditos</h1>
        
        <center>
            <a href="Espanol-LecturaHistorias.jsp">
                <button class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </a>
        </center>
        
        <div class="story-container">
            <img src="../Imagenes/pig-icon.png" alt="Pig decoration" class="pig-decoration pig1 wiggling">
            
            <div class="story-text">
                <div class="paragraph-highlight">
                    <p>En un pueblito no muy lejano, vivía una mamá cerdita junto con sus tres cerditos. Todos eran muy felices hasta que un día la mamá cerdita les dijo:</p>
                    
                    <p class="pig-speech mama-pig">—Hijitos, ustedes ya han crecido, es tiempo de que sean cerditos adultos y vivan por sí mismos.</p>
                    
                    <p>Antes de dejarlos ir, les dijo:</p>
                    
                    <p class="pig-speech mama-pig">—En el mundo nada llega fácil, por lo tanto, deben aprender a trabajar para lograr sus sueños.</p>
                    
                    <p>Mamá cerdita se despidió con un besito en la mejilla y los tres cerditos se fueron a vivir en el mundo.</p>
                </div>
                
                <div class="straw-border">
                    <p>El cerdito menor, que era muy, pero muy perezoso, no prestó atención a las palabras de mamá cerdita y decidió construir una casita de paja para terminar temprano y acostarse a descansar.</p>
                </div>
                
                <div class="wood-border">
                    <p>El cerdito del medio, que era medio perezoso, medio prestó atención a las palabras de mamá cerdita y construyó una casita de palos. La casita le quedó chueca porque como era medio perezoso no quiso leer las instrucciones para construirla.</p>
                </div>
                
                <div class="brick-border">
                    <p>La cerdita mayor, que era la más aplicada de todos, prestó mucha atención a las palabras de mamá cerdita y quiso construir una casita de ladrillos. La construcción de su casita le tomaría mucho más tiempo. Pero esto no le importó; su nuevo hogar la albergaría del frío y también del temible lobo feroz...</p>
                </div>
                
                <p>Y hablando del temible lobo feroz, este se encontraba merodeando por el bosque cuando vio al cerdito menor durmiendo tranquilamente a través de su ventana. Al lobo le entró un enorme apetito y pensó que el cerdito sería un muy delicioso bocadillo, así que tocó a la puerta y dijo:</p>
                
                <p class="wolf-speech">—Cerdito, cerdito, déjame entrar.</p>
                
                <p>El cerdito menor se despertó asustado y respondió:</p>
                
                <p class="pig-speech little-pig">—¡No, no y no!, nunca te dejaré entrar.</p>
                
                <p>El lobo feroz se enfureció y dijo:</p>
                
                <p class="wolf-speech">—Soplaré y resoplaré y tu casa derribaré.</p>
                
                <div class="paragraph-highlight">
                    <p>El lobo sopló y resopló con todas sus fuerzas y la casita de paja se vino al piso. Afortunadamente, el cerdito menor había escapado hacia la casa del cerdito del medio mientras el lobo seguía soplando.</p>
                </div>
                
                <p>El lobo feroz sintiéndose engañado, se dirigió a la casa del cerdito del medio y al tocar la puerta dijo:</p>
                
                <p class="wolf-speech">—Cerdito, cerdito, déjame entrar.</p>
                
                <p>El cerdito del medio respondió:</p>
                
                <p class="pig-speech little-pig">— ¡No, no y no!, nunca te dejaré entrar.</p>
                
                <p>El lobo hambriento se enfureció y dijo:</p>
                
                <p class="wolf-speech">—Soplaré y resoplaré y tu casa derribaré.</p>
                
                <div class="paragraph-highlight">
                    <p>El lobo sopló y resopló con todas sus fuerzas y la casita de palo se vino abajo. Por suerte, los dos cerditos habían corrido hacia la casa de la cerdita mayor mientras que el lobo feroz seguía soplando y resoplando. Los dos hermanos, casi sin respiración le contaron toda la historia.</p>
                </div>
                
                <p class="pig-speech mama-pig">—Hermanitos, hace mucho frío y ustedes la han pasado muy mal, así que disfrutemos la noche al calor de la fogata —dijo la cerdita mayor y encendió la chimenea. Justo en ese momento, los tres cerditos escucharon que tocaban la puerta.</p>
                
                <p class="wolf-speech">—Cerdita, cerdita, déjame entrar —dijo el lobo feroz.</p>
                
                <p>La cerdita respondió:</p>
                
                <p class="pig-speech mama-pig">— ¡No, no y no!, nunca te dejaré entrar.</p>
                
                <p>El lobo hambriento se enfureció y dijo:</p>
                
                <p class="wolf-speech">—Soplaré y soplaré y tu casa derribaré.</p>
                
                <div class="brick-border">
                    <p>El lobo sopló y resopló con todas sus fuerzas, pero la casita de ladrillos resistía sus soplidos y resoplidos. Más enfurecido y hambriento que nunca decidió trepar el techo para meterse por la chimenea. Al bajar la chimenea, el lobo se quemó la cola con la fogata.</p>
                </div>
                
                <p class="wolf-speech">—¡AY! —gritó el lobo.</p>
                
                <p>Y salió corriendo por el bosque para nunca más ser visto.</p>
                
                <div class="paragraph-highlight">
                    <p>Un día cualquiera, mamá cerdita fue a visitar a sus queridos cerditos y descubrió que todos tres habían construido casitas de ladrillos. Los tres cerditos habían aprendido la lección:</p>
                    
                    <p>"En el mundo nada llega fácil, por lo tanto, debemos trabajar para lograr nuestros sueños".</p>
                </div>
            </div>
            
            <div class="story-image">
                <img src="../Imagenes/lect4.png" alt="Los Tres Cerditos" class="floating">
            </div>
            
            <img src="../Imagenes/pig-icon.png" alt="Pig decoration" class="pig-decoration pig2 wiggling">
        </div>
        
        <footer>
            <p>&copy; 2024 Proyecto de Lecturas Infantiles KIDI</p>
            <p>
                <i class="fas fa-book"></i> ¡Sigue leyendo para más aventuras! <i class="fas fa-star"></i>
            </p>
        </footer>
    </div>
</body>
</html>