package deim.urv.cat.homework2.controller;
import deim.urv.cat.homework2.service.GameService;

import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.binding.BindingResult;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import java.util.List;
import deim.urv.cat.homework2.model.*;
import jakarta.mvc.Models;
import jakarta.mvc.UriRef;
import jakarta.servlet.http.*;
import jakarta.validation.Valid;
import jakarta.ws.rs.BeanParam;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.QueryParam;
import java.util.Set;

import java.util.logging.Logger;
import java.util.stream.Collectors;

@Controller
@Path("MainPage")
public class MainPageController {    
    // CDI
    @Inject BindingResult bindingResult;
    @Inject Logger log;
    @Inject GameService gameService;
    @Inject UserSession userSession;
    @Inject HttpSession session;
    @Inject Cart cart;
    @Inject Models models;
    
    @GET
    @UriRef("main")
    public String showForm() {
        List<Game> games = gameService.findGames();
        List<Game.Console> consoles = Set.of(Game.Console.values()).stream().toList();
        List<Game.Genre> genres = Set.of(Game.Genre.values()).stream().toList();
        for (Game.Genre genre: genres){
            System.out.println(genre);
        }
        for (Game.Console console: consoles){
            System.out.println(console);
        }
        session.setAttribute("consoles", consoles);
        session.setAttribute("genres", genres);
        session.setAttribute("games", games);
        session.setAttribute("userSession", userSession);
        session.setAttribute("cart", cart);
        String oldURL = "MainPage";
        session.setAttribute("oldURL", oldURL);
        return "MainPage.jsp";
    }
    
    @GET
    @Path("genre")
    @UriRef("genre")
    public String genre(@QueryParam("genre") String genre){
        session.removeAttribute("games");
        List<Game> games = gameService.findGames(), filteredGames;
        filteredGames = games.stream().filter(game -> game.getGenre().toString().equalsIgnoreCase(genre)).toList();
        session.setAttribute("games", filteredGames);
        String oldURL = "MainPage/genre?genre="+genre;
        session.setAttribute("oldURL", oldURL);
        return "MainPage.jsp";
    }
    
    
    @GET
    @Path("console")
    @UriRef("console")
    public String Console(@QueryParam("console") String console){
        session.removeAttribute("games");
        List<Game> games = gameService.findGames(), filteredGames;
        filteredGames = games.stream().filter(game -> game.getConsole().toString().equalsIgnoreCase(console)).toList();
        session.setAttribute("games", filteredGames);
        String oldURL = "MainPage/console?console="+console;
        session.setAttribute("oldURL", oldURL);
        return "MainPage.jsp";
    }

}
