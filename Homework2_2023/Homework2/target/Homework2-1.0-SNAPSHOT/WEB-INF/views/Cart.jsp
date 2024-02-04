<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="deim.urv.cat.homework2.model.Game"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detalles del Carrito</title>
    <!-- CDN de Bootstrap CSS para diseño responsivo -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div class="d-flex justify-content-center mt-3 mb-3">
        <form action="${mvc.uri('main')}" method="GET" class="mr-2">
            <button type="submit" class="btn btn-primary">Home</button>
        </form>
    </div>
    <div class="container mt-5">
        <h1>Detalles del Carrito</h1>
        <div class="list-group">
            <!-- Iterar sobre la lista de juegos en el carrito -->
            <c:forEach var="game" items="${cart.cart}">
                <div class="list-group-item">
                    <h5 class="mb-1">Nombre del Juego: ${game.name}</h5>
                    <p class="mb-1">Precio: ${game.price}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>