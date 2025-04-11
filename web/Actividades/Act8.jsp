<%-- 
    Document   : Act8
    Created on : 10 abr. 2025, 22:55:25
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

// Obtener el ID de la actividad y validar
int idActividad = 8;
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
    <link rel="stylesheet" href="estilosActs.css">
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
            <h1><i class="fas fa-language"></i> <%= nombreActividad %></h1>
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
                <form id="Form" action="guardarPuntaje.jsp" method="post">
                        <!-- Añade esto dentro del formulario quizForm -->
                    <input type="hidden" id="scoreInput" name="finalScore">
                    <input type="hidden" name="idActividad" value="<%= idActividad %>">
                    <input type="hidden" name="idUsuario" value="<%= idUsuario %>">
                    <button id="btnPunt" class="btn-retry">
                    <i class="fas fa-redo"></i> Guardar puntaje
                    </button>
                </form>
                
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
                let resultScore = (score/totalQuestions)*10;
                console.log("Puntuación final:", resultScore);

                // Enviar el resultado al servidor para guardarlo en la BD
                // Puedes usar un formulario oculto o una petición AJAX
                document.getElementById('scoreInput').value = resultScore;
                // Actualizar progreso visual
                updateProgress(score);
            });
            
            // Evento para volver a intentar
            document.getElementById('btnRetry').addEventListener('click', function() {
                // Recargar la página para resetear todo
                location.reload();
            });
            
            document.getElementById('btnPunt').addEventListener('click', function() {
                // Recargar la página para resetear todo
                 mandarPuntaje();
            });
            
            // Función para actualizar el progreso visual
            function updateProgress(score) {
                const normalizedScore = Math.round((score / totalQuestions) * 10);
                document.getElementById('lastScore').textContent = `Último puntaje: ${normalizedScore}/10`;
                
                // Actualizar barra de progreso
                document.getElementById('progressBar').style.width = (normalizedScore * 10) + '%';
            }
            
            function mandarPuntaje() {
                document.getElementById('Form').submit();
            }
            
        });
    </script>
</body>
</html>