<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,org.mindrot.jbcrypt.BCrypt"%>
<%@ include file="../Sistema/ConexionBD.jsp" %>

<%    String nombre = request.getParameter("Nombre");
    String correo = request.getParameter("Correo");
    String contrasena = request.getParameter("Contrasena");
    String edadStr = request.getParameter("Edad");
    int edad = 0;
    try {
        edad = Integer.parseInt(edadStr);
    } catch (Exception e) {
        out.println("<script>alert('Edad inválida');window.history.back();</script>");
        return;
    }

    // Imagen por defecto (ejemplo: 1)
    int idFotoDefault = 1;

    // Obtener ID_T del tutor actual
    int idTutor = 1; // default si no encuentras nada
    try {
        PreparedStatement p = c.prepareStatement("SELECT ID_T FROM TUTOR WHERE CORREO_T = ?");
        // Aquí asumimos que tienes en sesión el correo del tutor, si no cámbialo
        String correoTutor = (String) session.getAttribute("correoTutor");
        if (correoTutor == null) {
            correoTutor = "tutor@example.com"; // Valor por defecto
        }
        p.setString(1, correoTutor);
        ResultSet r = p.executeQuery();
        if (r.next()) {
            idTutor = r.getInt("ID_T");
        }
        r.close();
        p.close();
    } catch (SQLException ex) {
        out.println("Error obteniendo tutor: " + ex.getMessage());
    }

    // Verificar que no exista correo duplicado en USUARIO
    try {
        PreparedStatement check = c.prepareStatement("SELECT * FROM USUARIO WHERE CORREO_U = ?");
        check.setString(1, correo);
        ResultSet rsCheck = check.executeQuery();
        if (rsCheck.next()) {
            out.println("<script>alert('Ya existe un usuario con ese correo.');window.location='P-AnadirN.jsp';</script>");
            rsCheck.close();
            check.close();
            return;
        }
        rsCheck.close();
        check.close();
    } catch (SQLException ex) {
        out.println("Error comprobando correo duplicado: " + ex.getMessage());
        return;
    }

    // Hashear la contraseña
    String hashedPass = BCrypt.hashpw(contrasena, BCrypt.gensalt());

    // Insertar nuevo usuario
    try {
        PreparedStatement ps = c.prepareStatement("INSERT INTO USUARIO (NOMBRE_U, EDAD_U, CORREO_U, CONTRASEÑA_U, ID_FOTO, ID_T) VALUES (?, ?, ?, ?, ?, ?)");
        ps.setString(1, nombre);
        ps.setInt(2, edad);
        ps.setString(3, correo);
        ps.setString(4, hashedPass);
        ps.setInt(5, idFotoDefault);
        ps.setInt(6, idTutor);

        int res = ps.executeUpdate();
        ps.close();

        if (res > 0) {
            // Registro exitoso
           out.println("<script>");
out.println("alert('Usuario registrado con éxito.');");
out.println("window.location = 'P-AnadirN.jsp';");
out.println("</script>");
            

        } else {
            out.println("<script>alert('Error al registrar usuario.');window.history.back();</script>");
        }
    } catch (SQLException ex) {
        out.println("Error insertando usuario: " + ex.getMessage());
    }
%>
