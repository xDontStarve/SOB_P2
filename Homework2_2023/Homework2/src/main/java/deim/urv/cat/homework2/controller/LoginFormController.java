package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.CustomerDTO;
import deim.urv.cat.homework2.service.AuthenticationService;

import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.UriRef;
import jakarta.mvc.security.CsrfProtected;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import jakarta.ws.rs.BeanParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;

@Controller
@Path("login")
public class LoginFormController {    
    // CDI
    @Inject AuthenticationService authenticationService;
    @Inject Models models;
    @Inject HttpSession session;
    @Inject UserSession userSession;
    
    @GET
    public String showForm() {
        return "login-form.jsp"; // Injects CRSF token
    }    
    
    @POST
    @UriRef("login")
    public String login(@Valid @BeanParam UserForm userForm) {
        models.put("userForm", userForm);
        Response response= authenticationService.login(userForm);
        
        // Verifica si la respuesta es exitosa / existe customer
        if (response.getStatus() == Response.Status.OK.getStatusCode()) {
            models.put("loginFailed", false);
            CustomerDTO customerDTO;
            customerDTO = response.readEntity(CustomerDTO.class);
            session.setAttribute("customerDTO", customerDTO);
            userSession.setIsLoggedIn(true);
            userSession.setUsername(userForm.getUsername());
            session.setAttribute("userSession", userSession);
            String oldURL = (String) session.getAttribute("oldURL");
            session.removeAttribute("oldURL");
            if (oldURL==null){
                return "MainPage.jsp";
            }
            if (oldURL.isBlank()){
                return "MainPage.jsp";
            }
            return "redirect:"+oldURL;
        } else {
            // No existe customer
            models.put("loginFailed", true);
            response.close();
            return "login-form.jsp";
        }
    } 
    
}
