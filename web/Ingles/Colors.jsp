<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Colors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f7fe;
            font-family: 'Comic Sans MS', 'Chalkboard SE', sans-serif;
            background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' ... %3E%3C/svg%3E");
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
            background: linear-gradient(to right, red, orange, yellow, green, blue, indigo, violet);
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
            animation: fadeInUp 0.5s ease forwards;
            opacity: 0;
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

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .color-card:nth-child(1) { animation-delay: 0.1s; }
        .color-card:nth-child(2) { animation-delay: 0.2s; }
        .color-card:nth-child(3) { animation-delay: 0.3s; }
        .color-card:nth-child(4) { animation-delay: 0.4s; }
        .color-card:nth-child(5) { animation-delay: 0.5s; }
        .color-card:nth-child(6) { animation-delay: 0.6s; }
        .color-card:nth-child(7) { animation-delay: 0.7s; }
        .color-card:nth-child(8) { animation-delay: 0.8s; }
        .color-card:nth-child(9) { animation-delay: 0.9s; }

        /* RESPONSIVE */
        @media (max-width: 992px) {
            .page-title h1 { font-size: 2rem; }
            .color-card { width: 45%; padding: 15px; }
            .color-card img { width: 120px; height: 120px; }
            .color-name { font-size: 1.6em; }
            .translation { font-size: 1.1em; }
            .back-btn { width: 50px; height: 50px; font-size: 2rem; }
        }

        @media (max-width: 576px) {
            body { padding: 0 10px; }
            .page-title { margin: 20px auto; padding: 15px; max-width: 95%; }
            .page-title h1 { font-size: 1.5rem; }
            .color-card { width: 100%; padding: 15px; }
            .color-card img { width: 100px; height: 100px; }
            .color-name { font-size: 1.4em; text-align: center; }
            .translation { font-size: 1em; text-align: center; }
            .back-btn { width: 45px; height: 45px; font-size: 1.5rem; }
        }
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
    <div class="color-card" id="red-card">
        <div class="color-name">Red</div>
        <img src="../Imagenes/Red.png" alt="Red">
        <p class="translation">Rojo</p>
    </div>
    <div class="color-card" id="blue-card">
        <div class="color-name">Blue</div>
        <img src="../Imagenes/Blue.png" alt="Blue">
        <p class="translation">Azul</p>
    </div>
    <div class="color-card" id="green-card">
        <div class="color-name">Green</div>
        <img src="../Imagenes/Green.png" alt="Green">
        <p class="translation">Verde</p>
    </div>
    <div class="color-card" id="yellow-card">
        <div class="color-name">Yellow</div>
        <img src="../Imagenes/Yellow.png" alt="Yellow">
        <p class="translation">Amarillo</p>
    </div>
    <div class="color-card" id="orange-card">
        <div class="color-name">Orange</div>
        <img src="../Imagenes/Orange.png" alt="Orange">
        <p class="translation">Naranja</p>
    </div>
    <div class="color-card" id="black-card">
        <div class="color-name">Black</div>
        <img src="../Imagenes/Black.png" alt="Black">
        <p class="translation">Negro</p>
    </div>
    <div class="color-card" id="white-card">
        <div class="color-name">White</div>
        <img src="../Imagenes/White.png" alt="White">
        <p class="translation">Blanco</p>
    </div>
    <div class="color-card" id="pink-card">
        <div class="color-name">Pink</div>
        <img src="../Imagenes/Pink.png" alt="Pink">
        <p class="translation">Rosa</p>
    </div>
    <div class="color-card" id="purple-card">
        <div class="color-name">Purple</div>
        <img src="../Imagenes/Purple.png" alt="Purple">
        <p class="translation">Morado</p>
    </div>
</div>
</body>
</html>
