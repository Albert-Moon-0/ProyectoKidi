<%-- 
    Document   : Reconoce los números
    Created on : 3 nov. 2024, 16:26:28
    Author     : P500
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verb to be</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 
    <style>
         body {           
            display: flex;
            flex-direction: column;
            align-items: center;
            border-top: 65px;
        }
        h1 {
            color: #2c3e50;
            margin-bottom: 50px;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Centra las tarjetas horizontalmente */
            gap: 20px;
            padding: 20px;
            width: 100%;
            max-width: 1000px; /* Establece un ancho máximo para las tarjetas */
        }
        .to-be-card {
            border: 2px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            width: 45%; /* Esto permite que las tarjetas se acomoden en dos columnas */
            text-align: center;
            background-color: #fff;
            box-sizing: border-box;
        }
        .to-be-card img {
            width: 120px;
            height: 120px;
        }
        .to-be-card p {
            font-size: 1.2em;
            color: #333;
        }
        .verb {
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
        <h1>Aprendamos el Verbo "To Be"</h1>
            <center>  <a href="Ingles-LeccionVocabulario.jsp"><button class="back-btn">&larr;</button> </a></center>


    <div class="container">
        <!-- Forma afirmativa -->
        <div class="to-be-card">
            <div class="verb">I am</div>
            <img src="../Imagenes/Iam.png" alt="Imagen de una persona">
            <p>I am happy. (Yo estoy feliz.)</p>
        </div>

        <div class="to-be-card">
            <div class="verb">He is</div>
            <img src="../Imagenes/Heis.png" alt="Imagen de un hombre">
            <p>He is a teacher. (Él es un maestro.)</p>
        </div>

        <!-- Forma negativa -->
        <div class="to-be-card">
            <div class="verb">You are not</div>
            <img src="../Imagenes/Youare.png" alt="Imagen de un chico">
            <p>You are not tired. (No estás cansado.)</p>
        </div>

        <div class="to-be-card">
            <div class="verb">She is not</div>
            <img src="../Imagenes/Sheis.png" alt="Imagen de una mujer">
            <p>She is not sad. (Ella no está triste.)</p>
        </div>

        <!-- Forma interrogativa -->
        <div class="to-be-card">
            <div class="verb">Is it?</div>
            <img src="../Imagenes/Isit.png" alt="Imagen de una persona preguntando">
            <p>What is it? (¿Qué es eso?)</p>
        </div>

        <div class="to-be-card">
            <div class="verb">Are they?</div>
            <img src="../Imagenes/They.png" alt="Imagen de dos personas">
            <p>Are they students? (¿Son ellos estudiantes?)</p>
        </div>
    </div>
</body>
</html>
