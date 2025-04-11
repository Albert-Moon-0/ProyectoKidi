<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<%
    // Invalidar la sesión existente
    request.getSession().invalidate();

    // Redirigir a la página de inicio
    response.sendRedirect("../iniciodesesion.jsp");
%>
