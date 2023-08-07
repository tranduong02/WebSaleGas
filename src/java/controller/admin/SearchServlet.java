/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.*;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.*;
import java.util.List;

/**
 *
 * @author dell
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
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
        try ( PrintWriter out = response.getWriter()) {
            ProductDAO pd = new ProductDAO();
            String key = request.getParameter("keyword").trim();
            List<Product> listtype = pd.getProductByKey(key);
            HttpSession sesion = request.getSession();
            sesion.setAttribute("listsearch", listtype);
            Gson gson = new Gson();
            String json = gson.toJson(listtype);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            // Gửi chuỗi JSON như phản hồi           
            out.print(json);
            out.flush();
        }
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
        HttpSession sesion = request.getSession();
        List<Product> listtype = (List<Product>) sesion.getAttribute("listsearch");
        ProductDAO pd = new ProductDAO();
        List<Product> list = new ArrayList<>();
        for (Product pt : listtype) {
            Product p = pd.getProductByID(pt.getProductID());
            list.add(p);
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
        request.setAttribute("list", list);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
