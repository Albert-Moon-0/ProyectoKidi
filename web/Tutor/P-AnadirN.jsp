<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../Sistema/ConexionBD.jsp" %>
<%
    ResultSet r = null;
    int IdT = 1;
    try {
        PreparedStatement p = c.prepareStatement("SELECT * FROM TUTOR WHERE CORREO_T = ?");
        p.setString(1, userEmail);
        r = p.executeQuery();
        if (r.next()) {
            IdT = r.getInt("ID_T");
            Nombre = r.getString("NOMBRE_T");
            Correo = r.getString("CORREO_T");
        } else {
            out.println("<script>alert('Usuario no encontrado');window.location='../iniciodesesion.jsp';</script>");
        }
    } catch (SQLException error) {
        out.print(error.toString());
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kidi - Agregar Niño</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
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
            --sidebar-width: 200px;
        }

        body {
            background-color: var(--background-color);
            font-family: 'Poppins', sans-serif;
            color: var(--text-primary);
            background-image: linear-gradient(135deg, rgba(108, 138, 232, 0.05) 0%, rgba(165, 214, 167, 0.05) 100%);
            background-attachment: fixed;
            margin: 0;
            min-height: 100vh;
        }

        /* Formas flotantes decorativas */
        .floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .shape {
            position: absolute;
            border-radius: 50%;
            background: linear-gradient(45deg, rgba(108, 138, 232, 0.1), rgba(165, 214, 167, 0.1));
            animation: float 6s ease-in-out infinite;
        }

        .shape:nth-child(1) {
            width: 80px;
            height: 80px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            width: 120px;
            height: 120px;
            top: 60%;
            right: 10%;
            animation-delay: 2s;
        }

        .shape:nth-child(3) {
            width: 60px;
            height: 60px;
            top: 80%;
            left: 20%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        /* Contenedor principal */
        .registration-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .registration-wrapper {
            background-color: white;
            border-radius: 25px;
            box-shadow: var(--card-shadow);
            overflow: hidden;
            max-width: 1000px;
            width: 100%;
            display: flex;
            min-height: 500px;
            position: relative;
        }

        .registration-wrapper::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 8px;
            height: 100%;
            background-color: var(--primary-color);
        }

        /* Sección de imagen */
        .image-section {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
            overflow: hidden;
        }

        .image-section::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .image-section img {
            max-width: 80%;
            height: auto;
            border-radius: 15px;
            position: relative;
            z-index: 2;
            filter: drop-shadow(0 10px 20px rgba(0,0,0,0.2));
        }

        .image-placeholder {
            width: 200px;
            height: 200px;
            background-color: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 4rem;
            color: white;
            position: relative;
            z-index: 2;
        }

        /* Sección del formulario */
        .registration-section {
            flex: 1;
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .registration-header {
            margin-bottom: 2rem;
            position: relative;
        }

        .back-btn {
            position: absolute;
            top: -1rem;
            left: -1rem;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary-light);
            color: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            font-size: 1.2rem;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background-color: var(--primary-color);
            color: white;
            transform: scale(1.1);
        }

        .registration-header h1 {
            color: var(--primary-color);
            font-weight: 600;
            font-size: 2rem;
            margin-bottom: 0.5rem;
            position: relative;
            display: inline-block;
        }

        .registration-header h1::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 60px;
            height: 3px;
            background-color: var(--primary-color);
        }

        .registration-header p {
            color: var(--text-secondary);
            font-size: 1rem;
            margin: 0;
        }

        /* Formulario */
        .registration-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .form-input {
            position: relative;
            transition: all 0.3s ease;
        }

        .form-input i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
            font-size: 1rem;
            z-index: 2;
        }

        .form-input input,
        .form-input select {
            width: 100%;
            padding: 1rem 1rem 1rem 3rem;
            border: 2px solid var(--primary-light);
            border-radius: 12px;
            font-size: 1rem;
            font-family: 'Poppins', sans-serif;
            background-color: var(--secondary-color);
            color: var(--text-primary);
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .form-input input:focus,
        .form-input select:focus {
            outline: none;
            border-color: var(--primary-color);
            background-color: white;
            box-shadow: 0 0 0 3px rgba(108, 138, 232, 0.1);
        }

        .form-input input::placeholder {
            color: var(--text-secondary);
        }

        .form-input select {
            cursor: pointer;
        }

        .form-input select option {
            padding: 0.5rem;
        }

        /* Botón de registro */
        .register-btn {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            margin-top: 1rem;
        }

        .register-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .register-btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--card-hover-shadow);
        }

        .register-btn:hover::before {
            left: 100%;
        }

        .register-btn:active {
            transform: translateY(0px);
        }

        .register-btn.loading {
            opacity: 0.7;
            cursor: not-allowed;
            pointer-events: none;
        }

        /* Animaciones */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .registration-wrapper {
            animation: fadeIn 0.8s ease-out;
        }

        .form-input {
            animation: fadeIn 0.5s ease-out forwards;
            animation-delay: calc(var(--animation-order) * 0.1s);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .registration-container {
                padding: 1rem;
            }

            .registration-wrapper {
                flex-direction: column;
                max-width: 500px;
            }

            .image-section {
                min-height: 200px;
                padding: 1.5rem;
            }

            .image-placeholder {
                width: 120px;
                height: 120px;
                font-size: 2.5rem;
            }

            .registration-section {
                padding: 2rem;
            }

            .registration-header h1 {
                font-size: 1.6rem;
            }

            .back-btn {
                position: relative;
                top: 0;
                left: 0;
                margin-bottom: 1rem;
                width: fit-content;
                padding: 0.5rem 1rem;
                border-radius: 8px;
            }
        }

        @media (max-width: 480px) {
            .registration-section {
                padding: 1.5rem;
            }

            .form-input input,
            .form-input select {
                padding: 0.8rem 0.8rem 0.8rem 2.5rem;
                font-size: 0.9rem;
            }

            .form-input i {
                left: 0.8rem;
                font-size: 0.9rem;
            }
        }

        /* Estados de validación */
        .form-input input:invalid:not(:placeholder-shown) {
            border-color: #FF5722;
            background-color: rgba(255, 87, 34, 0.05);
        }

        .form-input input:valid:not(:placeholder-shown) {
            border-color: #4CAF50;
            background-color: rgba(76, 175, 80, 0.05);
        }

        /* Tooltip de ayuda */
        .form-input[title]:hover::after {
            content: attr(title);
            position: absolute;
            bottom: -2rem;
            left: 0;
            background-color: var(--text-primary);
            color: white;
            padding: 0.5rem;
            border-radius: 4px;
            font-size: 0.8rem;
            white-space: nowrap;
            z-index: 10;
            animation: fadeIn 0.3s ease;
        }

        /* Mejoras adicionales */
        .success-message {
            background: linear-gradient(45deg, #4CAF50, #8BC34A);
            color: white;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            display: none;
        }

        .error-message {
            background: linear-gradient(45deg, #FF5722, #FF7043);
            color: white;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            display: none;
        }
    </style>
</head>
<body>
     <jsp:include page="BarraNavTutor.jsp" />
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    
    <div class="registration-container">
        <div class="registration-wrapper">
            <div class="image-section">
                <img src="../img/kidilogin.png" alt="Kidi - Plataforma educativa" />
            </div>
            
            <div class="registration-section">
                <div class="registration-header">
                    <a href="menu_T.jsp" class="back-btn">
                        <i class="fas fa-arrow-left"></i>
                    </a>
                    <br>
                    <h1>Nuevo Niño</h1>
                    <p>Llena los datos del niño para registrarlo en la plataforma</p>
                </div>
                
                <div class="success-message" id="successMessage">
                    <i class="fas fa-check-circle"></i> ¡Niño registrado exitosamente!
                </div>
                
                <div class="error-message" id="errorMessage">
                    <i class="fas fa-exclamation-triangle"></i> Error al registrar el niño. Verifica los datos.
                </div>
                
                <form class="registration-form" action="procesar-nino.jsp" method="post">
                    <div class="form-input" style="--animation-order: 1" title="Ingresa el nombre completo del niño">
                        <i class="fas fa-child"></i>
                        <input 
                            type="text" 
                            name="Nombre" 
                            placeholder="Nombre completo del niño" 
                            required 
                            pattern="^([A-ZÁÉÍÓÚÑ][a-záéíóúñ]{1,19})(\s[A-ZÁÉÍÓÚÑ][a-záéíóúñ]{1,19})*$" 
                            maxlength="40"
                            title="Cada palabra debe iniciar con mayúscula y tener entre 2 y 20 letras."
                        />
                    </div>
                    
                    <div class="form-input" style="--animation-order: 2" title="Edad del niño (1-12 años)">
                        <i class="fas fa-birthday-cake"></i>
                        <input 
                            type="number" 
                            name="Edad" 
                            placeholder="Edad del niño" 
                            required 
                            min="4" 
                            max="12"
                            title="La edad debe estar entre 4 y 12 años"
                        />
                    </div>
                    
                    <div class="form-input" style="--animation-order: 3" title="Correo electrónico único para el niño">
                        <i class="fas fa-envelope"></i>
                        <input 
                            type="email" 
                            name="Correo" 
                            placeholder="Correo electrónico del niño" 
                            required
                            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                            title="Ingresa un correo electrónico válido"
                        />
                    </div>
                    
                    <div class="form-input" style="--animation-order: 4" title="Contraseña segura para la cuenta">
                        <i class="fas fa-lock"></i>
                        <input 
                            type="password" 
                            name="Contrasena" 
                            placeholder="Contraseña para la cuenta" 
                            maxlength="15" 
                            required 
                            pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"
                            title="Debe tener 8-15 caracteres, una mayúscula, una minúscula y un número."
                        />
                    </div>
                    
                    <button type="submit" class="register-btn">
                        <i class="fas fa-plus-circle"></i> Registrar Niño
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Animaciones para los inputs
        document.querySelectorAll('.form-input input, .form-input select').forEach(el => {
            el.addEventListener('focus', () => {
                el.parentElement.style.transform = 'scale(1.02)';
                el.parentElement.style.zIndex = '10';
            });
            
            el.addEventListener('blur', () => {
                el.parentElement.style.transform = 'scale(1)';
                el.parentElement.style.zIndex = '1';
            });
        });

        // Manejo del formulario
        document.querySelector('.registration-form').addEventListener('submit', function(e) {
            const btn = this.querySelector('.register-btn');
            btn.classList.add('loading');
            btn.disabled = true;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Registrando...';
        });

        // Validación en tiempo real
        document.querySelectorAll('input[pattern], input[required]').forEach(input => {
            input.addEventListener('input', function() {
                if (this.validity.valid) {
                    this.style.borderColor = '#4CAF50';
                    this.style.backgroundColor = 'rgba(76, 175, 80, 0.05)';
                } else if (this.value.length > 0) {
                    this.style.borderColor = '#FF5722';
                    this.style.backgroundColor = 'rgba(255, 87, 34, 0.05)';
                } else {
                    this.style.borderColor = 'var(--primary-light)';
                    this.style.backgroundColor = 'var(--secondary-color)';
                }
            });
        });

        // Validación específica para email
        const emailInput = document.querySelector('input[name="Correo"]');
        emailInput.addEventListener('blur', function() {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(this.value) && this.value.length > 0) {
                this.setCustomValidity('Por favor ingresa un correo electrónico válido');
            } else {
                this.setCustomValidity('');
            }
        });

        // Validación de contraseña en tiempo real
        const passwordInput = document.querySelector('input[name="Contrasena"]');
        passwordInput.addEventListener('input', function() {
            const password = this.value;
            const hasUpperCase = /[A-Z]/.test(password);
            const hasLowerCase = /[a-z]/.test(password);
            const hasNumbers = /\d/.test(password);
            const hasValidLength = password.length >= 8 && password.length <= 15;
            
            if (hasUpperCase && hasLowerCase && hasNumbers && hasValidLength) {
                this.style.borderColor = '#4CAF50';
                this.style.backgroundColor = 'rgba(76, 175, 80, 0.05)';
            } else if (password.length > 0) {
                this.style.borderColor = '#FF5722';
                this.style.backgroundColor = 'rgba(255, 87, 34, 0.05)';
            }
        });

        // Función para mostrar mensajes
        function showMessage(type, message) {
            const successDiv = document.getElementById('successMessage');
            const errorDiv = document.getElementById('errorMessage');
            
            if (type === 'success') {
                successDiv.textContent = message;
                successDiv.style.display = 'block';
                errorDiv.style.display = 'none';
            } else {
                errorDiv.textContent = message;
                errorDiv.style.display = 'block';
                successDiv.style.display = 'none';
            }
            
            setTimeout(() => {
                successDiv.style.display = 'none';
                errorDiv.style.display = 'none';
            }, 5000);
        }

        // Prevenir envío múltiple
        let formSubmitted = false;
        document.querySelector('.registration-form').addEventListener('submit', function(e) {
            if (formSubmitted) {
                e.preventDefault();
                return false;
            }
            formSubmitted = true;
        });
    </script>
</body>
</html>