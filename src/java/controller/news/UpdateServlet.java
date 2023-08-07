/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.news;

import dal.NewsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import model.News;

/**
 *
 * @author Ngvie
 */
@WebServlet(urlPatterns = {"/updateNew"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class UpdateServlet extends HttpServlet {

    /**
     * Processes requests for HTTP <code>GET</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     *
     * /**
     * Processes requests for HTTP <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        int id = Integer.parseInt(request.getParameter("newId"));
        NewsDAO db = new NewsDAO();
        News news = db.getNewById(id);
        request.setAttribute("news", news);
        request.getRequestDispatcher("./updatenews.jsp").forward(request, response);
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
        News news = new News();
        news.setNewsId(Integer.parseInt(request.getParameter("id")));
        try {
            news.setNewsTitle(request.getParameter("title"));
            news.setTagname(request.getParameter("tagname"));
            int pi = Integer.parseInt(request.getParameter("parent"));
            news.setNewParentId(pi);
            news.setIsVisible(Boolean.parseBoolean(request.getParameter("visibale")));
            news.setNewsContent(request.getParameter("content"));
            String newimg = null;
            Part imagePart = request.getPart("image");
            // Lấy tên của file ảnh
            if (imagePart != null) {
                String fileName = imagePart.getSubmittedFileName();
                // Tạo một đường dẫn tuyệt đối của file ảnh trên server
                String savePath = "D:\\Semester_5\\SWP391\\swp391-se1707-group3\\web\\img"; // Giả sử có một thư mục images trên server
                String filePath = savePath + File.separator + fileName;
                // Kiểm tra xem thư mục images có tồn tại hay không và tạo nếu cần
                File saveDir = new File(savePath);
                if (!saveDir.exists()) {
                    saveDir.mkdir();
                }
                // Lưu file ảnh vào thư mục images trên server
                imagePart.write(filePath);
                newimg = "img/" + fileName;
            } else {
                newimg = "NULL";
            }
            news.setImage(newimg);
            LocalDate currentDate = LocalDate.now();
            Date DateUpload = Date.valueOf(currentDate);
            news.setDateUpload(DateUpload);
            NewsDAO db = new NewsDAO();
//            PrintWriter out = response.getWriter();
//            out.print(newimg);
            db.update(news);
            response.sendRedirect("listnews.jsp");
        } catch (NumberFormatException ex) {
            System.out.println(ex);
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
