<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar</title>
    </head>
    <body>
        <%
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            Connection c = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c = DriverManager.getConnection("jdbc:mysql://localhost/Kidi", "root", "n0m3l0");

                String query1 = "SELECT * FROM USUARIO WHERE CORREO_U = ? AND CONTRASEÑA_U = ?";

                ps = c.prepareStatement(query1);
                ps.setString(1, correo);
                ps.setString(2, contrasena);
                rs = ps.executeQuery();

                
                jakarta.servlet.http.HttpSession userSession = request.getSession();

                if (rs.next()) {
                    userSession.setAttribute("userEmail", correo);
                    out.println("<script>window.location='menu.jsp';</script>");
                } else {
                    out.println("<script>alert('No existe el usuario');window.location='../index.jsp';</script>");
                }

                    out.println("<script>window.location='menu.jsp';</script>");
            } catch (SQLException | ClassNotFoundException e) {
                out.print("Error: " + e.getMessage());
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (ps != null) {
                        ps.close();
                    }
                    if (c != null) {
                        c.close();
                    }
                } catch (SQLException e) {
                    out.print("Error closing resources: " + e.getMessage());
                }
            }
        %>
    </body>
</html>
