<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
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

        .registration-container {
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

        .registration-section {
            width: 50%;
            padding: 3rem 2rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .registration-header {
            position: relative;
            text-align: center;
            margin-bottom: 2rem;
        }

        .back-btn {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            font-size: 1.5rem;
            color: var(--primary-dark);
            cursor: pointer;
        }

        .registration-header h1 {
            color: var(--primary-dark);
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .registration-header p {
            color: var(--text-color);
            font-size: 1rem;
        }

        .registration-form {
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

        .register-btn {
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

        .register-btn:hover {
            background-color: var(--accent-color);
        }

        .login-link {
            text-align: center;
            margin-top: 1rem;
        }

        .login-link a {
            color: var(--primary-dark);
            text-decoration: none;
            font-weight: bold;
        }

        @media screen and (max-width: 768px) {
            .registration-container {
                flex-direction: column;
            }

            .image-section, .registration-section {
                width: 100%;
            }

            .image-section {
                max-height: 300px;
            }

            .back-btn {
                position: static;
                margin-bottom: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <div class="image-section">
            <img src="../img/vlogin.png" alt="Imagen de registro">
        </div>
        
        <div class="registration-section">
            <div class="registration-header">
                <a href="../index.jsp" class="back-btn">&larr;</a>
                <h1>Registro</h1>
                <p>Completa tus datos para crear una cuenta</p>
            </div>
            
            <form class="registration-form" action="Alta.jsp" method="get">
                <div class="form-input">
                    <i class="fas fa-user"></i>
                    <input 
                        type="text" 
                        name="Nombre" 
                        id="nombre" 
                        placeholder="Nombre" 
                        required 
                        pattern="[A-ZÁÉÍÓÚÑ][a-záéíóúñ]{1,19}" 
                        title="El nombre debe contener solo letras, empezar con mayúscula y tener máximo 20 caracteres." 
                        maxlength="20"
                    >
                </div>
                
                <div class="form-input">
                    <i class="fas fa-birthday-cake"></i>
                    <input 
                        type="number" 
                        name="Edad" 
                        placeholder="Edad" 
                        max="99" 
                        min="1" 
                        required
                    >
                </div>
                
                <div class="form-input">
                    <i class="fas fa-envelope"></i>
                    <input 
                        type="email" 
                        name="Correo" 
                        id="correo" 
                        placeholder="Correo electrónico" 
                        required
                    >
                </div>
                
                <div class="form-input">
                    <i class="fas fa-lock"></i>
                    <input 
                        type="password" 
                        name="Contrasena" 
                        id="contraseña" 
                        placeholder="Contraseña" 
                        maxlength="15" 
                        required 
                        pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{12,}$" 
                        title="La contraseña debe tener al menos 12 caracteres, una mayúscula, una minúscula y un número."
                    >
                </div>
                
                <button type="submit" class="register-btn">Registrar</button>
            </form>
            
            
        </div>
    </div>
</body>
</html>