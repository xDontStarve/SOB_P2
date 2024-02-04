package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.CustomerDTO;
import deim.urv.cat.homework2.model.Game;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.UriRef;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;

/**
 *
 * @author chali
 */
@Controller
@Path("cart")
public class CartController {
    @Inject HttpSession session;
    @Inject Models models;
    @Inject Cart cart;
    
    @GET
    @UriRef("cart")
    public String showForm(){
        String oldURL;
        UserSession userSession = (UserSession) session.getAttribute("userSession");
        if (userSession != null && userSession.getIsLoggedIn()) {
            models.put("cart", cart);
            session.setAttribute("cart", cart);
            oldURL = (String) session.getAttribute("oldURL");
            session.removeAttribute("oldURL");
            return "cart.jsp:";
        }
        oldURL = "cart";
        return "login-form.jsp";
    }
}
