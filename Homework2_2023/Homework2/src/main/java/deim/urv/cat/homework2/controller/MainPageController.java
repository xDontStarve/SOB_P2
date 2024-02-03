package deim.urv.cat.homework2.controller;
import deim.urv.cat.homework2.service.GameService;

import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.binding.BindingResult;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import java.util.List;
import deim.urv.cat.homework2.model.*;
import jakarta.servlet.http.*;
import jakarta.ws.rs.POST;
import java.util.ArrayList;

import java.util.logging.Logger;

@Controller
@Path("MainPage")
public class MainPageController {    
    // CDI
    @Inject BindingResult bindingResult;
    @Inject Logger log;
    @Inject GameService gameService;
    @Inject UserSession userSession;
    @Inject HttpSession session;
    
    @GET
    public String showForm() {
        List<Game> games = gameService.findGames();
        session.setAttribute("userSession", userSession);
        for (Game game : games){
            System.out.println(game);
        }
        return "MainPage.jsp";
    }
    
    @POST
    public String login(){
        String oldURL = "http://localhost:8080/Homework2/Web/MainPage";
        session.setAttribute("oldURL", oldURL);
        return "login-form.jsp";
    }
}
