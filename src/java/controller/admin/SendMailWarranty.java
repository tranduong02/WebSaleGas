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
import java.io.BufferedReader;
import java.sql.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Warranty;

/**
 *
 * @author duykh
 */
@WebServlet(name = "SendMailWarranty", urlPatterns = {"/sendmailwarranty"})
public class SendMailWarranty extends HttpServlet {

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
            out.println("<title>Servlet SendMailWarranty</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMailWarranty at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        // Đọc dữ liệu từ luồng đầu vào
        BufferedReader reader = request.getReader();
        StringBuilder stringBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }
        reader.close();

        // Chuyển đổi dữ liệu từ chuỗi JSON thành đối tượng
        Gson gson = new Gson();
        Warranty data = gson.fromJson(stringBuilder.toString(), Warranty.class);
        Date orderDate = data.getOrderDate();
        String username = data.getUsername();
        String email = data.getEmail();
        String warrantyCategory = data.getWarrantyCategory();
        int warrantyPeriod = data.getWarrantyPeriod();
        String productName = data.getProductName();
        sendConfirmationEmail(email, orderDate, username, productName, warrantyCategory, warrantyPeriod);
    }

    private void sendConfirmationEmail(String email, Date orderDate, String name, String productName, String warrantyCategory, int warrantyPeriod) {
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
                message.setSubject("Warranty Notice");

                // Đặt nội dung email
                message.setText("Dear" + name + ",\n"
                        + "\n"
                        + "  Your product's warranty will expire in 1 month, to ensure that your product always works at its best, and to enhance your shopping experience at SaleGas, we would like to send you information Details of maintenance services are as follows:\n"
                        + "\n"
                        + "- Product Name: " + productName + "\n"
                        + "- Order Date:" + orderDate + "\n"
                        + "- Warranty period:" + warrantyPeriod + "\n"
                        + "- Warranty Policy: " + warrantyCategory + "\n"
                        + "\n"
                        + "To schedule a maintenance appointment or get more detailed information, please contact SaleGas customer care team at 0966328802 or email khanhpd2402@gmail.com. We are committed to coordinating and supporting you in the best way, with time and convenience.\n"
                        + "\n"
                        + "We sincerely thank our customers for their trust and support.\n"
                        + "\n"
                        + "Best regards,\n"
                        + "SaleGas");

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
