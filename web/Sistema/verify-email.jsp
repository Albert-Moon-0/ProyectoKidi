<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verificación de Correo</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-bright: #9ac8cf;
            --secondary-bright: #4fbcb4;
            --accent-yellow: #FFE66D;
            --accent-purple: #A8E6CF;
            --accent-orange: #C4DEE2;
            --background-light: #F8F9FA;
            --text-dark: #2C3E50;
            --white: #FFFFFF;
            --shadow-color: rgba(0,0,0,0.1);
            --error-color: #E74C3C;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        body {
            font-family: 'Comic Sans MS', 'Arial', sans-serif;
            background: linear-gradient(45deg, var(--primary-bright), var(--secondary-bright), var(--accent-yellow), var(--accent-purple));
            background-size: 400% 400%;
            animation: gradientShift 8s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 1rem;
            line-height: 1.6;
            position: relative;
            overflow-x: hidden;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Floating elements for fun */
        .floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .shape {
            position: absolute;
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .shape:nth-child(1) {
            width: 60px;
            height: 60px;
            background: var(--accent-yellow);
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            width: 40px;
            height: 40px;
            background: var(--accent-orange);
            top: 60%;
            right: 15%;
            animation-delay: 2s;
        }

        .shape:nth-child(3) {
            width: 80px;
            height: 80px;
            background: var(--accent-purple);
            bottom: 20%;
            left: 20%;
            animation-delay: 4s;
        }

        .shape:nth-child(4) {
            width: 50px;
            height: 50px;
            background: var(--primary-bright);
            top: 10%;
            right: 25%;
            animation-delay: 1s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .verification-container {
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: 500px;
            background: var(--white);
            border-radius: 25px;
            box-shadow: 0 20px 40px var(--shadow-color);
            overflow: hidden;
            padding: 3rem 2rem;
            text-align: center;
            position: relative;
            z-index: 2;
            border: 3px solid var(--accent-yellow);
        }

        .verification-container::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, var(--primary-bright), var(--secondary-bright), var(--accent-yellow), var(--accent-purple));
            border-radius: 25px;
            z-index: -1;
            animation: borderGlow 3s ease-in-out infinite alternate;
        }

        @keyframes borderGlow {
            0% { opacity: 0.7; }
            100% { opacity: 1; }
        }

        .verification-icon {
            font-size: 5rem;
            color: var(--primary-bright);
            margin-bottom: 1.5rem;
            animation: bounce 2s ease-in-out infinite;
            text-shadow: 2px 2px 4px var(--shadow-color);
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        .verification-header {
            margin-bottom: 2rem;
        }

        .verification-header h1 {
            color: var(--primary-bright);
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            text-shadow: 2px 2px 4px var(--shadow-color);
            position: relative;
        }

        .verification-header h1::after {
            content: '✉';
            position: absolute;
            top: -10px;
            right: -40px;
            font-size: 1.5rem;
            animation: twinkle 2s ease-in-out infinite;
        }

        @keyframes twinkle {
            0%, 100% { opacity: 0.5; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.2); }
        }

        .verification-header p {
            color: var(--text-dark);
            font-size: 1.1rem;
            margin-bottom: 1.5rem;
            font-weight: bold;
        }

        .verification-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .code-input-container {
            position: relative;
            margin-bottom: 1rem;
        }

        #verification-code {
            width: 100%;
            padding: 1.5rem;
            font-size: 2rem;
            text-align: center;
            letter-spacing: 0.5rem;
            border: 3px solid var(--secondary-bright);
            border-radius: 20px;
            outline: none;
            background: var(--white);
            font-family: 'Comic Sans MS', 'Arial', sans-serif;
            font-weight: bold;
            box-shadow: 0 5px 15px var(--shadow-color);
            transition: all 0.3s ease;
        }

        #verification-code:focus {
            border-color: var(--primary-bright);
            box-shadow: 0 8px 25px rgba(154, 200, 207, 0.3);
            transform: scale(1.02);
        }

        #verification-code::placeholder {
            color: #A0A0A0;
            font-style: italic;
            letter-spacing: normal;
        }

        .verify-btn {
            background: linear-gradient(45deg, var(--primary-bright), var(--accent-orange));
            color: var(--white);
            border: none;
            padding: 1.5rem;
            border-radius: 20px;
            font-size: 1.3rem;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-top: 1rem;
            font-family: 'Comic Sans MS', 'Arial', sans-serif;
            font-weight: bold;
            box-shadow: 0 8px 20px var(--shadow-color);
            position: relative;
            overflow: hidden;
        }

        .verify-btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            transition: all 0.6s ease;
            transform: translate(-50%, -50%);
        }

        .verify-btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .verify-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(154, 200, 207, 0.4);
        }

        .verify-btn:active {
            transform: translateY(0px);
        }

        .resend-link {
            margin-top: 1.5rem;
            color: var(--secondary-bright);
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1rem;
            padding: 0.5rem 1rem;
            border-radius: 15px;
            transition: all 0.3s ease;
        }

        .resend-link:hover {
            background: var(--secondary-bright);
            color: var(--white);
            transform: scale(1.1);
        }

        .error-message {
            color: var(--error-color);
            margin-top: 1rem;
            display: none;
            background: rgba(231, 76, 60, 0.1);
            padding: 1rem;
            border-radius: 15px;
            border: 2px solid var(--error-color);
            font-weight: bold;
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        /* Fun loading state */
        .verify-btn.loading {
            position: relative;
            color: transparent;
        }

        .verify-btn.loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid var(--white);
            border-radius: 50%;
            animation: spin 1s linear infinite;
            transform: translate(-50%, -50%);
        }

        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }

        /* Success animation */
        .code-input-container.success #verification-code {
            border-color: #2ECC71;
            background: #E8F8F5;
        }

        @media screen and (max-width: 768px) {
            .verification-container {
                margin: 0.5rem;
                padding: 2rem 1.5rem;
            }

            .verification-header h1 {
                font-size: 2rem;
            }

            .verification-header h1::after {
                right: -20px;
                font-size: 1.2rem;
            }

            .verification-icon {
                font-size: 4rem;
            }

            #verification-code {
                font-size: 1.5rem;
                padding: 1.2rem;
            }

            .floating-shapes {
                display: none;
            }
        }

        /* Decorative elements */
        .verification-container::after {
            content: '🎉';
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 1.5rem;
            animation: twinkle 3s ease-in-out infinite 1s;
        }
    </style>
