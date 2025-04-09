<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Colors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 
    <style>
        
        h1 {
            color: #2c3e50;
            margin-top: 20px;
            margin-bottom: 40px;
            text-align: center;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            width: 100%;
            max-width: 1200px;
        }
        .color-card {
            border: 2px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            width: 45%;
            text-align: center;
            background-color: #fff;
            box-sizing: border-box;
        }
        .color-card img {
            width: 120px;
            height: 120px;
        }
        .color-card p {
            font-size: 1.2em;
            color: #333;
        }
        .color-name {
            font-size: 2em;
            color: #e67e22;
            margin: 10px;
        }
        
        .back-btn {
                        font-size: 3rem;
                        color: var(--colorTextoPrincipal);
                        background: none;
                        border: none;
                        cursor: pointer;
                        
                    }
    </style>
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    <br><br>
    <h1>Learn Colors in English</h1>
                <center>  <a href="Ingles-LeccionVocabulario.jsp"><button class="back-btn">&larr;</button> </a></center>


    <div class="container">
        <!-- Red -->
        <div class="color-card">
            <div class="color-name">Red</div>
            <img src="../Imagenes/Red.png" alt="Image of a red object">
            <p>Red. (Rojo)</p>
        </div>

        <!-- Blue -->
        <div class="color-card">
            <div class="color-name">Blue</div>
            <img src="../Imagenes/Blue.png" alt="Image of a blue object">
            <p>Blue. (Azul)</p>
        </div>

        <!-- Green -->
        <div class="color-card">
            <div class="color-name">Green</div>
            <img src="../Imagenes/Green.png" alt="Image of a green object">
            <p>Green. (Verde)</p>
        </div>

        <!-- Yellow -->
        <div class="color-card">
            <div class="color-name">Yellow</div>
            <img src="../Imagenes/Yellow.png" alt="Image of a yellow object">
            <p>Yellow. (Amarillo)</p>
        </div>

        <!-- Orange -->
        <div class="color-card">
            <div class="color-name">Orange</div>
            <img src="../Imagenes/Orange.png" alt="Image of an orange object">
            <p>Orange. (Naranja)</p>
        </div>

        <!-- Black -->
        <div class="color-card">
            <div class="color-name">Black</div>
            <img src="../Imagenes/Black.png" alt="Image of a black object">
            <p>Black. (Negro)</p>
        </div>

        <!-- White -->
        <div class="color-card">
            <div class="color-name">White</div>
            <img src="../Imagenes/White.png" alt="Image of a white object">
            <p>White. (Blanco)</p>
        </div>

        <!-- Pink -->
        <div class="color-card">
            <div class="color-name">Pink</div>
            <img src="../Imagenes/Pink.png" alt="Image of a pink object">
            <p>Pink. (Rosa)</p>
        </div>
    </div>
</body>
</html>
