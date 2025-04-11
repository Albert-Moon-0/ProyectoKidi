<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>¡Aprende el Verbo To Be!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Comic+Neue:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f8f9ff;
            background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%239C92AC' fill-opacity='0.1' fill-rule='evenodd'/%3E%3C/svg%3E");
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            border-top: 65px;
            min-height: 100vh;
        }

        .main-title {
            font-family: 'Comic Neue', cursive;
            font-weight: 800;
            font-size: 3rem;
            color: #6c5ce7;
            text-align: center;
            margin: 40px 0 20px;
            text-shadow: 3px 3px 0px rgba(108, 92, 231, 0.2);
            position: relative;
            display: inline-block;
        }

        .main-title:before {
            content: "??";
            position: absolute;
            left: -50px;
            top: 5px;
            font-size: 2.5rem;
        }

        .main-title:after {
            content: "?";
            position: absolute;
            right: -50px;
            top: 5px;
            font-size: 2.5rem;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            padding: 20px;
            width: 100%;
            max-width: 1200px;
            margin-top: 20px;
            position: relative;
        }

        .category-title {
            width: 100%;
            text-align: center;
            font-family: 'Comic Neue', cursive;
            font-size: 1.7rem;
            color: #fff;
            background-color: #6c5ce7;
            padding: 10px;
            border-radius: 50px;
            margin: 20px 0 10px;
            box-shadow: 0 4px 15px rgba(108, 92, 231, 0.3);
            position: relative;
            z-index: 1;
        }

        .afirmativo { background-color: #00b894; }
        .negativo { background-color: #e17055; }
        .interrogativo { background-color: #fdcb6e; color: #333; }

        .to-be-card {
            border: 5px solid #fff;
            border-radius: 20px;
            padding: 25px 15px;
            width: 300px;
            text-align: center;
            background-color: #fff;
            box-sizing: border-box;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .to-be-card:hover {
            transform: translateY(-15px) scale(1.05);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
            z-index: 2;
        }

        .to-be-card:before {
            content: "";
            position: absolute;
            top: -10px;
            left: -10px;
            right: -10px;
            height: 10px;
            background: linear-gradient(90deg, #6c5ce7, #00b894, #fdcb6e, #e17055);
            background-size: 300% 300%;
            animation: gradientBorder 3s ease infinite;
        }

        .afirm:before { background: linear-gradient(90deg, #00b894, #55efc4); }
        .neg:before { background: linear-gradient(90deg, #e17055, #fab1a0); }
        .interr:before { background: linear-gradient(90deg, #fdcb6e, #ffeaa7); }

        @keyframes gradientBorder {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .to-be-card img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 5px solid #f0f0f0;
            transition: all 0.3s ease;
            margin: 15px 0;
            object-fit: cover;
            background-color: #f8f9ff;
        }

        .to-be-card:hover img {
            transform: scale(1.1) rotate(5deg);
            border-color: #6c5ce7;
        }

        .to-be-card p {
            font-size: 1.1em;
            color: #555;
            margin-top: 15px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 10px;
            position: relative;
        }

        .to-be-card p:after {
            content: "";
            position: absolute;
            top: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-bottom: 10px solid #f8f9fa;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
        }

        .verb {
            font-family: 'Comic Neue', cursive;
            font-size: 2.2em;
            font-weight: bold;
            margin: 10px 0;
            padding: 5px 15px;
            display: inline-block;
            border-radius: 15px;
            position: relative;
            transition: all 0.3s ease;
        }

        .afirm .verb { color: #00b894; text-shadow: 2px 2px 0px rgba(0, 184, 148, 0.2); }
        .neg .verb { color: #e17055; text-shadow: 2px 2px 0px rgba(225, 112, 85, 0.2); }
        .interr .verb { color: #fdcb6e; text-shadow: 2px 2px 0px rgba(253, 203, 110, 0.2); }

        .back-btn {
            font-size: 2.5rem;
            color: #6c5ce7;
            background: #fff;
            border: none;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            cursor: pointer;
            box-shadow: 0 5px 15px rgba(108, 92, 231, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            margin: 10px 0 20px;
        }

        .back-btn:hover {
            transform: scale(1.1) translateX(-5px);
            box-shadow: 0 8px 25px rgba(108, 92, 231, 0.4);
        }

        .back-btn i {
            transition: transform 0.3s ease;
        }

        .back-btn:hover i {
            transform: translateX(-5px);
        }

        .spanish {
            color: #777;
            font-style: italic;
        }

        .pronoun {
            display: inline-block;
            font-weight: bold;
            background-color: #f0f0f0;
            padding: 3px 8px;
            border-radius: 5px;
            margin-right: 5px;
        }

        /* Decoraciones adicionales */
        .cloud {
            position: absolute;
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 50%;
            z-index: -1;
        }

        .cloud-1 {
            width: 150px;
            height: 70px;
            top: 5%;
            left: 10%;
        }

        .cloud-2 {
            width: 100px;
            height: 50px;
            bottom: 15%;
            right: 5%;
        }

        .rainbow {
            position: absolute;
            top: -50px;
            left: 50%;
            transform: translateX(-50%);
            width: 90%;
            height: 50px;
            border-radius: 150px 150px 0 0;
            background: linear-gradient(to bottom, 
                #ff9a9e 0%,
                #fad0c4 20%,
                #ffecd2 40%,
                #fcb69f 60%,
                #fda085 80%,
                #fee140 100%);
            opacity: 0.1;
            z-index: -1;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            width: 100%;
        }

        /* Animación de tarjetas */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translate3d(0, 30px, 0);
            }
            to {
                opacity: 1;
                transform: translate3d(0, 0, 0);
            }
        }

        .to-be-card {
            animation: fadeInUp 0.6s ease forwards;
            opacity: 0;
        }

        .to-be-card:nth-child(1) { animation-delay: 0.1s; }
        .to-be-card:nth-child(2) { animation-delay: 0.2s; }
        .to-be-card:nth-child(3) { animation-delay: 0.3s; }
        .to-be-card:nth-child(4) { animation-delay: 0.4s; }
        .to-be-card:nth-child(5) { animation-delay: 0.5s; }
        .to-be-card:nth-child(6) { animation-delay: 0.6s; }

        /* Indicador de nivel */
        .level-indicator {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #6c5ce7;
            color: white;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        /* Decoración inferior */
        .decoration {
            width: 100%;
            height: 30px;
            background: linear-gradient(90deg, #6c5ce7, #00b894, #fdcb6e, #e17055);
            margin-top: 40px;
            border-radius: 15px;
            position: relative;
            overflow: hidden;
        }

        .decoration:before {
            content: "";
            position: absolute;
            width: 100%;
            height: 10px;
            background: linear-gradient(90deg, transparent 0%, rgba(255,255,255,0.5) 50%, transparent 100%);
            animation: lightMove 3s infinite linear;
        }

        @keyframes lightMove {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }

        /* Emoji flotantes */
        .floating-emoji {
            position: absolute;
            font-size: 2rem;
            animation: float 5s ease-in-out infinite;
            z-index: -1;
            opacity: 0.5;
        }

        .emoji-1 {
            top: 10%;
            left: 5%;
            animation-delay: 0s;
        }

        .emoji-2 {
            top: 15%;
            right: 10%;
            animation-delay: 1s;
        }

        .emoji-3 {
            bottom: 15%;
            left: 15%;
            animation-delay: 2s;
        }

        .emoji-4 {
            bottom: 20%;
            right: 5%;
            animation-delay: 1.5s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0); }
            50% { transform: translateY(-15px) rotate(5deg); }
        }

        /* Medios responsivos */
        @media (max-width: 768px) {
            .main-title {
                font-size: 2.2rem;
                margin-top: 30px;
            }

            .main-title:before, .main-title:after {
                display: none;
            }

            .to-be-card {
                width: 100%;
                max-width: 300px;
            }

            .category-title {
                font-size: 1.4rem;
                padding: 8px;
            }

            .floating-emoji, .cloud {
                display: none;
            }

            .verb {
                font-size: 1.8em;
            }
        }

        /* Añadiendo elementos interactivos */
        .sound-btn {
            background: #fff;
            border: 2px solid #6c5ce7;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            position: absolute;
            top: 15px;
            right: 15px;
            transition: all 0.3s ease;
            color: #6c5ce7;
        }

        .sound-btn:hover {
            background: #6c5ce7;
            color: white;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Elementos decorativos -->
    <div class="cloud cloud-1"></div>
    <div class="cloud cloud-2"></div>
    <div class="floating-emoji emoji-1">?</div>
    <div class="floating-emoji emoji-2">??</div>
    <div class="floating-emoji emoji-3">?</div>
    <div class="floating-emoji emoji-4">?</div>
    
    <div class="rainbow"></div>
    
    <h1 class="main-title">¡Vamos a Aprender el Verbo "To Be"!</h1>
    
    <center>
        <a href="Ingles-LeccionVocabulario.jsp">
            <button class="back-btn">
                <i class="fas fa-arrow-left"></i>
            </button>
        </a>
    </center>
    
    <div class="container">
        <div class="level-indicator">Nivel: Principiante</div>
        
        <!-- Forma afirmativa -->
        <div class="category-title afirmativo">
            <i class="fas fa-check-circle"></i> Forma Afirmativa
        </div>
        <div class="card-container">
            <div class="to-be-card afirm">
                <div class="sound-btn" onclick="playSound('iam')">
                    <i class="fas fa-volume-up"></i>
                </div>
                <div class="verb">I am</div>
                <img src="../Imagenes/Iam.png" alt="Imagen de una persona">
                <p><span class="pronoun">I</span> am happy. <br><span class="spanish">(Yo estoy feliz.)</span></p>
            </div>
            <div class="to-be-card afirm">
                <div class="sound-btn" onclick="playSound('heis')">
                    <i class="fas fa-volume-up"></i>
                </div>
                <div class="verb">He is</div>
                <img src="../Imagenes/Heis.png" alt="Imagen de un hombre">
                <p><span class="pronoun">He</span> is a teacher. <br><span class="spanish">(Él es un maestro.)</span></p>
            </div>
        </div>
        
        <!-- Forma negativa -->
        <div class="category-title negativo">
            <i class="fas fa-times-circle"></i> Forma Negativa
        </div>
        <div class="card-container">
            <div class="to-be-card neg">
                <div class="sound-btn" onclick="playSound('youarenot')">
                    <i class="fas fa-volume-up"></i>
                </div>
                <div class="verb">You are not</div>
                <img src="../Imagenes/Youare.png" alt="Imagen de un chico">
                <p><span class="pronoun">You</span> are not tired. <br><span class="spanish">(No estás cansado.)</span></p>
            </div>
            <div class="to-be-card neg">
                <div class="sound-btn" onclick="playSound('sheisnot')">
                    <i class="fas fa-volume-up"></i>
                </div>
                <div class="verb">She is not</div>
                <img src="../Imagenes/Sheis.png" alt="Imagen de una mujer">
                <p><span class="pronoun">She</span> is not sad. <br><span class="spanish">(Ella no está triste.)</span></p>
            </div>
        </div>
        
        <!-- Forma interrogativa -->
        <div class="category-title interrogativo">
            <i class="fas fa-question-circle"></i> Forma Interrogativa
        </div>
        <div class="card-container">
            <div class="to-be-card interr">
                <div class="sound-btn" onclick="playSound('isit')">
                    <i class="fas fa-volume-up"></i>
                </div>
                <div class="verb">Is it?</div>
                <img src="../Imagenes/Isit.png" alt="Imagen de una persona preguntando">
                <p>What <span class="pronoun">is</span> it? <br><span class="spanish">(¿Qué es eso?)</span></p>
            </div>
            <div class="to-be-card interr">
                <div class="sound-btn" onclick="playSound('arethey')">
                    <i class="fas fa-volume-up"></i>
                </div>
                <div class="verb">Are they?</div>
                <img src="../Imagenes/They.png" alt="Imagen de dos personas">
                <p><span class="pronoun">Are</span> they students? <br><span class="spanish">(¿Son ellos estudiantes?)</span></p>
            </div>
        </div>
        
        <div class="decoration"></div>
    </div>
    
    <script>
        // Función para reproducir sonidos (simulada)
        function playSound(id) {
            // En una implementación real, aquí se reproduciría el audio
            console.log("Reproduciendo sonido: " + id);
            
            // Animación visual de feedback
            const btn = event.currentTarget;
            btn.classList.add('active');
            
            // Animar la tarjeta
            const card = btn.closest('.to-be-card');
            card.style.transform = 'scale(1.05)';
            
            setTimeout(() => {
                btn.classList.remove('active');
                card.style.transform = '';
            }, 300);
        }
        
        // Animación de entrada
        document.addEventListener('DOMContentLoaded', function() {
            const title = document.querySelector('.main-title');
            title.style.opacity = '0';
            title.style.transform = 'translateY(-20px)';
            
            setTimeout(() => {
                title.style.transition = 'all 0.8s ease';
                title.style.opacity = '1';
                title.style.transform = 'translateY(0)';
            }, 200);
        });
    </script>
</body>
</html>