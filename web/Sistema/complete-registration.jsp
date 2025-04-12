<%-- 
    Document   : complete-registration
    Created on : 11 abr. 2025, 20:57:09
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Completando Registro</title>
    </head>
    <body>
        <%
            String enteredCode = request.getParameter("code");
            String savedCode = (String) session.getAttribute("verificationCode");
            Long codeExpiry = (Long) session.getAttribute("codeExpiry");
            
            // Verificar si el código ha expirado
            if (codeExpiry == null || System.currentTimeMillis() > codeExpiry) {
                out.println("<script>alert('El código de verificación ha expirado. Por favor, solicita un nuevo código.');window.location='verify-email.jsp';</script>");
                return;
            }
            
            // Verificar si el código es correcto
            if (savedCode == null || !savedCode.equals(enteredCode)) {
                response.sendRedirect("verify-email.jsp?error=invalid");
                return;
            }
            
            // Obtener datos de la sesión
            String nombre = (String) session.getAttribute("nombre");
            String correo = (String) session.getAttribute("correo");
            String contrasena = (String) session.getAttribute("contrasena");
            
            if (nombre == null ||  correo == null || contrasena == null) {
                out.println("<script>alert('Información de registro incompleta. Por favor, inicia el registro nuevamente.');window.location='../registro.jsp';</script>");
                return;
            }
            
            Connection c = null;
            PreparedStatement ps = null;
            
            try {
                // Insertar usuario en la base de datos
                Class.forName("com.mysql.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost/Kidi", "root", "n0m3l0");
                
                String contrasenaHash = BCrypt.hashpw(contrasena, BCrypt.gensalt(12));                        
                
                String sql = "INSERT INTO TUTOR (NOMBRE_T, CORREO_T, CONTRA_T) VALUES (?, ?, ?)";
                ps = c.prepareStatement(sql);
                ps.setString(1, nombre);
                ps.setString(2, correo);
                ps.setString(3, contrasenaHash);
                ps.executeUpdate();
                
                // Limpiar datos de sesión
                session.removeAttribute("nombre");
                session.removeAttribute("correo");
                session.removeAttribute("contrasena");
                session.removeAttribute("verificationCode");
                session.removeAttribute("codeExpiry");
                
                // Mostrar mensaje de éxito y redirigir
                out.println("<script>alert('¡Registro completado con éxito! Ahora puedes iniciar sesión.');window.location='../iniciodesesion.jsp';</script>");
                
            } catch (Exception e) {
                out.println("<script>alert('Error al completar el registro: " + e.getMessage() + "');window.location='Registro.jsp';</script>");
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (c != null) c.close();
                } catch (SQLException e) {
                    out.print("Error closing resources: " + e.getMessage());
                }
            }
        %>
    </body>
</html>