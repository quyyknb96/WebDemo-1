/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashSet;

/**
 *
 * @author QuyTaNgoc
 */
public class BillStatistic {
    private String date;
    private int total_order;
    private HashSet total_user;
    private int total_quantity;

    public BillStatistic() {
        total_order=0;
        total_user= new HashSet();
        total_quantity = 0;
    }

    public BillStatistic(String date, int total_order, HashSet total_user, int total_quantity) {
        this.date = date;
        this.total_order = total_order;
        this.total_user = total_user;
        this.total_quantity = total_quantity;
    }

    public String getDate() {
        return date;
    }

    public int getTotal_order() {
        return total_order;
    }

    public HashSet getTotal_user() {
        return total_user;
    }

    public int getTotal_quantity() {
        return total_quantity;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setTotal_order(int total_order) {
        this.total_order = total_order;
    }

    public void setTotal_user(HashSet total_user) {
        this.total_user = total_user;
    }

    public void setTotal_quantity(int total_quantity) {
        this.total_quantity = total_quantity;
    }
    
    
    
    
}
