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
import model.User;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import java.util.Random;

/**
 *
 * @author duykh
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/signup"})
public class SignUpServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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
//        processRequest(request, response);
        String uname = request.getParameter("uname");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        UserDAO udb = new UserDAO();
        HttpSession session = request.getSession();
        try {
            User u = udb.getAnUser(uname, email, phone);
            if (u != null) {
                if (u.getUsername().equals(uname)) {
                    request.setAttribute("errorusername", "Tên đăng nhập đã tồn tại!");
                }
                if (u.getEmail().equals(email)) {
                    request.setAttribute("erroremail", "Email đã được sử dụng!");
                }
                if (u.getPhoneNumber().equals(phone)) {
                    request.setAttribute("errorphone", " Số điện thoại đã được sử dụng!");
                }
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else {
                User uNew = new User(uname, pass, fname, lname, email, phone, address);
                session.setAttribute("insertuser", uNew);
                String verificationCode = generateVerificationCode();

                // Lưu mã xác nhận vào session
                session.setAttribute("verification", verificationCode);
                session.setMaxInactiveInterval(300);

                // Gửi email chứa mã xác nhận đến người dùng
                sendConfirmationEmail(email, verificationCode);
                response.sendRedirect("verifysignup");
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    private void sendConfirmationEmail(String email, String verificationCode) {
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
            // Check if the email address is not null or empty
            if (email != null && !email.isEmpty()) {
                // Tạo đối tượng MimeMessage
                Message message = new MimeMessage(session);

                // Đặt thông tin người gửi
                message.setFrom(new InternetAddress("WebSaleGas"));

                // Đặt thông tin người nhận
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));

                // Đặt tiêu đề email
                message.setSubject("Registration Verification");

                // Đặt nội dung email
                message.setText("WebSaleGas-Group3, Hello! \nYour verification code is:  " + verificationCode + "  Verification code will expire in 5 minutes." + "\nPlease click the following link to verify your account:   http://localhost:9999/salegas/verify");

                // Gửi email
                Transport.send(message);
            } else {
                // Handle the case when the email address is null or empty
                System.out.println("Invalid email address.");
            }
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private String generateVerificationCode() {
        // Tạo mã xác nhận ngẫu nhiên
        Random random = new Random();
        int code = random.nextInt(900000) + 100000;
        return String.valueOf(code);
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
