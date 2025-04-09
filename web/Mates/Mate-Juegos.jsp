<%-- 
    Document   : Ingles-JuegosPalabras
    Created on : 18 oct. 2024, 13:41:36
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vocabulario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .container {
            text-align: center;
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }
        h1 {
            color: #007BFF;
            margin-bottom: 20px;
        }
        .grid {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }
        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 250px;
            text-align: center;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card img {
            width: 100%;
            height: auto;
        }
        .card h3 {
            margin: 0;
            padding: 15px;
            background-color: #007BFF;
            color: white;
        }
        .card p {
            padding: 15px;
            color: #555;
        }
        .card a {
            display: block;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 0 0 10px 10px;
        }
        .card a:hover {
            background-color: #0056b3;
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

    <div class="container">
        <h1>Juegos</h1>
        <a href="P-Mates.jsp"><button class="back-btn" style="font-size: 55px;">&larr;</button> </a>
<br><br>
        <div class="grid">
            <div class="card">
                <img src="../img/numrs.jpg" alt="Adivina el número">
                <h3>Adivina el número</h3>
                <p>Adivina el número en el que pienso.</p>
                <a href="ejercicios_mt.html">Ver más</a>
            </div>
        </div>
    </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
