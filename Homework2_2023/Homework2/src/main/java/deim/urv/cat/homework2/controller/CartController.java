package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.CustomerDTO;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.UriRef;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

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
        models.put("cart", cart);
        session.setAttribute("cart", cart);
        return "Cart.jsp";
    }
}
