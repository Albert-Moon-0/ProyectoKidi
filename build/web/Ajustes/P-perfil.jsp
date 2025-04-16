<%-- 
    Document   : P-perfil
    Updated on : March 2025
    Author     : Alumno
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>
<!DOCTYPE html>
<%
    ResultSet r = null;    
    String Edad = null;
    String urlFoto = null;
    try {
        PreparedStatement ps = c.prepareStatement("SELECT * FROM USUARIO u JOIN FOTO_PERFIL f ON u.ID_FOTO = f.ID_FOTO WHERE u.CORREO_U = ?");
        ps.setString(1, userEmail);
        r = ps.executeQuery();
        if (r.next()) {
            Nombre = r.getString("NOMBRE_U");
            Correo = r.getString("CORREO_U");
            Edad = r.getString("EDAD_U");
            urlFoto = r.getString("NOMBRE_FOTO");
        }
    } catch (SQLException error) {
        out.print(error.toString());
    } finally {
        if (r != null) try { r.close(); } catch (SQLException e) { out.print(e.toString()); }
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Perfil - Kidi</title>
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
                --error-color: #FF5252;
                --card-shadow: 0 10px 25px rgba(108, 138, 232, 0.1);
                --card-hover-shadow: 0 15px 35px rgba(108, 138, 232, 0.15);
            }

            body {
                background-color: var(--background-color);
                font-family: 'Poppins', sans-serif;
                color: var(--text-primary);
                margin-left: 220px;
                padding: 20px;
                background-image: linear-gradient(135deg, rgba(108, 138, 232, 0.05) 0%, rgba(165, 214, 167, 0.05) 100%);
                background-attachment: fixed;
            }

            .profile-container {
                max-width: 700px;
                margin: 2rem auto;
                padding: 0 1rem;
            }

            .profile-card {
                background-color: white;
                border-radius: 20px;
                box-shadow: var(--card-shadow);
                padding: 2.5rem;
                margin-bottom: 1.5rem;
                transition: all 0.3s ease;
                border-top: 5px solid var(--primary-color);
            }

            .profile-card:hover {
                box-shadow: var(--card-hover-shadow);
                transform: translateY(-5px);
            }

            .profile-header {
                text-align: center;
                margin-bottom: 2rem;
                border-bottom: 2px solid var(--secondary-color);
                padding-bottom: 1.5rem;
                position: relative;
            }

            .profile-header::after {
                content: '';
                position: absolute;
                bottom: -2px;
                left: 50%;
                transform: translateX(-50%);
                width: 100px;
                height: 3px;
                background-color: var(--primary-color);
            }

            .profile-header h2 {
                color: var(--primary-color);
                font-weight: 600;
                margin-bottom: 0.5rem;
                font-size: 1.8rem;
            }

            .profile-header p {
                color: var(--text-secondary);
                font-size: 1.1rem;
                font-weight: 500;
            }

            .profile-info {
                background: linear-gradient(to right, var(--secondary-color), white);
                border-radius: 12px;
                padding: 1.5rem;
                margin-bottom: 2rem;
                border-left: 4px solid var(--primary-color);
            }

            .form-input {
                position: relative;
                margin-bottom: 1.5rem;
            }

            .form-input i {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--primary-color);
                font-size: 1.2rem;
            }

            .form-input input {
                width: 100%;
                padding: 15px 15px 15px 50px;
                border: 2px solid #e9ecef;
                border-radius: 10px;
                font-size: 1rem;
                transition: all 0.3s;
                color: var(--text-primary);
                background-color: white;
            }

            .form-input input:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 3px rgba(108, 138, 232, 0.3);
                outline: none;
            }

            .form-input input:hover {
                border-color: var(--hover-color);
            }

            .form-input input::placeholder {
                color: #adb5bd;
            }

            .form-input label {
                position: absolute;
                top: -10px;
                left: 15px;
                background-color: white;
                padding: 0 5px;
                font-size: 0.8rem;
                color: var(--text-secondary);
                font-weight: 500;
            }

            .btn {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
                padding: 12px;
                margin-bottom: 1rem;
                color: var(--text-primary);
                text-decoration: none;
                border-radius: 10px;
                transition: all 0.3s ease;
                border: 2px solid;
                gap: 12px;
                cursor: pointer;
                font-weight: 500;
                font-size: 1rem;
            }

            .btn:hover {
                transform: translateY(-2px);
            }

            .btn:active {
                transform: translateY(0);
            }

            .btn i {
                font-size: 1.1rem;
            }

            .back-btn {
                background-color: transparent;
                color: #6c757d;
                border-color: #ced4da;
            }

            .back-btn:hover {
                background-color: #6c757d;
                color: white;
                border-color: #6c757d;
            }

            .save-btn {
                background-color: var(--accent-color);
                color: white;
                border-color: var(--accent-color);
            }

            .save-btn:hover {
                background-color: var(--accent-hover);
                border-color: var(--accent-hover);
                box-shadow: 0 5px 15px rgba(165, 214, 167, 0.4);
            }

            .security-btn {
                background-color: transparent;
                color: #dc3545;
                border-color: #dc3545;
            }

            .security-btn:hover {
                background-color: #dc3545;
                color: white;
            }

            /* Form validation styles */
            .form-input input:invalid {
                border-color: var(--error-color);
            }

            .form-input input:invalid:focus {
                box-shadow: 0 0 0 3px rgba(255, 82, 82, 0.3);
            }

            .validation-message {
                color: var(--error-color);
                font-size: 0.8rem;
                margin-top: 5px;
                margin-left: 15px;
                display: none;
            }

            .form-input input:invalid + .validation-message {
                display: block;
            }

            /* Animation for card */
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(20px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .profile-card {
                animation: fadeIn 0.6s ease-out forwards;
            }

            /* Profile image styles */
            .profile-image-container {
                position: relative;
                width: 120px;
                height: 120px;
                margin: 0 auto 1.5rem;
            }

            .profile-image {
                width: 100%;
                height: 100%;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid var(--primary-color);
                box-shadow: 0 5px 15px rgba(108, 138, 232, 0.3);
            }

            .image-upload-label {
                position: absolute;
                right: 0;
                bottom: 0;
                background-color: var(--accent-color);
                width: 35px;
                height: 35px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: all 0.3s;
                box-shadow: 0 3px 10px rgba(165, 214, 167, 0.4);
            }

            .image-upload-label:hover {
                background-color: var(--accent-hover);
                transform: scale(1.1);
            }

            .image-upload-label i {
                color: white;
                font-size: 16px;
            }

            .upload-input {
                display: none;
            }

            /* Subscription styles */
            .subscription-info {
                display: flex;
                align-items: center;
                margin-bottom: 1.5rem;
                padding: 1rem;
                background-color: var(--primary-light);
                border-radius: 10px;
            }

            .subscription-icon {
                background-color: var(--primary-color);
                width: 45px;
                height: 45px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 1rem;
            }

            .subscription-icon i {
                color: white;
                font-size: 1.2rem;
            }

            .subscription-status {
                flex-grow: 1;
            }

            .subscription-status h4 {
                margin: 0;
                font-size: 1rem;
                font-weight: 600;
                color: var(--text-primary);
            }

            .subscription-status p {
                margin: 0;
                font-size: 0.9rem;
                color: var(--text-secondary);
            }

            .subscription-badge {
                background-color: var(--accent-color);
                color: white;
                padding: 0.25rem 0.75rem;
                border-radius: 50px;
                font-size: 0.8rem;
                font-weight: 500;
            }

            /* Responsive design improvements */
            @media (max-width: 768px) {
                body {
                    margin-left: 0;
                }
                
                .profile-container {
                    padding: 0 0.5rem;
                }
                
                .profile-card {
                    padding: 1.5rem;
                }
                
                .profile-image-container {
                    width: 100px;
                    height: 100px;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="../Sistema/BarraNavegacion.jsp" />
        <div class="profile-container">
            <!-- Personal Information Card -->
            <div class="profile-card">
                <div class="profile-header">
                    <div class="profile-image-container">
                        <img src="../ImgPerfil/<%= urlFoto %>" alt="Foto de perfil" class="profile-image">
                        <label for="upload-photo" class="image-upload-label">
                            <i class="fas fa-camera"></i>
                        </label>
                        <input type="file" id="upload-photo" class="upload-input" accept="image/*">
                    </div>
                    <h2><%= Nombre %></h2>
                    <p class="text-muted">Actualiza tus datos personales</p>
                </div>

                <form class="registration-form" action="../Sistema/Cambio.jsp" method="post">
                    <div class="profile-info">
                        <div class="form-input">
                            <i class="fas fa-user"></i>
                            <input 
                                type="text" 
                                name="Nombre" 
                                id="nombre" 
                                value="<%= Nombre %>" 
                                required 
                                pattern="[A-ZÁÉÍÓÚÑ][a-záéíóúñ]{1,19}" 
                                title="El nombre debe contener solo letras, empezar con mayúscula y tener máximo 20 caracteres." 
                                maxlength="20"
                            >
                            <label for="nombre">Nombre</label>
                            <div class="validation-message">El nombre debe comenzar con mayúscula y contener solo letras</div>
                        </div>
                        
                        <div class="form-input">
                            <i class="fas fa-birthday-cake"></i>
                            <input 
                                type="number" 
                                name="Edad" 
                                id="edad"
                                value="<%= Edad %>" 
                                max="99" 
                                min="1" 
                                required
                            >
                            <label for="edad">Edad</label>
                            <div class="validation-message">La edad debe ser entre 1 y 99 años</div>
                        </div>
                        
                        <div class="form-input">
                            <i class="fas fa-envelope"></i>
                            <input 
                                type="email" 
                                name="Correo" 
                                id="correo" 
                                value="<%= Correo %>" 
                                required
                            >
                            <label for="correo">Correo electrónico</label>
                            <div class="validation-message">Introduce un correo electrónico válido</div>
                        </div>
                    </div>

                    <button type="submit" class="btn save-btn">
                        <i class="fas fa-save"></i> Guardar Cambios
                    </button>
                </form>
                
                                <a href="../Sistema/menu.jsp" class="btn back-btn">
                    <i class="fas fa-arrow-left"></i> Regresar al menu principal
                </a>
            </div>
            
            <!-- Subscription Card -->
            <div class="profile-card">
                <div class="profile-header">
                    <h2>Mi Suscripción</h2>
                    <p class="text-muted">Administra tu plan y pagos</p>
                </div>
                
                <div class="subscription-info">
                    <div class="subscription-icon">
                        <i class="fas fa-crown"></i>
                    </div>
                    <div class="subscription-status">
                        <h4>Plan Premium</h4>
                        <p>Facturación mensual - Próximo pago: 15/04/2025</p>
                    </div>
                    <span class="subscription-badge">Activo</span>
                </div>
                
                <a href="gestionSuscripcion.jsp" class="btn back-btn">
                    <i class="fas fa-credit-card"></i> Cambiar Método de Pago
                </a>
                
                <a href="cancelarSuscripcion.jsp" class="btn security-btn">
                    <i class="fas fa-times-circle"></i> Cancelar Suscripción
                </a>
            </div>
            
            <!-- Security Card -->
            <div class="profile-card">
                <div class="profile-header">
                    <h2>Seguridad</h2>
                    <p class="text-muted">Gestiona tu acceso a la cuenta</p>
                </div>
            <form class="password-form" action="../Sistema/CambioPassword.jsp" method="post">
                <div class="profile-info">
                    <div class="form-input">
                        <i class="fas fa-lock"></i>
                        <input 
                            type="password" 
                            name="passwordActual" 
                            id="passwordActual" 
                            placeholder="Ingresa tu contraseña actual" 
                            required
                            >
                        <label for="passwordActual">Contraseña Actual</label>
                    </div>

                    <div class="form-input">
                        <i class="fas fa-key"></i>
                        <input 
                            type="password" 
                            name="passwordNueva" 
                            id="passwordNueva" 
                            placeholder="Ingresa tu nueva contraseña" 
                            required
                            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                            title="La contraseña debe tener al menos 8 caracteres, incluir una mayúscula, una minúscula y un número"
                            >
                        <label for="passwordNueva">Nueva Contraseña</label>
                        <div class="validation-message">La contraseña debe tener al menos 8 caracteres, incluir una mayúscula, una minúscula y un número</div>
                    </div>

                    <div class="form-input">
                        <i class="fas fa-check-circle"></i>
                        <input 
                            type="password" 
                            name="passwordConfirm" 
                            id="passwordConfirm" 
                            placeholder="Confirma tu nueva contraseña" 
                            required
                            >
                        <label for="passwordConfirm">Confirmar Contraseña</label>
                        <div class="validation-message">Las contraseñas no coinciden</div>
                    </div>
                </div>

                <input type="hidden" name="userEmail" value="<%= Correo %>">
                <button type="submit" class="btn save-btn">
                    <i class="fas fa-lock"></i> Actualizar Contraseña
                </button>
                <a href="../Sistema/invalidateSession.jsp" class="btn security-btn">
                    <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                </a>
            </form>
            </div>
        </div>

        <script>
            // Form validation enhancements
            document.addEventListener('DOMContentLoaded', function() {
                const inputs = document.querySelectorAll('.form-input input');
                const passwordInput = document.getElementById('passwordNueva');
                const confirmInput = document.getElementById('passwordConfirm');
                
                inputs.forEach(input => {
                    // Show validation messages on input
                    input.addEventListener('input', function() {
                        if (this.validity.valid) {
                            this.style.borderColor = '#A5D6A7';
                        } else {
                            this.style.borderColor = 'var(--error-color)';
                        }
                    });
                    
                    // Reset validation styling on focus
                    input.addEventListener('focus', function() {
                        this.style.borderColor = 'var(--primary-color)';
                    });
                });
                
                // Password match validation
                if (passwordInput && confirmInput) {
                    confirmInput.addEventListener('input', function() {
                        if (this.value !== passwordInput.value) {
                            this.setCustomValidity('Las contraseñas no coinciden');
                            this.style.borderColor = 'var(--error-color)';
                        } else {
                            this.setCustomValidity('');
                            this.style.borderColor = '#A5D6A7';
                        }
                    });
                }
                
                // Profile image upload preview
                const uploadInput = document.getElementById('upload-photo');
                const profileImage = document.querySelector('.profile-image');
                
                if (uploadInput && profileImage) {
                    uploadInput.addEventListener('change', function() {
                        if (this.files && this.files[0]) {
                            const reader = new FileReader();
                            
                            reader.onload = function(e) {
                                profileImage.src = e.target.result;
                            }
                            
                            reader.readAsDataURL(this.files[0]);
                        }
                    });
                }
            });
        </script>
    </body>
</html>