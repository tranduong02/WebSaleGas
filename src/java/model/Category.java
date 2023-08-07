/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author duykh
 */
//	categoryID tinyint IDENTITY(1,1) PRIMARY KEY,
//	categoryName nvarchar(255) NOT NULL,
public class Category {
    private int categoryID;
    private String categoryName;
    private String image;

    public Category() {
    }

    public Category(int categoryID, String categoryName, String image) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.image = image;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    

   
    
}
