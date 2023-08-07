        /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author duykh
 */

public class Product {
    private int productID, categoryID, supplierID, WarrantyPolicyID, quantity, status;
    private String productName, describe;
    private double price;
    private int warrantyPeriod;
    private String WarrantyCategory;
    private double discount;
    private String image;
    private String productDetail;
    

    public Product() {
    }

    public Product(int productID, String productName, double price, int warrantyPeriod, String WarrantyCategory, double discount, String image, String productDetail) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.warrantyPeriod = warrantyPeriod;
        this.WarrantyCategory = WarrantyCategory;
        this.discount = discount;
        this.image = image;
        this.productDetail = productDetail;
    }

    public Product(int productID, int categoryID, String productName, double price, double discount, String image) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.price = price;
        this.discount = discount;
        this.image = image;
    }

    public Product(int categoryID, int supplierID, int WarrantyPolicyID, int quantity, int status, String productName, String describe, double price, double discount, String image, String productDetail) {
        this.categoryID = categoryID;
        this.supplierID = supplierID;
        this.WarrantyPolicyID = WarrantyPolicyID;
        this.quantity = quantity;
        this.status = status;
        this.productName = productName;
        this.describe = describe;
        this.price = price;
        this.discount = discount;
        this.image = image;
        this.productDetail = productDetail;
    }

    public Product(int productID, int categoryID, int supplierID, int quantity, String productName, String describe, double price, int warrantyPeriod, String WarrantyCategory, double discount, String image, String productDetail) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.supplierID = supplierID;
        this.quantity = quantity;
        this.productName = productName;
        this.describe = describe;
        this.price = price;
        this.warrantyPeriod = warrantyPeriod;
        this.WarrantyCategory = WarrantyCategory;
        this.discount = discount;
        this.image = image;
        this.productDetail = productDetail;
    }

    public Product(int categoryID, int supplierID, int warrantyPeriod, int quantity, String productName, String describe, double price, String image) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Product(int productID, int categoryID, int supplierID, int warrantyPeriod, int quantity, String productName, String describe, double price, String image) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public int getWarrantyPolicyID() {
        return WarrantyPolicyID;
    }

    public void setWarrantyPolicyID(int WarrantyPolicyID) {
        this.WarrantyPolicyID = WarrantyPolicyID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public int getWarrantyPeriod() {
        return warrantyPeriod;
    }

    public void setWarrantyPeriod(int warrantyPeriod) {
        this.warrantyPeriod = warrantyPeriod;
    }

    public String getWarrantyCategory() {
        return WarrantyCategory;
    }

    public void setWarrantyCategory(String WarrantyCategory) {
        this.WarrantyCategory = WarrantyCategory;
    }


}
