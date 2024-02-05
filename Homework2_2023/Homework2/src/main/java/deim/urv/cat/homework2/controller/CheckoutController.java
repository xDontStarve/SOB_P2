package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.CustomerDTO;
import deim.urv.cat.homework2.model.Game;
import deim.urv.cat.homework2.service.CheckoutService;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.UriRef;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import java.util.ArrayList;

/**
 *
 * @author chali
 */
@Controller
@Path("checkout")
public class CheckoutController {
    @Inject UserSession userSession;
    @Inject HttpSession session;
    @Inject Models models;
    @Inject Cart cart;
    
    @GET
    @UriRef("checkout")
    public String showForm(){
        String oldURL;
        UserSession userSession = (UserSession) session.getAttribute("userSession");
        if (userSession != null && userSession.getIsLoggedIn()) {
            models.put("cart", cart);
            session.setAttribute("cart", cart);
            oldURL = (String) session.getAttribute("oldURL");
            session.removeAttribute("oldURL");
            return "Checkout.jsp";
        }
        oldURL = "checkout";
        session.setAttribute("oldURL", oldURL);
        return "login-form.jsp";
    }
    
    @POST
    @UriRef("pay")
    public String pay(){
        CheckoutService service = new CheckoutService();
        if (!cart.getCart().isEmpty()){
            CustomerDTO customerDTO = (CustomerDTO) session.getAttribute("customerDTO");
            float totalPrice=0;
            ArrayList<Game> games = cart.getCart();
            for (Game game : games){
                totalPrice+=game.getPrice();
            }
            String response = service.postRent(games, customerDTO.getId(), totalPrice);
            session.setAttribute("rentInfo", response);
            cart.setCart(new ArrayList<Game>());
            return "Checkout.jsp";
        }
        return "Checkout.jsp";
    }
}
