<%-- 
    Document   : Mates-LeccionesNumeros
    Created on : 3 nov. 2024, 12:13:40
    Author     : P500
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*,java.io.*,java.util.*"%>

<%@ include file="../Sistema/ConexionBD.jsp" %>

<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Página Matemáticas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 

        <style>
            .card-img-top {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }
            .card {
                height: 100%;
            }
            
            .back-btn {
                        font-size: 3rem;
                        color: var(--colorTextoPrincipal);
                        background: none;
                        border: none;
                        cursor: pointer;
                    }
        </style>
    </head>
    <body>

        <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />

        <!-- Mini Header -->
        <div class="header-title text-center my-4">Ejercicios</div>
    <center>
        <a href="P-Espanol.jsp"><button class="back-btn">&larr;</button> </a>
        </center>
        <br><br><br><br>
            


        <div class="container mt-4">
            <div class="row text-center">

                <%                ResultSet rt = null;
                    String ejercicio;
                    try {
                        String queryStr = "SELECT DESC_EE FROM EJERCICIOS_E";
                        rt = s.executeQuery(queryStr);

                        while (rt.next()) {
                            ejercicio = rt.getString("DESC_EE");

                %>
                <div class="col-sm-6 col-md-3 mb-4">
                    <a href="<%=ejercicio%>.jsp">
                        <div class="card">
                            <img class="card-img-top" src="../Imagenes/<%=ejercicio%>.png" alt="<%=ejercicio%>" loading="lazy">
                            <div class="card-body">
                                <h5 class="card-title"><%= ejercicio%>
                                    <input type="checkbox" name="CheckLeccionNumerosMates" value="ON" disabled /></h5>
                            </div>
                        </div>
                    </a>
                </div>
                <%
                        }
                    } catch (SQLException error) {
                        out.print(error.toString());
                    }
                %>

            </div>
        </div>

        <!-- Footer -->
        <footer class="py-3 my-4">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            </ul>
            <p class="text-center text-body-secondary">© 2024 KIDI, Inc Todos los derechos reservados</p>
        </footer>

        <!-- Script de Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
