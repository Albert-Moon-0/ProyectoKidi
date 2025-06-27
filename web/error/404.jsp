<%-- 
    Document   : 404
    Created on : 27 jun 2025, 14:08:33
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página no encontrada - 404</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #6C8AE8;
            --primary-light: #E6EEFF;
            --secondary-color: #F4F9FC;
            --accent-color: #A5D6A7;
            --accent-hover: #8BC34A;
            --text-primary: #2C3E50;
            --text-secondary: #7D7D7D;
            --background-color: #EDF2F7;
            --hover-color: #5A7BE0;
            --card-shadow: 0 10px 25px rgba(108, 138, 232, 0.1);
            --card-hover-shadow: 0 15px 35px rgba(108, 138, 232, 0.15);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: var(--background-color);
            font-family: 'Poppins', sans-serif;
            color: var(--text-primary);
            background-image: linear-gradient(135deg, rgba(108, 138, 232, 0.05) 0%, rgba(165, 214, 167, 0.05) 100%);
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .error-container {
            background-color: white;
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            padding: 3rem;
            text-align: center;
            max-width: 600px;
            width: 100%;
            border-top: 4px solid var(--primary-color);
            animation: fadeIn 0.6s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .error-icon {
            background-color: var(--primary-light);
            color: var(--primary-color);
            border-radius: 50%;
            width: 120px;
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            font-size: 3rem;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }

        .error-code {
            font-size: 4rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1rem;
            line-height: 1;
        }

        .error-title {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 1rem;
        }

        .error-message {
            font-size: 1.1rem;
            color: var(--text-secondary);
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 500;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--hover-color);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(108, 138, 232, 0.3);
        }

        .btn-secondary {
            background-color: var(--secondary-color);
            color: var(--text-primary);
            border: 2px solid var(--primary-light);
        }

        .btn-secondary:hover {
            background-color: var(--primary-light);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(108, 138, 232, 0.2);
        }

        .error-details {
            background-color: var(--secondary-color);
            border-radius: 12px;
            padding: 1rem;
            margin-top: 2rem;
            text-align: left;
            font-size: 0.9rem;
            color: var(--text-secondary);
        }

        .error-details strong {
            color: var(--text-primary);
        }

        @media (max-width: 768px) {
            .error-container {
                padding: 2rem;
            }
            
            .error-code {
                font-size: 3rem;
            }
            
            .error-title {
                font-size: 1.5rem;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                max-width: 250px;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">
            <i class="fas fa-search"></i>
        </div>
        
        <div class="error-code">404</div>
        
        <h1 class="error-title">¡Oops! Página no encontrada</h1>
        
        <p class="error-message">
            Lo sentimos, la página que estás buscando no existe o ha sido movida. 
            Puede que la URL esté mal escrita o que el contenido ya no esté disponible.
        </p>
        
        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                <i class="fas fa-home"></i>
                Ir al inicio
            </a>
            <button onclick="history.back()" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i>
                Volver atrás
            </button>
        </div>
        
        <div class="error-details">
            <strong>Detalles técnicos:</strong><br>
            <strong>Código de error:</strong> 404 - Not Found<br>
            <strong>URL solicitada:</strong> <%= request.getAttribute("javax.servlet.error.request_uri") %><br>
            <strong>Hora:</strong> <%= new java.util.Date() %>
        </div>
    </div>
</body>
</html>