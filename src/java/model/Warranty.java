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
public class Warranty {
    private Date orderDate;
    private int userID;
    private String username;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String email;
    private int productID;
    private String productName;
    private String warrantyCategory;
    private int warrantyPeriod;

    public Warranty() {
    }

    public Warranty(Date orderDate, int userID, String username, String firstName, String lastName, String phoneNumber, String email, int productID, String productName, String warrantyCategory, int warrantyPeriod) {
        this.orderDate = orderDate;
        this.userID = userID;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.productID = productID;
        this.productName = productName;
        this.warrantyCategory = warrantyCategory;
        this.warrantyPeriod = warrantyPeriod;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getWarrantyCategory() {
        return warrantyCategory;
    }

    public void setWarrantyCategory(String WarrantyCategory) {
        this.warrantyCategory = WarrantyCategory;
    }

    public int getWarrantyPeriod() {
        return warrantyPeriod;
    }

    public void setWarrantyPeriod(int warrantyPeriod) {
        this.warrantyPeriod = warrantyPeriod;
    }
    
}
