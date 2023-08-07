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
import model.Supplier;

/**
 *
 * @author duykh
 */
public class SupplierDAO extends DBContext {

    public List<Supplier> getAllSupplierToChose() {
        List<Supplier> list = new ArrayList<>();
        String sql = "select supplierID, supplierName from Supplier where status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Supplier s = new Supplier(rs.getInt("supplierID"), rs.getString("supplierName"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Supplier> getListSupplier(int xstatus) {
        List<Supplier> list = new ArrayList<>();
        String sql = "select supplierID, supplierName, [companyName], status from Supplier WHERE 1 = 1 ";
        if (xstatus == 1) {
            sql += " AND status = 1";
        } else if (xstatus == 0) {
            sql += " AND status = 0";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Supplier s = new Supplier(rs.getInt("supplierID"), rs.getInt("status"), rs.getString("supplierName"),rs.getString("companyName"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public String getSupplierName(int sID) {
        String sname = null;
        String sql = "select supplierName from Supplier where supplierID = ? AND status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sname = rs.getString("supplierName");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sname;
    }

    public Supplier getAnSupplierByID(int sID) {
        Supplier s = null;
        String sql = "SELECT [supplierID]\n"
                + "      ,[supplierName]\n"
                + "      ,[companyName]\n"
                + "      ,[contactInfor]\n"
                + "      ,[phoneContact]\n"
                + "      ,[address]\n"
                + "      ,[country]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Supplier] WHERE supplierID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                s = new Supplier(rs.getInt("supplierID"),
                        rs.getInt("status"),
                        rs.getString("supplierName"),
                        rs.getString("companyName"),
                        rs.getString("contactInfor"),
                        rs.getString("phoneContact"),
                        rs.getString("address"),
                        rs.getString("country"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return s;
    }

    public void updateSupplier(Supplier s) {
        String sql = "UPDATE [dbo].[Supplier]\n"
                + "   SET [supplierName] = ? \n"
                + "      ,[companyName] = ? \n"
                + "      ,[contactInfor] = ? \n"
                + "      ,[phoneContact] = ? \n"
                + "      ,[address] = ? \n"
                + "      ,[country] = ? \n"
                + "      ,[status] = ? \n"
                + " WHERE SupplierID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, s.getSupplierName());
            st.setString(2, s.getCompanyName());
            st.setString(3, s.getContactInfor());
            st.setString(4, s.getPhoneContact());
            st.setString(5, s.getAddress());
            st.setString(6, s.getCountry());
            st.setInt(7, s.getStatus());
            st.setInt(8, s.getSupplierID());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insertSupplier(Supplier s) {
        String sql = "INSERT INTO [dbo].[Supplier]\n"
                + "           ([supplierName]\n"
                + "           ,[companyName]\n"
                + "           ,[contactInfor]\n"
                + "           ,[phoneContact]\n"
                + "           ,[address]\n"
                + "           ,[country]\n"
                + "           ,[status])\n"
                + "     VALUES "
                + "           (?, ?, ?, ?, ?, ?, 1)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, s.getSupplierName());
            st.setString(2, s.getCompanyName());
            st.setString(3, s.getContactInfor());
            st.setString(4, s.getPhoneContact());
            st.setString(5, s.getAddress());
            st.setString(6, s.getCountry());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
