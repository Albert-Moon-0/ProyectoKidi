<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

// Obtener el ID de la actividad y validar
int idActividad = 1;
String nombreActividad = "";
int idUsuario = 0;
List<Map<String, Object>> preguntas = new ArrayList<>();

try {
    // Obtener información de la actividad
    PreparedStatement ps = c.prepareStatement("SELECT DESC_ACT FROM ACTIVIDADES WHERE ID_ACT = ?");
    ps.setInt(1, idActividad);
    ResultSet rs = ps.executeQuery();
    
    if(rs.next()) {
        nombreActividad = rs.getString("DESC_ACT");
    } else {
        response.sendRedirect("P-Pruebas.jsp");
        return;
    }
    rs.close();
    ps.close();
    
    // Obtener información del usuario actual
    PreparedStatement psUser = c.prepareStatement("SELECT ID_U FROM USUARIO WHERE CORREO_U = ?");
    psUser.setString(1, userEmail);
    ResultSet rsUser = psUser.executeQuery();
    if (rsUser.next()) {
        idUsuario = rsUser.getInt("ID_U");
    }
    rsUser.close();
    psUser.close();
    
    // Obtener todas las preguntas para esta actividad
    PreparedStatement psPreguntas = c.prepareStatement(
        "SELECT ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA FROM PREGUNTAS WHERE ID_ACT = ?");
    psPreguntas.setInt(1, idActividad);
    ResultSet rsPreguntas = psPreguntas.executeQuery();
    
    while (rsPreguntas.next()) {
        int idPregunta = rsPreguntas.getInt("ID_PREGUNTA");
        String enunciado = rsPreguntas.getString("ENUNCIADO");
        String respuestaCorrecta = rsPreguntas.getString("RESPUESTA_CORRECTA");
        
        Map<String, Object> pregunta = new HashMap<>();
        pregunta.put("id", idPregunta);
        pregunta.put("enunciado", enunciado);
        pregunta.put("respuestaCorrecta", respuestaCorrecta);
        
        // Obtener opciones para esta pregunta
        List<Map<String, Object>> opciones = new ArrayList<>();
        PreparedStatement psOpciones = c.prepareStatement(
            "SELECT ID_OPCION, TEXTO_OPCION, ES_CORRECTA FROM OPCIONES WHERE ID_PREGUNTA = ?");
        psOpciones.setInt(1, idPregunta);
        ResultSet rsOpciones = psOpciones.executeQuery();
        
        while (rsOpciones.next()) {
            Map<String, Object> opcion = new HashMap<>();
            opcion.put("id", rsOpciones.getInt("ID_OPCION"));
            opcion.put("texto", rsOpciones.getString("TEXTO_OPCION"));
            opcion.put("esCorrecta", rsOpciones.getBoolean("ES_CORRECTA"));
            opciones.add(opcion);
        }
        
        rsOpciones.close();
        psOpciones.close();
        
        // Mezclar opciones para que no siempre aparezcan en el mismo orden
        Collections.shuffle(opciones);
        pregunta.put("opciones", opciones);
        
        preguntas.add(pregunta);
    }
    
    rsPreguntas.close();
    psPreguntas.close();
    
} catch(Exception e) {
    out.print("Error: " + e.toString());
    return;
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
            width: 100%;
            height: 100%;
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
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <div class="page-container">
        <!-- Botón de regreso -->
        <a href="P-Pruebas.jsp" class="return-link">
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
            <!-- Preguntas dinámicas desde la base de datos -->
            <% for (int i = 0; i < preguntas.size(); i++) { 
                Map<String, Object> pregunta = preguntas.get(i);
                List<Map<String, Object>> opciones = (List<Map<String, Object>>) pregunta.get("opciones");
                int idPregunta = (int) pregunta.get("id");
            %>
                <div class="question-container">
                    <div class="question-title">
                        <div class="question-number"><%= i + 1 %></div>
                        <%= pregunta.get("enunciado") %>
                    </div>
                    <div class="options">
                        <% for (int j = 0; j < opciones.size(); j++) { 
                            Map<String, Object> opcion = opciones.get(j);
                            int idOpcion = (int) opcion.get("id");
                            boolean esCorrecta = (boolean) opcion.get("esCorrecta");
                        %>
                            <div class="option-item">
                                <input type="radio" name="pregunta_<%= idPregunta %>" id="q<%= idPregunta %>_<%= j %>" 
                                       value="<%= esCorrecta ? "correcto" : "incorrecto" %>">
                                <label for="q<%= idPregunta %>_<%= j %>"><%= opcion.get("texto") %></label>
                            </div>
                        <% } %>
                    </div>
                </div>
            <% } %>
            
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
            <div class="score" id="finalScore">0 de <%= preguntas.size() %></div>
            <div class="result-message" id="resultMessage">Sigue practicando para mejorar.</div>
            <div class="action-buttons">
                <button id="btnRetry" class="btn-retry">
                    <i class="fas fa-redo"></i> Intentar nuevamente
                </button>
                <a href="P-Pruebas.jsp" class="btn-submit">
                    <i class="fas fa-th-list"></i> Otras actividades
                </a>
            </div>
        </div>
    </div>
    
    <!-- Script de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Script del cuestionario -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // ID de usuario y actividad
            const userId = <%= idUsuario %>;
            const activityId = <%= idActividad %>;
            const totalQuestions = <%= preguntas.size() %>;
            
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
            
            // Evento al hacer clic en verificar respuestas
            document.getElementById('btnSubmit').addEventListener('click', function() {
                let score = 0;
                let unansweredQuestions = [];
                
                // Obtener todas las preguntas y verificar si están contestadas
                <% for (int i = 0; i < preguntas.size(); i++) { 
                    Map<String, Object> pregunta = preguntas.get(i);
                    int idPregunta = (int) pregunta.get("id");
                %>
                    const answered<%= idPregunta %> = document.querySelector('input[name="pregunta_<%= idPregunta %>"]:checked');
                    if (!answered<%= idPregunta %>) {
                        unansweredQuestions.push(<%= i %>);
                    } else if (answered<%= idPregunta %>.value === "correcto") {
                        score++;
                    }
                <% } %>
                
                // Verificar si todas las preguntas han sido respondidas
                if (unansweredQuestions.length > 0) {
                    // Resaltar las preguntas no respondidas
                    unansweredQuestions.forEach(index => {
                        const questionContainer = document.querySelectorAll('.question-container')[index];
                        questionContainer.style.borderLeft = '4px solid #dc3545';
                        setTimeout(() => {
                            questionContainer.style.borderLeft = '4px solid var(--primary-color)';
                        }, 1500);
                    });
                    
                    alert('Por favor responde todas las preguntas antes de continuar.');
                    return;
                }
                
                // Mostrar resultados
                document.getElementById('finalScore').textContent = score + ' de ' + totalQuestions;
                
                // Personalizar mensaje según el puntaje
                const resultMessage = document.getElementById('resultMessage');
                const resultIcon = document.querySelector('.result-icon i');
                
                const percentage = (score / totalQuestions) * 100;
                
                if (percentage === 100) {
                    resultMessage.textContent = '¡Excelente trabajo! Has respondido todas correctamente. ¡Eres un experto en números!';
                    resultIcon.className = 'fas fa-trophy';
                    resultIcon.style.color = '#FFD700';
                } else if (percentage >= 60) {
                    resultMessage.textContent = '¡Buen trabajo! Estás aprendiendo bien. Sigue practicando para mejorar aún más.';
                    resultIcon.className = 'fas fa-star';
                    resultIcon.style.color = '#FFA500';
                } else {
                    resultMessage.textContent = 'Sigue practicando para mejorar tus conocimientos. ¡No te rindas!';
                    resultIcon.className = 'fas fa-award';
                    resultIcon.style.color = '#A5D6A7';
                }
                
                // Ocultar formulario y mostrar resultados
                document.getElementById('quizForm').style.display = 'none';
                document.getElementById('resultContainer').style.display = 'block';
                
                // Guardar puntuación solo en variable (no en BD por ahora)
                let resultScore = score;
                console.log("Puntuación final:", resultScore);
                
                // Actualizar progreso visual
                updateProgress(score);
            });
            
            // Evento para volver a intentar
            document.getElementById('btnRetry').addEventListener('click', function() {
                // Recargar la página para resetear todo
                location.reload();
            });
            
            // Función para actualizar el progreso visual
            function updateProgress(score) {
                const normalizedScore = Math.round((score / totalQuestions) * 10);
                document.getElementById('lastScore').textContent = `Último puntaje: ${normalizedScore}/10`;
                
                // Actualizar barra de progreso
                document.getElementById('progressBar').style.width = (normalizedScore * 10) + '%';
            }
        });
    </script>
</body>
</html>