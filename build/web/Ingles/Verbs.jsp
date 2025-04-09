<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Common Basic Verbs</title>
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
        .verb-card {
            border: 2px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            width: 45%;
            text-align: center;
            background-color: #fff;
            box-sizing: border-box;
        }
        .verb-card img {
            width: 120px;
            height: 120px;
        }
        .verb-card p {
            font-size: 1.2em;
            color: #333;
        }
        .verb-name {
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
    <h1>Learn Common Basic Verbs</h1>
                    <center>  <a href="Ingles-LeccionVocabulario.jsp"><button class="back-btn">&larr;</button> </a></center>


    <div class="container">
        <!-- To be -->
        <div class="verb-card">
            <div class="verb-name">To be</div>
            <img src="../Imagenes/Be.png" alt="Image representing 'to be'">
            <p>To be: Used to indicate identity, condition, or existence.</p>
        </div>

        <!-- To have -->
        <div class="verb-card">
            <div class="verb-name">To have</div>
            <img src="../Imagenes/Have.png" alt="Image representing 'to have'">
            <p>To have: Used to express possession or relationships.</p>
        </div>

        <!-- To go -->
        <div class="verb-card">
            <div class="verb-name">To go</div>
            <img src="../Imagenes/Go.png" alt="Image representing 'to go'">
            <p>To go: Used to express movement from one place to another.</p>
        </div>

        <!-- To eat -->
        <div class="verb-card">
            <div class="verb-name">To eat</div>
            <img src="../Imagenes/Eat.png" alt="Image representing 'to eat'">
            <p>To eat: Used to describe the action of consuming food.</p>
        </div>

        <!-- To make -->
        <div class="verb-card">
            <div class="verb-name">To make</div>
            <img src="../Imagenes/Make.png" alt="Image representing 'to make'">
            <p>To make: Used to describe the creation or construction of something.</p>
        </div>

        <!-- To do -->
        <div class="verb-card">
            <div class="verb-name">To do</div>
            <img src="../Imagenes/Do.png" alt="Image representing 'to do'">
            <p>To do: Used for actions or tasks.</p>
        </div>

        <!-- To see -->
        <div class="verb-card">
            <div class="verb-name">To see</div>
            <img src="../Imagenes/See.png" alt="Image representing 'to see'">
            <p>To see: Used to express visual perception.</p>
        </div>

        <!-- To speak -->
        <div class="verb-card">
            <div class="verb-name">To speak</div>
            <img src="../Imagenes/Speak.png" alt="Image representing 'to speak'">
            <p>To speak: Used to express verbal communication.</p>
        </div>
    </div>
</body>
</html>
