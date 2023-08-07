/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author duykh
 */

//	supplierID int IDENTITY(1,1) PRIMARY KEY,
//	supplierName nvarchar(255) NOT NULL,
//	contactInfor varchar(100) UNIQUE,
//	phoneContact char(15) UNIQUE,
//	[address] char(255)

public class Supplier {
    private int supplierID, status;
    private String supplierName, companyName,contactInfor, phoneContact, address, country;

    public Supplier() {
    }

    public Supplier(int supplierID, int status, String supplierName, String companyName, String contactInfor, String phoneContact, String address, String country) {
        this.supplierID = supplierID;
        this.status = status;
        this.supplierName = supplierName;
        this.companyName = companyName;
        this.contactInfor = contactInfor;
        this.phoneContact = phoneContact;
        this.address = address;
        this.country = country;
    }

    public Supplier(int status, String supplierName, String companyName, String contactInfor, String phoneContact, String address, String country) {
        this.status = status;
        this.supplierName = supplierName;
        this.companyName = companyName;
        this.contactInfor = contactInfor;
        this.phoneContact = phoneContact;
        this.address = address;
        this.country = country;
    }

    public Supplier(int supplierID, int status, String supplierName, String companyName) {
        this.supplierID = supplierID;
        this.status = status;
        this.supplierName = supplierName;
        this.companyName = companyName;
    }


    public Supplier(int supplierID, String supplierName) {
        this.supplierID = supplierID;
        this.supplierName = supplierName;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getContactInfor() {
        return contactInfor;
    }

    public void setContactInfor(String contactInfor) {
        this.contactInfor = contactInfor;
    }

    public String getPhoneContact() {
        return phoneContact;
    }

    public void setPhoneContact(String phoneContact) {
        this.phoneContact = phoneContact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    
}