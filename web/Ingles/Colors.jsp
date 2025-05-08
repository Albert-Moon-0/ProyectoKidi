<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Colors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f7fe;
            font-family: 'Comic Sans MS', 'Chalkboard SE', sans-serif;
            /*Sigo en conflicto si dejarle el fondo*/
            background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%236C63FF' fill-opacity='0.1' fill-rule='evenodd'/%3E%3C/svg%3E");
            padding-right: 140px; 
        }
        
        .page-title {
            background: linear-gradient(135deg, #9C27B0, #3F51B5);
            color: white;
            padding: 20px;
            border-radius: 20px;
            margin: 30px auto;
            text-align: center;
            max-width: 80%;
            box-shadow: 0 8px 15px rgba(0,0,0,0.1);
            position: relative;
        }
        
        .page-title h1 {
            font-size: 2.6rem;
            margin: 0;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .rainbow-border {
            position: absolute;
            height: 10px;
            width: 100%;
            bottom: 0;
            left: 0;
            background: linear-gradient(to right, 
                red, orange, yellow, green, blue, indigo, violet);
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
        }
        
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            padding: 20px;
            width: 100%;
            max-width: 1200px;
        }
        
        .color-card {
            border: none;
            border-radius: 20px;
            padding: 20px;
            width: 260px;
            text-align: center;
            background-color: white;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }
        
        .color-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }
        
        .color-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background-color: var(--card-color);
        }
        
        .color-card img {
            width: 140px;
            height: 140px;
            object-fit: contain;
            margin: 15px 0;
            transition: transform 0.5s ease;
            filter: drop-shadow(0 5px 15px rgba(0,0,0,0.1));
        }
        
        .color-card:hover img {
            transform: scale(1.1) rotate(5deg);
        }
        
        .color-name {
            font-size: 2.2em;
            font-weight: bold;
            margin: 15px 0;
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
            position: relative;
        }
        
        .color-name::after {
            content: "🎨";
            position: absolute;
            font-size: 0.7em;
            margin-left: 5px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .color-card:hover .color-name::after {
            opacity: 1;
        }
        
        .translation {
            font-size: 1.3em;
            color: #666;
            margin-bottom: 15px;
        }
        
        .sound-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 50px;
            padding: 8px 15px;
            font-size: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .sound-button:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }
        
        .sound-button i {
            margin-right: 5px;
        }
        
        .back-btn {
            font-size: 2.5rem;
            background-color: #FF9800;
            color: white;
            border: none;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            margin: 20px auto;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        
        .back-btn:hover {
            background-color: #F57C00;
            transform: scale(1.1);
        }
        
        /* Estilos específicos para cada color */
        #red-card { --card-color: #ff5252; }
        #red-card .color-name { background-image: linear-gradient(to right, #ff5252, #ff1744); }
        
        #blue-card { --card-color: #448aff; }
        #blue-card .color-name { background-image: linear-gradient(to right, #448aff, #2962ff); }
        
        #green-card { --card-color: #69f0ae; }
        #green-card .color-name { background-image: linear-gradient(to right, #69f0ae, #00e676); }
        
        #yellow-card { --card-color: #ffeb3b; }
        #yellow-card .color-name { background-image: linear-gradient(to right, #ffeb3b, #ffd600); }
        
        #orange-card { --card-color: #ffa726; }
        #orange-card .color-name { background-image: linear-gradient(to right, #ffa726, #ff9800); }
        
        #black-card { --card-color: #424242; }
        #black-card .color-name { background-image: linear-gradient(to right, #424242, #212121); }
        
        #white-card { --card-color: #e0e0e0; }
        #white-card .color-name { background-image: linear-gradient(to right, #f5f5f5, #e0e0e0); }
        
        #pink-card { --card-color: #ec407a; }
        #pink-card .color-name { background-image: linear-gradient(to right, #ec407a, #d81b60); }
        
        #purple-card { --card-color:#ae32a6; }
        #purple-card .color-name { background-image: linear-gradient(to right, #ae32a6, #ce56c5); }
        
        /* Animación de aparecer */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .color-card {
            animation: fadeInUp 0.5s ease forwards;
            opacity: 0;
        }
        
        .color-card:nth-child(1) { animation-delay: 0.1s; }
        .color-card:nth-child(2) { animation-delay: 0.2s; }
        .color-card:nth-child(3) { animation-delay: 0.3s; }
        .color-card:nth-child(4) { animation-delay: 0.4s; }
        .color-card:nth-child(5) { animation-delay: 0.5s; }
        .color-card:nth-child(6) { animation-delay: 0.6s; }
        .color-card:nth-child(7) { animation-delay: 0.7s; }
        .color-card:nth-child(8) { animation-delay: 0.8s; }
        .color-card:nth-child(8) { animation-delay: 0.9s; }

    </style>
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    <br><br>
    
    <div class="page-title">
        <h1>Learn Colors in English</h1>
        <div class="rainbow-border"></div>
    </div>
    
    <center>
        <a href="Ingles-LeccionVocabulario.jsp">
            <button class="back-btn">
                <i class="fas fa-arrow-left"></i>
            </button>
        </a>
    </center>

    <div class="container">
        <!-- Red -->
        <div class="color-card" id="red-card">
            <div class="color-name">Red</div>
            <img src="../Imagenes/Red.png" alt="Image of a red object">
            <p class="translation">Rojo</p>
        </div>

        <!-- Blue -->
        <div class="color-card" id="blue-card">
            <div class="color-name">Blue</div>
            <img src="../Imagenes/Blue.png" alt="Image of a blue object">
            <p class="translation">Azul</p>
        </div>

        <!-- Green -->
        <div class="color-card" id="green-card">
            <div class="color-name">Green</div>
            <img src="../Imagenes/Green.png" alt="Image of a green object">
            <p class="translation">Verde</p>
        </div>

        <!-- Yellow -->
        <div class="color-card" id="yellow-card">
            <div class="color-name">Yellow</div>
            <img src="../Imagenes/Yellow.png" alt="Image of a yellow object">
            <p class="translation">Amarillo</p>
        </div>

        <!-- Orange -->
        <div class="color-card" id="orange-card">
            <div class="color-name">Orange</div>
            <img src="../Imagenes/Orange.png" alt="Image of an orange object">
            <p class="translation">Naranja</p>
        </div>

        <!-- Black -->
        <div class="color-card" id="black-card">
            <div class="color-name">Black</div>
            <img src="../Imagenes/Black.png" alt="Image of a black object">
            <p class="translation">Negro</p>
        </div>

        <!-- White -->
        <div class="color-card" id="white-card">
            <div class="color-name">White</div>
            <img src="../Imagenes/White.png" alt="Image of a white object">
            <p class="translation">Blanco</p>
        </div>

        <!-- Pink -->
        <div class="color-card" id="pink-card">
            <div class="color-name">Pink</div>
            <img src="../Imagenes/Pink.png" alt="Image of a pink object">
            <p class="translation">Rosa</p>
        </div>
        
        <!-- Morado -->
        <div class="color-card" id="purple-card">
            <div class="color-name">Purple</div>
            <img src="../Imagenes/Purple.png" alt="Image of a purple object">
            <p class="translation">Morado</p>
        </div>
    </div>

    <script>
   
        
        // Efecto de confeti al cargar la página
        document.addEventListener('DOMContentLoaded', function() {
            // Aquí podrías agregar alguna animación de bienvenida si lo deseas
        });
    </script>
</body>
</html>   