/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author duykh
 */
@WebServlet(name="AddWarrantyInvoice", urlPatterns={"/addwarrantyinvoice"})
public class AddWarrantyInvoice extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String maintenanceDate_raw = request.getParameter("maintenanceDate");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddWarrantyInvoice</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddWarrantyInvoice at " + maintenanceDate_raw + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("addwarrantyinvoice.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        String productID_raw = request.getParameter("productID");
//        String orderID_raw = request.getParameter("orderID");
//        String maintenanceDate_raw = request.getParameter("maintenanceDate");
//        String appointmentDate = request.getParameter("appointmentDate");
//        String describe = request.getParameter("describe");
//        String status = request.getParameter("status");
//        String money = request.getParameter("money");
//        
//        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//        try {
//           int productID = Integer.parseInt(productID_raw);
//           int orderID = Integer.parseInt(orderID_raw);
//           if (maintenanceDate_raw != null && !maintenanceDate_raw.isEmpty()) {
//                Date maintenanceDate = (Date) sdf.parse(maintenanceDate_raw);
//           }
//           
//        } catch (Exception e) {
//        }
processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
