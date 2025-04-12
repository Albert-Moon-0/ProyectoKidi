<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verificación de Correo</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        /* Utilizar los mismos estilos que en tu formulario de registro */
        :root {
            --primary-dark: #4A235A;
            --primary-light: #D7BDE2;
            --accent-color: #8E44AD;
            --background-color: #F3E5F5;
            --text-color: #2C3E50;
            --input-background: #FFFFFF;
            --input-border: #A569BD;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--accent-color) 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 1rem;
            line-height: 1.6;
        }

        .verification-container {
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: 500px;
            background-color: var(--input-background);
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
            padding: 2rem;
            text-align: center;
        }

        .verification-header {
            margin-bottom: 2rem;
        }

        .verification-header h1 {
            color: var(--primary-dark);
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .verification-header p {
            color: var(--text-color);
            font-size: 1rem;
            margin-bottom: 1.5rem;
        }

        .verification-icon {
            font-size: 4rem;
            color: var(--primary-dark);
            margin-bottom: 1.5rem;
        }

        .verification-form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .code-inputs {
            display: flex;
            justify-content: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .code-inputs input {
            width: 3rem;
            height: 3rem;
            text-align: center;
            font-size: 1.5rem;
            border: 2px solid var(--input-border);
            border-radius: 10px;
            outline: none;
        }

        .verify-btn {
            background-color: var(--primary-dark);
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 10px;
            font-size: 1.1rem;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 1rem;
        }

        .verify-btn:hover {
            background-color: var(--accent-color);
        }

        .resend-link {
            margin-top: 1rem;
            color: var(--primary-dark);
            text-decoration: none;
            font-weight: bold;
            cursor: pointer;
        }

        .error-message {
            color: #E74C3C;
            margin-top: 1rem;
            display: none;
        }
    </style>
</head>
<body>
    <div class="verification-container">
        <div class="verification-icon">
            <i class="fas fa-envelope"></i>
        </div>
        
        <div class="verification-header">
            <h1>Verificación de Correo</h1>
            <p>Hemos enviado un código de verificación a tu correo electrónico. Por favor, introdúcelo a continuación para verificar tu cuenta.</p>
        </div>
        
        <form class="verification-form" action="complete-registration.jsp" method="post">
            <input type="text" name="code" id="verification-code" maxlength="6" pattern="[0-9]{6}" 
                   title="El código debe contener 6 dígitos" required 
                   style="width: 100%; padding: 1rem; font-size: 1.5rem; text-align: center; letter-spacing: 0.5rem; border: 2px solid var(--input-border); border-radius: 10px;">
            
            <div class="error-message" id="error-message">
                Código de verificación incorrecto. Por favor, inténtalo de nuevo.
            </div>
            
            <button type="submit" class="verify-btn">Verificar</button>
        </form>
        
        <a href="resend-code.jsp" class="resend-link">¿No recibiste el código? Enviar de nuevo</a>
    </div>

    <script>
        // Si hay un parámetro de error en la URL, mostrar el mensaje de error
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('error')) {
            document.getElementById('error-message').style.display = 'block';
        }
    </script>
</body>
</html>