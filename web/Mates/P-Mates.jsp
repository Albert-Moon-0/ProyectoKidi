<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matemáticas </title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Baloo+2:wght@500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #FF5757;
            --secondary-color: #4FC1E9;
            --accent-color: #FFDE59;
            --green-color: #A0E57D;
            --purple-color: #C990FF;
            --text-color: #333333;
            --background-color: #F7F9FC;
        }
        
        body {
            font-family: 'Nunito', sans-serif;
            color: var(--text-color);
            background-color: var(--background-color);
            background-image: url('data:image/svg+xml;utf8,<svg width="100" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><circle cx="10" cy="10" r="2" fill="%23FFDE59" opacity="0.3"/><circle cx="40" cy="30" r="3" fill="%234FC1E9" opacity="0.3"/><circle cx="70" cy="50" r="2" fill="%23FF5757" opacity="0.3"/><circle cx="20" cy="70" r="4" fill="%23A0E57D" opacity="0.3"/><circle cx="90" cy="85" r="3" fill="%23C990FF" opacity="0.3"/></svg>');
            transition: all 0.3s ease;
        }
        
        /* Header animado y divertido */
        .header-title {
            font-family: 'Baloo 2', cursive;
            font-size: 3.5rem;
            font-weight: 700;
            color: var(--primary-color);
            text-shadow: 3px 3px 0 var(--purple-color);
            margin: 1.5rem 0;
            position: relative;
            padding-bottom: 0.5rem;
            text-align: center;
            letter-spacing: 1px;
            animation: bounce 2s infinite;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        /* Mejoras para las tarjetas */
        .card {
            height: 100%;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            position: relative;
            background: white;
        }
        
        .card:hover {
            transform: translateY(-10px) rotate(2deg);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        .card:nth-child(odd):hover {
            transform: translateY(-10px) rotate(-2deg);
        }
        
        .card-img-top {
            width: 100%;
            height: 220px;
            object-fit: cover;
            transition: transform 0.5s ease;
            border-bottom: 5px solid var(--accent-color);
        }
        
        .card:nth-child(1) .card-img-top {
            border-bottom-color: var(--primary-color);
        }
        
        .card:nth-child(2) .card-img-top {
            border-bottom-color: var(--secondary-color);
        }
        
        .card:nth-child(3) .card-img-top {
            border-bottom-color: var(--green-color);
        }
        
        .card:nth-child(4) .card-img-top {
            border-bottom-color: var(--purple-color);
        }
        
        .card:hover .card-img-top {
            transform: scale(1.05);
        }
        
        .card-body {
            padding: 1.5rem;
            background: white;
        }
        
        .card-title {
            font-family: 'Baloo 2', cursive;
            font-weight: 700;
            color: var(--text-color);
            margin-bottom: 0.75rem;
            font-size: 1.3rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        /* Estilo para los checkboxes */
        input[type="checkbox"] {
            width: 22px;
            height: 22px;
            accent-color: var(--secondary-color);
            cursor: not-allowed;
            border-radius: 5px;
        }
        
        /* Mejoras en los enlaces */
        a {
            text-decoration: none;
            color: inherit;
            display: block;
        }
        
        /* Contenedor principal con espacio adecuado */
        .main-container {
            padding: 2rem 0;
            min-height: 70vh;
            display: flex;
            align-items: center;
        }
        
        /* Iconos de matemáticas flotantes */
        .floating-icon {
            position: absolute;
            font-size: 2.5rem;
            opacity: 0.6;
            animation: float 8s infinite ease-in-out;
            color: var(--accent-color);
            z-index: -1;
        }
        
        .icon-1 {
            top: 20%;
            left: 5%;
            animation-delay: 0s;
        }
        
        .icon-2 {
            top: 15%;
            right: 10%;
            animation-delay: 2s;
            color: var(--primary-color);
        }
        
        .icon-3 {
            bottom: 25%;
            left: 10%;
            animation-delay: 4s;
            color: var(--secondary-color);
        }
        
        .icon-4 {
            bottom: 20%;
            right: 5%;
            animation-delay: 6s;
            color: var(--green-color);
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
        }
        
        /* Footer colorido */
        footer {
            padding: 2rem 0 1rem;
            margin-top: 3rem !important;
            background-color: white;
            border-top: 4px dashed var(--accent-color);
        }
        
        footer p {
            font-weight: 600;
            color: var(--text-color);
        }
        
        /* Personalización de cada tarjeta con colores distintos */
        .col-card:nth-child(1) .card {
            border-top: 5px solid var(--primary-color);
        }
        
        .col-card:nth-child(2) .card {
            border-top: 5px solid var(--secondary-color);
        }
        
        .col-card:nth-child(3) .card {
            border-top: 5px solid var(--green-color);
        }
        
        .col-card:nth-child(4) .card {
            border-top: 5px solid var(--purple-color);
        }
        
        /* Botón de volver al inicio */
        .back-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--accent-color);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            font-size: 1.5rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            opacity: 0.8;
            z-index: 100;
        }
        
        .back-button:hover {
            transform: scale(1.1);
            opacity: 1;
        }
        
        /* Responsividad mejorada */
        @media (max-width: 768px) {
            .header-title {
                font-size: 2.5rem;
            }
            
            .card-title {
                font-size: 1.1rem;
            }
            
            .floating-icon {
                font-size: 2rem;
            }
        }
        
        @media (max-width: 576px) {
            .header-title {
                font-size: 2rem;
            }
            
            .card {
                margin-bottom: 1.5rem;
            }
            
            .floating-icon {
                display: none;
            }
        }
    </style>
</head>
<body>
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Iconos flotantes matemáticos -->
    <div class="floating-icon icon-1">+</div>
    <div class="floating-icon icon-2">×</div>
    <div class="floating-icon icon-3">?</div>
    <div class="floating-icon icon-4">÷</div>
    
    <!-- Header animado -->
    <div class="header-title">¡Matemáticas !</div>
    
    <!-- Contenido principal -->
    <div class="main-container">
        <div class="container">
            <div class="row text-center g-4">
                <div class="col-sm-6 col-md-3 mb-4 col-card">
                    <a href="Mates-LeccionesNumeros.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/LeccionNumerosMates.png" alt="Lección de números" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Lección de números
                                    <input type="checkbox" name="CheckLeccionNumerosMates" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-3 mb-4 col-card">
                    <a href="Leccion Geometria.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/GeometriaMates.png" alt="Geometría" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Geometría
                                    <input type="checkbox" name="CheckGeometriaMates" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-3 mb-4 col-card">
                    <a href="Mates-Ejercicios.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/OperacionesMates.png" alt="Ejercicios de operaciones" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Ejercicios de operaciones
                                    <input type="checkbox" name="CheckEjerOperaMates" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-3 mb-4 col-card">
                    <a href="Mate-Juegos.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/JuegosMates.png" alt="Juegos de matemáticas" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Juegos de matemáticas
                                    <input type="checkbox" name="CheckJuegosMates" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Botón flotante para volver arriba -->
    <a href="#" class="back-button">?</a>
    
    <!-- Footer -->
    <footer class="py-3">
        <div class="container">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3"></ul>
            <p class="text-center">© 2024 KIDI, Inc ¡Aprendiendo juntos!</p>
        </div>
    </footer>
    
    <!-- Script de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>