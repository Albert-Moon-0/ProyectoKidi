<%-- 
    Document   : session_debug
    Created on : 24 jun 2025, 16:32:29
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Diagnóstico de Sesión</title>
</head>
<body>
    <h2>Diagnóstico Completo de Sesión</h2>
    
    <%
        out.println("<h3>Información de la Sesión:</h3>");
        out.println("<p><strong>Session ID:</strong> " + session.getId() + "</p>");
        out.println("<p><strong>Session New:</strong> " + session.isNew() + "</p>");
        out.println("<p><strong>Creation Time:</strong> " + new Date(session.getCreationTime()) + "</p>");
        out.println("<p><strong>Last Accessed:</strong> " + new Date(session.getLastAccessedTime()) + "</p>");
        out.println("<p><strong>Max Inactive Interval:</strong> " + session.getMaxInactiveInterval() + " segundos</p>");
        
        out.println("<h3>Todos los Atributos de Sesión:</h3>");
        Enumeration<String> attributeNames = session.getAttributeNames();
        boolean hasAttributes = false;
        
        while (attributeNames.hasMoreElements()) {
            hasAttributes = true;
            String attributeName = attributeNames.nextElement();
            Object attributeValue = session.getAttribute(attributeName);
            out.println("<p><strong>" + attributeName + ":</strong> " + 
                       (attributeValue != null ? attributeValue.toString() : "NULL") + "</p>");
        }
        
        if (!hasAttributes) {
            out.println("<p style='color: red;'><strong>NO HAY ATRIBUTOS EN LA SESIÓN</strong></p>");
        }
        
        out.println("<h3>Información del Request:</h3>");
        out.println("<p><strong>Request Method:</strong> " + request.getMethod() + "</p>");
        out.println("<p><strong>Request URL:</strong> " + request.getRequestURL() + "</p>");
        out.println("<p><strong>Context Path:</strong> " + request.getContextPath() + "</p>");
        out.println("<p><strong>Server Name:</strong> " + request.getServerName() + "</p>");
        out.println("<p><strong>Server Port:</strong> " + request.getServerPort() + "</p>");
        
        out.println("<h3>Headers:</h3>");
        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String headerName = headerNames.nextElement();
            out.println("<p><strong>" + headerName + ":</strong> " + request.getHeader(headerName) + "</p>");
        }
        
        out.println("<h3>Cookies:</h3>");
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                out.println("<p><strong>" + cookie.getName() + ":</strong> " + cookie.getValue() + "</p>");
            }
        } else {
            out.println("<p style='color: red;'>NO HAY COOKIES</p>");
        }
    %>
    
    <h3>Probar Establecer Atributos:</h3>
    <form method="post">
        <input type="hidden" name="action" value="setAttributes">
        <button type="submit">Establecer Atributos de Prueba</button>
    </form>
    
    <%
        if ("setAttributes".equals(request.getParameter("action"))) {
            session.setAttribute("userEmail", "test@example.com");
            session.setAttribute("userType", "USUARIO");
            out.println("<p style='color: green;'>Atributos establecidos. <a href='session_debug.jsp'>Recargar página</a></p>");
        }
    %>
    
    <br><br>
    <a href="session_debug.jsp">Recargar</a> | 
    <a href="javascript:history.back()">Volver</a>
</body>
</html>