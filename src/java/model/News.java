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
//	newsID int IDENTITY(1,1) PRIMARY KEY,
//	EmployeeID int CONSTRAINT FK_User_userID FOREIGN KEY REFERENCES [User](userID) NOT NULL,
//	newsTitle ntext,
//	newContent ntext,
//	image text,
public class News {
    private int newsId, employeeId, newParentId;
    private String newsTitle, tagname, newsContent;
    private Date dateUpload;
    private String image;
    private boolean isVisible;

    public News() {
    }

    public News(int newsId, int employeeId, String newsTitle, String tagname, String newsContent, Date dateUpload, String image, boolean isVisible) {
        this.newsId = newsId;
        this.employeeId = employeeId;
        this.newsTitle = newsTitle;
        this.tagname = tagname;
        this.newsContent = newsContent;
        this.dateUpload = dateUpload;
        this.image = image;
        this.isVisible = isVisible;
    }
    
    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getTagname() {
        return tagname;
    }

    public void setTagname(String tagname) {
        this.tagname = tagname;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    public Date getDateUpload() {
        return dateUpload;
    }

    public void setDateUpload(Date dateUpload) {
        this.dateUpload = dateUpload;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isIsVisible() {
        return isVisible;
    }

    public void setIsVisible(boolean isVisible) {
        this.isVisible = isVisible;
    }

    public int getNewParentId() {
        return newParentId;
    }

    public void setNewParentId(int newParentId) {
        this.newParentId = newParentId;
    }
    
   

   
}
