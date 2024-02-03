package deim.urv.cat.homework2.controller;

import jakarta.enterprise.context.RequestScoped;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import jakarta.mvc.binding.MvcBinding;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import jakarta.ws.rs.FormParam;
import java.io.Serializable;

@Named("userForm")
@SessionScoped
public class UserForm implements Serializable {
    private static final long serialVersionUID = 1L;
        
    // JSR 303 validation
    @NotBlank
    @FormParam("username")
    @MvcBinding
    private String username;
    
    // JSR 303 validation
    @NotBlank
    @FormParam("password")
    @MvcBinding
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    private String fixNull(String in) {
        return (in == null) ? "" : in;
    }
}