</head>
<body>
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <div class="verification-container">
        <div class="verification-icon">
            <i class="fas fa-envelope"></i>
        </div>
        
        <div class="verification-header">
            <h1>¡Verifica tu Correo!</h1>
            <p>Hemos enviado un código súper especial a tu correo electrónico. ¡Introdúcelo aquí para verificar tu cuenta!</p>
        </div>
        
        <form class="verification-form" action="complete-registration.jsp" method="post">
            <div class="code-input-container">
                <input type="text" name="code" id="verification-code" maxlength="6" pattern="[0-9]{6}" 
                       title="El código debe contener 6 dígitos" required 
                       placeholder="000000">
            </div>
            
            <div class="error-message" id="error-message">
                ¡Ups! El código no es correcto. ¡Inténtalo de nuevo! 🤔
            </div>
            
            <button type="submit" class="verify-btn">¡Verificar!</button>
        </form>
        
        <a href="resend-code.jsp" class="resend-link">¿No recibiste el código? ¡Enviar de nuevo! 📬</a>
    </div>

    <script>
        // Si hay un parámetro de error en la URL, mostrar el mensaje de error
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('error')) {
            document.getElementById('error-message').style.display = 'block';
        }

        // Fun interactions
        const codeInput = document.getElementById('verification-code');
        const container = document.querySelector('.code-input-container');

        codeInput.addEventListener('focus', function() {
            container.style.transform = 'scale(1.05)';
        });
        
        codeInput.addEventListener('blur', function() {
            container.style.transform = 'scale(1)';
        });

        // Simulate loading state on form submission
        document.querySelector('.verification-form').addEventListener('submit', function(e) {
            const btn = this.querySelector('.verify-btn');
            btn.classList.add('loading');
            btn.disabled = true;
        });

        // Add some fun input validation feedback
        codeInput.addEventListener('input', function() {
            if (this.value.length === 6) {
                container.classList.add('success');
            } else {
                container.classList.remove('success');
            }
        });
    </script>
</body>
</html>