package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.CustomerDTO;
import deim.urv.cat.homework2.model.Game;
import deim.urv.cat.homework2.service.GameService;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.core.Response;
import java.net.URI;
import java.util.ArrayList;

@Controller
@Path("gameDetails")
public class GameDetailsController {
    
    @Inject GameService gameService;
    @Inject UserSession userSession;
    @Inject Models models;
    @Inject HttpSession session;
    @Inject Cart cart;
    
    @GET
    @Path("{gameId}") // Captura el ID del juego como parte de la URL
    public String showGameDetails(@PathParam("gameId") Long gameId) {
        Game game = gameService.findGameById(gameId);
        session.setAttribute("userSession", userSession);
        session.setAttribute("cart", cart);
        String oldURL = "gameDetails/"+gameId;
        session.setAttribute("oldURL", oldURL);
        models.put("game", game); // Agrega el juego al modelo para que pueda ser accesible en la vista
        return "gameDetails.jsp"; // Redirige a la vista con el modelo actualizado
    }
    
    @POST
    @Path("{gameId}")
    public String addGameToCart(@PathParam("gameId") Long gameId) {
        Game game = gameService.findGameById(gameId);
        session.removeAttribute("oldURL");
        String oldURL = "gameDetails/"+gameId;
        session.setAttribute("oldURL", oldURL);
        if (!userSession.getIsLoggedIn()){
            return "login-form.jsp";
        }
        cart.addGame(game);
        session.setAttribute("cart", cart);
        return "cart.jsp";
    }
    
    
}