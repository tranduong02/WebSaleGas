/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.News;

/**
 *
 * @author duykh
 */
public class NewsDAO extends DBContext {

    private static final String DELETE_NEWS_COMMAND = "DELETE FROM [dbo].[News]\n"
            + "      WHERE [newsID] = ?";
    private static final String SELECT_NEWS_QUERY = "SELECT [newsID]\n"
            + "      ,[EmployeeID]\n"
            + "      ,[newsTitle]\n"
            + "      ,[newContent]\n"
            + "      ,[image]\n"
            + "      ,[dateUpload]\n"
            + "  FROM [dbo].[News]\n";
    private static final String SELECT_TOP_NEWS_QUERY = "SELECT TOP ? [newsID]\n"
            + "      ,[EmployeeID]\n"
            + "      ,[newsTitle]\n"
            + "      ,[newContent]\n"
            + "      ,[image]\n"
            + "      ,[dateUpload]\n"
            + "  FROM [dbo].[News]\n";

   public void add(News news) {
    try (PreparedStatement st = connection.prepareStatement("INSERT INTO [gasManagement].[dbo].[News] ([EmployeeID], [newsTitle], [tagname], [newContent], [image], [DateUpload], [isVisible], [parentNewsID]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")) {
        st.setInt(1, news.getEmployeeId());
        st.setString(2, news.getNewsTitle());
        st.setString(3, news.getTagname());
        st.setString(4, news.getNewsContent());
        st.setString(5, news.getImage());
        st.setDate(6, news.getDateUpload());
        st.setBoolean(7, news.isIsVisible());
        st.setInt(8, news.getNewParentId());
        st.executeUpdate();
    } catch (SQLException ex) {
        Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
}


    public void update(News news) {
        String sql = "UPDATE [gasManagement].[dbo].[News] "
                + "SET [tagname] = ?, "
                + "[newsTitle] = ?, "
                + "[newContent] = ?, "
                + "[parentNewsID] = ?, "
                + "[isVisible] = ?, "
                + "[image] = ?, "
                + "[DateUpload] = ? "
                + "WHERE [newsID] = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, news.getTagname());
            st.setString(2, news.getNewsTitle());
            st.setString(3, news.getNewsContent());
            st.setInt(4, news.getNewParentId());
            st.setBoolean(5, news.isIsVisible());
            st.setString(6, news.getImage());
            st.setDate(7, news.getDateUpload());
            st.setInt(8, news.getNewsId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int newsId) {
        try ( PreparedStatement st = connection.prepareStatement(DELETE_NEWS_COMMAND)) {
            st.setInt(1, newsId);
            st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<String> getNewsByTagName(String tagname) {
        String sql = "SELECT [newsTitle] FROM [gasManagement].[dbo].[News] WHERE tagname LIKE '%" + tagname + "%'";
        List<String> list = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
//            st.setString(1, tagname);           
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("newsTitle"));
            }
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<String> getTagName() {
        String sql = "SELECT DISTINCT CONVERT(nvarchar(max), tagname) AS tagname FROM [gasManagement].[dbo].[News]";
        List<String> list = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
//            st.setString(1, tagname);           
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("tagname"));
            }
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public String getTitleByID(int newId) {
        String sql = "SELECT newsTitle FROM [gasManagement].[dbo].[News] WHERE newsID =?";
        String title = null;
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, newId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                title = rs.getString("newsTitle");
            }
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return title;
    }

    public List<Integer> getNewId() {
        String sql = "SELECT newsID FROM [gasManagement].[dbo].[News]";
        List<Integer> listid = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listid.add(rs.getInt("newsID"));
            }
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listid;
    }

    public List<News> getNews() {
        String sql = "SELECT newsID,newsTitle,tagname,[isVisible] FROM [gasManagement].[dbo].[News]";
        List<News> list = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt("newsID"));
                n.setNewsTitle(rs.getString("newsTitle"));
                n.setTagname(rs.getString("tagname"));
                n.setIsVisible(rs.getBoolean("isVisible"));
                list.add(n);
            }
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public News getNewById(int newId) {
        String sql = "SELECT * FROM [gasManagement].[dbo].[News] WHERE [newsID]=?";
        News news = new News();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, newId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                news.setNewsId(rs.getInt("newsID"));
                news.setNewsTitle(rs.getString("newsTitle"));
                news.setTagname(rs.getString("tagname"));
                news.setIsVisible(rs.getBoolean("isVisible"));
                news.setDateUpload(rs.getDate("DateUpload"));
                news.setEmployeeId(rs.getInt("EmployeeID"));
                news.setImage(rs.getString("image"));
                news.setNewsContent(rs.getString("newContent"));
                news.setNewParentId(rs.getInt("parentNewsID"));

            }
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return news;
    }

    public static void main(String[] args) {
        NewsDAO nd = new NewsDAO();
        LocalDate currentDate = LocalDate.now();
        Date DateUpload = Date.valueOf(currentDate);
//        News n1 = new News(6, 1, "jhdsghjk", "hdsgfhjshdgj", "sdgfhsgj", DateUpload, "jhdsfghsdg", true);

//        nd.update(n1);
//        System.out.println(nd.getNewsByTagName("topbar"));
nd.delete(5);
    }
//    public News getById(int newsId) {
//        String sql = SELECT_NEWS_QUERY + "WHERE [newsID] = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, newsId);
//            ResultSet rs = st.executeQuery();
//            
//            if (rs.next()) {
//                News news = new News(
//                        rs.getInt("[newsID]"),
//                        rs.getInt("[EmployeeID]"),
//                        rs.getString( "[newsTitle]"),
//                        rs.getString("[newContent]"),
//                        rs.getDate("[dateUpload]"),
//                        rs.getString("[image]"));
//                st.close();
//                
//                return news;
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return null;
//    }

//    public List<News> getTopNews(int number, String rankedBy) {
//        List<News> newsList = new ArrayList<>();
//        String sql = SELECT_TOP_NEWS_QUERY +
//                "ORDER BY " + rankedBy;
//        try (PreparedStatement st = connection.prepareStatement(sql)) {
//            st.setInt(1, number);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                News news = new News(
//                        rs.getInt("[newsID]"),
//                        rs.getInt("[EmployeeID]"),
//                        rs.getString( "[newsTitle]"),
//                        rs.getString("[newContent]"),
//                        rs.getDate("[dateUpload]"),
//                        rs.getString("[image]"));
//                newsList.add(news);
//            }
//            st.close();
//            
//            return newsList;
//        } catch (SQLException ex) {
//            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return null;
//    }
}
