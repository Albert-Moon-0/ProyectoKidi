<%-- 
    Document   : Suma y resta
    Created on : 3 nov. 2024, 13:13:42
    Author     : P500
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lección de Matemáticas: Sumas y Restas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css"> 
    <style>.header {
            text-align: center;
            font-size: 2.5rem;
            font-weight: bold;
            margin: 20px 0;
            color: var(--primary-color);
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
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
    <header>
        <h1 class="header">¡Bienvenidos a la Lección de Matemáticas!</h1>
        <h3 class="greeting">Suma y Resta</h3>
                <a href="Mates-LeccionesNumeros.jsp"><button class="back-btn">&larr;</button> </a>
    </header>

    <main class="container my-5">
        <section class="card p-4 mb-4">
            <h3>¿Qué es la Suma?</h3>
            <p>La suma es el proceso de combinar dos o más números para obtener un total. Por ejemplo, si tienes un número de objetos y le agregas más, estás sumando.</p>
            <h4>Ejemplo:</h4>
            <div class="suma-container text-center">
                <div class="bloque">25 + 15 = 40</div>
            </div>
            <p>Si tienes 25 manzanas y luego recibes 15 más, ¿cuántas manzanas tienes en total? ¡Tienes 40 manzanas!</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>Métodos de Suma</h3>
            <h4>Método Tradicional:</h4>
            <p>Para realizar una suma, escribe uno de los números debajo del otro, alineando los dígitos según su lugar (unidades, decenas, etc.) y suma comenzando desde la derecha.</p>
            <div class="metodo-container text-center">
                <div class="bloque">&nbsp;  25</div>
                <div class="bloque">+15</div>
                <div class="bloque resultado">____</div>
                <div class="bloque resultado">&nbsp;&nbsp;  40</div>
            </div>
        </section>

        <section class="card p-4 mb-4">
            <h3>¿Qué es la Resta?</h3>
            <p>La resta es el proceso de quitar un número de otro para encontrar la diferencia. Es útil cuando necesitas saber cuánto te queda después de quitar algo.</p>
            <h4>Ejemplo:</h4>
            <div class="resta-container text-center">
                <div class="bloque">50 - 20 = 30</div>
            </div>
            <p>Si tienes 50 galletas y comes 20, ¿cuántas galletas te quedan? ¡Te quedan 30 galletas!</p>
        </section>

        <section class="card p-4 mb-4">
            <h3>Métodos de Resta</h3>
            <h4>Método Tradicional:</h4>
            <p>Para realizar una resta, coloca los números uno debajo del otro, alineando correctamente los dígitos, y resta comenzando desde la derecha.</p>
            <div class="metodo-container text-center">
                <div class="bloque">&nbsp;   50</div>
                <div class="bloque">-20</div>
                <div class="bloque resultado">____</div>
                <div class="bloque resultado">&nbsp;&nbsp;  30</div>
            </div>
        </section>
    </main>

    <footer class="text-center mt-5">
        <p>¡Diviértete aprendiendo matemáticas!</p>
    </footer>
</body>
</html>
