/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author duykh
 */

//	userID int IDENTITY(1,1) PRIMARY KEY,
//	username varchar(255) UNIQUE,
//	[password] varchar(255) CONSTRAINT CHECK_password_User CHECK(LEN([password]) > 8) NOT NULL,
//	firstName nvarchar(255) NOT NULL,
//	lastName nvarchar(255) NOT NULL,
//	email varchar(255) UNIQUE CONSTRAINT CHECK_email_User CHECK(email LIKE '%@%'),
//	phoneNumber char(15) UNIQUE,
//	[address] nvarchar(255),
//	[status] tinyint DEFAULT 0 CONSTRAINT CHECK_status_User CHECK([status] in (0,1,2)),
//	discount float DEFAULT 0 CONSTRAINT CHECK_Range_Discount_User CHECK(discount > 0 AND discount < 1)
public class User {
    private int userID;
    private String username, password, firstName, lastName, email, phoneNumber, address;
    private int status;
    private float discount;

    public User() {
    }

    public User(int userID, String username, String password, String firstName, String lastName, String email, String phoneNumber, String address, int status, float discount) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.status = status;
        this.discount = discount;
    }

    public User(int userID, String username, String firstName, String lastName, String email, String phoneNumber, String address) {
        this.userID = userID;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public User(int userID, String username, String firstName, String lastName, String email, String phoneNumber, String address, int status) {
        this.userID = userID;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.status = status;
    }

    public User(String username, String password, String firstName, String lastName, String email, String phoneNumber, String address) {
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public User(String password) {
        this.password = password;
    }

    public User(int userID, String username, String firstName, String lastName) {
        this.userID = userID;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }
    
    
}
