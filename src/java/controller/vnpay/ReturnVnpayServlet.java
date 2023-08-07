/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.vnpay;

import controller.NotificationEndpoint;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.User;

/**
 *
 * @author duykh
 */
@WebServlet(name = "ReturnVnpayServlet", urlPatterns = {"/vnpay/returnvnpay"})
public class ReturnVnpayServlet extends HttpServlet {

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

        //Begin process return from VNPAY
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }

        HttpSession session = request.getSession();
        OrderDAO odb = new OrderDAO();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        
        if(session.getAttribute("address")!= null && session.getAttribute("totalMoney") != null){
             
        
        String address = (String) session.getAttribute("address");
        long totalMoney = (long) session.getAttribute("totalMoney");
        User u = (User) session.getAttribute("userinfo");
        request.setAttribute("totalMoney", totalMoney);
        //co roi
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        if (u != null) {
            try {
                odb.insertOrder(u, cart, "2", address, totalMoney);
                session.removeAttribute("cart");
                session.removeAttribute("address");
                session.removeAttribute("totalMoney");
                session.setAttribute("size", 0);
            } catch (SQLException ex) {
                Logger.getLogger(ReturnVnpayServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        }
        String notificationMessage = "Có đơn hàng mới - Thanh toán trực tuyến";
        NotificationEndpoint.sendNotification(notificationMessage);
        String signValue = Config.hashAllFields(fields);

        request.getRequestDispatcher("vnpay_return.jsp").forward(request, response);
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
        processRequest(request, response);
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
