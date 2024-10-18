/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Comment;
import entity.Post;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author doanm
 */
public class DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private void close(){
        try{
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public List<Post> getAllPosts(){
        List<Post> list = new ArrayList<>();
        String query = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n" +
                        "from posts as p, users as u, categories as c\n" +
                        "where p.userID = u.userID\n" +
                        "and p.categoryID = c.categoryID\n" +
                        "order by p.ptime desc;";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
            close();
            return list;
        }catch(Exception e){
            
        }
        return null;
    }
    public List<Post> getPostsByCategory(String categoryID){
        List<Post> list = new ArrayList<>();
        String query =  "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n" +
                        "FROM posts as p, users as u, categories as c\n" +
                        "WHERE p.userID = u.userID\n" +
                        "AND p.categoryID = c.categoryID\n" +
                        "AND p.categoryID = ? \n" +
                        "order by p.ptime DESC;";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryID);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
            close();
            return list;
        }catch(Exception e){
            
        }
        return null;
    }
    public Post getPostByID(String id){
       String query = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
               + "FROM posts as p, users as u, categories as c\n"
               + "WHERE p.userID = u.userID\n"
               + "AND p.categoryID = c.categoryID\n"
               + "AND p.postID = ? ;";
        try{
           conn = new DBContext().getConnection();
           ps = conn.prepareStatement(query);
           ps.setString(1, id);
           rs = ps.executeQuery();
           Post post = null;
           if(rs.next()){
               post = new Post(rs.getInt(1),
                       rs.getString(2),
                       rs.getString(3),
                       rs.getString(4),
                       rs.getTimestamp(5),
                       rs.getInt(6),
                       rs.getInt(7),
                       rs.getString(8),
                       rs.getString(9));
           }
           close();
           return post;
       }catch(Exception e){
           e.printStackTrace();
       }
       return null;
    }
    public List<Post> getPostsByUserID (int userID){
        List<Post> list = new ArrayList<>();
        String query = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                + "FROM posts as p, users as u, categories as c\n"
                + "WHERE p.userID = u.userID\n"
                + "AND p.categoryID = c.categoryID \n"
                + "AND p.userID = ? \n"
                + "order by p.ptime DESC;";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
     
            while(rs.next()){
               list.add(new Post(rs.getInt(1),
                       rs.getString(2),
                       rs.getString(3),
                       rs.getString(4),
                       rs.getTimestamp(5),
                       rs.getInt(6),
                       rs.getInt(7),
                       rs.getString(8),
                       rs.getString(9)));
            }
           close();
           
       }catch(Exception e){
           e.printStackTrace();
       }
       return list;
    }
    public List<Post> getRelatedPosts(String postID, int categoryID){
        List<Post> list = new ArrayList<>();
        String query = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                + "FROM posts as p, users as u, categories as c\n"
                + "WHERE p.userID = u.userID\n"
                + "AND p.categoryID = c.categoryID \n"
                + "AND p.postID != ? \n"
                + "AND p.categoryID = ? \n"
                + "order by p.ptime DESC;";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,postID);
            ps.setInt(2, categoryID);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
            close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Post> get10Posts(String entry, int pageIndex){
        List<Post> list = new ArrayList<>();
        // phan trang home
        String query1 = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                + "from posts as p, users as u, categories as c\n"
                + "where p.userID = u.userID\n"
                + "and p.categoryID = c.categoryID\n"
                + "order by p.ptime desc\n"
                + "limit 10 offset ?;";
        // phan trang theo the loai
        String query2 = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                + "from posts as p, users as u, categories as c\n"
                + "where p.userID = u.userID\n"
                + "and p.categoryID = c.categoryID\n"
                + "and c.categoryID = ?\n"
                + "order by p.ptime desc\n"
                + "limit 10 offset ?;";
        // phan trang theo muc tin yeu thich
        String query3 = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                + "from posts as p, users as u, categories as c\n"
                + "where p.userID = u.userID\n"
                + "and p.categoryID = c.categoryID\n"
                + "order by p.plikes desc\n"
                + "limit 10 offset ?;";
        // phan trang theo muc tin xu huong
        String query4 = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                + "from posts as p, users as u, categories as c\n"
                + "where p.userID = u.userID\n"
                + "and p.categoryID = c.categoryID\n"
                + "and ptime >= now() - interval 2 week\n"
                + "order by p.pclicks desc\n"
                + "limit 10 offset ?;";
        try{
            conn = new DBContext().getConnection();
            int offset = (pageIndex-1)*10;
            if(entry.equals("")){
                ps = conn.prepareStatement(query1);
                ps.setInt(1,offset);
            }else if(Character.isDigit(entry.charAt(0))){
                ps = conn.prepareStatement(query2);
                ps.setString(1, entry);
                ps.setInt(2,offset);
            }else if(entry.equals("tin-duoc-yeu-thich")){
                ps = conn.prepareStatement(query3);
                ps.setInt(1,offset);
            }else if(entry.equals("tin-xu-huong")){
                ps = conn.prepareStatement(query4);
                ps.setInt(1,offset);
            }
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
            close();
            return list;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Post> getLikedPosts(int userID){
        String query = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                + "from posts as p, users as u, categories as c, favorites as f\n"
                + "where p.userID = u.userID\n"
                + "and p.categoryID = c.categoryID\n"
                + "and p.postID = f.postID\n"
                + "and f.userID = ? ;";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            List<Post> res = new ArrayList<>();
            while(rs.next()){
                res.add(new Post(rs.getInt(1),
                       rs.getString(2),
                       rs.getString(3),
                       rs.getString(4),
                       rs.getTimestamp(5),
                       rs.getInt(6),
                       rs.getInt(7),
                       rs.getString(8),
                       rs.getString(9)));
            }
            close();
            return res;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public void addPost(Post post){
        String query = "insert into posts (ptitle,pimage,pcontent,ptime,plikes,pclicks,userID,categoryID)\n"
                + "values (?,?,?,now(),0,0,?,?);";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, post.getPtitle());
            ps.setString(2, post.getPimage());
            ps.setString(3, post.getPcontent());
            ps.setInt(4, post.getEditorID());
            ps.setInt(5, post.getCategoryID());
            ps.executeUpdate();
            close();
        }catch(Exception e){
        }
    }
    public void updatePost(String postID, Post post){
        String query = "update posts\n" +
                "set ptitle = ?, pimage = ?, pcontent = ?, categoryID = ? \n" +
                "where postID = ? ;"; 
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            DAO dao = new DAO();
            ps.setString(1, post.getPtitle());
            ps.setString(2, post.getPimage());
            ps.setString(3, post.getPcontent());
            ps.setInt(4, dao.getCategoryIDByName(post.getCategoryName()));
            ps.setString(5, postID);
            ps.executeUpdate();
            close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void deletePost(String postID) {
        String query = "delete from posts\n"
                + "where postID = ? ;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, postID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    // CATEGORY
    public List<Category> getAllCategories(){
        List<Category> list = new ArrayList<>();
        String query = "select * from categories";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
            close();
            return list;
        }catch(Exception e){
        }
        return null;
    }
    public int getCategoryIDByName(String cname){
        String query = "select categoryID \n"
                + "from categories\n"
                + "where cname = ?; ";
        int res = 0;
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cname);
            rs = ps.executeQuery();
            if(rs.next()){
                res = rs.getInt(1);
            }
            close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return res;
    }
    public String getCategoryByID(String categoryID){
        String query = "select cname from categories\n"
                + "where categoryID = ?;";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryID);
            rs = ps.executeQuery();
            String res = null;
            if(rs.next()){
                res = rs.getString(1);
            }
            close();
            return res;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    // USERS
    public User getUserByAccount(String acc){
        String query = "SELECT * FROM users\n"
                + "where uaccount = ? ;";
        User user = null;
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, acc);
            rs = ps.executeQuery();
            if(rs.next()){
                user = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5));
            }
            close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    // SEARCH
    public List<Post> searchNPosts(int postCount, int pageIndex, String txt, String cate, String time){
        List<Post> list = new ArrayList<>();
        try{
            conn = new DBContext().getConnection();
            String query = "";
            int offset = (pageIndex-1)*postCount;
            // tim kiem tat ca chuyen muc va thoi gian
            if(cate.equals("allCates") && time.equals("allTime")){
                query = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                        + "from posts as p, users as u, categories as c\n"
                        + "where p.userID = u.userID\n"
                        + "and p.categoryID = c.categoryID\n"
                        + "and (p.ptitle like ? or p.pcontent like ?)\n"
                        + "limit ? offset ?;";
                ps = conn.prepareStatement(query);
                
                ps.setString(1, "%" + txt + "%");
                ps.setString(2, "%" + txt + "%");
                ps.setInt(3, postCount);
                ps.setInt(4, offset);
            }
            else if(cate.equals("allCates") && !time.equals("allTime")){
                query = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                        + "from posts as p, users as u, categories as c\n"
                        + "where p.userID = u.userID\n"
                        + "and p.categoryID = c.categoryID\n"
                        + "and p.ptime >= now() - interval 1 " + time + " \n"
                        + "and (p.ptitle like ? or p.pcontent like ? )\n"
                        + "limit ? offset ?;";
                ps = conn.prepareStatement(query);
                
                ps.setString(1, "%" + txt + "%");
                ps.setString(2, "%" + txt + "%");
                ps.setInt(3, postCount);
                ps.setInt(4, offset);
            }
            else if(!cate.equals("allCates") && time.equals("allTime")){
                query = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                        + "from posts as p, users as u, categories as c\n"
                        + "where p.userID = u.userID\n"
                        + "and p.categoryID = c.categoryID\n"
                        + "and p.categoryID = ?\n"
                        + "and (p.ptitle like ? or p.pcontent like ?)\n"
                        + "limit ? offset ?;";
                ps = conn.prepareStatement(query);
                ps.setString(1,cate);
                ps.setString(2, "%" + txt + "%");
                ps.setString(3, "%" + txt + "%");
                ps.setInt(4, postCount);
                ps.setInt(5, offset);
            }
            else{
                query = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n"
                        + "from posts as p, users as u, categories as c\n"
                        + "where p.userID = u.userID\n"
                        + "and p.categoryID = c.categoryID\n"
                        + "and p.categoryID = ? \n"
                        + "and p.ptime >= now() - interval 1 " + time + " \n"
                        + "and (p.ptitle like ? or p.pcontent like ?)\n"
                        + "limit ? offset ?;";
                ps = conn.prepareStatement(query);
                ps.setString(1,cate);
                ps.setString(2, "%" + txt + "%");
                ps.setString(3, "%" + txt + "%");
                ps.setInt(4, postCount);
                ps.setInt(5, offset);
            }
          
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Post(rs.getInt(1),
                       rs.getString(2),
                       rs.getString(3),
                       rs.getString(4),
                       rs.getTimestamp(5),
                       rs.getInt(6),
                       rs.getInt(7),
                       rs.getString(8),
                       rs.getString(9)));
            }
            close();
            
        }catch(Exception e){
        }
        return list;
    }
    public int[] getSearchPages(int postCount, String txt, String cate, String time){
        int pageCount = 1;
        int posts = 1;
        try{
            conn = new DBContext().getConnection();
            String query = "";
            
            // tim kiem tat ca chuyen muc va thoi gian
            if(cate.equals("allCates") && time.equals("allTime")){
                query = "select count(*) from posts\n"
                        + "where ptitle like ? or pcontent like ? ;";
                ps = conn.prepareStatement(query);
                ps.setString(1, "%" + txt + "%");
                ps.setString(2, "%" + txt + "%");
                
            }
            // tim kiem tat ca chuyen muc trong 1 khoang thoi gian
            else if(cate.equals("allCates") && !time.equals("allTime")){
                query = "select count(*) from posts\n"
                        + "where (ptitle like ? or pcontent like ?)\n"
                        + "and ptime >= now() - interval 1 " + time +";";
                ps = conn.prepareStatement(query);
                
                ps.setString(1, "%" + txt + "%");
                ps.setString(2, "%" + txt + "%");
                
            }
            // tim kiem 1 chuyen muc trong tat ca thoi gian
            else if(!cate.equals("allCates") && time.equals("allTime")){
                query = "select count(*) from posts\n"
                        + "where (ptitle like ? or pcontent like ? )\n"
                        + "and categoryID = ?;";
                ps = conn.prepareStatement(query);
              
                ps.setString(1, "%" + txt + "%");
                ps.setString(2, "%" + txt + "%");
                ps.setString(3, cate);
               
            }
            // tim kiem 1 chuyen muc trong 1 khoang thoi gian
            else{
                query = "select count(*) from posts\n"
                        + "where (ptitle like ? or pcontent like ? )\n"
                        + "and ptime >= now() - interval 1 " +time + " \n"
                        + "and categoryID = ?;";
                ps = conn.prepareStatement(query);
              
                ps.setString(1, "%" + txt + "%");
                ps.setString(2, "%" + txt + "%");
                ps.setString(3, cate);
            }
          
            rs = ps.executeQuery();
            while(rs.next()){
                posts = rs.getInt(1);
                pageCount = posts/postCount;
                if(posts % postCount != 0){
                    pageCount++;
                }
            }
            close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return new int[]{pageCount,posts};
    }
    
    
    
    
    public void like(int userID, String postID){
        String check = "select * from favorites\n"
                + "where userID = ?\n"
                + "and postID = ?;";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(check);
            ps.setInt(1, userID);
            ps.setString(2,postID);
            rs = ps.executeQuery();
            if(!rs.next()){
                String query1 = "insert into favorites\n"
                        + "values (?,?);";
                String query2 = "update posts\n"
                        + "set plikes = plikes + 1\n"
                        + "where postID = ?;";
                
                // cap nhat bang favorites
                ps = conn.prepareStatement(query1);
                ps.setInt(1, userID);
                ps.setString(2, postID);
                ps.executeUpdate();

                // cap nhat bang post
                ps = conn.prepareStatement(query2);
               
                ps.setString(1, postID);
                ps.executeUpdate();
                
            }
            close();
        }catch (Exception e) {
        }
    }
    public void unlike(int userID, String postID){
        String query1 = "delete from favorites \n"
                + "where userID = ? and postID = ? ;";
        String query2 = "update posts\n"
                + "set plikes = plikes - 1\n"
                + "where postID = ? ;";
        try{
                conn = new DBContext().getConnection();
                // cap nhat bang favorites
                ps = conn.prepareStatement(query1);
                ps.setInt(1, userID);
                ps.setString(2, postID);
                ps.executeUpdate();

                // cap nhat bang post
                ps = conn.prepareStatement(query2);
                ps.setString(1, postID);
                ps.executeUpdate();
        }catch(Exception e){
        }
    }    
    public void click(String postID){
        String query = "update posts\n" +
                "set pclicks = pclicks + 1\n" +
                "where postID = ? ;";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, postID);
            ps.executeUpdate();
            close();
        }catch(Exception e){
            
        }
    }
    public int getTotalPages(String entry){
        String query = "";
        if(entry.isEmpty() || entry.equals("tin-duoc-yeu-thich"))
            query = "select count(*) from posts;";
        else if(entry.equals("tin-xu-huong"))
            query = "select count(*) from posts\n"
                    + "where ptime >= now() - interval 2 week;";
        else
            query = "select count(*) from posts\n"
                    + "where categoryID = ?;";
       
        int pageCount = 1;
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            if(!entry.isEmpty() && Character.isDigit(entry.charAt(0))) ps.setString(1,entry);
            rs = ps.executeQuery();
            if(rs.next()){
                int postCount = rs.getInt(1);
                pageCount = postCount/10;
                if(postCount % 10 != 0){
                    pageCount++;
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return pageCount;
    }
    // COMMENT
    public boolean insertComment(Comment comment) {
        try {
            String query = "INSERT INTO comments (ccontent, ctime, userID, postID) \n"
                    + "VALUES (?, now(), ?, ?); ";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, comment.getCcontent());
            ps.setInt(2, comment.getUserID());
            ps.setInt(3, comment.getPostID());

            // Thực thi câu lệnh và in ra log để kiểm tra số hàng được thêm
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;

        } catch (Exception e) {

        }
        return false;
    }
    public List<Comment> getCommentsByPostID(String postID) {
        List<Comment> list = new ArrayList<>();
        try{
            String query = "SELECT  c.commentID,c.ccontent,c.ctime, u.uname, u.userID, c.postID \n"
                    + "FROM news.comments c JOIN news.users u \n"
                    + "ON c.userID = u.userID \n"
                    + "WHERE c.postID = ?;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, postID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt(1),
                        rs.getString(2),
                        rs.getTimestamp(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6)));
            }
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Comment> getCommentsByUserID(int userID){
        String query = "SELECT  c.commentID,c.ccontent,c.ctime, u.uname, u.userID, c.postID \n"
                + "FROM news.comments c JOIN news.users u \n"
                + "ON c.userID = u.userID \n"
                + "WHERE c.userID = ? ;";
        List<Comment> list = new ArrayList<>();
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt(1),
                        rs.getString(2),
                        rs.getTimestamp(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6)));
            }
            close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    
    //login, signup
    public User login(String acc, String pass){
        String query = "select * from users \n"
                    + " where uaccount = ?\n"
                    + " AND upassword = ?\n";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, acc);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            User user = null;
            if(rs.next()){
                user = new User(rs.getInt(1), 
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5));
            }
            close();
            return user;
        }catch (Exception e){
            
        }
        return null;
    }
    public void signup(User user){
        String query = "insert into users (uaccount,upassword,uname,ueditor)\n"
                + "values (?,?,?,0)\n";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,user.getUaccount());
            ps.setString(2,user.getUpassword());
            ps.setString(3,user.getUname());
            ps.executeUpdate();
            close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public User checkUserExist(String acc) {
        String query = "select * from users\n"
                + "where uaccount = ?\n";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, acc);
            rs = ps.executeQuery();
            User user = null;
            if (rs.next()){
                user =  new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5));
            }
            close();
            return user;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public Timestamp getTime(){
        String q = "select ptime from posts where postID = 9";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(q);
            rs = ps.executeQuery();
            if(rs.next()){
                return rs.getTimestamp(1);
            }
        }catch (Exception e){
        }
        return null;
    }
    public static void main(String[] args) {
        DAO dao = new DAO();
//        Timestamp timestamp = dao.getTime();
//        System.out.println("Timestamp: " + timestamp);

        // Convert to java.time.LocalDateTime (Java 8+)
//        LocalDateTime localDateTime = timestamp.toLocalDateTime();
//        System.out.println("LocalDateTime: " + localDateTime);
//        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
//        System.out.println(sdf.format(timestamp));
//        
//        Locale vietnam = new Locale.Builder().setLanguage("vi").setRegion("VN").build();
//        sdf = new SimpleDateFormat("EEEE", vietnam);
//        System.out.println(sdf.format(timestamp));
//        List<Post> l = dao.get10Posts("tin-duoc-yeu-thich",2);
//        for(Post p:l){
//            System.out.println(p.getPtitle());
//        }
//          List<Post> l = dao.searchNPosts(7,1,"t","4","week");
//          
//          for(Post p:l){
//              System.out.println(p.getPtitle());
//          }
//          System.out.println(dao.getSearchPages(7, "t", "4", "week"));
        
//        List<Comment> l = dao.getCommentsByUserID(2);
//        for(Comment x : l){
//            System.out.println(x.getCcontent());
//        }
           List<Post> l = dao.getPostsByUserID(8);
           System.out.println(l.size());
    } 
}
