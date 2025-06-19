<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../Sistema/ConexionBD.jsp" %>

<%
    String idUsuarioStr = request.getParameter("idUsuario");
    if (idUsuarioStr != null) {
        try {
            int idUsuario = Integer.parseInt(idUsuarioStr);

            // Eliminar registros en REALIZA (actividades del niño)
            PreparedStatement ps1 = c.prepareStatement("DELETE FROM REALIZA WHERE ID_U = ?");
            ps1.setInt(1, idUsuario);
            ps1.executeUpdate();
            ps1.close();

            // Eliminar el usuario
            PreparedStatement ps2 = c.prepareStatement("DELETE FROM USUARIO WHERE ID_U = ?");
            ps2.setInt(1, idUsuario);
            int resultado = ps2.executeUpdate();
            ps2.close();

            if (resultado > 0) {
                response.sendRedirect("ver-ninos.jsp"); // Ajusta el nombre si tu archivo se llama diferente
            } else {
                out.println("<script>alert('No se pudo eliminar el usuario.'); history.back();</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('Error al eliminar usuario: " + e.getMessage() + "'); history.back();</script>");
        }
    } else {
        out.println("<script>alert('ID de usuario no recibido.'); history.back();</script>");
    }
%>
