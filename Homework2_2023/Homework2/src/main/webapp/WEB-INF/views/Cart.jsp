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
    <style>
        .game-img {
            max-height: 10vw; /* Altura máxima basada en el ancho de la ventana */
            max-width: 10vw; /* Anchura máxima igual a la altura para mantener la proporción del cuadrado */
            object-fit: contain; /* Escala la imagen para ajustarse dentro del contenedor sin recortar */
            border-radius: 5px; /* Opcional: Añade bordes redondeados a la imagen */
            margin-left: auto; /* Alinea la imagen a la derecha */
            background-color: #f8f9fa; /* Color de fondo para el espacio no ocupado por la imagen */
        }
        .list-group-item {
            display: flex; /* Usa Flexbox para alinear elementos horizontalmente */
            align-items: center; /* Centra los elementos verticalmente dentro del item */
            justify-content: space-between; /* Separa el contenido y la imagen */
        }
        .item-content {
            flex-grow: 1; /* Permite que la descripción ocupe el espacio disponible */
        }

        /* Ajustes para pantallas más pequeñas */
        @media (max-width: 768px) {
            .game-img {
                max-height: 20vw; /* Aumenta el tamaño de la imagen en pantallas más pequeñas */
                max-width: 20vw;
            }
        }
    </style>
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
                    <div class="item-content">
                        <h5 class="mb-1">Nombre del Juego: ${game.name}</h5>
                        <p class="mb-1">Precio: ${game.price}€</p>
                    </div>
                    <img src="/Homework2/resources/img/${game.name}.png" class="game-img" alt="Imagen del juego">
                </div>
            </c:forEach>
        </div>
        <form action="/Homework2/Web/checkout" method="GET" class="mr-2">
            <button type="submit" class="btn btn-primary">Checkout</button>
        </form>
    </div>
</body>
</html>