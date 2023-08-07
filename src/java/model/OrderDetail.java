/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author duykh
 */
//	OrderDetailID int IDENTITY(1,1) PRIMARY KEY,
//	orderID int CONSTRAINT FK_Order_orderID FOREIGN KEY REFERENCES [Order](orderID) NOT NULL,
//	productID int CONSTRAINT FK_Product_productID FOREIGN KEY REFERENCES Product(productID) NOT NULL,
//	quantityOrder int NOT NULL
public class OrderDetail {
    private int OrderDetailID, productID, orderID, quantityOrder;
    private double price;
    private String productName, image;
    public OrderDetail() {
    }

    public OrderDetail(int productID, int quantityOrder, double price, String productName, String image) {
        this.productID = productID;
        this.quantityOrder = quantityOrder;
        this.price = price;
        this.productName = productName;
        this.image = image;
    }

    public OrderDetail(int OrderDetailID, int productID, int orderID, int quantityOrder, double price) {
        this.OrderDetailID = OrderDetailID;
        this.productID = productID;
        this.orderID = orderID;
        this.quantityOrder = quantityOrder;
        this.price = price;
    }

    public int getOrderDetailID() {
        return OrderDetailID;
    }

    public void setOrderDetailID(int OrderDetailID) {
        this.OrderDetailID = OrderDetailID;
    }

    public int getProductID() {
        return productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getQuantityOrder() {
        return quantityOrder;
    }

    public void setQuantityOrder(int quantityOrder) {
        this.quantityOrder = quantityOrder;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

   
}
