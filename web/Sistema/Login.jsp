<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, org.mindrot.jbcrypt.BCrypt"%>
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
                
                String query1 = "SELECT * FROM USUARIO WHERE CORREO_U = ?";
                ps = c.prepareStatement(query1);
                ps.setString(1, correo);
                rs = ps.executeQuery();
                
                jakarta.servlet.http.HttpSession userSession = request.getSession();
                if (rs.next()) {
                    // Obtener el hash almacenado en la base de datos
                    String hashAlmacenado = rs.getString("CONTRASEÑA_U");
                    out.println("<script>alert('hashAlmacenado'"+hashAlmacenado+ ");</script>");
                    out.println("<script>alert('contraseña'"+contrasena+ ");</script>");
                    boolean coincide = BCrypt.checkpw(contrasena, hashAlmacenado);
                    out.println("<script>alert('coinciden '"+coincide+ ");</script>");
                    
                    // Verificar si la contraseña coincide con el hash
                    if (BCrypt.checkpw(contrasena, hashAlmacenado)) {
                        userSession.setAttribute("userEmail", correo);
                        out.println("<script>window.location='menu.jsp';</script>");
                    } else {
                        out.println("<script>alert('Contraseña incorrecta');window.location='../index.jsp';</script>");
                    }
                } else {
                    out.println("<script>alert('No existe el usuario');window.location='../index.jsp';</script>");
                }
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