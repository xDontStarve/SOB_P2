package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.controller.UserForm;
import jakarta.inject.Inject;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
        
public class AuthenticationService{
    private final WebTarget webTarget;
    private final jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/projecte/webresources/rest/api/v1/customer/login";
    @Inject HttpSession session;
    
    public AuthenticationService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI); // Sin path adicional
    }
    
    public Response login(UserForm userForm) {
        // Realiza la petición GET y recibe la respuesta
        return webTarget.request(MediaType.APPLICATION_JSON).post(Entity.entity(userForm, MediaType.APPLICATION_JSON), 
        Response.class);
    }
}
