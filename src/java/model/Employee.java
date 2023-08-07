/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author duykh
 */

//	EmployeeID int IDENTITY(1,1) PRIMARY KEY, 
//	Employeename nvarchar(255) NOT NULL,
//	[password] varchar(255) CONSTRAINT CHECK_password_Employee CHECK(LEN([password]) > 8) NOT NULL,
//	firstName nvarchar(255) NOT NULL,
//	lastName nvarchar(255) NOT NULL,
//	email varchar(255) UNIQUE CONSTRAINT CHECK_email_Employee CHECK(email LIKE '%@%'),
//	phoneNumber char(15) UNIQEmployeenameUE,
//	[address] nvarchar(255)
public class Employee {
    private int employeeID, role;
    private String employeeName, password, firstName, lastName, email, phoneNumber, address;

    public Employee() {
    }

    public Employee(int employeeID, int role, String employeeName, String password, String firstName, String lastName, String email, String phoneNumber, String address) {
        this.employeeID = employeeID;
        this.role = role;
        this.employeeName = employeeName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public Employee(int employeeID, int role, String employeeName, String firstName, String lastName) {
        this.employeeID = employeeID;
        this.role = role;
        this.employeeName = employeeName;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getEmployeename() {
        return employeeName;
    }

    public void setEmployeename(String employeeName) {
        this.employeeName = employeeName;
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

   
}
