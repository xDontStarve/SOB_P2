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
        /* Estilo para las imágenes de los juegos */
        .game-img {
            width: 100px; /* Ajusta este valor según necesites */
            height: auto;
            margin-right: 20px; /* Espacio entre la imagen y el texto */
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
                        // Utiliza 'list-group-item-action' para elementos clicables, haciendo que el ítem se destaque al pasar el mouse
                        // 'flex-column align-items-start' organiza el contenido en columnas y los alinea al inicio
                        // 'd-flex' activa flexbox para el elemento, permitiendo un diseño flexible
                        out.println("<a href='gameDetails/" + game.getId() + "' class='list-group-item list-group-item-action flex-column align-items-start d-flex'>");
                        // Incluir imagen del juego. 'game-img' es una clase personalizada para controlar el tamaño y el margen de la imagen.
                        out.println("<img src=/Homework2/resources/img/" + game.getName() + ".png class='game-img'>");
                        // 'd-flex w-100 justify-content-between' permite un diseño flexible con ancho al 100% y distribuye el espacio entre elementos
                        out.println("<div>");
                        // 'mb-1' añade un margen inferior para separar visualmente el nombre del juego de los detalles
                        out.println("<h5 class='mb-1'>" + game.getName() + "</h5>");
                        // Continúa con la descripción y detalles del juego, utilizando clases de Bootstrap para el espaciado
                        out.println("<p class='mb-1'>Unidades disponibles: " + game.getUnits() + "</p>");
                        // 'small' y 'text-muted' son clases para texto pequeño y suavizado, respectivamente, utilizadas aquí para detalles adicionales
                        out.println("<small>Género: " + game.getGenre() + ", Consola: " + game.getConsole() + "</small>");
                        out.println("</div>");
                        out.println("</a>");
                    }
                } else {
                    // Mensaje cuando no hay juegos disponibles
                    out.println("<p>No se encontraron juegos disponibles.</p>");
                }
            %>
            <h5>${pageContext.request.contextPath}</h5>
        </div>
    </div>

</body>
</html>