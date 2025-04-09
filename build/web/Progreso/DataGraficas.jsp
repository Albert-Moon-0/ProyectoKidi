

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,org.json.simple.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>

<%
    // Configuración de caché para prevenir problemas con datos antiguos
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    JSONObject jsonDatos = new JSONObject();
    JSONArray actividadesData = new JSONArray();
    
    String correo = request.getParameter("correo");
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        // Obtener el ID del usuario
        String query1 = "SELECT * FROM USUARIO WHERE CORREO_U = ? ";
        ps = c.prepareStatement(query1);
        ps.setString(1, userEmail);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            int ID_U = rs.getInt("ID_U");
            
            // Consulta correcta usando la tabla REALIZA como unión
            String query2 = "SELECT * FROM REALIZA r " +
                            "JOIN ACTIVIDADES a ON a.ID_ACT = r.ID_ACT " +
                            "WHERE r.ID_U = ?";
            ps = c.prepareStatement(query2);
            ps.setInt(1, ID_U);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                JSONObject item = new JSONObject();
                item.put("actividad", rs.getString("DESC_ACT"));
                item.put("puntaje", rs.getInt("PUNTAJE_ACT"));
                actividadesData.add(item);
            }            
            
        }
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (c != null) c.close();
        } catch (SQLException e) {
            out.print("Error closing resources: " + e.getMessage());
        }
    }
    
    jsonDatos.put("actividades", actividadesData);
    out.print(jsonDatos.toJSONString());
%>