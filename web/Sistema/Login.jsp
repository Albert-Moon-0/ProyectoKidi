<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, org.mindrot.jbcrypt.BCrypt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            Connection c = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost/Kidi", "root", "n0m3l0");
                jakarta.servlet.http.HttpSession userSession = request.getSession();
                
                String[] tables = {"ADMIN_", "USUARIO", "TUTOR"};
                String[] emailColumns = {"CORREO_A", "CORREO_U", "CORREO_T"};
                String[] passwordColumns = {"CONTRA_A", "CONTRASEÑA_U", "CONTRA_T"};
                String[] redirigir = {"menu_A", "menu", "menu_T"};
                boolean authenticated = false;
                
                for (int i = 0; i < tables.length; i++) {
                    String query = "SELECT * FROM " + tables[i] + " WHERE " + emailColumns[i] + " = ?";
                    ps = c.prepareStatement(query);
                    ps.setString(1, correo);
                    rs = ps.executeQuery();
                    
                    if (rs.next()) {
                        String hashAlmacenado = rs.getString(passwordColumns[i]);
                        
                        if (hashAlmacenado != null && BCrypt.checkpw(contrasena, hashAlmacenado)) {
                            userSession.setAttribute("userEmail", correo);
                            userSession.setAttribute("userType", tables[i].replace("_", ""));
                            authenticated = true;
                            out.println("<script>window.location='"+redirigir[i]+".jsp';</script>");
                            return;
                        } else {
                            out.println("<script>alert('Contraseña incorrecta');window.location='../iniciodesesion.jsp';</script>");
                            return;
                        }
                    }
                  
                }
                
                if (!authenticated) {
                    out.println("<script>alert('Usuario no encontrado');window.location='../iniciodesesion.jsp';</script>");
                }
                
            } catch (Exception e) {
                out.print("Error: " + e.getMessage());
                out.println("<script>alert('Erro sistema"+e.getMessage()+"');window.location='../iniciodesesion.jsp';</script>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (c != null) c.close();
                } catch (SQLException e) {
                    out.print("Error closing resources: " + e.getMessage());
                }
            }
        %>
    </body>
</html>