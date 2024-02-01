<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="deim.urv.cat.homework2.service.GameService"%>
<%@page import="deim.urv.cat.homework2.model.Game"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Estilo para scroll infinito */
        #gameList {
            overflow-y: auto;
            height: 400px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Listado de Juegos</h1>
        <div id="gameList" class="list-group">
            <% 
                GameService service = new GameService();
                List<Game> games = service.findGames();
                if(games != null && !games.isEmpty()) {
                    for(Game game : games) {
                        out.println("<a href='#' class='list-group-item list-group-item-action flex-column align-items-start'>");
                        out.println("<div class='d-flex w-100 justify-content-between'>");
                        out.println("<h5 class='mb-1'>" + game.getName() + "</h5>");
                        out.println("</div>");
                        out.println("<p class='mb-1'>Unidades disponibles: " + game.getUnits() + "</p>");
                        out.println("<small>Género: " + game.getGenre() + ", Consola: " + game.getConsole() + "</small>");
                        out.println("</a>");
                    }
                } else {
                    out.println("<p>No se encontraron juegos disponibles.</p>");
                }
            %>
        </div>
    </div>

    <!-- Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // scroll infinito
        $(document).ready(function() {
            $('#gameList').on('scroll', function() {
                if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
                    console.log('Cargar más juegos');
                }
            });
        });
    </script>
</body>