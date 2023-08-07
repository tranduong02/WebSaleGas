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
import dal.*;
import java.util.ArrayList;
import model.*;
import java.util.List;

/**
 *
 * @author dell
 */
@WebServlet(name = "SearchSmartServlet", urlPatterns = {"/searchsmart"})
public class SearchSmartServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchSmartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchSmartServlet at " + request.getContextPath() + "</h1>");
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
        String spid = request.getParameter("pid");
        ProductDAO pd = new ProductDAO();
        List<Product> list = new ArrayList<>();
        if (spid != null) {
            int pid = Integer.parseInt(spid.trim());
            list.add(pd.getProductByID(pid));
            request.setAttribute("list", list);
        }
        ProductDAO pdb = new ProductDAO();
        CategoryDAO cdb = new CategoryDAO();
        List<Product> listTop10 = pdb.getTop10Product();
        List<Category> listC = cdb.getAllCategory();
        List<Product> listTop10BestSelling = pdb.getTop10BestSellingProduct();
        List<Product> ListAll = pdb.getAllProductHome();

        request.setAttribute("dataAll", ListAll);
        request.setAttribute("listc", listC);
        request.setAttribute("datatop10", listTop10);
        request.setAttribute("databestselling", listTop10BestSelling);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
