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
@Path("user")
public class UserDetailsController {
    @Inject HttpSession session;
    @Inject Models models;
    
    @GET
    @UriRef("user")
    public String showForm(){
        CustomerDTO customerDTO = (CustomerDTO) session.getAttribute("customerDTO");
        models.put("customerDTO", customerDTO);
        return "user-detail.jsp";
    }
}
