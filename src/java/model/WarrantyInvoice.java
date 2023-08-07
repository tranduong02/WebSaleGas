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

public class WarrantyInvoice {

    private int WarrantyInvoiceID, productID, userID, EmployeeID;
    private Date maintenanceDate;
    private Date appointmentDate;
    private double money;
    private int status;
    private String describe;
    private String comment;

    public WarrantyInvoice() {
    }

    public WarrantyInvoice(int WarrantyInvoiceID, int productID, int userID, int EmployeeID, Date maintenanceDate, Date appointmentDate, double money, int status, String describe, String comment) {
        this.WarrantyInvoiceID = WarrantyInvoiceID;
        this.productID = productID;
        this.userID = userID;
        this.EmployeeID = EmployeeID;
        this.maintenanceDate = maintenanceDate;
        this.appointmentDate = appointmentDate;
        this.money = money;
        this.status = status;
        this.describe = describe;
        this.comment = comment;
    }

    public int getWarrantyInvoiceID() {
        return WarrantyInvoiceID;
    }

    public void setWarrantyInvoiceID(int WarrantyInvoiceID) {
        this.WarrantyInvoiceID = WarrantyInvoiceID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getEmployeeID() {
        return EmployeeID;
    }

    public void setEmployeeID(int EmployeeID) {
        this.EmployeeID = EmployeeID;
    }

    public Date getMaintenanceDate() {
        return maintenanceDate;
    }

    public void setMaintenanceDate(Date maintenanceDate) {
        this.maintenanceDate = maintenanceDate;
    }

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}
