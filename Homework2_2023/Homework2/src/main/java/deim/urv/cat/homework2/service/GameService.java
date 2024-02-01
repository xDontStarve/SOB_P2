package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.model.Game;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.GenericType;
import java.util.List;
        
public class GameService{
    private final WebTarget webTarget;
    private final jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/projecte/webresources/rest/api/v1/game";
    
    public GameService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI); // Sin path adicional
    }
    
    public List<Game> findGames() { // Retorna una List<Game>
        Response response = webTarget
                .request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            // Usamos GenericType para indicar el tipo específico de la lista
            return response.readEntity(new GenericType<List<Game>>(){});
        }
        return null;
    }
}
