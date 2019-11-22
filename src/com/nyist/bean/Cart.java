package com.nyist.bean;

import java.util.HashMap;
import java.util.Map;

public class Cart {//购物车各类书籍

    private Map<String,CartItem> map = new HashMap<String,CartItem>();

    private double price;

    public void addCart(Book book){
        CartItem cartItem = map.get(book.getId());
            if(cartItem==null){
                cartItem=new CartItem();
                cartItem.setBook(book);
                cartItem.setQuantity(1);
                map.put(book.getId(), cartItem);
            }else{
                cartItem.setQuantity(cartItem.getQuantity()+1);
            }

    }

    public void setMap(Map<String, CartItem> map) {
        this.map = map;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Map<String, CartItem> getMap() {
        return map;
    }

    public double getPrice() {
        double totalPrice = 0;
        for (Map.Entry<String, CartItem> cartItemEntry : this.map.entrySet()) {
           CartItem cartItem =cartItemEntry.getValue();
           totalPrice=cartItem.getPrice()+totalPrice;
        }
        this.price = totalPrice;
        return totalPrice;
    }
}
