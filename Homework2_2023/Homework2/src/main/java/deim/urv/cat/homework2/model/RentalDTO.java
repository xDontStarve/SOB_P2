/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deim.urv.cat.homework2.model;

import java.util.Date;

/**
 *
 * @author chali
 */
public class RentalDTO {
    private long id;
    private float price;
    private Date date;
    private Date returnDate;

    public RentalDTO(Rental rental){
        this.id=rental.getId();
        this.price=rental.getPrice();
        this.date=rental.getDate();
        this.returnDate=rental.getReturnDate();
    }
    public RentalDTO(){
        
    }
    public long getId() {
        return id;
    }
    
    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public void setId(long id) {
        this.id = id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
