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
            margin-right: 20px;
            background-color: #f8f9fa; /* Fondo para rellenar el espacio vacío */
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
        h2, h3 {
            color: #000; /* Color del texto para los títulos, para contrastar con el fondo */
        }
        p {
            color: #000; /* Color del texto para los párrafos */
        }
    </style>
</head>
<body>
    <% 
        UserSession userSession = (UserSession) session.getAttribute("userSession"); // Recupera el objeto UserSession de la sesión
        if (userSession != null && userSession.getIsLoggedIn()) {
    %>
        <form action="${mvc.uri('user')}" method="GET">    
            <div class="alert alert-success" role="alert">
                <button type="submit" class="btn btn-primary">Hola, <%= userSession.getUsername() %></button>
            </div>
        </form>
    <% } else { %>
        <form action="" method="POST">
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    <% } %>
    <div class="container mt-5">
        <h2>Detalles del Juego</h2>
        <div>
            <img src="/Homework2/resources/img/${game.name}.png" class="game-img">
        </div>
        <div>
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
</body>
</html>
