/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.SupplierDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import model.Supplier;

/**
 *
 * @author duykh
 */
@WebServlet(name = "ShowProductServlet", urlPatterns = {"/shop"})
public class ShopProductServlet extends HttpServlet {

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
            out.println("<title>Servlet ShowProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowProductServlet at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("searchname");
        String[] categoryIDs = request.getParameterValues("category");
        String[] supplierIDs = request.getParameterValues("supplier");
        String price_raw = request.getParameter("price");
        String priceS_raw = request.getParameter("priceS");
        String categoryID_raw = request.getParameter("categoryID");

        ProductDAO pdb = new ProductDAO();
        CategoryDAO cdb = new CategoryDAO();
        SupplierDAO sdb = new SupplierDAO();
        if (categoryID_raw != null) {
            try {
                int categoryID = Integer.parseInt(categoryID_raw);
                List<Product> listProductByCate = pdb.getProductByCategory(categoryID);
                request.setAttribute("listpbc", listProductByCate);
            } catch (NumberFormatException e) {
            }
        }
        List<Integer> parsedSupplierIDs = new ArrayList<>();
        List<Integer> parsedCategoryIDs = new ArrayList<>();
        long minPrice = 0;
        long maxPrice = 0;
        int priceS = 0;
        try {
            priceS = Integer.parseInt(priceS_raw);
        } catch (NumberFormatException e) {
        }
        if (supplierIDs != null || categoryIDs != null || price_raw != null) {
            //parse suplierID
            if (supplierIDs != null) {
                for (String supplierId : supplierIDs) {
                    try {
                        int SupplierID = Integer.parseInt(supplierId);
                        parsedSupplierIDs.add(SupplierID);
                    } catch (NumberFormatException e) {
                    }
                }
            }
            //parse categoryID
            if (categoryIDs != null) {
                for (String categoryId : categoryIDs) {
                    try {
                        int categoryID = Integer.parseInt(categoryId);
                        parsedCategoryIDs.add(categoryID);
                    } catch (NumberFormatException e) {
                    }
                }
            }
            //parse price
            if (price_raw != null) {
                // Remove currency symbol (₫) and percent encoding (%C2%A0)
                String cleanedPrice_raw1 = price_raw.replaceAll("[^\\d.-]", "");
                String cleanedPrice_raw = cleanedPrice_raw1.replaceAll("\\.", "");
                String[] price = cleanedPrice_raw.split("-");
                if (price.length == 2) {

                    try {
                        minPrice = Long.parseLong(price[0]);
                        maxPrice = Long.parseLong(price[1]);
                    } catch (NumberFormatException e) {
                        minPrice = 1;
                        maxPrice = 1;
                    }
                }
            }
            List<Product> listFilter = pdb.getProductByFilter(parsedCategoryIDs, parsedSupplierIDs, minPrice, maxPrice, priceS);
            request.setAttribute("listProductFilter", listFilter);
        } else {

            List<Product> listAll = pdb.getAllProduct(priceS);
            request.setAttribute("dataAll", listAll);
        }
        if (name != null) {
            List<Product> listSearch = pdb.searchProductByName(name, priceS);
            if (listSearch.isEmpty()) {
                request.setAttribute("notfound", "The product you requested could not be found!");
            }
            request.setAttribute("listSearch", listSearch);
        }

        List<Category> listAllc = cdb.getAllCategory();
        request.setAttribute("dataAllc", listAllc);
        List<Supplier> listAlls = sdb.getAllSupplierToChose();
        request.setAttribute("dataAlls", listAlls);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
        processRequest(request, response);
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
