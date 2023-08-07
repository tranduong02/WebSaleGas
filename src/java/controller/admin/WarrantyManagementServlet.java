/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;


import dal.WarrantyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Warranty;

/**
 *
 * @author duykh
 */
@WebServlet(name = "WarrantyManagementServlet", urlPatterns = {"/warrantymanagement"})
public class WarrantyManagementServlet extends HttpServlet {

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
            out.println("<title>Servlet WarrantyManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WarrantyManagementServlet at " + request.getContextPath() + "</h1>");
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
        WarrantyDAO wdb = new WarrantyDAO();
        List<Warranty> list = wdb.getListWarranty();
        request.setAttribute("listWarranty", list);
        request.getRequestDispatcher("warrantymanagement.jsp").forward(request, response);
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
        String orderDate = request.getParameter("orderDate");
        String userID = request.getParameter("userID");
        String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String warrantyCategory = request.getParameter("warrantyCategory");
        String warrantyPeriod = request.getParameter("warrantyPeriod");
        request.setAttribute("orderDate", orderDate);
        request.setAttribute("userID", userID);
        request.setAttribute("username", username);
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("email", email);
        request.setAttribute("productID", productID);
        request.setAttribute("productName", productName);
        request.setAttribute("warrantyCategory", warrantyCategory);
        request.setAttribute("warrantyPeriod", warrantyPeriod);
        request.getRequestDispatcher("addwarrantyinvoice.jsp").forward(request, response);
        
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

    public static void main(String[] args) {
        WarrantyDAO wdb = new WarrantyDAO();
        List<Warranty> list = wdb.getListWarranty();
        for (Warranty warranty : list) {
            System.out.println(warranty.getOrderDate()+ " - " + warranty.getWarrantyCategory() + " - " + warranty.getWarrantyPeriod());
        }
    }

}
