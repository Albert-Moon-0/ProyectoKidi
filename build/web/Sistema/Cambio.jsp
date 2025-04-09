<%-- 
    Document   : Cambio
    Created on : 04 apr. 2025, 17:25:01
    Author     : Ger_Fer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<% jakarta.servlet.http.HttpSession userSession = request.getSession(); %>
<% String userEmail = (String) userSession.getAttribute("userEmail"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualización de Perfil - Kidi</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    </head>
    <script>
        function mensajeExito(){
            alert("Perfil actualizado correctamente");
        }
        
        function mensajeError(){
            alert("Error al actualizar el perfil");
        }
    </script>
        
    <body>
        <%
            String nombre = request.getParameter("Nombre");
            String correo = request.getParameter("Correo");
            String edad = request.getParameter("Edad");
            Connection con = null;
            Statement sta = null;
            ResultSet r = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi", "root", "n0m3l0");
                sta = con.createStatement();
                
                try {
                                       
                    // Actualizamos los datos del usuario
                    int resultado = sta.executeUpdate("UPDATE USUARIO SET NOMBRE_U='" + nombre + "', CORREO_U='" + correo + "', EDAD_U='" + edad + "' WHERE CORREO_U='" + userEmail + "';");
                    
                    if (resultado > 0) {
                        // Actualizar la sesión con el nuevo correo
                        userSession.setAttribute("userEmail", correo);
                        out.println("<script>mensajeExito();</script>");
                        out.println("<script>window.location='../Ajustes/P-perfil.jsp';</script>");
                    } else {
                        out.println("<script>mensajeError();</script>");
                        out.println("<script>window.location='../Ajustes/P-perfil.jsp';</script>");
                    }
                } catch (SQLException error) {
                    out.println("<script>mensajeError();</script>");
                    out.print(error.toString());
                    out.println("<script>window.location='../Ajustes/P-perfil.jsp';</script>");
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