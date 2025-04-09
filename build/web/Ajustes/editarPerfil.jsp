<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>
<!DOCTYPE html>
<%
    ResultSet r = null;    
    String Edad = null;
    try {
        PreparedStatement ps = c.prepareStatement("SELECT * FROM USUARIO WHERE CORREO_U = ?");
        ps.setString(1, userEmail);
        r = ps.executeQuery();
        if (r.next()) {
            Nombre = r.getString("NOMBRE_U");
            Correo = r.getString("CORREO_U");
            Edad = r.getString("EDAD_U");
        }
    } catch (SQLException error) {
        out.print(error.toString());
    } finally {
        if (r != null) try { r.close(); } catch (SQLException e) { out.print(e.toString()); }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Perfil - Kidi</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="EstilosFormularios.css">
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
            }
        </style>
    </head>
    <body>
        <jsp:include page="../Sistema/BarraNavegacion.jsp" />
        <div class="profile-container">
            <div class="profile-card">
                <div class="profile-header">
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
                
                <a href="P-perfil.jsp" class="btn back-btn">
                    <i class="fas fa-arrow-left"></i> Regresar al Perfil
                </a>
            </div>
        </div>

        <script>
            // Form validation enhancements
            document.addEventListener('DOMContentLoaded', function() {
                const inputs = document.querySelectorAll('.form-input input');
                
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
            });
        </script>
    </body>
</html>