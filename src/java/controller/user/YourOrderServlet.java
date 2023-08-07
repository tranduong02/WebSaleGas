/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Order;
import model.User;

/**
 *
 * @author duykh
 */
@WebServlet(name = "YourOrderServlet", urlPatterns = {"/yourorder"})
public class YourOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet YourOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet YourOrderServlet at " + request.getContextPath() + "</h1>");
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
        User u = (User) session.getAttribute("userinfo");
        OrderDAO odb = new OrderDAO();
        if (u != null) {
            List<Order> list = odb.getOrderUser(1, u.getUserID());
            request.setAttribute("listConfirmationWaiting", list);
        }
        request.getRequestDispatcher("yourorder.jsp").forward(request, response);
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
        String status_raw = request.getParameter("status");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("userinfo");
        OrderDAO odb = new OrderDAO();
        try {
            int status = Integer.parseInt(status_raw);
            if (u != null) {
                switch (status) {
                    case 1: {
                        List<Order> list = odb.getOrderUser(status, u.getUserID());
                        request.setAttribute("listConfirmationWaiting", list);
                        break;
                    }
                    case 2: {
                        List<Order> list = odb.getOrderUser(status, u.getUserID());
                        request.setAttribute("listPrepare", list);
                        break;
                    }
                    case 3: {
                        List<Order> list = odb.getOrderUser(status, u.getUserID());
                        request.setAttribute("listShipping", list);
                        break;
                    }
                    case 4: {
                        List<Order> list = odb.getOrderUser(status, u.getUserID());
                        request.setAttribute("listComplete", list);
                        break;
                    }
                    case 5: {
                        List<Order> list = odb.getOrderUser(status, u.getUserID());
                        request.setAttribute("listCanceled", list);
                        break;
                    }
                }
            }

        } catch (NumberFormatException e) {
        }
        request.getRequestDispatcher("yourorder.jsp").forward(request, response);
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
