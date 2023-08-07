/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.CategoryDAO;
import dal.OrderDAO;
import dal.SupplierDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.LineChart;
import java.time.LocalDate;
import java.sql.Date;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.Category;
import model.StatisticProduct;
import model.Supplier;

/**
 *
 * @author duykh
 */
@WebServlet(name = "StatisticProductServlet", urlPatterns = {"/statisticproduct"})
public class StatisticProductServlet extends HttpServlet {

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
            out.println("<title>Servlet StatisticProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticProductServlet at " + request.getContextPath() + "</h1>");
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
        CategoryDAO c = new CategoryDAO();
        List<Category> listc = c.getAllCategory();
        SupplierDAO s = new SupplierDAO();
        List<Supplier> lists = s.getListSupplier(3);
        OrderDAO od = new OrderDAO();
        List<LineChart> list = od.getDataChart();

        request.setAttribute("datac", listc);
        request.setAttribute("datas", lists);
        request.setAttribute("datachart", list);
        request.getRequestDispatcher("statisticproduct.jsp").forward(request, response);
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
        OrderDAO od = new OrderDAO();
        //chart
        String beDate_raw = request.getParameter("bedate");
        String enDate_raw = request.getParameter("endate");
        String formatShow = request.getParameter("formatshow");
        //filter thong ke san pham
        String beDatesp_raw = request.getParameter("bedatesp");
        String enDatesp_raw = request.getParameter("endatesp");
        String[] categoryIDs = request.getParameterValues("categoryID");
        String[] supplierIDs = request.getParameterValues("supplierID");
        List<Integer> parsedSupplierIDs = new ArrayList<>();
        List<Integer> parsedCategoryIDs = new ArrayList<>();
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
        Date beDatesp = null;
        Date enDatesp = null;
        try {
            if (beDatesp_raw != null && !beDatesp_raw.isEmpty()) {
                LocalDate beDateLocalDatesp = LocalDate.parse(beDatesp_raw, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                request.setAttribute("sendbedatesp", beDatesp_raw);
                beDatesp = java.sql.Date.valueOf(beDateLocalDatesp);

            }
            if (enDatesp_raw != null && !enDatesp_raw.isEmpty()) {
                LocalDate enDateLocalDatesp = LocalDate.parse(enDatesp_raw, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                request.setAttribute("sendendatesp", enDatesp_raw);
                enDatesp = java.sql.Date.valueOf(enDateLocalDatesp);
            }
        } catch (Exception e) {
        }
        List<StatisticProduct> lsp = od.getStatisticProduct(parsedCategoryIDs, parsedSupplierIDs, beDatesp, enDatesp);
        request.setAttribute("dataStatisticProduct", lsp);
        
        CategoryDAO c = new CategoryDAO();
        List<Category> listc = c.getAllCategory();
        SupplierDAO s = new SupplierDAO();
        List<Supplier> lists = s.getListSupplier(3);
        request.setAttribute("datac", listc);
        request.setAttribute("datas", lists);
        //xu ly filter chart
        if (beDate_raw != null && !beDate_raw.isEmpty() && enDate_raw != null && !enDate_raw.isEmpty() && formatShow != null && !formatShow.isEmpty()) {

            try {
                LocalDate beDateLocalDate = LocalDate.parse(beDate_raw, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
                LocalDate enDateLocalDate = LocalDate.parse(enDate_raw, DateTimeFormatter.ofPattern("dd-MM-yyyy"));

                request.setAttribute("sendbedate", beDate_raw);
                request.setAttribute("sendendate", enDate_raw);
                request.setAttribute("sendformatshow", formatShow);

                Date beDate = java.sql.Date.valueOf(beDateLocalDate);
                Date enDate = java.sql.Date.valueOf(enDateLocalDate);

                List<LineChart> list = od.getDataChartFilter(beDate, enDate, formatShow);
                request.setAttribute("datachartfilter", list);
            } catch (ParseException ex) {
                Logger.getLogger(DashBoardServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            List<LineChart> list = od.getDataChart();
            request.setAttribute("datachart", list);
        }

        request.getRequestDispatcher("statisticproduct.jsp").forward(request, response);
//processRequest(request, response);
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
