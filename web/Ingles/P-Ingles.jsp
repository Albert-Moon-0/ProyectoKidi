<%-- 
    Document   : P-Ingles
    Created on : 18 oct. 2024, 11:24:01
    Author     : Usuario
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Inglés</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #4ecdc4;
            --accent-color: #ffe66d;
            --text-color: #2d334a;
            --background-light: #f8f9fa;
        }
        
        body {
            font-family: 'Nunito', sans-serif;
            color: var(--text-color);
            background-color: var(--background-light);
            transition: all 0.3s ease;
        }
        
        /* Header estilizado */
        .header-title {
            font-size: 3rem;
            font-weight: 700;
            color: var(--primary-color);
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            margin: 2rem 0;
            position: relative;
            padding-bottom: 0.5rem;
        }
        
        /* Mejoras para las tarjetas */
        .card {
            height: 100%;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
        }
        
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        .card-img-top {
            width: 100%;
            height: 220px;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .card:hover .card-img-top {
            transform: scale(1.05);
        }
        
        .card-body {
            padding: 1.5rem;
            background: white;
        }
        
        .card-title {
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
            width: 20px;
            height: 20px;
            accent-color: var(--secondary-color);
            cursor: not-allowed;
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
        
        /* Footer sin color específico */
        footer {
            padding: 2rem 0 1rem;
            margin-top: 3rem !important;
        }
        
        footer p {
            font-weight: 500;
        }
        
        /* Responsividad mejorada */
        @media (max-width: 768px) {
            .header-title {
                font-size: 2.2rem;
            }
            
            .card-title {
                font-size: 1.1rem;
            }
        }
        
        @media (max-width: 576px) {
            .header-title {
                font-size: 1.8rem;
            }
            
            .card {
                margin-bottom: 1.5rem;
            }
        }
    </style>
    <!-- Fuente Nunito de Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <!-- Mini Header -->
    <div class="header-title text-center">Inglés</div>
    
    <!-- Contenido principal -->
    <div class="main-container">
        <div class="container">
            <div class="row text-center">
                <div class="col-sm-6 col-md-3 mb-4">
                    <a href="Ingles-LeccionVocabulario.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/LeccionVocabularioIngles.png" alt="Lección de vocabulario" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Lección de vocabulario
                                    <input type="checkbox" name="CheckLecVocIngles" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-3 mb-4">
                    <a href="Ingles-EjerciciosGramatica.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/EjerciciosGramaticaIngles.png" alt="Ejercicios de gramática" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Ejercicios de gramática
                                    <input type="checkbox" name="CheckEjerGramIngles" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-3 mb-4">
                    <a href="Ingles-LecturaHistorias.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/LecturaHistoriasIngles.png" alt="Lectura de historias cortas" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Lectura de historias cortas
                                    <input type="checkbox" name="CheckLecHistoriasIngles" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-3 mb-4">
                    <a href="Ingles-JuegosPalabras.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/JuegosPalabrasEspanol.png" alt="Juegos de palabras" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Juegos de palabras
                                    <input type="checkbox" name="CheckJuegoPalabrasIngles" value="ON" disabled />
                                </h5>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="py-3">
        <div class="container">
            <p class="text-center text-body-secondary">© 2024 KIDI, Inc Todos los derechos reservados</p>
        </div>
    </footer>
    
    <!-- Script de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>