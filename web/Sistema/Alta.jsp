<%-- 
    Document   : Alta
    Created on : 26 may. 2024, 17:25:01
    Author     : Ger_Fer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Altas</title>
    </head>
    <script>
        function mensaje(){
            alert("Usuario registrado");
        }
        
        function mensaje2(){
            alert("Este usuario ya se creó anteriormente, cree uno nuevo");
        }
    </script>
        
    <body>
        <%
            String contrasena = request.getParameter("Contrasena");
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
                out.println("Conexión realizada...");

                try {
                    r = sta.executeQuery("SELECT * FROM USUARIO WHERE CORREO_U ='" + correo + "';");

                    if (r.next()) {
                        out.println("<script>mensaje2();</script>");
                        out.println("<script>window.location='index.jsp';</script>");
                    } else {
                        sta.executeUpdate("INSERT INTO USUARIO (NOMBRE_U, CORREO_U, CONTRASEÑA_U, EDAD_U) VALUES('" + nombre + "','" + correo + "', '" + contrasena + "', '" + edad + "');");

                        // Obtener la sesión y almacenar el correo del usuario
                        jakarta.servlet.http.HttpSession userSession = request.getSession();
                        userSession.setAttribute("userEmail", correo);
                        
                        out.println("<script>window.location='menu.jsp';</script>");
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
    </body>
</html>