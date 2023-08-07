/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.OutputStream;
import java.util.List;

import model.LineChart;

//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author duykh
 */
@WebServlet(name="DownloadStatisticServlet", urlPatterns={"/downloadstatistic"})
public class DownloadStatisticServlet extends HttpServlet {
   
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
            out.println("<title>Servlet DownloadStatisticServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DownloadStatisticServlet at " + request.getContextPath () + "</h1>");
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
//         OrderDAO od = new OrderDAO();
//        List<LineChart> list = od.getDataChart();
//        
//        OutputStream outputStream;
//        try ( // Tạo workbook và sheet mới cho file Excel
//                XSSFWorkbook workbook = new XSSFWorkbook()) {
//            XSSFSheet sheet = workbook.createSheet(" Statistic_Product_Full");
//            Row headerRow = sheet.createRow(0);
//            Cell headerCellProductName = headerRow.createCell(0);
//            headerCellProductName.setCellValue("Date");
//            Cell headerCellPrice = headerRow.createCell(1);
//            headerCellPrice.setCellValue("Total money");
//            // Ghi dữ liệu sản phẩm vào file Excel
//            int rowNumber = 1;
//            for (LineChart l : list) {
//                Row row = sheet.createRow(rowNumber++);
//                
//                Cell cellProductName = row.createCell(0);
//                cellProductName.setCellValue(l.getDate());
//                
//                Cell cellPrice = row.createCell(1);
//                cellPrice.setCellValue(l.getMoney());
//            }   // Thiết lập các header và thông tin file
//            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
//            response.setHeader("Content-Disposition", "attachment; filename=product_price.xlsx");
//            // Ghi workbook vào OutputStream để tải về
//            outputStream = response.getOutputStream();
//            workbook.write(outputStream);
//        }
//        outputStream.close();
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
        processRequest(request, response);
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
