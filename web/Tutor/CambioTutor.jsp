<%-- 
    Document   : CambioTutor
    Created on : 26 jun 2025, 20:52:25
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, java.net.*, org.mindrot.jbcrypt.BCrypt, java.util.*, java.time.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualización de Perfil - Tutor | Kidi</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    </head>
    <script>
        function mensajeExito(){
            alert("Perfil de tutor actualizado correctamente");
        }
        
        function mensajeError(){
            alert("Error al actualizar el perfil del tutor");
        }
    </script>
    <script>
        function debugAlert(mensaje) {
            alert("DEBUG TUTOR: " + mensaje);
        }
        
        function errorAlert(mensaje) {
            alert("ERROR TUTOR: " + mensaje);
        }
    </script>
        
    <body>
        <%
            // Continuar con la lógica de base de datos
            Nombre = "";
            Correo = "";
            int IdT = 0;
            
            if (c == null) {
                out.println("<script>errorAlert('Conexión a BD es null');window.location.href='../iniciodesesion.jsp';</script>");
                return;
            }
            
            PreparedStatement p = null;
            ResultSet r = null;
            
            try {
                p = c.prepareStatement("SELECT * FROM TUTOR WHERE CORREO_T = ?");
                p.setString(1, userEmail.trim());
                r = p.executeQuery();
                
                if (r.next()) {
                    IdT = r.getInt("ID_T");
                    Nombre = r.getString("NOMBRE_T");
                    Correo = r.getString("CORREO_T");
                    
                } else {
                    out.println("<script>errorAlert('Tutor no encontrado en BD para email: " + userEmail + "');</script>");
                    
                    // Debug: mostrar algunos emails de tutores en la BD
                    PreparedStatement debugPs = c.prepareStatement("SELECT CORREO_T FROM TUTOR LIMIT 3");
                    ResultSet debugRs = debugPs.executeQuery();
                    String emailsFound = "";
                    while (debugRs.next()) {
                        emailsFound += debugRs.getString("CORREO_T") + ", ";
                    }
                    debugRs.close();
                    debugPs.close();
                    
                    out.println("<script>debugAlert('Emails de tutores en BD: " + emailsFound + "');</script>");
                    out.println("<script>window.location.href='../iniciodesesion.jsp';</script>");
                }
                
            } catch (Exception error) {
                out.println("<script>errorAlert('Error en consulta BD: " + error.getMessage() + "');</script>");
                error.printStackTrace();
            } finally {
                try {
                    if (r != null) r.close();
                    if (p != null) p.close();
                } catch (SQLException e) {
                    out.println("<script>debugAlert('Error cerrando recursos: " + e.getMessage() + "');</script>");
                }
            }
        %>
        
        <%
            String nombre = request.getParameter("Nombre");
            String correo = request.getParameter("Correo");
            String tutorEmail = request.getParameter("tutorEmail");
            
            Connection con = null;
            Statement sta = null;
            r = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi", "root", "n0m3l0");
                sta = con.createStatement();
                
                try {
                    // Actualizamos los datos del tutor
                    int resultado = sta.executeUpdate("UPDATE TUTOR SET NOMBRE_T='" + nombre + "', CORREO_T='" + correo + "' WHERE CORREO_T='" + userEmail + "';");
                    
                    if (resultado > 0) {
                        // Actualizar la sesión con el nuevo correo
                        userSession.setAttribute("userEmail", correo);
                        
                        // Código a implementar después de que se actualicen los datos correctamente
                        try {
                            // MÉTODO 1: Cookies manuales con configuración específica para proxy
                            Cookie emailCookie = new Cookie("kidi_user_email", URLEncoder.encode(correo, "UTF-8"));
                            Cookie typeCookie = new Cookie("kidi_user_type", "tutor"); // Tipo específico para tutor
                            
                            // Configuración específica para servidores con proxy
                            emailCookie.setPath("/");
                            typeCookie.setPath("/");
                            emailCookie.setMaxAge(60 * 60 * 8); // 8 horas
                            typeCookie.setMaxAge(60 * 60 * 8);
                            emailCookie.setSecure(false); // Importante: false para HTTP
                            typeCookie.setSecure(false);
                            emailCookie.setHttpOnly(false); // Permitir acceso desde JavaScript si es necesario
                            typeCookie.setHttpOnly(false);
                            
                            response.addCookie(emailCookie);
                            response.addCookie(typeCookie);
                            
                            // MÉTODO 2: También usar parámetros URL como respaldo
                            String redirectUrl = "../Tutor/P-perfilT.jsp?e=" + URLEncoder.encode(correo, "UTF-8") + 
                                                "&t=" + URLEncoder.encode("tutor", "UTF-8") + 
                                                "&ts=" + System.currentTimeMillis(); // timestamp para evitar cache
                            
                            out.println("<script>mensajeExito();</script>");
                            out.println("<script>window.location.href='" + redirectUrl + "';</script>");
                            
                        } catch (Exception cookieError) {
                            // Si hay error con las cookies, al menos redirigir normalmente
                            out.println("<script>mensajeExito();</script>");
                            out.println("<script>window.location.href='../Tutor/P-perfilT.jsp';</script>");
                            out.println("<script>debugAlert('Error actualizando cookies: " + cookieError.getMessage() + "');</script>");
                        }
                        
                    } else {
                        out.println("<script>mensajeError();</script>");
                        out.println("<script>window.location.href='../Tutor/P-perfilT.jsp';</script>");
                    }
                    
                } catch (SQLException error) {
                    out.println("<script>mensajeError();</script>");
                    out.print(error.toString());
                    out.println("<script>window.location.href='../Tutor/P-perfilT.jsp';</script>");
                }
            } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException error) {
                out.println("<script>mensajeError();</script>");
                out.print(error.toString());
            } finally {
                // Cerrar recursos en el bloque finally
                if (r != null) try { r.close(); } catch (SQLException e) { out.print(e.toString()); }
                if (sta != null) try { sta.close(); } catch (SQLException e) { out.print(e.toString()); }
                if (con != null) try { con.close(); } catch (SQLException e) { out.print(e.toString()); }
            }
        %>
    </body>
</html>
