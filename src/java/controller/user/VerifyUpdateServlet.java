/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import controller.log.VerifySignUpServlet;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author my pc
 */
@WebServlet(name = "VerifyUpdateServlet", urlPatterns = {"/verifyupdate"})
public class VerifyUpdateServlet extends HttpServlet {

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
            out.println("<title>Servlet VerifyUpdateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyUpdateServlet at " + request.getContextPath() + "</h1>");
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
         request.getRequestDispatcher("verifyupdate.jsp").forward(request, response);
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
        String userCode = request.getParameter("verification");
        UserDAO udb = new UserDAO();
        // Lấy mã xác nhận từ session
        HttpSession session = request.getSession();
        String verificationCode = (String) session.getAttribute("verification");
        User uNew = (User) session.getAttribute("insertuser");
        // Lấy số lần nhập sai từ session hoặc khởi tạo nếu chưa có
        Integer incorrectAttempts = (Integer) session.getAttribute("incorrectAttempt");
        if (incorrectAttempts == null) {
            incorrectAttempts = 0;
        }
        if (verificationCode != null && verificationCode.equals(userCode)) {
            // Mã xác nhận hợp lệ
            session.removeAttribute("verification"); // Xóa mã xác nhận khỏi session
            session.removeAttribute("incorrectAttempt"); // Xóa số lần nhập sai khỏi session
            udb.updateUser(uNew);
            session.removeAttribute("insertuser");
            session.removeAttribute("userinfo");
            response.sendRedirect("notification-successful-update-profile.jsp");
        } else {
            // Mã xác nhận không hợp lệ
            incorrectAttempts++;
            session.setAttribute("incorrectAttempt", incorrectAttempts);
            if (incorrectAttempts > 5) {
                session.removeAttribute("verification"); // Xóa mã xác nhận khỏi session
                session.removeAttribute("incorrectAttempt"); // Xóa số lần nhập sai khỏi session
                response.sendRedirect("notification-fail-register.jsp");
            } else {
                // Chuyển hướng đến trang xác nhận lại mã với thông báo lỗi
                request.setAttribute("error", "Mã xác nhận không hợp lệ");
                request.getRequestDispatcher("verifyupdate.jsp").forward(request, response);
            }
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
