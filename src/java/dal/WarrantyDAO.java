/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Warranty;
import model.WarrantyInvoice;

/**
 *
 * @author duykh
 */
public class WarrantyDAO extends DBContext {

    //lay ra thong tin ve cacs san pham con han bao hanh trong vong 1 thang nua
    public List<Warranty> getListWarranty() {
        List<Warranty> list = new ArrayList<>();
        String sql = "EXEC GetExpiringWarrantyProducts ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Warranty w = new Warranty(rs.getDate("orderDate"),
                        rs.getInt("userID"),
                        rs.getString("username"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("phoneNumber"),
                        rs.getString("email"),
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getString("WarrantyCategory"),
                        rs.getInt("warrantyPeriod"));
                list.add(w);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void insertWarrantyInvoice(WarrantyInvoice wi) {
        String sql = "INSERT INTO [dbo].[WarrantyInvoice]\n"
                + "           ([productID]\n"
                + "           ,[orderID]\n"
                + "           ,[EmployeeID]\n"
                + "           ,[maintenanceDate]\n"
                + "           ,[appointmentDate]\n"
                + "           ,[money]\n"
                + "           ,[status]\n"
                + "           ,[describe]\n"
                + "     VALUES (?,?,?,?,?,?,?,?)";
    }
}
