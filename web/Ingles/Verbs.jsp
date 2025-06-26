<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Common Basic Verbs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">  
    <style>
        body {
            background-color: #f9f7e8;
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' ... %3E%3C/svg%3E");
            padding: 0 15px;
        }

        h1 {
            margin-top: 20px;
            margin-bottom: 40px;
            text-align: center;
            animation: fadeInUp 2s ease-in-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .verb-card {
            border: 3px solid;
            border-radius: 20px;
            padding: 20px;
            width: 260px;
            max-width: 90vw;
            text-align: center;
            background-color: #fff;
            box-sizing: border-box;
            box-shadow: 0 6px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .verb-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0,0,0,0.15);
        }

        .verb-card img {
            width: 120px;
            height: 120px;
            border-radius: 10px;
            margin-bottom: 10px;
        }

        .verb-card p {
            font-size: 1.1em;
            color: #333;
            margin-top: 10px;
        }

        .verb-name {
            font-size: 2em;
            margin: 10px;
            font-weight: bold;
        }

        .back-btn {
            font-size: 3rem;
            color: var(--colorTextoPrincipal);
            background: none;
            border: none;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .back-btn:hover {
            transform: scale(1.1);
        }

        .verb-card:nth-child(1) { border-color: #4fc3f7; background-color: #e1f5fe; }
        .verb-card:nth-child(1) .verb-name { color: #0288d1; }
        .verb-card:nth-child(2) { border-color: #ff8a65; background-color: #fff3e0; }
        .verb-card:nth-child(2) .verb-name { color: #ef6c00; }
        .verb-card:nth-child(3) { border-color: #81c784; background-color: #e8f5e9; }
        .verb-card:nth-child(3) .verb-name { color: #2e7d32; }
        .verb-card:nth-child(4) { border-color: #ba68c8; background-color: #f3e5f5; }
        .verb-card:nth-child(4) .verb-name { color: #7b1fa2; }
        .verb-card:nth-child(5) { border-color: #ffb74d; background-color: #fff8e1; }
        .verb-card:nth-child(5) .verb-name { color: #ef6c00; }
        .verb-card:nth-child(6) { border-color: #64b5f6; background-color: #e3f2fd; }
        .verb-card:nth-child(6) .verb-name { color: #1565c0; }
        .verb-card:nth-child(7) { border-color: #e57373; background-color: #ffebee; }
        .verb-card:nth-child(7) .verb-name { color: #c62828; }
        .verb-card:nth-child(8) { border-color: #9575cd; background-color: #ede7f6; }
        .verb-card:nth-child(8) .verb-name { color: #512da8; }

        .stars-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
            pointer-events: none;
        }

        .star {
            position: absolute;
            width: 15px;
            height: 15px;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"...');
            background-size: contain;
            opacity: 0.5;
            animation: float 10s infinite linear;
        }

        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); opacity: 0; }
            10% { opacity: 0.5; }
            90% { opacity: 0.5; }
            100% { transform: translateY(-700px) rotate(360deg); opacity: 0; }
        }

        .title-decoration {
            display: inline-block;
            margin: 0 10px;
            font-size: 1.8em;
            color: #ffd700;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        @media (max-width: 768px) {
            h1 { font-size: 1.8rem; }
            .verb-name { font-size: 1.5em; }
            .back-btn { font-size: 2rem; }
            .verb-card img { width: 100px; height: 100px; }
            .verb-card p { font-size: 1em; }
        }

        @media (max-width: 480px) {
            h1 { font-size: 1.5rem; }
            .title-decoration { font-size: 1.2em; }
            .verb-card img { width: 90px; height: 90px; }
            .verb-name { font-size: 1.3em; }
            .verb-card p { font-size: 0.95em; }
        }
    </style>
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    <br><br>

    <div class="stars-container">
        <!-- Estrellas animadas -->
        <div class="star" style="top: 10%; left: 5%; animation-delay: 0s;"></div>
        <div class="star" style="top: 20%; left: 15%; animation-delay: 1s;"></div>
        <div class="star" style="top: 15%; left: 30%; animation-delay: 2s;"></div>
        <div class="star" style="top: 25%; left: 50%; animation-delay: 3s;"></div>
        <div class="star" style="top: 10%; left: 70%; animation-delay: 4s;"></div>
        <div class="star" style="top: 30%; left: 85%; animation-delay: 5s;"></div>
        <div class="star" style="top: 40%; left: 20%; animation-delay: 6s;"></div>
        <div class="star" style="top: 50%; left: 40%; animation-delay: 7s;"></div>
        <div class="star" style="top: 45%; left: 60%; animation-delay: 8s;"></div>
        <div class="star" style="top: 35%; left: 80%; animation-delay: 9s;"></div>
    </div>

    <h1>
        <span class="title-decoration">★</span>
        Learn Common Basic Verbs
        <span class="title-decoration">★</span>
    </h1>

    <center>
        <a href="Ingles-LeccionVocabulario.jsp">
            <button class="back-btn">&larr;</button>
        </a>
    </center>

    <div class="container">
        <div class="verb-card"><div class="verb-name">To be</div><img src="../Imagenes/Be.png"><p>To be: Used to indicate identity, condition, or existence.</p></div>
        <div class="verb-card"><div class="verb-name">To have</div><img src="../Imagenes/Have.png"><p>To have: Used to express possession or relationships.</p></div>
        <div class="verb-card"><div class="verb-name">To go</div><img src="../Imagenes/Go.png"><p>To go: Used to express movement from one place to another.</p></div>
        <div class="verb-card"><div class="verb-name">To eat</div><img src="../Imagenes/Eat.png"><p>To eat: Used to describe the action of consuming food.</p></div>
        <div class="verb-card"><div class="verb-name">To make</div><img src="../Imagenes/Make.png"><p>To make: Used to describe the creation or construction of something.</p></div>
        <div class="verb-card"><div class="verb-name">To do</div><img src="../Imagenes/Do.png"><p>To do: Used for actions or tasks.</p></div>
        <div class="verb-card"><div class="verb-name">To see</div><img src="../Imagenes/See.png"><p>To see: Used to express visual perception.</p></div>
        <div class="verb-card"><div class="verb-name">To speak</div><img src="../Imagenes/Speak.png"><p>To speak: Used to express verbal communication.</p></div>
    </div>

    <script>
        document.querySelectorAll('.verb-card').forEach(card => {
            card.addEventListener('click', function() {
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = 'translateY(-5px)';
                }, 150);
            });
        });
    </script>
</body>
</html>
