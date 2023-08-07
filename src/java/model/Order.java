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

//	userID int CONSTRAINT FK_Order_userID FOREIGN KEY REFERENCES [User](userID) NOT NULL,
//	orderDate date DEFAULT GETDATE() CONSTRAINT CHECK_orderDate_Order CHECK(orderDate <= GETDATE()),	
//	deliveryAddress nvarchar(255),	
//	totalMoney float,
//	note ntext
public class Order {
    private int orderID, userID;
    Date orderDate;
    int status;
    private String deliveryAddress;
    private double totalMoney;

    public Order() {
    }

    public Order(int orderID, int userID, Date orderDate, int status, String deliveryAddress, double totalMoney) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.status = status;
        this.deliveryAddress = deliveryAddress;
        this.totalMoney = totalMoney;
    }

    public Order(int orderID, Date orderDate, String deliveryAddress, double totalMoney) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.deliveryAddress = deliveryAddress;
        this.totalMoney = totalMoney;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }


}