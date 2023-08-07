/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author duykh
 */
public class WarrantyPolicy {
    private int WarrantyPolicyID;
    private int warrantyPeriod;
    private String WarrantyCategory;

    public WarrantyPolicy() {
    }

    public WarrantyPolicy(int WarrantyPolicyID, int warrantyPeriod, String WarrantyCategory) {
        this.WarrantyPolicyID = WarrantyPolicyID;
        this.warrantyPeriod = warrantyPeriod;
        this.WarrantyCategory = WarrantyCategory;
    }

    public int getWarrantyPolicyID() {
        return WarrantyPolicyID;
    }

    public void setWarrantyPolicyID(int WarrantyPolicyID) {
        this.WarrantyPolicyID = WarrantyPolicyID;
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
