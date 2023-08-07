/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;
import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * /**
 *
 * @author duykh
 */
public class UserDAO extends DBContext {

    public boolean checkUserToLogin(String xUsername, String xPassword) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(xPassword.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter
                .printHexBinary(digest).toUpperCase();
        String sql = "select username, [password] from [User] where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xUsername);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getString("username").equals(xUsername) & rs.getString("password").equals(myHash)) {

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

    public String getAnEmail(String xEmail) {
        String sql = "select email from [user] where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xEmail);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String email = rs.getString("email");
                return email;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertUser(User u) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(u.getPassword().getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter
                .printHexBinary(digest).toUpperCase();
        String sql = "insert into [User] (username, password, firstName, lastName, email, phoneNumber, [address]) values (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, myHash);
            st.setString(3, u.getFirstName());
            st.setString(4, u.getLastName());
            st.setString(5, u.getEmail());
            st.setString(6, u.getPhoneNumber());
            st.setString(7, u.getAddress());
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<User> getStatisticUser(int status) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [userID],[username]\n"
                + "                     ,[firstName]\n"
                + "                     ,[lastName]\n"
                + "                    ,[email]\n"
                + "                      ,[phoneNumber]\n"
                + "                    ,[address]\n"
                + "                      ,[status]\n"
                + "                  FROM [dbo].[User] where [status] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("userID"),
                        rs.getString("username"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getString("address"),
                        rs.getInt("status"));
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }


    public int getQuantityNewUser() {
        int quantity = 0;
        String sql = "SELECT COUNT([userID]) quantity From [dbo].[User] where [status] = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (Exception e) {
        }
        return quantity;
    }

    public int getQuantityUsingUser() {
        int quantity = 0;
        String sql = "SELECT COUNT([userID]) quantity From [dbo].[User] where [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (Exception e) {
        }
        return quantity;
    }

    public int getQuantityUsedUser() {
        int quantity = 0;
        String sql = "SELECT COUNT([userID]) quantity From [dbo].[User] where [status] = 2";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (Exception e) {
        }
        return quantity;
    }

    public User getAnUser(String xUsername, String xEmail, String xPhoneNumber) {
        String sql = "SELECT [userID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[firstName]\n"
                + "      ,[lastName]\n"
                + "      ,[email]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[address]\n"
                + "      ,[status]\n"
                + "      ,[discount]\n"
                + "  FROM [dbo].[User] where username = ? or email = ? or phoneNumber = ?";

        User u = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xUsername);
            st.setString(2, xEmail);
            st.setString(3, xPhoneNumber);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                u = new User(rs.getInt("userID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getString("address"),
                        rs.getInt("status"),
                        rs.getFloat("discount"));
                return u;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return (u);
    }

    public User getUserToAddSession(String xUsername) {
        String sql = "SELECT [userID]\n"
                + "      ,[username]\n"
                + "      ,[firstName]\n"
                + "      ,[lastName]\n"
                + "  FROM [dbo].[User] where username = ? ";

        User u = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xUsername);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                u = new User(rs.getInt("userID"),
                        rs.getString("username"),
                        rs.getString("firstName"),
                        rs.getString("lastName"));
                return u;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return (u);
    }

    public void updatePass(String xEmail, String xPass) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(xPass.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter
                .printHexBinary(digest).toUpperCase();
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
                + " WHERE [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, myHash);
            st.setString(2, xEmail);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateUser(User u) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [username] = ?\n"
                + "      ,[firstName] = ?\n"
                + "      ,[lastName] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phoneNumber] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getFirstName());
            st.setString(3, u.getLastName());
            st.setString(4, u.getEmail());
            st.setString(5, u.getPhoneNumber());
            st.setString(6, u.getAddress());
            st.setInt(7, u.getUserID());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
