/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import controller.NotificationEndpoint;
import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.User;

/**
 *
 * @author duykh
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/checkout"})
public class CheckOutServlet extends HttpServlet {

    private UserDAO udb = new UserDAO();

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
            out.println("<title>Servlet CheckOutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        User us = (User) session.getAttribute("userinfo");
        if (us != null) {
            User u = udb.getAnUser(us.getUsername(), "", "");
            request.setAttribute("user", u);
        }

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String paymentMethod = request.getParameter("paymentMethod");
        String shippingOption = request.getParameter("shipping-option");
        String address = request.getParameter("address");
        Cart cart = null;
        Object o = session.getAttribute("cart");
        User u = (User) session.getAttribute("userinfo");
        //co roi
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        OrderDAO odb = new OrderDAO();

        if (u != null) {
            try {
                User au = udb.getAnUser(u.getUsername(), "", "");
                if (paymentMethod.equals("1")) {
                    if (shippingOption.equals("1")) {
                        double totalMoney = cart.getTotalMoney() - cart.getTotalMoney() * au.getDiscount() + 20000;
                        odb.insertOrder(u, cart, paymentMethod, address, totalMoney);

                    } else if (shippingOption.equals("2")) {
                        double totalMoney = cart.getTotalMoney() - cart.getTotalMoney() * au.getDiscount() + 50000;
                        odb.insertOrder(u, cart, paymentMethod, address, totalMoney);
                    }

                    String notificationMessage = "Có đơn hàng mới - Thanh toán khi nhận hàng";
                    NotificationEndpoint.sendNotification(notificationMessage);

                    session.removeAttribute("cart");
                    session.setAttribute("size", 0);
                    response.sendRedirect("notification-successful-payment-upon-delivery.jsp");
                } else if (paymentMethod.equals("2")) {

                    if (shippingOption.equals("1")) {
                        long totalMoney = (long) (cart.getTotalMoney() - cart.getTotalMoney() * au.getDiscount() + 20000);
                        session.setAttribute("address", address);
                        session.setAttribute("totalMoney", totalMoney);
                        response.sendRedirect("vnpay/vnpay_pay.jsp");
                    } else if (shippingOption.equals("2")) {
                        long totalMoney = (long) (cart.getTotalMoney() - cart.getTotalMoney() * au.getDiscount() + 50000);
                        session.setAttribute("address", address);
                        session.setAttribute("totalMoney", totalMoney);
                        response.sendRedirect("vnpay/vnpay_pay.jsp");
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(CheckOutServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            response.sendRedirect("login");
        }

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
