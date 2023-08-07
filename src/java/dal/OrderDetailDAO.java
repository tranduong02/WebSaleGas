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
import model.OrderDetail;

/**
 *
 * @author duykh
 */
public class OrderDetailDAO extends DBContext {

    public List<OrderDetail> getOrderDetailUser(int xOrderID) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = " SELECT OD.[productID],\n"
                + "		p.[productName],\n"
                + "		p.[image],\n"
                + "      OD.[quantityOrder]\n"
                + "      ,OD.[price]\n"
                + "  FROM [dbo].[OrderDetail] OD,  [dbo].[Product] P where OD.[productID] = p.[productID] and [orderID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, xOrderID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
//                (int productID, int quantityOrder, double price, String productName, String image)
                OrderDetail od = new OrderDetail(rs.getInt("productID"), rs.getInt("quantityOrder"), rs.getLong("price"), rs.getString("productName"), rs.getString("image"));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
