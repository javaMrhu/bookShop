package com.nyist.bean;

public class CartItem {
    private int quantity;//单类书的数量
    private double price;//单价
    private Book book;


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return this.book.getPrice()*this.quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
}
