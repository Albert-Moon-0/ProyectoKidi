<%-- 
    Document   : general
    Created on : 27 jun 2025, 14:10:42
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Algo salió mal</title>
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
            max-width: 700px;
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
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        .error-code {
            font-size: 3rem;
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
            margin-bottom: 2rem;
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
            padding: 1.5rem;
            text-align: left;
            font-size: 0.9rem;
            color: var(--text-secondary);
        }

        .error-details strong {
            color: var(--text-primary);
        }

        .contact-info {
            background-color: var(--primary-light);
            border-radius: 12px;
            padding: 1rem;
            margin-top: 1rem;
            border-left: 4px solid var(--primary-color);
        }

        @media (max-width: 768px) {
            .error-container {
                padding: 2rem;
            }
            
            .error-code {
                font-size: 2.5rem;
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
    <%
        // Obtener información del error
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        String errorMessage = (String) request.getAttribute("javax.servlet.error.message");
        String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
        
        // Valores por defecto si no están disponibles
        if (statusCode == null) statusCode = 500;
        if (errorMessage == null) errorMessage = "Error desconocido";
        if (requestUri == null) requestUri = "Desconocida";
        
        // Determinar el mensaje según el código de error
        String title = "Algo salió mal";
        String message = "Ha ocurrido un error inesperado. Por favor, inténtalo de nuevo más tarde.";
        String iconClass = "fas fa-exclamation-circle";
        
        switch (statusCode) {
            case 404:
                title = "Página no encontrada";
                message = "La página que buscas no existe o ha sido movida.";
                iconClass = "fas fa-search";
                break;
            case 403:
                title = "Acceso prohibido";
                message = "No tienes permisos para acceder a este recurso.";
                iconClass = "fas fa-ban";
                break;
            case 500:
                title = "Error interno del servidor";
                message = "Ha ocurrido un error en el servidor. Nuestro equipo ha sido notificado.";
                iconClass = "fas fa-exclamation-triangle";
                break;
        }
    %>

    <div class="error-container">
        <div class="error-icon">
            <i class="<%= iconClass %>"></i>
        </div>
        
        <div class="error-code"><%= statusCode %></div>
        
        <h1 class="error-title"><%= title %></h1>
        
        <p class="error-message"><%= message %></p>
        
        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                <i class="fas fa-home"></i>
                Ir al inicio
            </a>
            <button onclick="history.back()" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i>
                Volver atrás
            </button>
            <button onclick="location.reload()" class="btn btn-secondary">
                <i class="fas fa-redo"></i>
                Recargar página
            </button>
        </div>
        
        <div class="error-details">
            <strong>Detalles técnicos:</strong><br>
            <strong>Código de error:</strong> <%= statusCode %><br>
            <strong>Mensaje:</strong> <%= errorMessage %><br>
            <strong>URL solicitada:</strong> <%= requestUri %><br>
            <strong>Hora:</strong> <%= new java.util.Date() %><br>
            <strong>Sesión ID:</strong> <%= request.getSession().getId() %>
            
            <div class="contact-info">
                <strong><i class="fas fa-info-circle"></i> ¿Necesitas ayuda?</strong><br>
                Si el problema persiste, por favor contacta a nuestro equipo de soporte 
                con el código de error y la hora mostrados arriba.
            </div>
        </div>
    </div>
</body>
</html>
