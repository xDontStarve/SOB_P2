<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="deim.urv.cat.homework2.model.Game"%>
<%@page import="deim.urv.cat.homework2.model.Game.Console"%>
<%@page import="deim.urv.cat.homework2.model.Game.Genre"%>
<%@page import="deim.urv.cat.homework2.controller.UserSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles del Juego</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .game-img {
            width: 100%; /* Ajusta el tamaño de la imagen de manera responsiva */
            object-fit: contain; /* Asegura que la imagen se muestre completamente */
            height: auto;
            max-width: 400px; /* Máximo ancho de la imagen */
            background-color: #f8f9fa; /* Fondo para rellenar el espacio vacío */
            margin: auto; /* Centra la imagen horizontalmente */
        }
        body {
            background: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
            color: #fff; /* Cambia el color del texto para mejorar la legibilidad */
        }
        .container {
            background: rgba(255, 255, 255, 0.8); /* Hace el contenedor ligeramente transparente */
            border-radius: 5px; /* Añade bordes redondeados al contenedor */
            padding: 20px; /* Añade un poco de padding para no tener el texto pegado a los bordes */
            margin-top: 20px; /* Espacio superior para separar del borde de la ventana */
        }
        @media (min-width: 992px) { /* Clases específicas para pantallas grandes (lg) */
            .text-lg-center { text-align: center; }
            .d-lg-flex { display: flex; }
            .flex-lg-column { flex-direction: column; }
            .align-items-lg-center { align-items: center; }
        }
    </style>
</head>
<body>
    <div class="d-flex justify-content-center mt-3 mb-3">
        <form action="${mvc.uri('main')}" method="GET" class="mr-2">
            <button type="submit" class="btn btn-primary">Home</button>
        </form>
        <% 
            UserSession userSession = (UserSession) session.getAttribute("userSession"); // Recupera el objeto UserSession de la sesión
            if (userSession != null && userSession.getIsLoggedIn()) {
        %>
            <form action="${mvc.uri('user')}" method="GET" class="mr-2">    
                <div class="alert alert-success" role="alert">
                    <button type="submit" class="btn btn-primary">Hola, <%= userSession.getUsername() %></button>
                </div>
            </form>
        <% } else { %>
            <form action="" method="POST" class="mr-2">
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        <% } %>
        <form action="${mvc.uri('cart')}" method="GET" class="mr-2">
            <button type="submit" class="btn btn-primary">Cart</button>
        </form>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 text-lg-center">
                <h2>Detalles del Juego</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-lg-6 d-lg-flex flex-lg-column align-items-lg-center">
                <img src="/Homework2/resources/img/${game.name}.png" class="game-img mb-3">
            </div>
            <div class="col-12 col-lg-6 d-lg-flex flex-lg-column align-items-lg-center">
                <h3>${game.name}</h3>
                <p><strong>Disponibilidad:</strong> ${game.isAvailable ? 'Disponible' : 'No disponible'}</p>
                <p><strong>Precio:</strong> ${game.price}</p>
                <p><strong>Descripción:</strong> ${game.description}</p>
                <p><strong>Dirección:</strong> ${game.address}</p>
                <p><strong>Unidades:</strong> ${game.units}</p>
                <p><strong>Género:</strong> ${game.genre}</p>
                <p><strong>Consola:</strong> ${game.console}</p>
                <form action="${pageContext.request.contextPath}/Web/gameDetails/${game.id}" method="post">
                    <button type="submit" class="btn btn-primary">Añadir a la cesta</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
