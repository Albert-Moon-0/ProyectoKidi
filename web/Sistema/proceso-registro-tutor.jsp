<%-- 
    Document   : proceso-registro-tutor
    Created on : 11 abr. 2025, 20:38:10
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.util.*, javax.mail.*, javax.mail.internet.*, org.mindrot.jbcrypt.BCrypt, java.security.SecureRandom"%>
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
            alert("Este usuario ya se creó anteriormente, cree uno nuevo");
        }
    </script>
    </head>
    <body>
        <%
            String contrasena = request.getParameter("Contrasena");
            String nombre = request.getParameter("Nombre");
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
                        out.println("<script>mensaje2();</script>");
                        out.println("<script>window.location='Registro.jsp';</script>");
                    } else {
                    
                        // Generar código de verificación de 6 dígitos
                        SecureRandom random = new SecureRandom();
                        int code = 100000 + random.nextInt(900000);
                        String verificationCode = String.valueOf(code);
                       
                        // Guardar datos temporalmente en la sesión
                        session.setAttribute("nombre", nombre);
                        session.setAttribute("correo", correo);
                        session.setAttribute("contrasena", contrasena);
                        session.setAttribute("verificationCode", verificationCode);
                        session.setAttribute("codeExpiry", System.currentTimeMillis() + 15*60*1000); // 15 minutos para expirar

                        // Enviar correo de verificación
                        boolean mailSent = sendVerificationEmail(correo, verificationCode);

                        if (mailSent) {
                            response.sendRedirect("verify-email.jsp");
                        } else {
                            out.println("<script>alert('Error al enviar el correo de verificación. Intente de nuevo.');window.location='../registro.jsp';</script>");
                        }
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
            private boolean sendVerificationEmail(String toEmail, String verificationCode) {
                // Configura estos valores según tu proveedor de correo
                final String fromEmail = "da.moonnight.167@gmail.com"; // Reemplaza con tu correo
                final String password = "qqvs krmb sosd ooge"; // Usa contraseña de aplicación para Gmail
                
                // Propiedades para el servidor SMTP de Gmail
                Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                
                // Crear sesión con autenticación
                Session session = Session.getInstance(props, new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, password);
                    }
                });
                
                try {
                    // Crear mensaje
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(fromEmail));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
                    message.setSubject("Verificación de Correo - Kidi");
                    
                    // Crea el contenido HTML del correo
                    String htmlContent = 
                        "<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto;padding:20px;border:1px solid #e0e0e0;border-radius:5px'>" +
                        "<h2 style='color:#4A235A;text-align:center'>Verificación de cuenta Kidi</h2>" +
                        "<p>¡Gracias por registrarte! Para completar tu registro, utiliza el siguiente código de verificación:</p>" +
                        "<div style='background-color:#f5f5f5;padding:15px;text-align:center;font-size:24px;letter-spacing:5px;margin:20px 0;border-radius:5px'>" +
                        verificationCode +
                        "</div>" +
                        "<p>Este código expirará en 15 minutos.</p>" +
                        "<p>Si no has solicitado este registro, puedes ignorar este correo.</p>" +
                        "<hr style='border:0;border-top:1px solid #e0e0e0;margin:20px 0'>" +
                        "<p style='text-align:center;color:#666;font-size:12px'>Este es un correo automático, por favor no responda a este mensaje.</p>" +
                        "</div>";
                    
                    message.setContent(htmlContent, "text/html; charset=utf-8");
                    
                    // Enviar mensaje
                    Transport.send(message);
                    
                    return true;
                } catch (MessagingException e) {
                    e.printStackTrace();
                    return false;
                }
            }
        %>
    </body>
</html>