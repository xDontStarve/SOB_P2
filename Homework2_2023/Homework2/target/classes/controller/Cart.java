/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.Game;
import jakarta.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author chali
 */
@SessionScoped
public class Cart implements Serializable{
    private ArrayList<Game> cart = new ArrayList<Game>();

    public ArrayList<Game> getCart() {
        return cart;
    }

    public void setCart(ArrayList<Game> cart) {
        this.cart = cart;
    }
    
    public void addGame(Game game){
        this.cart.add(game);
    }
}
