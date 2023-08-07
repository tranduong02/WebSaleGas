/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.xml.bind.DatatypeConverter;
import model.Employee;

/**
 *
 * @author duykh
 */
public class EmployeeDAO extends DBContext {

    public boolean checkEmployeeToLogin(String xEmployeename, String xPassword) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(xPassword.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter
                .printHexBinary(digest).toUpperCase();
        String sql = "select Employeename, [password] from [Employee] where Employeename = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xEmployeename);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getString("Employeename").equals(xEmployeename) & rs.getString("password").equals(myHash)) {

                    return true;
                }
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void insertEmployee(Employee em) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(em.getPassword().getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter
                .printHexBinary(digest).toUpperCase();
        String sql = "insert into [Employee] (Employeename, password, firstName, lastName, email, phoneNumber, [address], [role]) values (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, em.getEmployeename());
            st.setString(2, myHash);
            st.setString(3, em.getFirstName());
            st.setString(4, em.getLastName());
            st.setString(5, em.getEmail());
            st.setString(6, em.getPhoneNumber());
            st.setString(7, em.getAddress());
            st.setInt(8, em.getRole());
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

 
    public Employee getAnEmployee(String xEmployeename, String xEmail, String xPhoneNumber) {
        String sql = "SELECT [EmployeeID]\n"
                + "      ,[Employeename]\n"
                + "      ,[password]\n"
                + "      ,[firstName]\n"
                + "      ,[lastName]\n"
                + "      ,[email]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[address]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Employee] where Employeename = ? or email = ? or phoneNumber = ?";

        Employee em = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xEmployeename);
            st.setString(2, xEmail);
            st.setString(3, xPhoneNumber);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                em = new Employee(
                        rs.getInt("EmployeeID"),
                        rs.getInt("role"),
                        rs.getString("Employeename"),
                        rs.getString("password"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getString("address"));
                return em;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return (em);
    }
    
    public Employee getEmployeeToAddSession(String xEmployeename) {
        String sql = "SELECT [EmployeeID]\n"
                + "      ,[Employeename]\n"
                + "      ,[firstName]\n"
                + "      ,[lastName]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[Employee] where Employeename = ? ";

        Employee em = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xEmployeename);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                 em = new Employee(
                        rs.getInt("EmployeeID"),
                        rs.getInt("role"),
                        rs.getString("Employeename"),
                        rs.getString("firstName"),
                        rs.getString("lastName"));
                return em;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return (em);
    }
    
}
