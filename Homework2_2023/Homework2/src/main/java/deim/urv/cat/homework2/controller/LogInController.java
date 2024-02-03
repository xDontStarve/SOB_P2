package deim.urv.cat.homework2.controller;

import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.core.Response;
import deim.urv.cat.homework2.service.AuthenticationService;
import jakarta.inject.Inject;
import jakarta.mvc.Models;
import jakarta.ws.rs.GET;

@Path("/login")
public class LogInController {
    @Inject Models models;
    @Inject AuthenticationService authenticationService;

    private AuthenticationService authService = new AuthenticationService();
    
    @POST
    public Response loginUser(@FormParam("username") String username, @FormParam("password") String password) {
        // Implementar la lógica para verificar las credenciales del usuario
        boolean isAuthenticated = authService.authenticate(username, password);
        
        if (isAuthenticated) {
            // Si la autenticación es exitosa
            // Aquí podrías redirigir al usuario a otra página o devolver un mensaje de éxito
            // Asegúrate de manejar correctamente la sesión del usuario o los tokens de autenticación según tu diseño
            return Response.ok().entity("Inicio de sesión exitoso").build();
        } else {
            // Si la autenticación falla, retorna una respuesta indicando el fallo
            return Response.status(Response.Status.UNAUTHORIZED).entity("Credenciales inválidas").build();
        }
    }
    
    @GET
    public String showForm() {
        return "login.jsp";
    }
}