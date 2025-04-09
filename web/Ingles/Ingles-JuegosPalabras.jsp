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
                <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 

    <title>Vocabulario</title>
    <style>
        
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
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    <div class="container" style="margin-top: 50px;">
        <h1>Juegos</h1>
        <a href="P-Ingles.jsp"><button class="back-btn">&larr;</button> </a>
        <div class="grid">
            <div class="card">
                <img src="../img/cuerpo.jpg" alt="Partes del cuerpo">
                <h3>Partes del cuerpo</h3>
                <p>Aprende palabras relacionadas con el cuerpo humano.</p>
                <a href="MPDC.html">Ver más</a>
            </div>
            <div class="card">
                <img src="../img/vr.jpg" alt="Vregulares">
                <h3>Verbos Regulares</h3>
                <p>Aprende algunos verbos regulares con su traduccion.</p>
                <a href="MVR.html">Ver más</a>
            </div>
            <div class="card">
                <img src="../img/vi.png" alt="Virregulares">
                <h3>Verbos Irregulares</h3>
                <p>Aprende algunos verbos irregulares con su traduccion.</p>
                <a href="MVI.html">Ver más</a>
            </div>
            <div class="card">
                <img src="../img/comida.png" alt="Comida">
                <h3>Comida y Postres</h3>
                <p>Aprende como se traducen algunas comidas y postres.</p>
                <a href="MC.html">Ver más</a>
            </div>
            <div class="card">
                <img src="../img/oraciones.png" alt="Oraciones">
                <h3>Completa oraciones</h3>
                <p>Aprende a usar el vocabulario aprendido.</p>
                <a href="ORA.html">Ver más</a>
            </div>
        </div>
    </div>
</body>
</html>
