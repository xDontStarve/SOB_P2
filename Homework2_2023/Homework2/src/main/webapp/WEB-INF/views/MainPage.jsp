<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="deim.urv.cat.homework2.service.GameService"%>
<%@page import="deim.urv.cat.homework2.model.Game"%>
<%@page import="deim.urv.cat.homework2.controller.UserSession"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Ajustes para las tarjetas y las imágenes */
        .card {
            margin-bottom: 20px; /* Espacio entre tarjetas */
            background: rgba(255, 255, 255, 0.8); /* Hace las tarjetas ligeramente transparentes */
            color: #000; /* Color del texto dentro de las tarjetas */
        }
        .card-img-top {
            width: 100%;
            object-fit: contain; /* Ajusta las imágenes para que se muestren completas */
            height: 200px; /* Ajusta la altura de la imagen de la tarjeta */
            background-color: #f8f9fa; /* Fondo para rellenar el espacio vacío, ajusta según tu diseño */
        }
        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .container-fluid {
            max-width: 90%;
        }
        #gameList {
            overflow-y: auto;
            height: calc(100vh - 150px);
        }
        body {
            background: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
            color: #fff; /* Cambia el color del texto para mejorar la legibilidad */
        }
    </style>
</head>
<body>
    <div class="container-fluid">
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
        <h1>Listado de Juegos</h1>
        <div id="gameList" class="row">
            <%
                GameService service = new GameService();
                List<Game> games = service.findGames();
                if(games != null && !games.isEmpty()) {
                    for(Game game : games) {
                        // Agrega un enlace (<a>) alrededor de toda la tarjeta
                        out.println("<div class='col-md-4'>"); // 3 columnas para las tarjetas
                        out.println("<a href='gameDetails/" + game.getId() + "' class='card-link'>"); // Reemplaza 'URL-de-la-pagina-de-destino' con la URL correcta
                        out.println("<div class='card'>");
                        // Asegura que la imagen sea fluida y se ajuste bien dentro de la tarjeta
                        out.println("<img src='/Homework2/resources/img/" + game.getName() + ".png' class='card-img-top img-fluid' alt='" + game.getName() + "'>");
                        out.println("<div class='card-body'>");
                        out.println("<h5 class='card-title'>" + game.getName() + "</h5>");
                        out.println("<p class='card-text'>Unidades disponibles: " + game.getUnits() + "</p>");
                        out.println("<p class='card-text'><small class='text-muted'>Género: " + game.getGenre() + ", Consola: " + game.getConsole() + "</small></p>");
                        out.println("</div>"); // Cierra card-body
                        out.println("</div>"); // Cierra card
                        out.println("</a>"); // Cierra el enlace
                        out.println("</div>"); // Cierra la columna
                    }
                } else {
                    out.println("<p>No se encontraron juegos disponibles.</p>");
                }
            %>
        </div>
    </div>
</body>
</html>