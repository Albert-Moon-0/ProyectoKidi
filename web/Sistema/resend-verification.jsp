<%-- 
    Document   : resend-verification
    Created on : 26 jun. 2025
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.util.*, javax.mail.*, javax.mail.internet.*, java.security.SecureRandom, java.net.URLEncoder, java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reenviar Código de Verificación</title>
        <script>
            function debugAlert(mensaje){
                alert("DEBUG: " + mensaje);
            }
            
            function showLoading() {
                document.getElementById('resendBtn').disabled = true;
                document.getElementById('resendBtn').innerText = 'Enviando...';
            }
        </script>
    </head>
    <body>
        <%
            // Variables para almacenar los datos de registro
            String nombre = null;
            String correo = null;
            String contrasena = null;
            String savedCode = null;
            Long codeExpiry = null;
            
            // MÉTODO 1: Intentar obtener de cookies personalizadas
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("kidi_reg_nombre".equals(cookie.getName())) {
                        nombre = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    } else if ("kidi_reg_correo".equals(cookie.getName())) {
                        correo = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    } else if ("kidi_reg_contrasena".equals(cookie.getName())) {
                        contrasena = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    } else if ("kidi_reg_code".equals(cookie.getName())) {
                        savedCode = cookie.getValue();
                    } else if ("kidi_reg_expiry".equals(cookie.getName())) {
                        try {
                            codeExpiry = Long.parseLong(cookie.getValue());
                        } catch (NumberFormatException e) {
                            // Ignorar si no se puede parsear
                        }
                    }
                }
            }
            
            // MÉTODO 2: Si no hay cookies, intentar obtener de parámetros URL
            if (nombre == null || correo == null || contrasena == null) {
                String urlNombre = request.getParameter("n");
                String urlCorreo = request.getParameter("c");
                String urlContrasena = request.getParameter("p");
                
                if (urlNombre != null && urlCorreo != null && urlContrasena != null) {
                    nombre = URLDecoder.decode(urlNombre, "UTF-8");
                    correo = URLDecoder.decode(urlCorreo, "UTF-8");
                    contrasena = URLDecoder.decode(urlContrasena, "UTF-8");
                }
            }
            
            // MÉTODO 3: Como último recurso, intentar sesión tradicional
            if (nombre == null || correo == null || contrasena == null) {
                nombre = (String) session.getAttribute("nombre");
                correo = (String) session.getAttribute("correo");
                contrasena = (String) session.getAttribute("contrasena");
            }
            
            // Si se solicita reenvío (parámetro 'action=resend')
            String action = request.getParameter("action");
            if ("resend".equals(action)) {
                if (nombre == null || correo == null || contrasena == null) {
                    out.println("<script>alert('No se encontraron datos de registro. Por favor, inicia el proceso de registro nuevamente.');window.location='../Registro.jsp';</script>");
                    return;
                }
                
                // Verificar que el usuario no existe en la base de datos
                Connection con = null;
                Statement sta = null;
                ResultSet r = null;
                
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi", "root", "n0m3l0");
                    sta = con.createStatement();
                    
                    r = sta.executeQuery("SELECT * FROM TUTOR WHERE CORREO_T ='" + correo + "';");
                    
                    if (r.next()) {
                        out.println("<script>alert('Este usuario ya está registrado. Por favor, inicia sesión.');window.location='../iniciodesesion.jsp';</script>");
                        return;
                    }
                    
                    // Generar nuevo código de verificación
                    SecureRandom random = new SecureRandom();
                    int code = 100000 + random.nextInt(900000);
                    String newVerificationCode = String.valueOf(code);
                    long newExpiry = System.currentTimeMillis() + 15*60*1000; // 15 minutos
                    
                    out.println("<script>debugAlert('Nuevo código generado: " + newVerificationCode + "');</script>");
                    
                    // Actualizar cookies con el nuevo código
                    Cookie codeCookie = new Cookie("kidi_reg_code", newVerificationCode);
                    Cookie expiryCookie = new Cookie("kidi_reg_expiry", String.valueOf(newExpiry));
                    
                    codeCookie.setPath("/");
                    expiryCookie.setPath("/");
                    codeCookie.setMaxAge(60 * 30);
                    expiryCookie.setMaxAge(60 * 30);
                    codeCookie.setSecure(false);
                    expiryCookie.setSecure(false);
                    codeCookie.setHttpOnly(false);
                    expiryCookie.setHttpOnly(false);
                    
                    response.addCookie(codeCookie);
                    response.addCookie(expiryCookie);
                    
                    // Actualizar sesión
                    session.setAttribute("verificationCode", newVerificationCode);
                    session.setAttribute("codeExpiry", newExpiry);
                    
                    // Enviar nuevo correo
                    String[] emailResult = sendVerificationEmailWithDebug(correo, newVerificationCode);
                    boolean mailSent = Boolean.parseBoolean(emailResult[0]);
                    String debugMessage = emailResult[1];
                    
                    out.println("<script>debugAlert('Resultado del reenvío: " + debugMessage + "');</script>");
                    
                    if (mailSent) {
                        out.println("<script>alert('Código de verificación reenviado exitosamente. Revisa tu correo.');window.location='verify-email.jsp';</script>");
                    } else {
                        out.println("<script>alert('Error al reenviar el código: " + debugMessage + "');</script>");
                    }
                    
                } catch (Exception e) {
                    out.println("<script>alert('Error al procesar el reenvío: " + e.getMessage() + "');</script>");
                } finally {
                    if (r != null) try { r.close(); } catch (SQLException e) { }
                    if (sta != null) try { sta.close(); } catch (SQLException e) { }
                    if (con != null) try { con.close(); } catch (SQLException e) { }
                }
            }
        %>
        
        <!-- Interfaz para reenviar código -->
        <div style="max-width: 400px; margin: 50px auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; font-family: Arial, sans-serif;">
            <h2 style="text-align: center; color: #4A235A;">Reenviar Código de Verificación</h2>
            
            <% if (correo != null) { %>
                <p>Se reenviará el código de verificación a:</p>
                <p style="font-weight: bold; color: #2E86AB;"><%= correo %></p>
                
                <form method="post" action="resend-verification.jsp" onsubmit="showLoading()">
                    <input type="hidden" name="action" value="resend">
                    <button type="submit" id="resendBtn" style="width: 100%; padding: 12px; background-color: #4A235A; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px;">
                        Reenviar Código
                    </button>
                </form>
                
                <div style="margin-top: 20px; text-align: center;">
                    <a href="verify-email.jsp" style="color: #2E86AB; text-decoration: none;">« Volver a verificación</a>
                </div>
            <% } else { %>
                <p style="color: #e74c3c;">No se encontraron datos de registro activos.</p>
                <p>Por favor, <a href="../Registro.jsp" style="color: #2E86AB;">inicia el proceso de registro</a> nuevamente.</p>
            <% } %>
        </div>
        
        <%!
            private String[] sendVerificationEmailWithDebug(String toEmail, String verificationCode) {
                String debugInfo = "";
                
                try {
                    debugInfo += "Iniciando configuración de correo... ";
                    
                    // Configura estos valores según tu proveedor de correo
                    final String fromEmail = "da.moonnight.167@gmail.com";
                    final String password = "qqvs krmb sosd ooge";
                    
                    debugInfo += "Credenciales configuradas... ";
                    
                    // Propiedades para el servidor SMTP de Gmail
                    Properties props = new Properties();
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.port", "587");
                    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
                    props.put("mail.debug", "true");
                    
                    debugInfo += "Propiedades SMTP configuradas... ";
                    
                    // Crear sesión con autenticación
                    Session session = Session.getInstance(props, new Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(fromEmail, password);
                        }
                    });
                    
                    debugInfo += "Sesión de correo creada... ";
                    
                    // Crear mensaje
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(fromEmail));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
                    message.setSubject("Reenvío - Verificación de Correo - Kidi");
                    
                    debugInfo += "Mensaje configurado... ";
                    
                    // Crea el contenido HTML del correo
                    String htmlContent = 
                        "<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto;padding:20px;border:1px solid #e0e0e0;border-radius:5px'>" +
                        "<h2 style='color:#4A235A;text-align:center'>Código de Verificación - Kidi</h2>" +
                        "<p>Has solicitado un nuevo código de verificación. Utiliza el siguiente código para completar tu registro:</p>" +
                        "<div style='background-color:#f5f5f5;padding:15px;text-align:center;font-size:24px;letter-spacing:5px;margin:20px 0;border-radius:5px'>" +
                        verificationCode +
                        "</div>" +
                        "<p><strong>Este código expirará en 15 minutos.</strong></p>" +
                        "<p>Si no has solicitado este código, puedes ignorar este correo.</p>" +
                        "<hr style='border:0;border-top:1px solid #e0e0e0;margin:20px 0'>" +
                        "<p style='text-align:center;color:#666;font-size:12px'>Este es un correo automático, por favor no responda a este mensaje.</p>" +
                        "</div>";
                    
                    message.setContent(htmlContent, "text/html; charset=utf-8");
                    
                    debugInfo += "Contenido HTML configurado... ";
                    
                    // Enviar mensaje
                    Transport.send(message);
                    
                    debugInfo += "Mensaje enviado exitosamente!";
                    
                    return new String[]{"true", debugInfo};
                    
                } catch (MessagingException e) {
                    debugInfo += "ERROR MessagingException: " + e.getMessage();
                    if (e.getCause() != null) {
                        debugInfo += " Causa: " + e.getCause().getMessage();
                    }
                    return new String[]{"false", debugInfo};
                } catch (Exception e) {
                    debugInfo += "ERROR Exception: " + e.getMessage();
                    return new String[]{"false", debugInfo};
                }
            }
        %>
    </body>
</html>