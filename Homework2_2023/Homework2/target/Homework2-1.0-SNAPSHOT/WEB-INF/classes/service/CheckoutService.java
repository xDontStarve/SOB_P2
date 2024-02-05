package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.model.Game;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.stream.Collectors;

public class CheckoutService {
    private final WebTarget webTarget;
    private final jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/projecte/webresources/rest/api/v1/rental";
    
    public CheckoutService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI);
    }
    
    public String postRent(ArrayList<Game> games, long customerId, float total){
        // Obtener la fecha de alquiler actual y calcular la fecha de devolución
        ZonedDateTime rentalDate = ZonedDateTime.now(ZoneId.of("UTC"));
        ZonedDateTime returnDate = rentalDate.plusDays(7);

        // Preparar la lista de IDs de juegos
        ArrayList<Long> gameIDs = new ArrayList<Long>();
        for (Game game: games){
            gameIDs.add(game.getId());
        }
        
        // Formatear las fechas
        DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
        String formattedRentalDate = formatter.format(rentalDate);
        String formattedReturnDate = formatter.format(returnDate);
        
        // Construir el cuerpo de la solicitud JSON
        String json = "{"
                + "\"rental\":{"
                + "\"price\":" + total + ","
                + "\"date\":\"" + formattedRentalDate + "\","
                + "\"returnDate\":\"" + formattedReturnDate + "\","
                + "\"customer\":{\"id\":" + customerId + "}"
                + "},"
                + "\"gameIDs\":" + gameIDs.toString()
                + "}";
        System.out.println(json);
        // Enviar la petición POST
        Response response = webTarget.request(MediaType.APPLICATION_JSON)
                .post(Entity.entity(json, MediaType.APPLICATION_JSON));
        
        // Leer y devolver la respuesta
        if (response.getStatus() == 201) {
            String jsonResponse = response.readEntity(String.class);
            // Aquí puedes procesar y formatear la respuesta JSON como desees
            return jsonResponse;
        } else {
            return "Error: " + response.getStatus();
        }
    }
}