/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Item;
import model.LineChart;
import model.User;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Order;
import model.StatisticProduct;

/**
 *
 * @author duykh
 */
public class OrderDAO extends DBContext {

    public void insertOrder(User u, Cart cart, String paymentMethod, String address, double totalMoney) throws SQLException {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        connection.setAutoCommit(false);
        try {
            //add vao bang order trc
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([userID]\n"
                    + "           ,[orderDate]\n"
                    + "           ,[deliveryAddress]\n"
                    + "           ,[status]\n"
                    + "           ,[totalMoney])\n"
                    + "     VALUES (?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getUserID());
            st.setString(2, date);
            st.setString(3, address);
            if (paymentMethod.equals("1")) {
                st.setInt(4, 1);
            } else if (paymentMethod.equals("2")) {
                st.setInt(4, 2);
            }
            st.setDouble(5, totalMoney);
            st.executeUpdate();
            //lay id cua order cua add
            String sql1 = "select top 1 orderID from [order] order by orderID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add bang orderdetail

            if (rs.next()) {
                int orderID = rs.getInt("orderID");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderDetail]\n"
                            + "           ([OrderID]\n"
                            + "           ,[productID]\n"
                            + "           ,[quantityOrder]\n"
                            + "           ,[price])\n"
                            + "     VALUES (?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, orderID);
                    st2.setInt(2, i.getProduct().getProductID());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
            connection.commit(); // Xác nhận giao dịch
        } catch (SQLException e) {
            connection.rollback(); // Hủy bỏ giao dịch nếu có lỗi
        }
    }

    public void updateStatusOrder(int xOrderID, int action) {
        String sql = "UPDATE [dbo].[Order] SET [status] = ? WHERE orderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, action);
            st.setInt(2, xOrderID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<LineChart> getDataChart() {
        List<LineChart> list = new ArrayList<>();
        String sql = "select sum(totalMoney) MoneyEachDay, orderDate from [order] group by orderDate";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                LineChart l = new LineChart(rs.getLong("MoneyEachDay"), rs.getDate("orderDate"));
                list.add(l);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<LineChart> getDataChartFilter(Date beDate, Date enDate, String showDate) throws ParseException {
        List<LineChart> list = new A public List<LineChart> getDataChartFilterrrayList<>();
        String sql = "";
        switch (showDate) {
            case "ngay":
                sql += "select sum(totalMoney) [Money], orderDate "
                        + "from [order] Where orderDate >= ?"
                        + " and orderDate <= ? group by orderDate";
                break;
            case "thang":
                sql += "SELECT SUM(totalMoney) AS [Money], FORMAT(orderDate, 'yyyy-MM') AS [orderDate] \n"
                        + "FROM [order]\n"
                        + "WHERE orderDate >= ? AND orderDate <= ?\n"
                        + "GROUP BY FORMAT(orderDate, 'yyyy-MM')";
                break;
            default:
                sql += "select sum(totalMoney) [Money], Year(orderDate) [orderDate] "
                        + "from [order] Where orderDate >= ? "
                        + "and orderDate <= ? group by Year(orderDate)";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, new java.sql.Date(beDate.getTime()));
            st.setDate(2, new java.sql.Date(enDate.getTime()));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String orderDateString = rs.getString("orderDate");
                switch (showDate) {
                    case "ngay": {
                        LineChart l = new LineChart(rs.getLong("Money"), rs.getDate("orderDate"));
                        list.add(l);
                        break;
                    }
                    case "thang": {
                        SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy-MM");
                        java.util.Date parsedDate = dbDateFormat.parse(orderDateString);
                        java.sql.Date orderDate = new java.sql.Date(parsedDate.getTime());
                        LineChart l = new LineChart(rs.getLong("Money"), orderDate);
                        list.add(l);
                        break;
                    }
                    case "nam": {
                        SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy");
                        java.util.Date parsedDate = dbDateFormat.parse(orderDateString);
                        java.sql.Date orderDate = new java.sql.Date(parsedDate.getTime());
                        LineChart l = new LineChart(rs.getLong("Money"), orderDate);
                        list.add(l);
                        break;
                    }
                }

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<StatisticProduct> getStatisticProduct(List<Integer> categoryIDs, List<Integer> supplierIDs, Date beDate, Date enDate) {
        List<StatisticProduct> list = new ArrayList<>();
        String sql = "SELECT P.productName, S.supplierName, C.categoryName, SUM(OD.quantityOrder) AS Quantity, OD.price, SUM(OD.quantityOrder * OD.price) AS TotalPrice\n"
                + "FROM [Order] O\n"
                + "JOIN OrderDetail OD ON O.orderID = OD.OrderID\n"
                + "JOIN Product P ON OD.productID = P.productID\n"
                + "JOIN Supplier S ON P.supplierID = S.supplierID\n"
                + "JOIN Category C ON P.categoryID = C.categoryID\n"
                + "WHERE 1=1 \n";

        if (!categoryIDs.isEmpty()) {
            String categoryIDString = getCategoryIDsAsString(categoryIDs);
            sql += " AND P.categoryID IN (" + categoryIDString + ") ";
        }

        if (!supplierIDs.isEmpty()) {
            String supplierIDString = getSupplierIDsAsString(supplierIDs);
            sql += " AND P.supplierID IN (" + supplierIDString + ") ";
        }
        if (beDate != null) {
            sql += " AND  O.orderDate >= '" + beDate + "' ";
        }
        if (enDate != null) {
            sql += " AND  O.orderDate <= '" + enDate + "' ";
        }
        sql += " GROUP BY P.productName, S.supplierName, C.categoryName, OD.price ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                StatisticProduct sp = new StatisticProduct(rs.getString("productName"), rs.getString("supplierName"), rs.getString("categoryName"), rs.getInt("Quantity"), rs.getLong("price"), rs.getLong("TotalPrice"));
                list.add(sp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

// convert chuoi categoryIDs thanh List
    private String getCategoryIDsAsString(List<Integer> categoryIDs) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < categoryIDs.size(); i++) {
            if (i > 0) {
                sb.append(", ");
            }
            sb.append(categoryIDs.get(i));
        }
        return sb.toString();
    }

// convert chuoi supplierIDs thanh List
    private String getSupplierIDsAsString(List<Integer> supplierIDs) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < supplierIDs.size(); i++) {
            if (i > 0) {
                sb.append(", ");
            }
            sb.append(supplierIDs.get(i));
        }
        return sb.toString();
    }
//    public static void main(String[] args) throws ParseException {
//        String[] supplierIDs = {"1","2","3","4","5"};
//        String[] categoryIDs = {"1","2","3"};
//         List<Integer> parsedSupplierIDs = new ArrayList<>();
//        List<Integer> parsedCategoryIDs = new ArrayList<>();
//         //parse suplierID
//        if (supplierIDs != null) {
//            for (String supplierId : supplierIDs) {
//                try {
//                    int SupplierID = Integer.parseInt(supplierId);
//                    parsedSupplierIDs.add(SupplierID);
//                } catch (NumberFormatException e) {
//                }
//            }
//        }
//        //parse categoryID
//        if (categoryIDs != null) {
//            for (String categoryId : categoryIDs) {
//                try {
//                    int categoryID = Integer.parseInt(categoryId);
//                    parsedCategoryIDs.add(categoryID);
//                } catch (NumberFormatException e) {
//                }
//            }
//        }
//        OrderDAO od = new OrderDAO();
//        Date beDate = java.sql.Date.valueOf("2023-06-24");
//        Date enDate = java.sql.Date.valueOf("2023-12-14");
//        List<StatisticProduct> list = od.getStatisticProduct(parsedCategoryIDs, parsedSupplierIDs, beDate, enDate);
//        for (StatisticProduct category : list) {
//            System.out.println(category.getProductName()+ " " + category.getSupplierName());
//        }
//    }

    public List<Order> getOrderUser(int xstatus, int userID) {
        List<Order> list = new ArrayList<>();
        String sql = " SELECT [orderID]\n"
                + "      ,[orderDate]\n"
                + "      ,[deliveryAddress]\n"
                + "      ,[totalMoney]\n"
                + "  FROM [dbo].[Order] WHERE [userID] = ? and [status] = ? ORDER BY orderID DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, xstatus);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("orderID"), rs.getDate("orderDate"), rs.getString("deliveryAddress"), rs.getLong("totalMoney"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getOrder(int xstatus) {
        List<Order> list = new ArrayList<>();
        String sql = " SELECT [orderID]\n"
                + "      ,[orderDate]\n"
                + "      ,[deliveryAddress]\n"
                + "      ,[totalMoney]\n"
                + "  FROM [dbo].[Order] WHERE [status] = ? ORDER BY orderID DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, xstatus);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("orderID"), rs.getDate("orderDate"), rs.getString("deliveryAddress"), rs.getLong("totalMoney"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
