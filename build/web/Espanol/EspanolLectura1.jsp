<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lectura: El Patito Feo</title>
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
        <h1 class="floating">El Patito Feo</h1>
        
        <center>
            <a href="Espanol-LecturaHistorias.jsp">
                <button class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </a>
        </center>
        
        <div class="story-container">
            <img src="../Imagenes/duck-icon.png" alt="Duck decoration" class="duck-decoration duck1">
            
            <div class="story-text">
                <p>En la granja, había un gran alboroto: los patitos de Mamá Pato estaban saliendo de sus huevos.</p>
                
                <p>Uno por uno, comenzaron a romperse. Mamá Pato estaba tan emocionada con sus adorables patitos que no se dio cuenta de que uno de sus huevos, el más grande de todos, permaneció intacto.</p>
                
                <div class="paragraph-highlight">
                    <p>Después de unas horas, el último huevo comenzó a agrietarse. Mamá Pato, todos los patitos y los animales de la granja esperaban ansiosos para ver al pequeño que había tardado tanto en salir. De repente, un patito muy alegre emergió de la cáscara.</p>
                </div>
                
                <p>Cuando todos lo vieron, se sorprendieron; este patito no era pequeño ni amarillo y no estaba cubierto de suaves plumas. Este patito era grande, gris, y en lugar del esperado cuac, cada vez que hablaba, sonaba como una vieja trompeta.</p>
                
                <p>Aunque nadie dijo nada, todos pensaron lo mismo: "Este patito es demasiado feo."</p>
                
                <p>Pasaron los días, y todos los animales de la granja se burlaban de él. El patito feo se sentía muy triste, y una noche, escapó de la granja para encontrar un nuevo hogar.</p>
                
                <p>El patito feo vagó por el profundo bosque, y cuando estaba a punto de rendirse, encontró la casa de una humilde anciana que vivía con un gato y una gallina. El patito se quedó con ellos un tiempo, pero como no estaba feliz, pronto se fue.</p>
                
                <p>Al llegar el invierno, el pobre patito feo casi se congela. Afortunadamente, un granjero lo llevó a su casa para vivir con su esposa e hijos. Pero el patito estaba aterrorizado de los niños, que gritaban y saltaban todo el tiempo, así que escapó de nuevo y pasó el invierno en un charco de barro.</p>
                
                <div class="paragraph-highlight">
                    <p>Finalmente, llegó la primavera. El patito feo vio una familia de cisnes nadando en el estanque y quiso acercarse a ellos. Pero recordó cómo todos se habían burlado de él y bajó la cabeza avergonzado. Cuando miró su reflejo en el agua, se asombró. No era un patito feo, sino un hermoso cisne joven. ¡Ahora sabía por qué se veía tan diferente de sus hermanos y hermanas! Ellos eran patitos, ¡pero él era un cisne! Feliz, nadó hacia su familia.</p>
                </div>
            </div>
            
            <div class="story-image">
                <img src="../Imagenes/lect1.png" alt="El Patito Feo" class="floating">
            </div>
            
            <img src="../Imagenes/duck-icon.png" alt="Duck decoration" class="duck-decoration duck2">
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