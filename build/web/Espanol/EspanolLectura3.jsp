<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lectura: Ricitos de Oro</title>
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
            color: #4986e7;
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
            color: #4986e7;
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
            color: #5d4037;
            font-style: italic;
            margin-left: 20px;
            font-weight: bold;
        }
        
        .papa-bear {
            font-size: 1.25rem;
        }
        
        .mama-bear {
            font-size: 1.1rem;
        }
        
        .baby-bear {
            font-size: 0.95rem;
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
        
        .bear-decoration {
            position: absolute;
            width: 70px;
            height: auto;
            opacity: 0.6;
        }
        
        .bear1 {
            top: 30px;
            right: 40px;
            transform: rotate(15deg);
        }
        
        .bear2 {
            bottom: 40px;
            left: 30px;
            transform: rotate(-10deg);
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
            background-color: rgba(187, 222, 251, 0.3);
            border-radius: 10px;
            padding: 15px;
            margin: 20px 0;
        }
        
        .forest-border {
            border: 2px dashed #81c784;
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            position: relative;
        }
        
        .forest-border::after {
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
        <h1 class="floating">Ricitos de Oro</h1>
        
        <center>
            <a href="Espanol-LecturaHistorias.jsp">
                <button class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </a>
        </center>
        
        <div class="story-container">
            <img src="../Imagenes/bear-icon.png" alt="Bear decoration" class="bear-decoration bear1 wiggling">
            
            <div class="story-text">
                <div class="forest-border">
                    <p>Érase una vez una familia de osos que vivían en una linda casita en el bosque. Papá Oso era muy grande, Mamá Osa era de tamaño mediano y Osito era pequeño.</p>
                </div>
                
                <p>Una mañana, Mamá Osa sirvió la más deliciosa avena para el desayuno, pero como estaba demasiado caliente para comer, los tres osos decidieron ir de paseo por el bosque mientras se enfriaba. Al cabo de unos minutos, una niña llamada Ricitos de Oro llegó a la casa de los osos y tocó la puerta. Al no encontrar respuesta, abrió la puerta y entró en la casa sin permiso.</p>
                
                <div class="paragraph-highlight">
                    <p>En la cocina había una mesa con tres tazas de avena: una grande, una mediana y una pequeña. Ricitos de Oro tenía un gran apetito y la avena se veía deliciosa. Primero, probó la avena de la taza grande, pero la avena estaba muy fría y no le gustó. Luego, probó la avena de la taza mediana, pero la avena estaba muy caliente y tampoco le gustó. Por último, probó la avena de la taza pequeña y esta vez la avena no estaba ni fría ni caliente, ¡estaba perfecta! La avena estaba tan deliciosa que se la comió toda sin dejar ni un poquito.</p>
                </div>
                
                <p>Después de comer el desayuno de los osos, Ricitos de Oro fue a la sala. En la sala había tres sillas: una grande, una mediana y una pequeña. Primero, se sentó en la silla grande, pero la silla era muy alta y no le gustó. Luego, se sentó en la silla mediana, pero la silla era muy ancha y tampoco le gustó. Fue entonces que encontró la silla pequeña y se sentó en ella, pero la silla era frágil y se rompió bajo su peso.</p>
                
                <p>Buscando un lugar para descansar, Ricitos de Oro subió las escaleras, al final del pasillo había un cuarto con tres camas: una grande, una mediana y una pequeña. Primero, se subió a la cama grande, pero estaba demasiado dura y no le gustó. Después, se subió a la cama mediana, pero estaba demasiado blanda y tampoco le gustó. Entonces, se acostó en la cama pequeña, la cama no estaba ni demasiado dura ni demasiado blanda. De hecho, ¡se sentía perfecta! Ricitos de Oro se quedó profundamente dormida.</p>
                
                <div class="paragraph-highlight">
                    <p>Al poco tiempo, los tres osos regresaron del paseo por el bosque. Papá Oso notó inmediatamente que la puerta se encontraba abierta:</p>
                    
                    <p class="bear-speech papa-bear">?Alguien ha entrado a nuestra casa sin permiso, se sentó en mi silla y probó mi avena ?dijo Papá Oso con una gran voz de enfado.</p>
                    
                    <p class="bear-speech mama-bear">?Alguien se ha sentado en mi silla y probó mi avena ?dijo Mamá Osa con una voz medio enojada.</p>
                    
                    <p class="bear-speech baby-bear">?Alguien se comió toda mi avena y rompió mi silla ?dijo Osito con su pequeña voz.</p>
                </div>
                
                <p>Los tres osos subieron la escalera. Al entrar en la habitación, Papá Oso dijo:</p>
                
                <p class="bear-speech papa-bear">?¡Alguien se ha acostado en mi cama!</p>
                
                <p>Y Mamá Osa exclamó:</p>
                
                <p class="bear-speech mama-bear">?¡Alguien se ha acostado en mi cama también!</p>
                
                <p>Y Osito dijo:</p>
                
                <p class="bear-speech baby-bear">?¡Alguien está durmiendo en mi cama! ?y se puso a llorar desconsoladamente.</p>
                
                <div class="forest-border">
                    <p>El llanto de Osito despertó a Ricitos de Oro, que muy asustada saltó de la cama y corrió escaleras abajo hasta llegar al bosque para jamás regresar a la casa de los osos.</p>
                </div>
            </div>
            
            <div class="story-image">
                <img src="../Imagenes/lect3.png" alt="Ricitos de Oro" class="floating">
            </div>
            
            <img src="../Imagenes/bear-icon.png" alt="Bear decoration" class="bear-decoration bear2 wiggling">
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