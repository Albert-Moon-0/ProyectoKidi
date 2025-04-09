<%-- 
    Document   : ConexionBD
    Created on : 3 nov. 2024, 12:22:23
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*,java.io.*,java.util.*"%>
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
    
    jakarta.servlet.http.HttpSession userSession = request.getSession(false);
    if (userSession != null) {
        userEmail = (String) userSession.getAttribute("userEmail");
    }

    
%>