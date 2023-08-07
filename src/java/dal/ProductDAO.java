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
import model.*;

/**
 *
 * @author duykh
 */
public class ProductDAO extends DBContext {
//list san pham hien o trang shop

    public List<Product> getAllProduct(int priceS) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.[productID]\n"
                + "          ,p.[productName]\n"
                + "          ,p.[price]\n"
                + "          ,w.[warrantyPeriod]\n"
                + "          ,w.WarrantyCategory\n"
                + "          ,p.[productDetail]\n"
                + "          ,p.[discount]\n"
                + "          ,p.[image]\n"
                + "FROM [dbo].[Product] P , [dbo].WarrantyPolicy W where p.WarrantyPolicyID = w.WarrantyPolicyID AND status != 0";

        switch (priceS) {
            case 1:
                sql += " order by price DESC ";
                break;
            case 2:
                sql += " order by price ASC";
                break;
            default:
                sql += " order by [productID] DESC";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("warrantyPeriod"),
                        rs.getString("WarrantyCategory"),
                        rs.getDouble("discount"),
                        rs.getString("image"),
                        rs.getString("productDetail"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
    

//list san pham hien o trang home de chia theo category

    public List<Product> getAllProductHome() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [productID]\n"
                + "      ,[productName]\n"
                + "      ,[categoryID]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Product] WHERE status != 0 order by [productID] DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("productID"),
                        rs.getInt("categoryID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getDouble("discount"),
                        rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
///
    
    
//list san pham moi cap nhat

    public List<Product> getTop10Product() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [productID]\n"
                + "      ,[productName]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Product] WHERE status != 0 order by [productID] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("productID"),
                        0, //ko can categoryID nhung ma luoi them constructor nen them tam so 0 :)
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getDouble("discount"),
                        rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

//list theo category khi nguoi dung chon o trang index se chuyen huong den trang shop
    public List<Product> getProductByCategory(int categoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.[productID]\n"
                + "          ,p.[productName]\n"
                + "          ,p.[price]\n"
                + "          ,w.[warrantyPeriod]\n"
                + "          ,w.WarrantyCategory\n"
                + "          ,p.[productDetail]\n"
                + "          ,p.[discount]\n"
                + "          ,p.[image]\n"
                + "FROM [dbo].[Product] P , [dbo].WarrantyPolicy W where p.WarrantyPolicyID = w.WarrantyPolicyID "
                + "AND status != 0 AND categoryID = ? order by [productID] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("warrantyPeriod"),
                        rs.getString("WarrantyCategory"),
                        rs.getDouble("discount"),
                        rs.getString("image"),
                        rs.getString("productDetail"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

//list top 10 san pham ban chay nhat
    public List<Product> getTop10BestSellingProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select TOP 10 sum(O.quantityOrder) as totalQuantity, "
                + "P.[productID], "
                + "P.[productName], "
                + "P.[price], "
                + "P.[image], "
                + "p.[discount] \n"
                + "FROM Product P, OrderDetail O\n"
                + "                where P.productID = O.productID "
                + " AND p.status != 0\n"
                + "                 GROUP BY  P.[productID], P.[productName], P.[price], P.[image],p.[discount]\n"
                + "                order by sum(O.quantityOrder) DESC ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("productID"),
                        0, //ko can categoryID nhung ma luoi them constructor nen them tam so 0 :)
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getDouble("discount"),
                        rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

//search theo ten o trang shop
    public List<Product> searchProductByName(String name, int priceS) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.[productID]\n"
                + "          ,p.[productName]\n"
                + "          ,p.[price]\n"
                + "          ,w.[warrantyPeriod]\n"
                + "          ,w.WarrantyCategory\n"
                + "          ,p.[productDetail]\n"
                + "          ,p.[discount]\n"
                + "          ,p.[image]\n"
                + "FROM [dbo].[Product] P , [dbo].WarrantyPolicy W where p.WarrantyPolicyID = w.WarrantyPolicyID AND status != 0 ";
        if (name != null && !name.trim().equals("")) {
            // Tạo một biến để lưu kết quả
            String newName = "";
            // Tạo một biến để đếm số lượng kí tự khoảng trắng liên tiếp
            int spaceCount = 0;
            // Duyệt qua từng kí tự trong chuỗi đầu vào
            for (int i = 0; i < name.length(); i++) {
                // Lấy kí tự hiện tại
                char c = name.charAt(i);
                // Nếu kí tự là khoảng trắng
                if (c == ' ') {
                    // Tăng biến đếm lên 1
                    spaceCount++;
                    // Nếu biến đếm nhỏ hơn hoặc bằng 1
                    if (spaceCount <= 1) {
                        // Thêm kí tự vào kết quả
                        newName += c;
                    }
                    // Nếu không thì bỏ qua kí tự này
                } else {
                    // Nếu kí tự không phải là khoảng trắng
                    // Đặt lại biến đếm về 0
                    spaceCount = 0;
                    // Thêm kí tự vào kết quả
                    newName += c;
                }
            }
            sql += " AND productName like N'%" + newName.trim() + "%'";
        }
        switch (priceS) {
            case 1:
                sql += " order by price DESC ";
                break;
            case 2:
                sql += " order by price ASC";
                break;
            default:
                sql += " order by [productID] DESC";
                break;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("warrantyPeriod"),
                        rs.getString("WarrantyCategory"),
                        rs.getDouble("discount"),
                        rs.getString("image"),
                        rs.getString("productDetail"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }
//list san pham duoc filter

    public List<Product> getProductByFilter(List<Integer> categoryIDs, List<Integer> supplierIDs, double minPrice, double maxPrice, int priceS) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.[productID]\n"
                + "          ,p.[productName]\n"
                + "          ,p.[price]\n"
                + "          ,w.[warrantyPeriod]\n"
                + "          ,w.WarrantyCategory\n"
                + "          ,p.[productDetail]\n"
                + "          ,p.[discount]\n"
                + "          ,p.[image]\n"
                + "FROM [dbo].[Product] P , [dbo].WarrantyPolicy W where p.WarrantyPolicyID = w.WarrantyPolicyID AND status != 0 ";

        if (!categoryIDs.isEmpty()) {
            String categoryIDString = getCategoryIDsAsString(categoryIDs);
            sql += " AND categoryID IN (" + categoryIDString + ")";
        }

        if (!supplierIDs.isEmpty()) {
            String supplierIDString = getSupplierIDsAsString(supplierIDs);
            sql += " AND supplierID IN (" + supplierIDString + ")";
        }
        sql += " AND (price - (price * discount / 100)) >= " + minPrice;

        if (maxPrice != 0) {
            sql += " AND (price - (price * discount / 100)) <= " + maxPrice;
        }
        switch (priceS) {
            case 1:
                sql += " order by price DESC ";
                break;
            case 2:
                sql += " order by price ASC";
                break;
            default:
                sql += " order by [productID] DESC";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("warrantyPeriod"),
                        rs.getString("WarrantyCategory"),
                        rs.getDouble("discount"),
                        rs.getString("image"),
                        rs.getString("productDetail"));
                list.add(p);
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

//lay ra 1 product theo ID
    public Product getProductByID(int productID) {
        String sql = "SELECT p.[productID]\n"
                + "      ,p.[supplierID]\n"
                + "      ,p.[productName]\n"
                + "      ,p.[categoryID]\n"
                + "      ,p.[price]\n"
                + "      ,w.warrantyPeriod\n"
                + "	  ,w.WarrantyCategory\n"
                + "      ,p.[quantity]\n"
                + "      ,p.[productDetail]\n"
                + "      ,p.[describe]\n"
                + "      ,p.[discount]\n"
                + "      ,p.[image]\n"
                + "      ,p.[status]\n"
                + "  FROM [dbo].[Product] P , [dbo].WarrantyPolicy W where p.WarrantyPolicyID = w.WarrantyPolicyID "
                + "                                                         AND p.[productID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product(
                        rs.getInt("productID"),
                        rs.getInt("categoryID"),
                        rs.getInt("supplierID"),
                        rs.getInt("quantity"),
                        rs.getString("productName"),
                        rs.getString("describe"),
                        rs.getDouble("price"),
                        rs.getInt("warrantyPeriod"),
                        rs.getString("WarrantyCategory"),
                        rs.getDouble("discount"),
                        rs.getString("image"),
                        rs.getString("productDetail"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
// add san pham
    public void insertProduct(Product p) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([supplierID]\n"
                + "           ,[productName]\n"
                + "           ,[categoryID]\n"
                + "           ,[price]\n"
                + "           ,[WarrantyPolicyID]\n"
                + "           ,[quantity]\n"
                + "           ,[productDetail]\n"
                + "           ,[describe]\n"
                + "           ,[discount]\n"
                + "           ,[image]\n"
                + "           ,[status])\n"
                + "     VALUES "
                + "           (?,?,?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, p.getSupplierID());
            st.setString(2, p.getProductName());
            st.setInt(3, p.getCategoryID());
            st.setDouble(4, p.getPrice());
            st.setInt(5, p.getWarrantyPolicyID());
            st.setInt(6, p.getQuantity());
            st.setString(7, p.getProductDetail());
            st.setString(8, p.getDescribe());
            st.setDouble(9, p.getDiscount());
            st.setString(10, p.getImage());
            st.setInt(11, p.getStatus());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
// update san pham
    public void updateProduct(Product p) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [supplierID] = ?\n"
                + "      ,[productName] = ?\n"
                + "      ,[categoryID] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[WarrantyPolicyID] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[productDetail] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getSupplierID());
            st.setString(2, p.getProductName());
            st.setInt(3, p.getCategoryID());
            st.setDouble(4, p.getPrice());
            st.setInt(5, p.getWarrantyPolicyID());
            st.setInt(6, p.getQuantity());
            st.setString(7, p.getProductDetail());
            st.setString(8, p.getDescribe());
            st.setDouble(9, p.getDiscount());
            st.setString(10, p.getImage());
            st.setInt(11, p.getStatus());
            st.setInt(12, p.getProductID());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
//smart search
    public List<Product> getProductByKey(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [productID]\n"
                + "      ,[productName]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[image]\n"
                + "FROM [dbo].[Product] WHERE status != 0 ";
        if (key != null && !key.trim().equals("")) {
            // Tạo một biến để lưu kết quả
            String newKey = "";
            // Tạo một biến để đếm số lượng kí tự khoảng trắng liên tiếp
            int spaceCount = 0;
            // Duyệt qua từng kí tự trong chuỗi đầu vào
            for (int i = 0; i < key.length(); i++) {
                // Lấy kí tự hiện tại
                char c = key.charAt(i);
                // Nếu kí tự là khoảng trắng
                if (c == ' ') {
                    // Tăng biến đếm lên 1
                    spaceCount++;
                    // Nếu biến đếm nhỏ hơn hoặc bằng 1
                    if (spaceCount <= 1) {
                        // Thêm kí tự vào kết quả
                        newKey += c;
                    }
                    // Nếu không thì bỏ qua kí tự này
                } else {
                    // Nếu kí tự không phải là khoảng trắng
                    // Đặt lại biến đếm về 0
                    spaceCount = 0;
                    // Thêm kí tự vào kết quả
                    newKey += c;
                }
            }
            sql += " AND productName like N'%" + newKey.trim() + "%' ";
        }
        sql += " ORDER BY [productID] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("productID"),
                        0, //ko can categoryID nhung ma luoi them constructor nen them tam so 0 :)
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getDouble("discount"),
                        rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
