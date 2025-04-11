<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<%@ include file="../../Sistema/ConexionBD.jsp" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

// Obtener el ID de la actividad y validar
int idActividad = 1;
String nombreActividad = "";
int idUsuario = 0;

try {
    // Obtener información de la actividad
    PreparedStatement ps = c.prepareStatement("SELECT DESC_ACT FROM ACTIVIDADES WHERE ID_ACT = ?");
    ps.setInt(1, idActividad);
    ResultSet rs = ps.executeQuery();
    
    if(rs.next()) {
        nombreActividad = rs.getString("DESC_ACT");
    } else {
        response.sendRedirect("../P-Pruebas.jsp");
        return;
    }
    rs.close();
    ps.close();
} catch(Exception e) {
    response.sendRedirect("../P-Pruebas.jsp");
    return;
}

ResultSet r = null;
try {
    PreparedStatement ps = c.prepareStatement("SELECT * FROM USUARIO WHERE CORREO_U = ?");
    ps.setString(1, userEmail);
    r = ps.executeQuery();
    while (r.next()) {
        idUsuario = r.getInt("ID_U");
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
    <title>Kidi - <%= nombreActividad %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
        }
        
        body {
            background-color: var(--background-color);
            font-family: 'Poppins', sans-serif;
            color: var(--text-primary);
            padding: 20px;
            background-image: linear-gradient(135deg, rgba(108, 138, 232, 0.05) 0%, rgba(165, 214, 167, 0.05) 100%);
            background-attachment: fixed;
        }
        
        .page-container {
            max-width: 900px;
            margin: 0 auto;
        }
        
        .page-header {
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--secondary-color);
            position: relative;
        }
        
        .page-header::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100px;
            height: 3px;
            background-color: var(--primary-color);
        }
        
        .page-header h1 {
            color: var(--primary-color);
            font-weight: 600;
            font-size: 1.8rem;
        }
        
        .page-header .lead {
            color: var(--text-secondary);
            font-size: 1.1rem;
        }
        
        .return-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            margin-bottom: 1.5rem;
            transition: all 0.3s;
        }
        
        .return-link:hover {
            color: var(--hover-color);
            transform: translateX(-5px);
        }
        
        .progress-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 1.5rem;
            margin-bottom: 2rem;
            border-left: 4px solid var(--accent-color);
        }
        
        .activity-progress {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 0.5rem;
        }
        
        .activity-progress h4 {
            font-size: 1.1rem;
            font-weight: 600;
            margin: 0;
            color: var(--text-primary);
        }
        
        .progress {
            height: 10px;
            border-radius: 5px;
            background-color: #e9ecef;
            margin-bottom: 0.5rem;
        }
        
        .progress-bar {
            background-color: var(--accent-color);
            border-radius: 5px;
        }
        
        .question-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border-left: 4px solid var(--primary-color);
            transition: all 0.3s ease;
        }
        
        .question-container:hover {
            box-shadow: var(--card-hover-shadow);
        }
        
        .question-title {
            font-size: 1.2rem;
            font-weight: 500;
            margin-bottom: 1.5rem;
            padding-bottom: 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: var(--primary-color);
            border-bottom: 1px dashed #e9ecef;
        }
        
        .question-number {
            background-color: var(--primary-light);
            color: var(--primary-color);
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
        }
        
        .option-item {
            background-color: #f8f9fa;
            padding: 1rem;
            border-radius: 12px;
            transition: all 0.3s;
            cursor: pointer;
            border: 2px solid transparent;
        }
        
        .option-item:hover {
            background-color: var(--primary-light);
            border-color: var(--primary-color);
            transform: translateY(-3px);
        }
        
        .option-item input {
            display: none;
        }
        
        .option-item label {
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
        }
        
        .option-item label::before {
            content: '';
            display: inline-block;
            width: 18px;
            height: 18px;
            border: 2px solid #c4c4c4;
            border-radius: 50%;
            margin-right: 0.5rem;
        }
        
        .option-item input:checked + label::before {
            border-color: var(--primary-color);
            background-color: var(--primary-color);
            box-shadow: inset 0 0 0 4px white;
        }
        
        .option-item input:checked + label {
            color: var(--primary-color);
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .btn-submit, .btn-retry {
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 0.75rem 1.75rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-submit:hover, .btn-retry:hover {
            background-color: var(--hover-color);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(108, 138, 232, 0.3);
        }
        
        .btn-retry {
            background-color: var(--accent-color);
        }
        
        .btn-retry:hover {
            background-color: var(--accent-hover);
        }
        
        .result-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 2rem;
            margin-top: 2rem;
            text-align: center;
            border-left: 4px solid var(--accent-color);
            display: none;
            animation: fadeIn 0.5s ease-out forwards;
        }
        
        .result-icon {
            font-size: 3rem;
            color: var(--accent-color);
            margin-bottom: 1rem;
        }
        
        .result-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 1rem;
        }
        
        .score {
            font-size: 2.5rem;
            font-weight: bold;
            color: var(--accent-color);
            margin: 1rem 0;
            position: relative;
            display: inline-block;
        }
        
        .score::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background-color: var(--accent-color);
            border-radius: 3px;
        }
        
        .result-message {
            font-size: 1.1rem;
            color: var(--text-secondary);
            margin: 1.5rem 0;
        }
        
        /* Animaciones */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* Media queries para responsividad */
        @media (max-width: 768px) {
            .options {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn-submit, .btn-retry {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Barra de Navegación -->
    <jsp:include page="../../Sistema/BarraNavegacion.jsp" />
    
    <div class="page-container">
        <!-- Botón de regreso -->
        <a href="../P-actividades.jsp" class="return-link">
            <i class="fas fa-arrow-left"></i> Volver a actividades
        </a>
        
        <!-- Header principal -->
        <div class="page-header">
            <h1><i class="fas fa-calculator"></i> <%= nombreActividad %></h1>
            <p class="lead">Practica tus conocimientos sobre números y operaciones básicas para desarrollar habilidades matemáticas fundamentales.</p>
        </div>
        
        <!-- Información del progreso -->
        <div class="progress-container">
            <div class="activity-progress">
                <h4>Tu progreso</h4>
                <div class="ms-auto">
                    <i class="fas fa-star text-warning"></i> 
                    <span id="lastScore">Completa la actividad para ver tu puntaje</span>
                </div>
            </div>
            <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 0%" id="progressBar"></div>
            </div>
            <small class="text-muted">Completa la actividad para registrar tu progreso</small>
        </div>
        
        <!-- Formulario del cuestionario -->
        <form id="quizForm">
            <!-- Pregunta 1 -->
            <div class="question-container" data-aos="fade-up">
                <div class="question-title">
                    <div class="question-number">1</div>
                    ¿Cuánto es 5 + 3?
                </div>
                <div class="options">
                    <div class="option-item">
                        <input type="radio" name="q1" id="q1a" value="a">
                        <label for="q1a">7</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q1" id="q1b" value="b">
                        <label for="q1b">8</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q1" id="q1c" value="c">
                        <label for="q1c">9</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q1" id="q1d" value="d">
                        <label for="q1d">10</label>
                    </div>
                </div>
            </div>
            
            <!-- Pregunta 2 -->
            <div class="question-container" data-aos="fade-up" data-aos-delay="100">
                <div class="question-title">
                    <div class="question-number">2</div>
                    ¿Cuál es el número mayor?
                </div>
                <div class="options">
                    <div class="option-item">
                        <input type="radio" name="q2" id="q2a" value="a">
                        <label for="q2a">12</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q2" id="q2b" value="b">
                        <label for="q2b">9</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q2" id="q2c" value="c">
                        <label for="q2c">15</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q2" id="q2d" value="d">
                        <label for="q2d">10</label>
                    </div>
                </div>
            </div>
            
            <!-- Pregunta 3 -->
            <div class="question-container" data-aos="fade-up" data-aos-delay="200">
                <div class="question-title">
                    <div class="question-number">3</div>
                    ¿Cuánto es 10 - 4?
                </div>
                <div class="options">
                    <div class="option-item">
                        <input type="radio" name="q3" id="q3a" value="a">
                        <label for="q3a">5</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q3" id="q3b" value="b">
                        <label for="q3b">6</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q3" id="q3c" value="c">
                        <label for="q3c">7</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q3" id="q3d" value="d">
                        <label for="q3d">4</label>
                    </div>
                </div>
            </div>
            
            <!-- Pregunta 4 -->
            <div class="question-container" data-aos="fade-up" data-aos-delay="300">
                <div class="question-title">
                    <div class="question-number">4</div>
                    ¿Qué número viene después del 19?
                </div>
                <div class="options">
                    <div class="option-item">
                        <input type="radio" name="q4" id="q4a" value="a">
                        <label for="q4a">18</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q4" id="q4b" value="b">
                        <label for="q4b">21</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q4" id="q4c" value="c">
                        <label for="q4c">20</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q4" id="q4d" value="d">
                        <label for="q4d">19</label>
                    </div>
                </div>
            </div>
            
            <!-- Pregunta 5 -->
            <div class="question-container" data-aos="fade-up" data-aos-delay="400">
                <div class="question-title">
                    <div class="question-number">5</div>
                    ¿Cuánto es 3 × 2?
                </div>
                <div class="options">
                    <div class="option-item">
                        <input type="radio" name="q5" id="q5a" value="a">
                        <label for="q5a">5</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q5" id="q5b" value="b">
                        <label for="q5b">6</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q5" id="q5c" value="c">
                        <label for="q5c">8</label>
                    </div>
                    <div class="option-item">
                        <input type="radio" name="q5" id="q5d" value="d">
                        <label for="q5d">9</label>
                    </div>
                </div>
            </div>
            
            <!-- Botón de enviar -->
            <div class="action-buttons">
                <button type="button" id="btnSubmit" class="btn-submit">
                    <i class="fas fa-check-circle"></i> Verificar respuestas
                </button>
            </div>
        </form>
        
        <!-- Contenedor de resultados (inicialmente oculto) -->
        <div id="resultContainer" class="result-container">
            <div class="result-icon">
                <i class="fas fa-award"></i>
            </div>
            <div class="result-title">¡Has completado el cuestionario!</div>
            <div class="score" id="finalScore">0 de 5</div>
            <div class="result-message" id="resultMessage">Sigue practicando para mejorar.</div>
            <div class="action-buttons">
                <button id="btnRetry" class="btn-retry">
                    <i class="fas fa-redo"></i> Intentar nuevamente
                </button>
                <a href="../P-actividades.jsp" class="btn-submit">
                    <i class="fas fa-th-list"></i> Otras actividades
                </a>
            </div>
        </div>
    </div>
    
    <!-- Script de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Script AOS para animaciones de entrada -->
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    
    <!-- Script del cuestionario -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Inicializar AOS (Animate On Scroll)
            AOS.init({
                once: true,
                duration: 800
            });
            
            // ID de usuario y actividad
            const userId = <%= idUsuario %>;
            const activityId = <%= idActividad %>;
            
            // Respuestas correctas
            const correctAnswers = {
                q1: "b", // 8
                q2: "c", // 15
                q3: "b", // 6
                q4: "c", // 20
                q5: "b"  // 6
            };
            
            // Mejorar la interacción con los radio buttons
document.querySelectorAll('.option-item').forEach(item => {
    item.addEventListener('click', function() {
        const radio = this.querySelector('input[type="radio"]');
        radio.checked = true;
        
        // Quitar selección visual de otros elementos del mismo grupo
        const name = radio.getAttribute('name');
        document.querySelectorAll(`input[name="${name}"]`).forEach(input => {
            const parentItem = input.closest('.option-item');
            if (input !== radio) {
                parentItem.style.backgroundColor = '#f8f9fa';
                parentItem.style.borderColor = 'transparent';
            } else {
                parentItem.style.backgroundColor = getComputedStyle(document.documentElement).getPropertyValue('--primary-light');
                parentItem.style.borderColor = getComputedStyle(document.documentElement).getPropertyValue('--primary-color');
            }
        });
    });
});
            
            // Cargar último puntaje si existe
            loadLastScore();
            
            // Evento al hacer clic en verificar respuestas
            document.getElementById('btnSubmit').addEventListener('click', function() {
                let score = 0;
                let allAnswered = true;
                
                // Verificar si todas las preguntas tienen respuesta
                for (let i = 1; i <= 5; i++) {
                    const answered = document.querySelector(`input[name="q${i}"]:checked`);
                    if (!answered) {
                        allAnswered = false;
                        // Destacar preguntas sin responder
                        document.querySelectorAll(`.question-container`)[i-1].style.borderLeft = '4px solid #dc3545';
                        setTimeout(() => {
                            document.querySelectorAll(`.question-container`)[i-1].style.borderLeft = '4px solid var(--primary-color)';
                        }, 1500);
                    }
                }
                
                if (!allAnswered) {
                    alert('Por favor responde todas las preguntas antes de continuar.');
                    return;
                }
                
                // Verificar cada pregunta
                for (let question in correctAnswers) {
                    const selectedOption = document.querySelector(`input[name="${question}"]:checked`);
                    
                    if (selectedOption && selectedOption.value === correctAnswers[question]) {
                        score++;
                    }
                }
                
                // Mostrar resultados
                document.getElementById('finalScore').textContent = score + ' de 5';
                
                // Personalizar mensaje y icono según el puntaje
                const resultMessage = document.getElementById('resultMessage');
                const resultIcon = document.querySelector('.result-icon i');
                
                if (score === 5) {
                    resultMessage.textContent = '¡Excelente trabajo! Has respondido todas correctamente. ¡Eres un experto en números!';
                    resultIcon.className = 'fas fa-trophy';
                    resultIcon.style.color = '#FFD700';
                } else if (score >= 3) {
                    resultMessage.textContent = '¡Buen trabajo! Estás aprendiendo bien. Sigue practicando para mejorar aún más.';
                    resultIcon.className = 'fas fa-star';
                    resultIcon.style.color = '#FFA500';
                } else {
                    resultMessage.textContent = 'Sigue practicando para mejorar tus conocimientos. ¡No te rindas!';
                    resultIcon.className = 'fas fa-award';
                    resultIcon.style.color = '#A5D6A7';
                }
                
                // Animación de entrada para resultados
                document.getElementById('quizForm').style.display = 'none';
                const resultContainer = document.getElementById('resultContainer');
                resultContainer.style.display = 'block';
                
                // Guardar resultado en la base de datos
                saveResult(score);
                
                // Actualizar progreso
                updateProgress(score);
            });
            
            // Evento para volver a intentar
document.getElementById('btnRetry').addEventListener('click', function() {
    // Mostrar formulario y ocultar resultados
    document.getElementById('quizForm').style.display = 'block';
    document.getElementById('resultContainer').style.display = 'none';
    
    // Limpiar selecciones
    document.querySelectorAll('input[type="radio"]').forEach(input => {
        input.checked = false;
        const parentItem = input.closest('.option-item');
        parentItem.style.backgroundColor = '#f8f9fa';
        parentItem.style.borderColor = 'transparent';
    });
    
    // Reiniciar animaciones
    AOS.refresh();
});
            
            // Función para guardar el resultado en la base de datos
            function saveResult(score) {
                // Calcular puntaje en escala de 10
                const normalizedScore = Math.round((score / 5) * 10);
                
                // Crear FormData para enviar
                const formData = new FormData();
                formData.append('userId', userId);
                formData.append('activityId', activityId);
                formData.append('score', normalizedScore);
                
                // Enviar mediante AJAX
                fetch('SaveResult.jsp', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.text())
                .then(data => {
                    console.log('Resultado guardado:', data);
                })
                .catch(error => {
                    console.error('Error al guardar resultado:', error);
                });
            }
            
            // Función para cargar el último puntaje
            function loadLastScore() {
                fetch(`GetLastScore.jsp?userId=${userId}&activityId=${activityId}`)
                .then(response => response.text())
                .then(data => {
                    if (data && !isNaN(data)) {
                        const score = parseInt(data);
                        document.getElementById('lastScore').textContent = `Último puntaje: ${score}/10`;
                        document.getElementById('progressBar').style.width = `${score * 10}%`;
                    }
                })
                .catch(error => {
                    console.error('Error al cargar el último puntaje:', error);
                });
            }
            
            // Función para actualizar el progreso
            function updateProgress(score) {
                const normalizedScore = Math.round((score / 5) * 10);
                document.getElementById('lastScore').textContent = `Último puntaje: ${normalizedScore}/10`;
                
                // Animar la barra de progreso
                const progressBar = document.getElementById('progressBar');
                const currentWidth = parseFloat(progressBar.style.width) || 0;
                const targetWidth = normalizedScore * 10;
                
                // Animación simple de la barra de progreso
                let width = currentWidth;
                const interval = setInterval(() => {
                    if (width >= targetWidth) {
                        clearInterval(interval);
                    } else {
                        width++;
                        progressBar.style.width = width + '%';
                    }
                }, 20);
            }
        });
    </script>
</body>
</html>