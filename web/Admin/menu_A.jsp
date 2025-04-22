<%-- 
    Document   : menu_A
    Created on : 11 abr. 2025, 18:52:20
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kidi - Administrador</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
        <style>
            /* ===== VARIABLES GLOBALES ===== */
            :root {
                /* Colores principales */
                --primary-color: #6A5ACD;       /* Amarillo */
                --secondary-color: #FF6B6B;     /* Coral */
                --accent-color: #FFD166;        /* Amarillo */
                --success-color: #06D6A0;       /* Azul */
                --info-color: #26C6DA;          /* Averde */

                /* Colores de fondo */
                --bg-light: #F9F7FF;
                --bg-gradient-1: #E0EAFC;
                --bg-gradient-2: #CFDEF3;

                /* Colores de texto */
                --text-primary: #333;
                --text-secondary: #666;
                --text-light: #FFF;

                /* Sombras y efectos */
                --box-shadow-sm: 0 4px 10px rgba(0, 0, 0, 0.1);
                --box-shadow-md: 0 8px 20px rgba(0, 0, 0, 0.15);
                --box-shadow-lg: 0 15px 30px rgba(0, 0, 0, 0.2);

                /* Bordes y radios */
                --border-radius-sm: 15px;
                --border-radius-md: 25px;
                --border-radius-lg: 50px;

                /* Animaciones */
                --transition-fast: 0.2s;
                --transition-normal: 0.3s;
                --transition-slow: 0.5s;
            }

            /* ===== ESTILOS BASE ===== */
            *, *::before, *::after {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                padding: 0;
                font-family: 'Comic Sans MS', 'Bubblegum Sans', 'Poppins', sans-serif;
                line-height: 1.6;
                color: var(--text-primary);
                background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%239C92AC' fill-opacity='0.1' fill-rule='evenodd'/%3E%3C/svg%3E"),
                    linear-gradient(135deg, var(--bg-gradient-1), var(--bg-gradient-2));
                background-attachment: fixed;
                overflow-x: hidden;
            }

            /* ===== ANIMACIONES GLOBALES ===== */
            @keyframes float {
                0% {
                    transform: translateY(0px);
                }
                50% {
                    transform: translateY(-15px);
                }
                100% {
                    transform: translateY(0px);
                }
            }

            @keyframes pulse {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.05);
                }
                100% {
                    transform: scale(1);
                }
            }

            @keyframes wiggle {
                0%, 100% {
                    transform: rotate(-3deg);
                }
                50% {
                    transform: rotate(3deg);
                }
            }

            @keyframes rainbow {
                0% {
                    color: #FF5B5B;
                }
                20% {
                    color: #FFA55B;
                }
                40% {
                    color: #FFD75B;
                }
                60% {
                    color: #6BFF5B;
                }
                80% {
                    color: #5B7CFF;
                }
                100% {
                    color: #B05BFF;
                }
            }

            @keyframes confetti {
                0% {
                    background-position: 0% 0%;
                }
                100% {
                    background-position: 100% 100%;
                }
            }

            @keyframes bounce {
                0%, 100% {
                    transform: translateY(0);
                }
                50% {
                    transform: translateY(-20px);
                }
            }

            /* ===== ENCABEZADOS Y TIPOGRAFÍA ===== */
            .header-title {
                font-size: clamp(2.5rem, 6vw, 3.5rem);
                font-weight: 700;
                text-align: center;
                margin: 2rem auto;
                color: var(--primary-color);
                text-shadow: 3px 3px 0px rgba(106, 90, 205, 0.3);
                position: relative;
                display: inline-block;
                animation: float 6s ease-in-out infinite;
            }

            .header-title::after {
                content: "✨";
                position: absolute;
                top: -20px;
                right: -30px;
                font-size: 2rem;
                animation: pulse 2s infinite;
            }

            .header-title::before {
                content: "✨";
                position: absolute;
                bottom: -10px;
                left: -20px;
                font-size: 1.5rem;
                animation: pulse 2s infinite reverse;
            }

            .greeting {
                font-size: clamp(1.8rem, 5vw, 2.5rem);
                text-align: center;
                margin: 2rem auto;
                font-weight: 600;
            }

            .greeting span {
                position: relative;
                display: inline-block;
                color: var(--secondary-color);
                padding: 0 10px;
                animation: rainbow 8s linear infinite;
            }

            .greeting span::before {
                content: "";
                position: absolute;
                width: 100%;
                height: 10px;
                bottom: 5px;
                left: 0;
                background-image: url("data:image/svg+xml,%3Csvg width='100' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,5 Q25,0 50,5 T100,5' stroke='%23FFD166' stroke-width='3' fill='none'/%3E%3C/svg%3E");
                background-repeat: repeat-x;
                background-size: 100px 10px;
                z-index: -1;
                opacity: 0.7;
            }

            .novedades {
                margin: 4rem auto 2rem;
                position: relative;
                padding: 2rem 0;
            }

            .novedades::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 15px;
                background-image: url("data:image/svg+xml,%3Csvg width='100' height='15' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,10 Q10,5 20,10 T40,10 T60,10 T80,10 T100,10 V0 H0' fill='%23E0EAFC'/%3E%3C/svg%3E");
                background-repeat: repeat-x;
                background-size: 100px 15px;
            }

            .novedades h2 {
                font-size: clamp(2rem, 5vw, 2.8rem);
                text-align: center;
                color: var(--info-color);
                margin-bottom: 2.5rem;
                font-weight: 700;
                position: relative;
                display: inline-block;
            }

            .novedades h2::after {
                content: "🎉";
                position: absolute;
                right: -40px;
                top: 0;
                animation: wiggle 3s ease-in-out infinite;
            }

            /* ===== TARJETAS ===== */
            .row {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 30px;
            }

            .col-md-5 {
                flex: 0 0 calc(45% - 30px);
                max-width: calc(45% - 30px);
            }

            @media (max-width: 768px) {
                .col-md-5 {
                    flex: 0 0 100%;
                    max-width: 100%;
                }
            }

            .card {
                position: relative;
                background-color: var(--bg-light);
                border-radius: var(--border-radius-lg);
                padding: 2.5rem 2rem;
                height: 100%;
                min-height: 200px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                box-shadow: var(--box-shadow-md);
                overflow: hidden;
                transition: transform var(--transition-normal) ease,
                    box-shadow var(--transition-normal) ease;
                border: none;
                z-index: 1;
            }

            .card::before {
                content: "";
                position: absolute;
                top: -10px;
                left: -10px;
                right: -10px;
                bottom: -10px;
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color), var(--accent-color), var(--success-color), var(--info-color));
                background-size: 300% 300%;
                animation: confetti 15s linear infinite;
                border-radius: var(--border-radius-lg);
                z-index: -1;
                opacity: 0;
                transition: opacity var(--transition-normal);
            }

            .card:hover {
                transform: translateY(-15px) scale(1.03);
                box-shadow: var(--box-shadow-lg);
            }

            .card:hover::before {
                opacity: 1;
            }

            .card::after {
                content: "";
                position: absolute;
                top: 5px;
                left: 5px;
                right: 5px;
                bottom: 5px;
                background-color: var(--bg-light);
                border-radius: calc(var(--border-radius-lg) - 5px);
                z-index: -1;
            }

            .card:nth-child(1) {
                animation: bounce 8s ease-in-out infinite;
                animation-delay: 0s;
            }

            .card:nth-child(2) {
                animation: bounce 8s ease-in-out infinite;
                animation-delay: 0.5s;
            }

            .card:nth-child(3) {
                animation: bounce 8s ease-in-out infinite;
                animation-delay: 1s;
            }

            .card-title {
                position: relative;
                font-weight: 700;
                font-size: 1.4rem;
                margin-bottom: 1.5rem;
                color: var(--primary-color);
                display: inline-block;
                transition: color var(--transition-normal) ease;
            }

            .card:hover .card-title {
                color: var(--secondary-color);
            }

            .card-title::before {
                content: "🌟";
                margin-right: 8px;
                font-size: 1.2rem;
                display: inline-block;
                transform: translateY(-2px);
            }

            .card-text {
                color: var(--text-secondary);
                font-size: 1.1rem;
                margin-bottom: 1rem;
                transition: color var(--transition-normal) ease;
            }

            .card:hover .card-text {
                color: var(--text-primary);
            }

            /* ===== ELEMENTOS DECORATIVOS ===== */
            .container {
                position: relative;
                padding: 2rem;
                max-width: 1200px;
                margin: 0 auto;
            }

            .container::before {
                content: "🦄";
                position: absolute;
                font-size: 3rem;
                top: 20px;
                left: 5%;
                animation: float 7s ease-in-out infinite;
                z-index: -1;
                opacity: 0.3;
            }

            .container::after {
                content: "🚀";
                position: absolute;
                font-size: 3rem;
                bottom: 5%;
                right: 5%;
                animation: float 6s ease-in-out infinite reverse;
                z-index: -1;
                opacity: 0.3;
            }

            /* Nubes decorativas */
            .cloud {
                position: absolute;
                z-index: -1;
                opacity: 0.3;
                pointer-events: none;
            }

            .cloud-1 {
                top: 10%;
                left: 5%;
                font-size: 2rem;
                animation: float 15s ease-in-out infinite;
            }

            .cloud-2 {
                top: 20%;
                right: 10%;
                font-size: 3rem;
                animation: float 12s ease-in-out infinite reverse;
            }

            .cloud-3 {
                bottom: 15%;
                left: 15%;
                font-size: 2.5rem;
                animation: float 18s ease-in-out infinite;
            }

            /* ===== BOTONES Y ELEMENTOS INTERACTIVOS ===== */
            .btn {
                display: inline-block;
                padding: 0.8rem 1.5rem;
                background-color: var(--primary-color);
                color: var(--text-light);
                border-radius: var(--border-radius-md);
                text-decoration: none;
                font-weight: 600;
                font-size: 1rem;
                transition: all var(--transition-normal) ease;
                border: none;
                cursor: pointer;
                box-shadow: 0 4px 0 darken(var(--primary-color), 10%);
                position: relative;
                overflow: hidden;
            }

            .btn:hover {
                transform: translateY(-5px);
                box-shadow: 0 9px 0 darken(var(--primary-color), 10%);
            }

            .btn:active {
                transform: translateY(0);
                box-shadow: 0 4px 0 darken(var(--primary-color), 10%);
            }

            .btn::before {
                content: "";
                position: absolute;
                width: 100%;
                height: 100%;
                top: 0;
                left: -100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
                transition: all var(--transition-normal) ease;
            }

            .btn:hover::before {
                left: 100%;
            }

            /* ===== EFECTOS ADICIONALES ===== */
            /* Colorear elementos al pasar el mouse */
            .card:hover .card-title,
            .greeting:hover span {
                background-image: linear-gradient(45deg, var(--primary-color), var(--secondary-color), var(--accent-color));
                background-size: 200% auto;
                background-clip: text;
                text-fill-color: transparent;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                animation: rainbow 3s linear infinite;
            }

            /* Estrellitas que caen al pasar el mouse sobre la tarjeta */
            @keyframes falling {
                0% {
                    transform: translateY(-50px) translateX(0) rotate(0deg);
                    opacity: 1;
                }
                100% {
                    transform: translateY(100px) translateX(30px) rotate(180deg);
                    opacity: 0;
                }
            }

            .card:hover::after {
                content: "⭐";
                position: absolute;
                top: 0;
                left: 20%;
                color: var(--accent-color);
                font-size: 1rem;
                pointer-events: none;
                animation: falling 2s ease-in infinite;
                z-index: 3;
            }

            /* ===== RESPONSIVE ===== */
            @media (max-width: 992px) {
                .container {
                    padding: 1rem;
                }

                .card {
                    padding: 2rem 1.5rem;
                }
            }

            @media (max-width: 768px) {
                .header-title,
                .greeting {
                    margin: 1.5rem auto;
                }

                .card {
                    margin-bottom: 2rem;
                }

                .novedades {
                    margin-top: 2rem;
                }
            }

            @media (max-width: 576px) {
                body {
                    font-size: 0.9rem;
                }

                .card-title {
                    font-size: 1.2rem;
                }

                .card-text {
                    font-size: 1rem;
                }
            }

            /* ===== ACCESSIBILITY ===== */
            @media (prefers-reduced-motion: reduce) {
                * {
                    animation: none !important;
                    transition: background-color var(--transition-normal) ease,
                        color var(--transition-normal) ease !important;
                }

                .card:hover {
                    transform: translateY(-5px);
                }
            }

            .card:focus-within {
                outline: 3px solid var(--primary-color);
                outline-offset: 3px;
            }

            /* ===== BARRA DE NAVEGACIÓN PERSONALIZADA ===== */
            .navbar {
                background-color: rgba(255, 255, 255, 0.9);
                border-radius: 0 0 var(--border-radius-md) var(--border-radius-md);
                box-shadow: var(--box-shadow-md);
                padding: 0.8rem 1rem;
                backdrop-filter: blur(10px);
                position: sticky;
                top: 0;
                z-index: 100;
            }

            .navbar-brand {
                font-size: 1.8rem;
                font-weight: 700;
                color: var(--primary-color);
                transition: all var(--transition-normal) ease;
            }

            .navbar-brand:hover {
                transform: scale(1.05);
            }

            .navbar-nav .nav-link {
                color: var(--text-primary);
                font-weight: 600;
                margin: 0 0.5rem;
                padding: 0.5rem 1rem;
                border-radius: var(--border-radius-sm);
                transition: all var(--transition-normal) ease;
            }

            .navbar-nav .nav-link:hover {
                background-color: var(--primary-color);
                color: var(--text-light);
                transform: translateY(-3px);
                box-shadow: var(--box-shadow-sm);
            }

            /* ===== AÑADIR ELEMENTOS DECORATIVOS AL DOM ===== */
            body:before {
                content: "";
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                pointer-events: none;
                background-image:
                    radial-gradient(circle at 10% 20%, rgba(255, 255, 255, 0.1) 0%, transparent 20%),
                    radial-gradient(circle at 85% 60%, rgba(255, 255, 255, 0.15) 0%, transparent 20%),
                    radial-gradient(circle at 40% 80%, rgba(255, 255, 255, 0.1) 0%, transparent 15%);
                z-index: -2;
            }

            /* ===== ANIMACIÓN DE CARGA DE PÁGINA ===== */
            @keyframes fadeIn {
                0% {
                    opacity: 0;
                    transform: translateY(20px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .header-title {
                animation: fadeIn 1s ease-out 0.2s both, float 6s ease-in-out 1s infinite;
            }

            .greeting {
                animation: fadeIn 1s ease-out 0.5s both;
            }

            .novedades h2 {
                animation: fadeIn 1s ease-out 0.8s both;
            }

            .row .col-md-5:nth-child(1) {
                animation: fadeIn 1s ease-out 1.1s both;
            }

            .row .col-md-5:nth-child(2) {
                animation: fadeIn 1s ease-out 1.4s both;
            }

            .row .col-md-5:nth-child(3) {
                animation: fadeIn 1s ease-out 1.7s both;
            }

            /* ===== MODIFICACIONES AL HTML EXISTENTE ===== */
            /* Estas clases se aplicarán automáticamente a los elementos existentes */
            .display-4 {
                font-weight: 800;
                letter-spacing: 1px;
            }

            .display-3 {
                font-weight: 700;
            }

            /* ===== EFECTOS DE CURSOR PERSONALIZADO ===== */
            .card {
                cursor: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg&#39; width='32' height='32' viewBox='0 0 32 32'%3E%3Cpath fill='%236A5ACD' d='M16 0C7.163 0 0 7.163 0 16s7.163 16 16 16 16-7.163 16-16S24.837 0 16 0zm6 17h-5v5a1 1 0 01-2 0v-5h-5a1 1 0 010-2h5v-5a1 1 0 012 0v5h5a1 1 0 010 2z'/%3E%3C/svg%3E"), auto;
            }

            /* ===== SCROLL SUAVE ===== */
            html {
                scroll-behavior: smooth;
            }

            /* ===== SCROLLBAR PERSONALIZADA ===== */
            ::-webkit-scrollbar {
                width: 12px;
            }

            ::-webkit-scrollbar-track {
                background: var(--bg-light);
            }

            ::-webkit-scrollbar-thumb {
                background: var(--primary-color);
                border-radius: 10px;
                border: 3px solid var(--bg-light);
            }

            ::-webkit-scrollbar-thumb:hover {
                background: var(--secondary-color);
            }
        </style>
    </head>
    <body>
        <jsp:include page="BarraNavAdmin.jsp" />
        <div class="container mt-5">
            <div class="header-title">
                <h1 class="display-4 fw-bold">Bienvenido a Kidi</h1>
            </div>
            <div class="greeting mb-5">
                <h2 class="display-3">Hola de nuevo, <span></span></h2>
            </div>
            <section class="novedades content-section py-5">
                <h2 class="h2 mb-4">Novedades</h2>
                <div class="row justify-content-center">
                    <div class="col-md-5 mb-4">
                        <div class="card p-4 shadow-sm">
                            <h5 class="card-title">Nuevas actividades de Matemáticas</h5>
                            <p class="card-text">Aprende sumas y restas con juegos y ejercicios interactivos.</p>
                        </div>
                    </div>
                    <div class="col-md-5 mb-4">
                        <div class="card p-4 shadow-sm">
                            <h5 class="card-title">Nuevas lecturas</h5>
                            <p class="card-text">Descubre historias emocionantes con nuevos cuentos.</p>
                        </div>
                    </div>
                    <div class="col-md-5 mb-4">
                        <div class="card p-4 shadow-sm">
                            <h5 class="card-title">¡Nuevos juegos de palabras!</h5>
                            <p class="card-text">Juega y mejora tu vocabulario con desafíos divertidos.</p>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

