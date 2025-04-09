<%-- 
    Document   : Ingles-LecturaHistorias
    Created on : 18 oct. 2024, 13:41:13
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reading</title>
        <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&family=Bubblegum+Sans&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            :root {
                --primary-color: #4986e7;
                --secondary-color: #ff6b97;
                --accent-color: #ffde7c;
                --light-bg: #f2f9fe;
                --text-color: #333;
            }
            
            body {
                font-family: 'Comic Neue', cursive;
                background-color: var(--light-bg);
                margin: 0;
                padding: 0;
                color: var(--text-color);
                min-height: 100vh;
                position: relative;
            }
            
            body::before {
                content: "";
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-image: url('../Imagenes/fondo3.png');
                background-size: cover; 
                background-repeat: no-repeat;
                opacity: 0.15;
                z-index: -1;
            }
            
            .page-container {
                max-width: 1200px;
                margin: 50px auto;
                padding: 20px;
                text-align: center;
            }
            
            h1 {
                font-family: 'Bubblegum Sans', cursive;
                text-align: center;
                color: var(--primary-color);
                font-size: 3rem;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
                margin-bottom: 30px;
                background-color: #e3f2fd;
                padding: 15px 30px;
                border-radius: 20px;
                border: 3px dashed #bbdefb;
                display: inline-block;
                animation: float 4s ease-in-out infinite;
            }
            
            @keyframes float {
                0% { transform: translateY(0px); }
                50% { transform: translateY(-10px); }
                100% { transform: translateY(0px); }
            }
            
            @keyframes wiggle {
                0% { transform: rotate(0deg); }
                25% { transform: rotate(3deg); }
                50% { transform: rotate(0deg); }
                75% { transform: rotate(-3deg); }
                100% { transform: rotate(0deg); }
            }
            
            .back-btn {
                font-size: 2.5rem;
                color: var(--secondary-color);
                background: var(--accent-color);
                border: none;
                border-radius: 50%;
                width: 70px;
                height: 70px;
                cursor: pointer;
                margin: 20px auto;
                display: block;
                transition: all 0.3s;
                box-shadow: 0 5px 10px rgba(0,0,0,0.1);
            }
            
            .back-btn:hover {
                transform: scale(1.1);
                background: var(--primary-color);
                color: #fff;
            }
            
            .grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 30px;
                margin-top: 40px;
                padding: 0 20px;
            }
            
            .card {
                background-color: white;
                border-radius: 20px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                transition: all 0.4s ease;
                position: relative;
                z-index: 1;
                height: 100%;
                display: flex;
                flex-direction: column;
            }
            
            .card::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 8px;
                z-index: 2;
                border-radius: 20px 20px 0 0;
            }
            
            .card:nth-child(1)::before {
                background: linear-gradient(90deg, #bbdefb, #90caf9, #64b5f6, #42a5f5, #2196f3);
            }
            
            .card:nth-child(2)::before {
                background: linear-gradient(90deg, #e1bee7, #ce93d8, #ba68c8, #ab47bc, #9c27b0);
            }
            
            .card:nth-child(3)::before {
                background: linear-gradient(90deg, #ffecb3, #ffe082, #ffd54f, #ffca28, #ffc107);
            }
            
            .card:nth-child(4)::before {
                background: linear-gradient(90deg, #ffcdd2, #ef9a9a, #e57373, #ef5350, #f44336);
            }
            
            .card:hover {
                transform: translateY(-15px);
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            }
            
            .card a {
                color: inherit;
                text-decoration: none;
                display: flex;
                flex-direction: column;
                height: 100%;
            }
            
            .card img {
                width: 100%;
                height: 220px;
                object-fit: cover;
                transition: transform 0.5s;
            }
            
            .card:hover img {
                transform: scale(1.1);
            }
            
            .card-content {
                padding: 20px;
                text-align: center;
                flex-grow: 1;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            
            .card h3 {
                margin: 0 0 15px;
                padding: 0;
                color: var(--text-color);
                font-family: 'Bubblegum Sans', cursive;
                font-size: 1.6rem;
                position: relative;
                display: inline-block;
            }
            
            .card h3::after {
                content: "";
                position: absolute;
                bottom: -5px;
                left: 50%;
                transform: translateX(-50%);
                width: 50px;
                height: 3px;
                background: var(--primary-color);
                transition: width 0.3s;
                border-radius: 2px;
            }
            
            .card:hover h3::after {
                width: 80px;
            }
            
            .card p {
                margin: 0;
                padding: 10px 0;
                color: #666;
                font-size: 1.1rem;
            }
            
            .card-theme-blue {
                background-color: rgba(176, 220, 252, 0.1);
            }
            
            .card-theme-purple {
                background-color: rgba(214, 186, 247, 0.1);
            }
            
            .card-theme-orange {
                background-color: rgba(255, 223, 186, 0.1);
            }
            
            .card-theme-pink {
                background-color: rgba(255, 186, 210, 0.1);
            }
            
            .read-more {
                display: inline-block;
                margin-top: 15px;
                background-color: var(--primary-color);
                color: white;
                padding: 8px 20px;
                border-radius: 30px;
                font-weight: bold;
                transition: all 0.3s;
                font-size: 0.9rem;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            }
            
            .read-more:hover {
                background-color: var(--secondary-color);
                transform: scale(1.05);
            }
            
            /* Floating decorative elements */
            .decoration {
                position: absolute;
                font-size: 3rem;
                opacity: 0.3;
                z-index: -1;
            }
            
            .book1 {
                top: 10%;
                left: 5%;
                animation: float 8s ease-in-out infinite;
            }
            
            .book2 {
                bottom: 15%;
                right: 5%;
                animation: float 7s ease-in-out infinite reverse;
            }
            
            .star1 {
                top: 20%;
                right: 10%;
                animation: wiggle 9s ease-in-out infinite;
            }
            
            .star2 {
                bottom: 25%;
                left: 10%;
                animation: wiggle 6s ease-in-out infinite reverse;
            }
            
            footer {
                margin-top: 50px;
                background-color: #e3f2fd;
                padding: 15px;
                border-radius: 15px;
                text-align: center;
                font-size: 1rem;
                color: #666;
                border-top: 3px dashed #bbdefb;
                max-width: 800px;
                margin-left: auto;
                margin-right: auto;
            }
            
            /* Responsive adjustments */
            @media (max-width: 768px) {
                .grid {
                    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                    gap: 20px;
                }
                
                h1 {
                    font-size: 2.5rem;
                }
                
                .decoration {
                    font-size: 2rem;
                }
            }
            
            @media (max-width: 480px) {
                .grid {
                    grid-template-columns: 1fr;
                }
                
                h1 {
                    font-size: 2rem;
                    padding: 10px 20px;
                }
                
                .card img {
                    height: 180px;
                }
            }
        </style>
    </head>
    <body>
        <!-- Barra de Navegación -->
        <jsp:include page="../Sistema/BarraNavegacion.jsp" />
        
        <!-- Elementos decorativos -->
        <div class="decoration book1">📚</div>
        <div class="decoration book2">📖</div>
        <div class="decoration star1">✨</div>
        <div class="decoration star2">⭐</div>
        
        <div class="page-container">
            <h1>Reading</h1>
            
            <center>
                <a href="P-Ingles.jsp">
                    <button class="back-btn">
                        <i class="fas fa-arrow-left"></i>
                    </button>
                </a>
            </center>
            
            <div class="grid">
                <div class="card card-theme-blue">
                    <a href="InglesLectura1.jsp">
                        <img src="../img/lec1.jpg" alt="The Ugly Duckling">
                        <div class="card-content">
                            <h3>The Ugly Duckling</h3>
                            <p>Conoce la historia del patito feo.</p>
                            <span class="read-more">Ver más</span>
                        </div>
                    </a>
                </div>
                
                <div class="card card-theme-purple">
                    <a href="InglesLectura2.jsp">
                        <img src="../img/lec2.png" alt="The Sleeping Beauty">
                        <div class="card-content">
                            <h3>The Sleeping Beauty</h3>
                            <p>Conoce la historia de la bella durmiente.</p>
                            <span class="read-more">Ver más</span>
                        </div>
                    </a>
                </div>
                
                <div class="card card-theme-orange">
                    <a href="InglesLectura3.jsp">
                        <img src="../img/lec3.jpg" alt="Goldilocks and the Three Bears">
                        <div class="card-content">
                            <h3>Goldilocks and the Three Bears</h3>
                            <p>Conoce la historia de risitos de oro.</p>
                            <span class="read-more">Ver más</span>
                        </div>
                    </a>
                </div>
                
                <div class="card card-theme-pink">
                    <a href="InglesLectura4.jsp">
                        <img src="../img/lec4.jpg" alt="The Three Little Pigs">
                        <div class="card-content">
                            <h3>The Three Little Pigs</h3>
                            <p>Conoce la historia de los 3 cerditos.</p>
                            <span class="read-more">Ver más</span>
                        </div>
                    </a>
                </div>
            </div>
            
            <footer>
                <p>&copy; 2024 Proyecto de Lecturas Infantiles KIDI</p>
                <p>
                    <i class="fas fa-book"></i> ¡Explore our stories and have fun reading! <i class="fas fa-star"></i>
                </p>
            </footer>
        </div>
    </body>
</html>