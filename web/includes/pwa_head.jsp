<%-- 
    Document   : pwa_head
    Created on : 23 jun 2025, 11:35:45
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Meta tags PWA -->
<meta name="theme-color" content="#3B7DDD">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="apple-mobile-web-app-title" content="KIDI">
<meta name="description" content="Plataforma educativa KIDI - Aprendizaje interactivo">

<!-- Manifest -->
<link rel="manifest" href="<%= request.getContextPath() %>/manifest.json">

<!-- Iconos para diferentes dispositivos -->
<link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/img/icons/icon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath() %>/img/icons/icon-16x16.png">
<link rel="apple-touch-icon" href="<%= request.getContextPath() %>/img/icons/icon-192x192.png">
<link rel="apple-touch-icon" sizes="152x152" href="<%= request.getContextPath() %>/img/icons/icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="<%= request.getContextPath() %>/img/icons/icon-180x180.png">