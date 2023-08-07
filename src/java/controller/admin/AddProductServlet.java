/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.SupplierDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Category;
import model.Product;
import model.Supplier;

/**
 *
 * @author duykh
 */
@WebServlet(name = "AddProduct", urlPatterns = {"/addproduct"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class AddProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//     [supplierID] = ?\n"
//                + "      ,[productName] = ?\n"
//                + "      ,[categoryID] = ?\n"
//                + "      ,[price] = ?\n"
//                + "      ,[warrantyPeriod] = ?\n"
//                + "      ,[quantity] = ?\n"
//                + "      ,[describe] = ?\n"
//                + "      ,[image] = ?\n"
//                + " WHERE productID = ?";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO c = new CategoryDAO();
        List<Category> list = c.getAllCategory();
        request.setAttribute("datac", list);
        SupplierDAO s = new SupplierDAO();
        List<Supplier> lists = s.getAllSupplierToChose();
        request.setAttribute("datas", lists);
        request.getRequestDispatcher("addproduct.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String supplierID_raw = request.getParameter("supplierID");
        String productName = request.getParameter("productName");
        String categoryID_raw = request.getParameter("categoryID");
        String price_raw = request.getParameter("price");
        String warrantyPeriod_raw = request.getParameter("warrantyPeriod");
        String quantity_raw = request.getParameter("quantity");
        String describe = request.getParameter("describe");
////        String image = request.getParameter("image");
// Lấy đối tượng Part theo tên của input kiểu file
        Part imagePart = request.getPart("image");
//        // Lấy tên của file ảnh
        String fileName = imagePart.getSubmittedFileName();
//        // Tạo một đường dẫn tuyệt đối của file ảnh trên server
        String savePath = "D:\\SWP391-SE1707-Group3\\SWP391-SE1707-Group3\\web\\images"; // Giả sử có một thư mục images trên server
        String filePath = savePath + File.separator + fileName;
        // Kiểm tra xem thư mục images có tồn tại hay không và tạo nếu cần
        File saveDir = new File(savePath);
        if (!saveDir.exists()) {
            saveDir.mkdir();
        }
        // Lưu file ảnh vào thư mục images trên server
        imagePart.write(filePath);
        String image = "images/" + fileName;
        ProductDAO pdb = new ProductDAO();
        try {
            int supplierID = Integer.parseInt(supplierID_raw);
            int categoryID = Integer.parseInt(categoryID_raw);
            double price = Double.parseDouble(price_raw.replace(",", ""));
            int warrantyPeriod = Integer.parseInt(warrantyPeriod_raw);
            int quantity = Integer.parseInt(quantity_raw);
            Product pNew = new Product(categoryID, supplierID, warrantyPeriod, quantity, productName, describe, price, image);
            pdb.insertProduct(pNew);
            String mess = "Add product successfully!";
            request.setAttribute("mess", mess);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("addproduct.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
