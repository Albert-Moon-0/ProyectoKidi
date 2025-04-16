<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,org.json.simple.*"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>
<%
    // Configuración de caché para prevenir problemas con datos antiguos
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    JSONObject jsonDatos = new JSONObject();
    JSONArray actividadesData = new JSONArray();
    
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection conn = null;
    
    try {
        // Verificar que userEmail no sea nulo
        if (userEmail == null || userEmail.isEmpty()) {
            throw new Exception("Email de usuario no disponible");
        }
        
        conn = c; // Guardar la conexión en una variable local
        
        // Obtener el ID del usuario
        String query1 = "SELECT * FROM USUARIO WHERE CORREO_U = ?";
        ps = conn.prepareStatement(query1);
        ps.setString(1, userEmail);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            int ID_U = rs.getInt("ID_U");
            int[] sumas = {0, 0, 0};
            int[] contadores = {0, 0, 0};
            double[] promedios = {0, 0, 0};
            // 1 español, 2 ingles, 3 matematicas
            String[] materias = {"Español", "Inglés", "Matemáticas"};
            
            // Cerrar el ResultSet antes de reutilizar
            rs.close();
            ps.close();
            int actividadesT = 0;
            int actividadesSemana = 0;
            
            for (int i = 0; i < 3; i++) {
                int materia = i + 1;
                
                String queryActividades = "SELECT COUNT(*) as numActividades FROM REALIZA " +
                               "WHERE ID_U = ?";
                ps = conn.prepareStatement(queryActividades);
                ps.setInt(1, ID_U);
                rs = ps.executeQuery();

                if (rs.next()) {
                    actividadesT = rs.getInt("numActividades");
                }

                // Cerrar recursos
                rs.close();
                ps.close();
                
                String queryActividadesSemana = "SELECT COUNT(*) as numActividades FROM REALIZA " +
                               "WHERE ID_U = ? AND FECHA_REALIZA >= DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY)";
                ps = conn.prepareStatement(queryActividadesSemana);
                ps.setInt(1, ID_U);
                rs = ps.executeQuery();
                if (rs.next()) {
                    actividadesSemana = rs.getInt("numActividades");
                }

                // Cerrar recursos
                rs.close();
                ps.close();
                
                String query2 = "SELECT r.PUNTAJE_ACT FROM REALIZA r " +
               "JOIN ACTIVIDADES a ON a.ID_ACT = r.ID_ACT " +
               "WHERE r.ID_U = ? AND a.ID_MAT = ?";
                ps = conn.prepareStatement(query2);
                ps.setInt(1, ID_U);
                ps.setInt(2, materia);
                rs = ps.executeQuery();

                while (rs.next()) {
                    sumas[i] = sumas[i] + rs.getInt("PUNTAJE_ACT");
                    contadores[i] = contadores[i] + 1;
                }
                
                // Cerrar recursos antes de reutilizar
                rs.close();
                ps.close();
                
                JSONObject item = new JSONObject();
                item.put("materia", materias[i]);
                
                if (contadores[i] == 0) {
                    promedios[i] = 0;
                } else {
                    promedios[i] = (double)sumas[i] / contadores[i];
                }
                
                item.put("promedio", promedios[i]);
                actividadesData.add(item);
                
            }
            
            // Calcular promedio general
            double sumaG = 0;
            int materiasConDatos = 0;
            
            for (int j = 0; j < 3; j++) {
                if (contadores[j] > 0) {
                    sumaG += promedios[j];
                    materiasConDatos++;
                }
            }
            
            double promG = (materiasConDatos > 0) ? sumaG / materiasConDatos : 0;
            
            jsonDatos.put("promedioGeneral", promG);
            jsonDatos.put("actividadesT", actividadesT); 
            jsonDatos.put("actividadesSemana", actividadesSemana); 
            
        }       
        jsonDatos.put("actividades", actividadesData);
        out.print(jsonDatos.toJSONString());
        
    } catch (Exception e) {
        // Crear un objeto JSON de error en lugar de imprimir texto directo
        JSONObject errorJson = new JSONObject();
        errorJson.put("error", e.getMessage());
        out.print(errorJson.toJSONString());
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            // No cerrar la conexión aquí si viene de ConexionBD.jsp
            // Si la conexión debe cerrarse, hacerlo en el archivo que la creó
        } catch (SQLException e) {
            JSONObject errorJson = new JSONObject();
            errorJson.put("error", "Error closing resources: " + e.getMessage());
            out.print(errorJson.toJSONString());
        }
    }
%>