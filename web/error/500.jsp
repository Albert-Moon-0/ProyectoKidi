<%-- 
    Document   : 500
    Created on : 27 jun 2025, 14:09:05
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error interno del servidor - 500</title>
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
            --error-color: #E74C3C;
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
            border-top: 4px solid var(--error-color);
            animation: fadeIn 0.6s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .error-icon {
            background-color: #FFE6E6;
            color: var(--error-color);
            border-radius: 50%;
            width: 120px;
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            font-size: 3rem;
            animation: pulse 2s infinite;
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

        .error-code {
            font-size: 4rem;
            font-weight: 700;
            color: var(--error-color);
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

        .error-details .stack-trace {
            background-color: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 1rem;
            margin-top: 1rem;
            font-family: 'Courier New', monospace;
            font-size: 0.8rem;
            max-height: 200px;
            overflow-y: auto;
            white-space: pre-wrap;
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
            <i class="fas fa-exclamation-triangle"></i>
        </div>
        
        <div class="error-code">500</div>
        
        <h1 class="error-title">Error interno del servidor</h1>
        
        <p class="error-message">
            Ha ocurrido un error inesperado en el servidor. Nuestro equipo técnico ha sido notificado 
            y está trabajando para solucionarlo. Por favor, inténtalo de nuevo más tarde.
        </p>
        
        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                <i class="fas fa-home"></i>
                Ir al inicio
            </a>
            <button onclick="location.reload()" class="btn btn-secondary">
                <i class="fas fa-redo"></i>
                Intentar de nuevo
            </button>
        </div>
        
        <div class="error-details">
            <strong>Detalles técnicos:</strong><br>
            <strong>Código de error:</strong> 500 - Internal Server Error<br>
            <strong>URL solicitada:</strong> <%= request.getAttribute("javax.servlet.error.request_uri") %><br>
            <strong>Método:</strong> <%= request.getAttribute("javax.servlet.error.request_method") %><br>
            <strong>Hora:</strong> <%= new java.util.Date() %><br>
            
            <% if (exception != null) { %>
                <strong>Excepción:</strong> <%= exception.getClass().getSimpleName() %><br>
                <strong>Mensaje:</strong> <%= exception.getMessage() != null ? exception.getMessage() : "No disponible" %><br>
                
                <div class="stack-trace">
                    <strong>Stack Trace:</strong><br>
                    <%
                        java.io.StringWriter sw = new java.io.StringWriter();
                        java.io.PrintWriter pw = new java.io.PrintWriter(sw);
                        exception.printStackTrace(pw);
                        String stackTrace = sw.toString();
                        // Limitar el stack trace a las primeras 10 líneas para evitar páginas muy largas
                        String[] lines = stackTrace.split("\n");
                        int maxLines = Math.min(10, lines.length);
                        for (int i = 0; i < maxLines; i++) {
                            out.println(lines[i]);
                        }
                        if (lines.length > 10) {
                            out.println("... (stack trace truncado)");
                        }
                    %>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
