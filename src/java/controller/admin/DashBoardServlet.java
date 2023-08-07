/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.LineChart;

/**
 *
 * @author duykh
 */
@WebServlet(name = "DashBoardServlet", urlPatterns = {"/dashboard"})
public class DashBoardServlet extends HttpServlet {

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
        String beDate_raw = request.getParameter("bedate");
        String enDate_raw = request.getParameter("endate");
        String formatShow = request.getParameter("formatshow");
        if (beDate_raw != null && !beDate_raw.isEmpty() && enDate_raw != null && !enDate_raw.isEmpty() && formatShow != null && !formatShow.isEmpty()) {
            try ( PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet StatisticChart</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet StatisticChart at " + beDate_raw + "</h1>");
                out.println("<h1>Servlet StatisticChart at " + enDate_raw + "</h1>");
                out.println("<h1>Servlet StatisticChart at " + formatShow + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        } else {
            try ( PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet StatisticChart</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet StatisticChart at " + "no" + "</h1>");
                out.println("<h1>Servlet StatisticChart at " + "aaa" + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
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
        OrderDAO od = new OrderDAO();
        UserDAO udb = new UserDAO();
        int quantityNewUser = udb.getQuantityNewUser();
        request.setAttribute("quantityNewUser", quantityNewUser);
        int quantityUsingUser = udb.getQuantityUsingUser();
        request.setAttribute("quantityUsingUser", quantityUsingUser);
        int quantityUsedUser = udb.getQuantityUsedUser();
        request.setAttribute("quantityUsedUser", quantityUsedUser);
        List<LineChart> list = od.getDataChart();
        request.setAttribute("datachart", list);
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
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
