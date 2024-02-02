<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="deim.urv.cat.homework2.model.Game"%>
<%@page import="deim.urv.cat.homework2.model.Game.Console"%>
<%@page import="deim.urv.cat.homework2.model.Game.Genre"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detalles del Juego</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Detalles del Juego</h2>
        <div>
            <h3>${game.name}</h3>
            <p><strong>Disponibilidad:</strong> ${game.isAvailable ? 'Disponible' : 'No disponible'}</p>
            <p><strong>Precio:</strong> ${game.price}</p>
            <p><strong>Descripción:</strong> ${game.description}</p>
            <p><strong>Dirección:</strong> ${game.address}</p>
            <p><strong>Unidades:</strong> ${game.units}</p>
            <p><strong>Género:</strong> ${game.genre}</p>
            <p><strong>Consola:</strong> ${game.console}</p>
            
            <!-- Formulario para añadir el juego a la cesta -->
            <form action="${pageContext.request.contextPath}/Web/gameDetails/${game.id}" method="post">
                <button type="submit" class="btn btn-primary">Añadir a la cesta</button>
            </form>
        </div>
    </div>
</body>
</html>