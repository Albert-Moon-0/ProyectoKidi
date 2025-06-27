<%-- 
    Document   : nueva-contrasena
    Created on : 27 jun 2025
    Author     : diego
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nueva Contraseña - Kidi</title>
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
            --success-green: #2ECC71;
            --error-red: #dc3545;
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

        .reset-container {
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

        .reset-container::before {
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
            content: '🔒';
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 2rem;
            animation: twinkle 2s ease-in-out infinite;
        }

        .image-section::after {
            content: '🔑';
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

        .reset-section {
            width: 50%;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: var(--white);
        }

        .reset-header {
            text-align: center;
            margin-bottom: 1.5rem;
            position: relative;
        }

        .reset-header h1 {
            color: var(--primary-bright);
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            text-shadow: 2px 2px 4px var(--shadow-color);
            position: relative;
        }

        .reset-header h1::after {
            content: '🔐';
            position: absolute;
            top: -10px;
            right: -40px;
            font-size: 1.5rem;
            animation: bounce 2s ease-in-out infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        .reset-header p {
            color: var(--text-dark);
            font-size: 1.1rem;
            font-weight: bold;
        }

        .reset-form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
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
            padding: 1rem 1rem 1rem 3rem;
            border: 3px solid var(--secondary-bright);
            border-radius: 20px;
            font-size: 1rem;
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
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-bright);
            font-size: 1.2rem;
            z-index: 1;
        }

        .form-input label {
            position: absolute;
            top: -10px;
            left: 15px;
            background: var(--white);
            padding: 0 5px;
            color: var(--text-dark);
            font-weight: bold;
            font-size: 0.9rem;
            z-index: 2;
        }

        .password-requirements {
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            border-left: 4px solid var(--primary-bright);
            border-radius: 15px;
            padding: 1rem;
            margin: 1rem 0;
            font-size: 0.85em;
            box-shadow: 0 5px 15px var(--shadow-color);
        }

        .password-requirements strong {
            color: var(--text-dark);
            display: block;
            margin-bottom: 0.5rem;
            font-size: 1rem;
        }

        .requirement {
            margin: 5px 0;
            color: #666;
            padding: 2px 0;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .requirement.valid {
            color: var(--success-green);
            background: rgba(46, 204, 113, 0.1);
            transform: scale(1.02);
        }

        .requirement.invalid {
            color: var(--error-red);
            background: rgba(220, 53, 69, 0.1);
        }

        .reset-btn {
            background: linear-gradient(45deg, var(--primary-bright), var(--accent-orange));
            color: var(--white);
            border: none;
            padding: 1.2rem;
            border-radius: 20px;
            font-size: 1.1rem;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 1rem;
            font-family: 'Comic Sans MS', 'Arial', sans-serif;
            font-weight: bold;
            box-shadow: 0 8px 20px var(--shadow-color);
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .reset-btn:disabled {
            background: #cccccc;
            cursor: not-allowed;
            opacity: 0.6;
        }

        .reset-btn:not(:disabled)::before {
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

        .reset-btn:not(:disabled):hover::before {
            width: 300px;
            height: 300px;
        }

        .reset-btn:not(:disabled):hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(255, 107, 107, 0.4);
        }

        .reset-btn:not(:disabled):active {
            transform: translateY(0px);
        }

        .back-link {
            text-align: center;
            margin-top: 1.5rem;
        }

        .back-link a {
            color: var(--secondary-bright);
            text-decoration: none;
            font-weight: bold;
            font-size: 1rem;
            padding: 0.5rem 1rem;
            border-radius: 15px;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .back-link a:hover {
            background: var(--secondary-bright);
            color: var(--white);
            transform: scale(1.1);
        }

        @media screen and (max-width: 768px) {
            .reset-container {
                flex-direction: column;
                margin: 0.5rem;
            }

            .image-section, .reset-section {
                width: 100%;
            }

            .image-section {
                max-height: 200px;
                background: none;
                text-align: center;
                padding: 20px;
            }

            .reset-header h1 {
                font-size: 2rem;
            }

            .reset-header h1::after {
                right: -20px;
                font-size: 1.2rem;
            }

            .floating-shapes {
                display: none;
            }

            .reset-section {
                padding: 1.5rem;
            }
        }

        /* Success animation for form submission */
        .form-input.success input {
            border-color: var(--success-green);
            background: #E8F8F5;
        }

        .form-input.success i {
            color: var(--success-green);
        }

        /* Fun loading state */
        .reset-btn.loading {
            position: relative;
            color: transparent;
        }

        .reset-btn.loading::after {
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
    <%
        // Verificar que tenemos los datos necesarios para el restablecimiento
        String correo = null;
        String resetToken = null;
        Long resetExpiry = null;
        
        // MÉTODO 1: Intentar obtener de cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("kidi_reset_correo".equals(cookie.getName())) {
                    correo = URLDecoder.decode(cookie.getValue(), "UTF-8");
                } else if ("kidi_reset_token".equals(cookie.getName())) {
                    resetToken = cookie.getValue();
                } else if ("kidi_reset_expiry".equals(cookie.getName())) {
                    try {
                        resetExpiry = Long.parseLong(cookie.getValue());
                    } catch (NumberFormatException e) {
                        // Ignorar si no se puede parsear
                    }
                }
            }
        }
        
        // MÉTODO 2: Si no hay cookies, intentar obtener de parámetros URL
        if (correo == null || resetToken == null || resetExpiry == null) {
            String urlCorreo = request.getParameter("c");
            String urlToken = request.getParameter("rt");
            String urlExpiry = request.getParameter("re");
            
            if (urlCorreo != null && urlToken != null && urlExpiry != null) {
                correo = URLDecoder.decode(urlCorreo, "UTF-8");
                resetToken = urlToken;
                try {
                    resetExpiry = Long.parseLong(urlExpiry);
                } catch (NumberFormatException e) {
                    // Ignorar si no se puede parsear
                }
            }
        }
        
        // MÉTODO 3: Como último recurso, intentar sesión
        if (correo == null || resetToken == null || resetExpiry == null) {
            correo = (String) session.getAttribute("reset_correo");
            resetToken = (String) session.getAttribute("reset_token");
            resetExpiry = (Long) session.getAttribute("reset_expiry");
        }
        
        // Verificar que tenemos los datos necesarios
        if (correo == null || resetToken == null || resetExpiry == null) {
            out.println("<script>alert('Sesión de restablecimiento inválida. Por favor, inicia el proceso nuevamente.');window.location='../iniciodesesion.jsp';</script>");
            return;
        }
        
        // Verificar si la sesión ha expirado
        if (System.currentTimeMillis() > resetExpiry) {
            out.println("<script>alert('La sesión de restablecimiento ha expirado. Por favor, inicia el proceso nuevamente.');window.location='../iniciodesesion.jsp';</script>");
            return;
        }
    %>

    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <div class="reset-container">
        <div class="image-section">
            <img src="img/kidilogin.png" alt="Kidi Reset Password">
        </div>
        
        <div class="reset-section">
            <div class="reset-header">
                <h1>Kidi</h1>
                <p>Establece tu nueva contraseña</p>
            </div>
            
            <form class="reset-form" action="restablecerContra.jsp" method="post" onsubmit="return validarFormulario()">
                <input type="hidden" name="correo" value="<%= correo %>">
                <input type="hidden" name="reset_token" value="<%= resetToken %>">
                
                <div class="form-input">
                    <label for="nueva_contrasena">Nueva Contraseña</label>
                    <i class="fas fa-lock"></i>
                    <input type="password" id="nueva_contrasena" name="nueva_contrasena" required onkeyup="validarContrasena()">
                </div>
                
                <div class="form-input">
                    <label for="confirmar_contrasena">Confirmar Contraseña</label>
                    <i class="fas fa-lock"></i>
                    <input type="password" id="confirmar_contrasena" name="confirmar_contrasena" required onkeyup="validarConfirmacion()">
                </div>
                
                <div class="password-requirements">
                    <strong>La contraseña debe tener:</strong>
                    <div class="requirement" id="req_length">• Al menos 8 caracteres</div>
                    <div class="requirement" id="req_upper">• Al menos una letra mayúscula</div>
                    <div class="requirement" id="req_lower">• Al menos una letra minúscula</div>
                    <div class="requirement" id="req_number">• Al menos un número</div>
                    <div class="requirement" id="req_match">• Las contraseñas deben coincidir</div>
                </div>
                
                <button type="submit" class="reset-btn" id="submit_btn" disabled>Establecer Nueva Contraseña</button>
            </form>
            
            <div class="back-link">
                <a href="../iniciodesesion.jsp">
                    <i class="fas fa-arrow-left"></i>
                    Volver al inicio de sesión
                </a>
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
        document.querySelector('.reset-form').addEventListener('submit', function(e) {
            const btn = this.querySelector('.reset-btn');
            btn.classList.add('loading');
            btn.disabled = true;
        });

        function validarContrasena() {
            const password = document.getElementById('nueva_contrasena').value;
            
            // Validar longitud
            const lengthReq = document.getElementById('req_length');
            if (password.length >= 8) {
                lengthReq.className = 'requirement valid';
            } else {
                lengthReq.className = 'requirement invalid';
            }
            
            // Validar mayúscula
            const upperReq = document.getElementById('req_upper');
            if (/[A-Z]/.test(password)) {
                upperReq.className = 'requirement valid';
            } else {
                upperReq.className = 'requirement invalid';
            }
            
            // Validar minúscula
            const lowerReq = document.getElementById('req_lower');
            if (/[a-z]/.test(password)) {
                lowerReq.className = 'requirement valid';
            } else {
                lowerReq.className = 'requirement invalid';
            }
            
            // Validar número
            const numberReq = document.getElementById('req_number');
            if (/[0-9]/.test(password)) {
                numberReq.className = 'requirement valid';
            } else {
                numberReq.className = 'requirement invalid';
            }
            
            validarConfirmacion();
            habilitarBoton();
        }
        
        function validarConfirmacion() {
            const password = document.getElementById('nueva_contrasena').value;
            const confirmPassword = document.getElementById('confirmar_contrasena').value;
            const matchReq = document.getElementById('req_match');
            
            if (confirmPassword.length > 0) {
                if (password === confirmPassword) {
                    matchReq.className = 'requirement valid';
                } else {
                    matchReq.className = 'requirement invalid';
                }
            } else {
                matchReq.className = 'requirement';
            }
            
            habilitarBoton();
        }
        
        function habilitarBoton() {
            const password = document.getElementById('nueva_contrasena').value;
            const confirmPassword = document.getElementById('confirmar_contrasena').value;
            const submitBtn = document.getElementById('submit_btn');
            
            const isValid = password.length >= 8 &&
                           /[A-Z]/.test(password) &&
                           /[a-z]/.test(password) &&
                           /[0-9]/.test(password) &&
                           password === confirmPassword &&
                           confirmPassword.length > 0;
            
            submitBtn.disabled = !isValid;
        }
        
        function validarFormulario() {
            const password = document.getElementById('nueva_contrasena').value;
            const confirmPassword = document.getElementById('confirmar_contrasena').value;
            
            if (password !== confirmPassword) {
                alert('Las contraseñas no coinciden.');
                return false;
            }
            
            if (password.length < 8) {
                alert('La contraseña debe tener al menos 8 caracteres.');
                return false;
            }
            
            if (!/[A-Z]/.test(password)) {
                alert('La contraseña debe tener al menos una letra mayúscula.');
                return false;
            }
            
            if (!/[a-z]/.test(password)) {
                alert('La contraseña debe tener al menos una letra minúscula.');
                return false;
            }
            
            if (!/[0-9]/.test(password)) {
                alert('La contraseña debe tener al menos un número.');
                return false;
            }
            
            return true;
        }
    </script>
</body>
</html>
