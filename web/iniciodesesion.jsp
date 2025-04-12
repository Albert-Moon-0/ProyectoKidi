<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
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

        .login-container {
            display: flex;
            width: 100%;
            max-width: 1000px;
            background-color: var(--input-background);
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .image-section {
            width: 50%;
            background-color: var(--primary-light);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 15px;
            object-fit: cover;
        }

        .login-section {
            width: 50%;
            padding: 3rem 2rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h1 {
            color: var(--primary-dark);
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .login-header p {
            color: var(--text-color);
            font-size: 1rem;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .form-input {
            position: relative;
        }

        .form-input input {
            width: 100%;
            padding: 1rem 1rem 1rem 3rem;
            border: 2px solid var(--input-border);
            border-radius: 10px;
            font-size: 1rem;
            outline: none;
        }

        .form-input i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-dark);
        }

        .login-btn {
            background-color: var(--primary-dark);
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 10px;
            font-size: 1.1rem;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .login-btn:hover {
            background-color: var(--accent-color);
        }

        .register-link {
            text-align: center;
            margin-top: 1rem;
        }

        .register-link a {
            color: var(--primary-dark);
            text-decoration: none;
            font-weight: bold;
        }

        @media screen and (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }

            .image-section, .login-section {
                width: 100%;
            }

            .image-section {
                max-height: 300px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="image-section">
            <img src="img/vlogin.png" alt="Login Image">
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
</body>
</html>