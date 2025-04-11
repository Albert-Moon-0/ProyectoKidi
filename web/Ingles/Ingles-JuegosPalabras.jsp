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
    <title>¡Juegos de Vocabulario!</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&family=Nunito:wght@400;700&display=swap');
        
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f9f7fe;
            background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%239C92AC' fill-opacity='0.1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
            margin: 0;
            padding: 0;
        }
        
        .container {
            text-align: center;
            max-width: 1200px;
            margin: auto;
            padding: 30px 20px;
        }
        
        h1 {
            color: #FF6B6B;
            margin-bottom: 30px;
            font-family: 'Comic Neue', cursive;
            font-size: 3rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            position: relative;
            display: inline-block;
        }
        
        h1::after {
            content: "🎮";
            position: absolute;
            right: -50px;
            top: 0;
        }
        
        h1::before {
            content: "📚";
            position: absolute;
            left: -50px;
            top: 0;
        }
        
        .grid {
            display: flex;
            gap: 25px;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 40px;
        }
        
        .card {
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 280px;
            text-align: center;
            transition: all 0.3s ease;
            border: 5px solid #FFF;
            position: relative;
        }
        
        .card:hover {
            transform: translateY(-15px) rotate(2deg);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }
        
        .card:nth-child(even):hover {
            transform: translateY(-15px) rotate(-2deg);
        }
        
        .card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-bottom: 4px dashed #E8E8E8;
            transition: all 0.5s ease;
        }
        
        .card:hover img {
            transform: scale(1.1);
        }
        
        .card h3 {
            margin: 0;
            padding: 18px 15px;
            background: linear-gradient(135deg, #7B68EE, #6A5ACD);
            color: white;
            font-family: 'Comic Neue', cursive;
            font-size: 1.5rem;
            position: relative;
        }
        
        .card h3::before {
            content: "";
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 100%;
            height: 10px;
            background-image: linear-gradient(45deg, transparent 33.333%, #6A5ACD 33.333%, #6A5ACD 66.667%, transparent 66.667%);
            background-size: 20px 20px;
        }
        
        .card p {
            padding: 20px 15px;
            color: #5D5D5D;
            font-size: 1.1rem;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .card a {
            display: block;
            padding: 15px;
            background: linear-gradient(135deg, #FF6B6B, #FF8E8E);
            color: white;
            text-decoration: none;
            border-radius: 0 0 15px 15px;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .card a::before {
            content: "→";
            position: absolute;
            right: 20px;
            opacity: 0;
            transition: all 0.3s ease;
        }
        
        .card a:hover {
            padding-right: 40px;
            background: linear-gradient(135deg, #FF5252, #FF7676);
        }
        
        .card a:hover::before {
            opacity: 1;
            right: 15px;
        }
        
        .back-btn {
            font-size: 2.5rem;
            color: #7B68EE;
            background: none;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 20px;
            border-radius: 50%;
            width: 70px;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(255, 255, 255, 0.7);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .back-btn:hover {
            transform: scale(1.1) translateX(-5px);
            color: #FF6B6B;
            background-color: white;
        }
        
        /* Burbujas animadas de fondo */
        .bubble {
            position: absolute;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: rgba(123, 104, 238, 0.1);
            animation: float 8s infinite ease-in-out;
        }
        
        .bubble:nth-child(1) {
            width: 60px;
            height: 60px;
            top: 10%;
            left: 5%;
            animation-delay: 0s;
        }
        
        .bubble:nth-child(2) {
            width: 40px;
            height: 40px;
            top: 20%;
            right: 10%;
            animation-delay: 1s;
        }
        
        .bubble:nth-child(3) {
            width: 70px;
            height: 70px;
            bottom: 15%;
            left: 15%;
            animation-delay: 2s;
        }
        
        .bubble:nth-child(4) {
            width: 50px;
            height: 50px;
            bottom: 10%;
            right: 5%;
            animation-delay: 3s;
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
            }
        }
        
        /* Adaptabilidad para dispositivos móviles */
        @media (max-width: 768px) {
            h1 {
                font-size: 2.5rem;
            }
            
            h1::before, h1::after {
                display: none;
            }
            
            .card {
                width: 100%;
                max-width: 320px;
            }
        }
        
        /* Badge para nivel de dificultad */
        .badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #FFD166;
            color: #333;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            z-index: 1;
        }
        
        /* Estilo específico para cada categoría */
        .card:nth-child(1) h3 {
            background: linear-gradient(135deg, #FF6B6B, #FF8E8E);
        }
        
        .card:nth-child(1) h3::before {
            background-image: linear-gradient(45deg, transparent 33.333%, #FF6B6B 33.333%, #FF6B6B 66.667%, transparent 66.667%);
        }
        
        .card:nth-child(2) h3 {
            background: linear-gradient(135deg, #4ECDC4, #2AB7CA);
        }
        
        .card:nth-child(2) h3::before {
            background-image: linear-gradient(45deg, transparent 33.333%, #2AB7CA 33.333%, #2AB7CA 66.667%, transparent 66.667%);
        }
        
        .card:nth-child(3) h3 {
            background: linear-gradient(135deg, #FFD166, #F4A261);
        }
        
        .card:nth-child(3) h3::before {
            background-image: linear-gradient(45deg, transparent 33.333%, #F4A261 33.333%, #F4A261 66.667%, transparent 66.667%);
        }
        
        .card:nth-child(4) h3 {
            background: linear-gradient(135deg, #06D6A0, #1B9AAA);
        }
        
        .card:nth-child(4) h3::before {
            background-image: linear-gradient(45deg, transparent 33.333%, #1B9AAA 33.333%, #1B9AAA 66.667%, transparent 66.667%);
        }
        
        .card:nth-child(5) h3 {
            background: linear-gradient(135deg, #9B5DE5, #7768AE);
        }
        
        .card:nth-child(5) h3::before {
            background-image: linear-gradient(45deg, transparent 33.333%, #7768AE 33.333%, #7768AE 66.667%, transparent 66.667%);
        }
        
        .page-title {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 40px;
        }
        
        .star {
            color: #FFD166;
            font-size: 2rem;
            margin: 0 15px;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.2);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <!-- Burbujas de fondo -->
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <div class="container" style="margin-top: 50px;">
        <div class="page-title">
            <span class="star"><i class="fas fa-star"></i></span>
            <h1>¡Juegos de Palabras!</h1>
            <span class="star"><i class="fas fa-star"></i></span>
        </div>
        
        <a href="P-Ingles.jsp">
            <button class="back-btn"><i class="fas fa-arrow-left"></i></button>
        </a>
        
        <div class="grid">
            <div class="card">
                <span class="badge">Nivel: Fácil</span>
                <img src="../img/cuerpo.jpg" alt="Partes del cuerpo">
                <h3>Partes del cuerpo</h3>
                <p>¡Descubre cómo se llaman las partes de tu cuerpo en inglés!</p>
                <a href="MPDC.html">¡Vamos a aprender! </a>
            </div>
            
            <div class="card">
                <span class="badge">Nivel: Medio</span>
                <img src="../img/vr.jpg" alt="Vregulares">
                <h3>Verbos Regulares</h3>
                <p>¡Aprende verbos regulares y cómo usarlos en oraciones divertidas!</p>
                <a href="MVR.html">¡Vamos a aprender!</a>
            </div>
            
            <div class="card">
                <span class="badge">Nivel: Avanzado</span>
                <img src="../img/vi.png" alt="Virregulares">
                <h3>Verbos Irregulares</h3>
                <p>¡Descubre los verbos que cambian de forma como por arte de magia!</p>
                <a href="MVI.html">¡Vamos a aprender!</a>
            </div>
            
            <div class="card">
                <span class="badge">Nivel: Fácil</span>
                <img src="../img/comida.png" alt="Comida">
                <h3>Comida y Postres</h3>
                <p>¡Aprende palabras deliciosas para hablar sobre tu comida favorita!</p>
                <a href="MC.html">¡Vamos a aprender!</a>
            </div>
            
            <div class="card">
                <span class="badge">Nivel: Medio</span>
                <img src="../img/oraciones.png" alt="Oraciones">
                <h3>Completa oraciones</h3>
                <p>¡Pon a prueba tus conocimientos completando oraciones divertidas!</p>
                <a href="ORA.html">¡Vamos a jugar!</a>
            </div>
        </div>
    </div>
    
    <script>
        // Animación sencilla para las cards
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.card');
            
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(50px)';
                
                setTimeout(() => {
                    card.style.transition = 'all 0.5s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, 100 * index);
            });
        });
    </script>
</body>
</html>