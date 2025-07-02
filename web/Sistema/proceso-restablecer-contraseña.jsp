
<%-- 
    Document   : proceso-restablecer-contraseña
    Created on : 11 abr. 2025, 20:38:10
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.util.*, javax.mail.*, javax.mail.internet.*, org.mindrot.jbcrypt.BCrypt, java.security.SecureRandom, java.net.URLEncoder, java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script>
        function mensaje(){
            alert("Usuario registrado");
        }
        
        function mensaje2(){
            alert("No se encontró nigun usuario para ese correo electrónico");
        }
        
        function debugAlert(mensaje){
            alert("DEBUG: " + mensaje);
        }
    </script>
    </head>
    <body>
        <%
            String correo = request.getParameter("Correo");

            Connection con = null;
            Statement sta = null;
            ResultSet r = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi", "root", "n0m3l0");
                sta = con.createStatement();
                out.println("Conexión realizada...");

                try {
                    r = sta.executeQuery("SELECT * FROM TUTOR WHERE CORREO_T ='" + correo + "';");

                    if (r.next()) {                                               
                        // Generar código de verificación de 6 dígitos
                        SecureRandom random = new SecureRandom();
                        int code = 100000 + random.nextInt(900000);
                        String verificationCode = String.valueOf(code);
                        
                       
                        // MÉTODO 1: Cookies manuales con configuración específica para proxy
                       
                        Cookie codeCookie = new Cookie("kidi_reg_code", verificationCode);
                        Cookie correoCookie = new Cookie("kidi_reg_correo", URLEncoder.encode(correo, "UTF-8"));
                        Cookie expiryCookie = new Cookie("kidi_reg_expiry", String.valueOf(System.currentTimeMillis() + 15*60*1000));
                        
                        // Configuración específica para servidores con proxy
                        codeCookie.setPath("/");
                        correoCookie.setPath("/");
                        expiryCookie.setPath("/");
                        
                        codeCookie.setMaxAge(60 * 30);
                        correoCookie.setMaxAge(60 * 30);
                        expiryCookie.setMaxAge(60 * 30);
                        
                        codeCookie.setSecure(false);
                        correoCookie.setSecure(false);
                        expiryCookie.setSecure(false);
                        
                        codeCookie.setHttpOnly(false);
                        correoCookie.setHttpOnly(false);
                        expiryCookie.setHttpOnly(false);
                        
                        response.addCookie(codeCookie);
                        response.addCookie(correoCookie);
                        response.addCookie(expiryCookie);

                        // MÉTODO 2: Guardar datos en sesión tradicional
                        session.setAttribute("verificationCode", verificationCode);
                        session.setAttribute("correo", correo);
                        session.setAttribute("codeExpiry", System.currentTimeMillis() + 15*60*1000); // 15 minutos para expirar


                        // Enviar correo de verificación
                        
                        String[] emailResult = sendVerificationEmailWithDebug(correo, verificationCode);
                        boolean mailSent = Boolean.parseBoolean(emailResult[0]);
                        String debugMessage = emailResult[1];


                        if (mailSent) {
                            
                            // MÉTODO 3: También usar parámetros URL como respaldo
                            String redirectUrl = "verify-email2.jsp?n=" + "&c=" + URLEncoder.encode(correo, "UTF-8") + 
                                                "&vc=" + verificationCode + 
                                                "&ve=" + (System.currentTimeMillis() + 15*60*1000) +
                                                "&ts=" + System.currentTimeMillis(); // timestamp para evitar cache
                            
                            out.println("<script>window.location='" + redirectUrl + "';</script>");
                        } else {
                            out.println("<script>alert('Error al enviar el correo de verificación: " + debugMessage + "');window.location='registro.jsp';</script>");
                        }
                        
                    } else {
                    
                        out.println("<script>mensaje2();</script>");
                        out.println("<script>window.location='../iniciodesesion.jsp';</script>");
                    }
                } catch (SQLException error) {
                    out.print(error.toString());
                }
            } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException error) {
                out.print(error.toString());
            } finally {
                // Cerrar recursos en el bloque finally para asegurarse de que siempre se cierren
                if (r != null) try { r.close(); } catch (SQLException e) { out.print(e.toString()); }
                if (sta != null) try { sta.close(); } catch (SQLException e) { out.print(e.toString()); }
                if (con != null) try { con.close(); } catch (SQLException e) { out.print(e.toString()); }
            }
        %>
        
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
                    message.setSubject("Verificación de Correo - Kidi");
                    
                    debugInfo += "Mensaje configurado... ";
                    
                    // Crea el contenido HTML del correo
                    String htmlContent = 
                        "<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto;padding:20px;border:1px solid #e0e0e0;border-radius:5px'>" +
                        "<h2 style='color:#4A235A;text-align:center'>Restablecer contraseña de cuenta Kidi</h2>" +
                        "<p>Para completar el restablecimiento de tu contraseña, utiliza el siguiente código de verificación:</p>" +
                        "<div style='background-color:#f5f5f5;padding:15px;text-align:center;font-size:24px;letter-spacing:5px;margin:20px 0;border-radius:5px'>" +
                        verificationCode +
                        "</div>" +
                        "<p>Este código expirará en 15 minutos.</p>" +
                        "<p>Si no has solicitado este registro, puedes ignorar este correo.</p>" +
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
            
            // Mantener el método original por compatibilidad
            private boolean sendVerificationEmail(String toEmail, String verificationCode) {
                String[] result = sendVerificationEmailWithDebug(toEmail, verificationCode);
                return Boolean.parseBoolean(result[0]);
            }
        %>
    </body>
</html>