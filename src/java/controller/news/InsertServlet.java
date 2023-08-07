package controller.news;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.NewsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
 * @author ngvie
 */
@WebServlet(urlPatterns = {"/addnews"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class InsertServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addnews.jsp").forward(request, response);
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
        String title = request.getParameter("title");
        String tagname = request.getParameter("tagname");
        String content = request.getParameter("content");
        String parentId_raw = request.getParameter("parent");
        int parent = 0;
        if (parentId_raw != null)  parent = Integer.parseInt(parentId_raw);
        int check = Integer.parseInt(request.getParameter("visibale"));
        boolean visible = false;
        if (check == 1) {
            visible = true;
        }
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
        LocalDate currentDate = LocalDate.now();
        Date DateUpload = Date.valueOf(currentDate);
        HttpSession session = request.getSession();
        int employeeId = 1;//(session.getAttribute("user").getEmployeeId())
        News n = new News();
        n.setEmployeeId(employeeId);
        n.setNewsTitle(title);
        n.setTagname(tagname);
        n.setNewsContent(content);
        n.setImage(newimg);
        n.setDateUpload(DateUpload);
        n.setIsVisible(visible);
        n.setNewParentId(parent);
        NewsDAO nd = new NewsDAO();
        nd.add(n);
        String msg = "Add new Successfully";
//            PrintWriter out = response.getWriter();
//            out.print(visible);
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("listnews.jsp").forward(request, response);
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
