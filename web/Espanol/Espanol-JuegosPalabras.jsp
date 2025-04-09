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
            margin-left: 100vh;
            padding-left: 180px;
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
<body><!-- Correo: crux.jimenez.jose -->
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    
    <div class="container">
        <h1>Juegos</h1>
                <a href="P-Espanol.jsp"><button class="back-btn">&larr;</button> </a>
        <div class="grid">
            <div class="card">
                <img src="../img/oraciones.png" alt="Oraciones">
                <h3>Completa oraciones</h3>
                <p>Aprende a usar el vocabulario aprendido.</p>
                <a href="EspanolJuego1.jsp">Ver más</a>
            </div>
        </div>
    </div>
</body>
</html>
