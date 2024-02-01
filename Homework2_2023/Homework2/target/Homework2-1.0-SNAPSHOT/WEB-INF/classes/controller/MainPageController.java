package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.AlertMessage;
import deim.urv.cat.homework2.model.SignUpAttempts;
import deim.urv.cat.homework2.service.GameService;

import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.binding.BindingResult;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import java.util.List;
import deim.urv.cat.homework2.model.*;

import java.util.logging.Logger;

@Controller
@Path("MainPage")
public class MainPageController {    
    // CDI
    @Inject BindingResult bindingResult;
    @Inject Logger log;
    @Inject GameService gameService;
    @Inject Models models;
    @Inject AlertMessage flashMessage;
    @Inject SignUpAttempts attempts;
    
    @GET
    public String showForm() {
        List<Game> games = gameService.findGames();
        for (Game game : games){
            System.out.println(game);
        }
        
        return "MainPage.jsp"; // Injects CRSF token
    }
}
