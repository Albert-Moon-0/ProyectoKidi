

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>
<%
    try {
        // Recuperar parámetros del formulario
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        int idActividad = Integer.parseInt(request.getParameter("idActividad"));
        double puntaje = Double.parseDouble(request.getParameter("finalScore"));
        
        // Verificar si el usuario ya ha realizado esta actividad
        PreparedStatement checkPS = c.prepareStatement(
            "SELECT COUNT(*) AS existe FROM REALIZA WHERE ID_U = ? AND ID_ACT = ?");
        checkPS.setInt(1, idUsuario);
        checkPS.setInt(2, idActividad);
        ResultSet rs = checkPS.executeQuery();
        
        boolean existeRegistro = false;
        if (rs.next()) {
            existeRegistro = rs.getInt("existe") > 0;
        }
        rs.close();
        checkPS.close();
        
        // Usar INSERT o UPDATE según corresponda
        PreparedStatement pst;
        
        if (existeRegistro) {
            // Actualizar registro existente
            pst = c.prepareStatement(
                "UPDATE REALIZA SET PUNTAJE_ACT = ? WHERE ID_U = ? AND ID_ACT = ?");
            pst.setDouble(1, puntaje);
            pst.setInt(2, idUsuario);
            pst.setInt(3, idActividad);
        } else {
            // Insertar nuevo registro
            pst = c.prepareStatement(
                "INSERT INTO REALIZA (ID_U, ID_ACT, PUNTAJE_ACT) VALUES(?, ?, ?)");
            pst.setInt(1, idUsuario);
            pst.setInt(2, idActividad);
            pst.setDouble(3, puntaje);
        }
        
        pst.executeUpdate();
        pst.close();
        
        
         response.sendRedirect("P-Pruebas.jsp");
        

    } catch(Exception e) {
        // Registrar el error
        System.err.println("Error al guardar puntaje: " + e.toString());
        
        // Mostrar mensaje de error
        out.println("<div style='color:red; padding:20px; text-align:center;'>");
        out.println("<h3>Error al guardar el puntaje</h3>");
        out.println("<p>" + e.getMessage() + "</p>");
        out.println("<a href='javascript:history.back()'>Volver</a>");
        out.println("</div>");
    }
%>