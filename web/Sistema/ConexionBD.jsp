<%-- 
    Document   : ConexionBD
    Created on : 3 nov. 2024, 12:22:23
    Author     : P500
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*,java.io.*,java.util.*,java.net.URLDecoder"%>
<%   
    Connection c = null;
    Statement s = null;
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        c = DriverManager.getConnection("jdbc:mysql://localhost/Kidi?useUnicode=true&characterEncoding=UTF-8", "root", "n0m3l0");
        s = c.createStatement();
    } catch (SQLException error) {
        out.print(error.toString());
    }
    
    String userEmail = null;
    String Nombre = null;
    String Correo = null;
    String userType = null;
    
    jakarta.servlet.http.HttpSession userSession = request.getSession(false);
    if (userSession != null) {
        userEmail = (String) userSession.getAttribute("userEmail");
        userType = (String) userSession.getAttribute("userType");
    }
    
    // MÉTODO 1: Intentar obtener de cookies personalizadas
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("kidi_user_email".equals(cookie.getName())) {
                userEmail = URLDecoder.decode(cookie.getValue(), "UTF-8");
            } else if ("kidi_user_type".equals(cookie.getName())) {
                userType = cookie.getValue();
            }
        }
    }
    
    // MÉTODO 2: Si no hay cookies, intentar obtener de parámetros URL
    if (userEmail == null || userType == null) {
        userEmail = request.getParameter("e");
        userType = request.getParameter("t");
        
        if (userEmail != null && userType != null) {
            userEmail = URLDecoder.decode(userEmail, "UTF-8");
            
            // Si obtenemos datos de URL, crear cookies para la próxima vez
            Cookie emailCookie = new Cookie("kidi_user_email", java.net.URLEncoder.encode(userEmail, "UTF-8"));
            Cookie typeCookie = new Cookie("kidi_user_type", userType);
            emailCookie.setPath("/");
            typeCookie.setPath("/");
            emailCookie.setMaxAge(60 * 60 * 8);
            typeCookie.setMaxAge(60 * 60 * 8);
            emailCookie.setSecure(false);
            typeCookie.setSecure(false);
            response.addCookie(emailCookie);
            response.addCookie(typeCookie);
        }
    }
    
    // MÉTODO 3: Como último recurso, intentar sesión tradicional
    if (userEmail == null || userType == null) {
        userEmail = (String) session.getAttribute("userEmail");
        userType = (String) session.getAttribute("userType");
    }
    
    // Verificar que tenemos los datos necesarios
    if (userEmail == null || userEmail.trim().isEmpty()) {
        // No hacer return aquí, simplemente continuar sin datos de usuario
        userEmail = "";
        userType = "";
    }
    
    // NUEVA SECCIÓN: Obtener datos específicos según el tipo de usuario
    if (userEmail != null && !userEmail.trim().isEmpty() && userType != null) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            if ("USUARIO".equals(userType)) {
                ps = c.prepareStatement("SELECT NOMBRE_U, CORREO_U FROM USUARIO WHERE CORREO_U = ?");
                ps.setString(1, userEmail);
                rs = ps.executeQuery();
                if (rs.next()) {
                    Nombre = rs.getString("NOMBRE_U");
                    Correo = rs.getString("CORREO_U");
                }
            } else if ("TUTOR".equals(userType)) {
                ps = c.prepareStatement("SELECT NOMBRE_T, CORREO_T FROM TUTOR WHERE CORREO_T = ?");
                ps.setString(1, userEmail);
                rs = ps.executeQuery();
                if (rs.next()) {
                    Nombre = rs.getString("NOMBRE_T");
                    Correo = rs.getString("CORREO_T");
                }
            } else if ("ADMIN".equals(userType)) {
                ps = c.prepareStatement("SELECT NOMBRE_A, CORREO_A FROM ADMIN_ WHERE CORREO_A = ?");
                ps.setString(1, userEmail);
                rs = ps.executeQuery();
                if (rs.next()) {
                    Nombre = rs.getString("NOMBRE_A");
                    Correo = rs.getString("CORREO_A");
                }
            }
        } catch (SQLException e) {
            // Log error pero no interrumpir la página
            System.out.println("Error al obtener datos del usuario: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                System.out.println("Error cerrando recursos: " + e.getMessage());
            }
        }
    }
    
    // Asegurar que las variables no sean null para evitar errores en JSP
    if (Nombre == null) Nombre = "";
    if (Correo == null) Correo = "";
    if (userEmail == null) userEmail = "";
    if (userType == null) userType = "";
%>