<%-- 
    Document   : CambioPasswordTutor
    Created on : 26 jun 2025, 20:53:02
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*, org.mindrot.jbcrypt.BCrypt"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Actualizar Contraseña - Tutor | Kidi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
    <%
        String passwordActual = request.getParameter("passwordActual");
        String passwordNueva = request.getParameter("passwordNueva");
        String tutorEmail = request.getParameter("tutorEmail");
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            // Primero verificamos la contraseña actual del tutor
            ps = c.prepareStatement("SELECT CONTRA_T FROM TUTOR WHERE CORREO_T = ?");
            ps.setString(1, userEmail);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                String hashAlmacenado = rs.getString("CONTRA_T");
                
                // Verificar si la contraseña actual es correcta
                if (BCrypt.checkpw(passwordActual, hashAlmacenado)) {
                    // Generar hash de la nueva contraseña
                    String nuevaContrasenaHash = BCrypt.hashpw(passwordNueva, BCrypt.gensalt(12));
                    
                    // Cerrar el ResultSet anterior
                    rs.close();
                    ps.close();
                    
                    // Actualizar la contraseña en la base de datos
                    ps = c.prepareStatement("UPDATE TUTOR SET CONTRA_T = ? WHERE CORREO_T = ?");
                    ps.setString(1, nuevaContrasenaHash);
                    ps.setString(2, userEmail);
                    int resultado = ps.executeUpdate();
                    
                    if (resultado > 0) {
                        out.println("<script>alert('Contraseña de tutor actualizada correctamente'); window.location='../Tutor/P-perfilT.jsp';</script>");
                    } else {
                        out.println("<script>alert('Error al actualizar la contraseña'); window.location='../Tutor/P-perfilT.jsp';</script>");
                    }
                } else {
                    out.println("<script>alert('La contraseña actual es incorrecta'); window.location='../Tutor/P-perfilT.jsp';</script>");
                }
            } else {
                out.println("<script>alert('Tutor no encontrado'); window.location='../Tutor/P-perfilT.jsp';</script>");
            }
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
            out.println("<script>alert('Error en el sistema: " + e.getMessage() + "'); window.location='../Tutor/P-perfilT.jsp';</script>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { }
            if (ps != null) try { ps.close(); } catch (SQLException e) { }
        }
    %>
</body>
</html>