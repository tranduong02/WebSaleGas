/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author duykh
 */
public class LineChart {
    private double money;
    private Date date;

    public LineChart() {
    }

    public LineChart(double money, Date date) {
        this.money = money;
        this.date = date;
    }


    public String getMoney() {
        NumberFormat format = NumberFormat.getInstance(Locale.US);
        format.setGroupingUsed(false);
        return format.format(money);
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
  
    
}
