<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
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

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .login-container {
            display: flex;
            width: 100%;
            max-width: 1000px;
            background: var(--white);
            border-radius: 25px;
            box-shadow: 0 20px 40px var(--shadow-color);
            overflow: hidden;
            position: relative;
            z-index: 2;
            border: 3px solid var(--accent-yellow);
        }

        .login-container::before {
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

        .image-section {
            width: 50%;
            background: linear-gradient(135deg, var(--accent-purple), var(--secondary-bright));
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
            position: relative;
        }

        .image-section::before {
            content: '?';
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 2rem;
            animation: twinkle 2s ease-in-out infinite;
        }

        .image-section::after {
            content: '?';
            position: absolute;
            bottom: 20px;
            right: 20px;
            font-size: 1.5rem;
            animation: twinkle 2s ease-in-out infinite 1s;
        }

        @keyframes twinkle {
            0%, 100% { opacity: 0.5; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.2); }
        }

        .image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 20px;
            object-fit: cover;
            box-shadow: 0 10px 20px var(--shadow-color);
        }

        .login-section {
            width: 50%;
            padding: 3rem 2rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: var(--white);
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .login-header h1 {
            color: var(--primary-bright);
            font-size: 3rem;
            margin-bottom: 0.5rem;
            text-shadow: 2px 2px 4px var(--shadow-color);
            position: relative;
        }

        .login-header h1::after {
            content: '?';
            position: absolute;
            top: -10px;
            right: -40px;
            font-size: 2rem;
            animation: bounce 2s ease-in-out infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        .login-header p {
            color: var(--text-dark);
            font-size: 1.2rem;
            font-weight: bold;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .form-input {
            position: relative;
            transform: scale(1);
        }

        .form-input:hover {
            transform: scale(1.02);
        }

        .form-input input {
            width: 100%;
            padding: 1.2rem 1.2rem 1.2rem 3.5rem;
            border: 3px solid var(--secondary-bright);
            border-radius: 20px;
            font-size: 1.1rem;
            outline: none;
            background: var(--white);
            font-family: 'Comic Sans MS', 'Arial', sans-serif;
            box-shadow: 0 5px 15px var(--shadow-color);
        }

        .form-input input:focus {
            border-color: var(--primary-bright);
            box-shadow: 0 8px 25px rgba(255, 107, 107, 0.3);
            transform: scale(1.02);
        }

        .form-input i {
            position: absolute;
            left: 1.2rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-bright);
            font-size: 1.3rem;
            z-index: 1;
        }

        .login-btn {
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

        .login-btn::before {
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

        .login-btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(255, 107, 107, 0.4);
        }

        .login-btn:active {
            transform: translateY(0px);
        }

        .register-link {
            text-align: center;
            margin-top: 1.5rem;
        }

        .register-link a {
            color: var(--secondary-bright);
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1rem;
            padding: 0.5rem 1rem;
            border-radius: 15px;
            transition: all 0.3s ease;
        }

        .register-link a:hover {
            background: var(--secondary-bright);
            color: var(--white);
            transform: scale(1.1);
        }

        /* Fun input animations */
        .form-input input::placeholder {
            color: #A0A0A0;
            font-style: italic;
        }

        .form-input input:focus::placeholder {
            transform: translateX(10px);
            opacity: 0.7;
        }

        @media screen and (max-width: 768px) {
            .login-container {
                flex-direction: column;
                margin: 0.5rem;
            }

            .image-section, .login-section {
                width: 100%;
            }

            .image-section {
                max-height: 300px;
                background: none;
                text-align: center;
                padding: 20px;
            }

            .login-header h1 {
                font-size: 2.5rem;
            }

            .login-header h1::after {
                right: -20px;
                font-size: 1.5rem;
            }

            .floating-shapes {
                display: none;
            }
        }

        /* Success animation for form submission */
        .form-input.success input {
            border-color: #2ECC71;
            background: #E8F8F5;
        }

        .form-input.success i {
            color: #2ECC71;
        }

        /* Fun loading state */
        .login-btn.loading {
            position: relative;
            color: transparent;
        }

        .login-btn.loading::after {
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
    </style>
</head>
<body>
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <div class="login-container">
        <div class="image-section">
            <img src="img/kidilogin.png" alt="Login Image">
        </div>
        
        <div class="login-section">
            <div class="login-header">
                <h1>Iniciar Sesión</h1>
                <p>Ingresa tus credenciales para continuar</p>
            </div>
            
            <form class="login-form" action="Sistema/Login.jsp" method="get">
                <div class="form-input">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="correo" placeholder="Correo electrónico" required>
                </div>
                
                <div class="form-input">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="contrasena" placeholder="Contraseña" 
                           maxlength="16" 
                           pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" 
                           title="La contraseña debe tener al menos 8 caracteres, una mayúscula, una minúscula y un número." 
                           required>
                </div>
                
                <button type="submit" class="login-btn">Iniciar Sesión</button>
            </form>
            
            <div class="register-link">
                <a href="Sistema/Registro.jsp">¿No tienes cuenta? Regístrate</a>
            </div>
        </div>
    </div>

    <script>
        // Fun interactions for kids
        document.querySelectorAll('.form-input input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'scale(1.05)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'scale(1)';
            });
        });

        // Simulate loading state on form submission
        document.querySelector('.login-form').addEventListener('submit', function(e) {
            const btn = this.querySelector('.login-btn');
            btn.classList.add('loading');
            btn.disabled = true;
        });
    </script>
</body>
</html>