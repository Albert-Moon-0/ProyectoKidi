<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*, org.mindrot.jbcrypt.BCrypt"%>
<%@ include file="ConexionBD.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Actualizar Contraseña</title>
</head>
<body>
    <%
        String passwordActual = request.getParameter("passwordActual");
        String passwordNueva = request.getParameter("passwordNueva");
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            // Primero verificamos la contraseña actual
            ps = c.prepareStatement("SELECT CONTRASEÑA_U FROM USUARIO WHERE CORREO_U = ?");
            ps.setString(1, userEmail);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                String hashAlmacenado = rs.getString("CONTRASEÑA_U");
                
                // Verificar si la contraseña actual es correcta
                if (BCrypt.checkpw(passwordActual, hashAlmacenado)) {
                    // Generar hash de la nueva contraseña
                    String nuevaContrasenaHash = BCrypt.hashpw(passwordNueva, BCrypt.gensalt(12));
                    
                    // Actualizar la contraseña en la base de datos
                    ps = c.prepareStatement("UPDATE USUARIO SET CONTRASEÑA_U = ? WHERE CORREO_U = ?");
                    ps.setString(1, nuevaContrasenaHash);
                    ps.setString(2, userEmail);
                    ps.executeUpdate();
                    
                    out.println("<script>alert('Contraseña actualizada correctamente'); window.location='../Ajustes/P-perfil.jsp';</script>");
                } else {
                    out.println("<script>alert('La contraseña actual es incorrecta'); window.location='../Ajustes/P-perfil.jsp';</script>");
                }
            } else {
                out.println("<script>alert('Usuario no encontrado'); window.location='../Ajustes/P-perfil.jsp';</script>");
            }
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { }
            if (ps != null) try { ps.close(); } catch (SQLException e) { }
        }
    %>
</body>
</html>