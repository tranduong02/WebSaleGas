/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.log;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import java.util.Random;
/**
 *
 * @author duykh
 */
@WebServlet(name="SendMailServlet", urlPatterns={"/forgotpass"})
public class ForgotPassServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendMailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMailServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");

        // Kiểm tra email trong cơ sở dữ liệu để tìm thông tin người dùng
        // Nếu tìm thấy, gửi email xác nhận
        if (isValidEmail(email)) {
             String verificationCode = generateVerificationCode();

            // Lưu mã xác nhận vào session
            HttpSession session = request.getSession();
            session.setAttribute("verificationCode", verificationCode);
            session.setAttribute("email", email);
            session.setMaxInactiveInterval(300);

            // Gửi email chứa mã xác nhận đến người dùng
            sendConfirmationEmail(email, verificationCode);
            response.sendRedirect("verify");
        }else{
            request.setAttribute("notfound", "Tìm kiếm không trả về kết quả nào. Vui lòng thử lại với thông tin khác.");
            request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
        }

        // Chuyển hướng người dùng đến trang xác nhận
        
    }
     private void sendConfirmationEmail(String email,String verificationCode) {
        // Cấu hình các thuộc tính của JavaMail
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        final String username = "khanhpd2402@gmail.com";
        final String password = "qgxozkbzzpgvfmgs";

        // Tạo phiên gửi email
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo đối tượng MimeMessage
            Message message = new MimeMessage(session);

            // Đặt thông tin người gửi
            message.setFrom(new InternetAddress("WebSaleGas"));

            // Đặt thông tin người nhận
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));

            // Đặt tiêu đề email
            message.setSubject("Confirm Password Recovery");

            // Đặt nội dung email
            message.setText("Your verification code is:  "+ verificationCode + "  Verification code will expire in 5 minutes."+ "\nPlease click the following link to recover your password: http://localhost:9999/salegas/verify");

            // Gửi email
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private boolean isValidEmail(String email) {
        UserDAO udb = new UserDAO();
        // Kiểm tra email trong cơ sở dữ liệu để xác minh tính hợp lệ
        // Trả về true nếu email hợp lệ, ngược lại trả về false
        if (udb.getAnEmail(email) != null) {
            return true;
        }
        return false;
    }
        private String generateVerificationCode() {
        // Tạo mã xác nhận ngẫu nhiên
        Random random = new Random();
        int code = random.nextInt(900000) + 100000;
        return String.valueOf(code);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    

}
