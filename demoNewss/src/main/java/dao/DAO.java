/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Post;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
                        rs.getString(5),
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
                        rs.getString(5),
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
       String query = "select p.postID, p.ptitle, p.pimage,p.pcontent,p.ptime,p.plikes,p.pclicks,u.uname,c.cname\n" +
                       "FROM posts as p, users as u, categories as c\n" +
                       "WHERE p.userID = u.userID\n" +
                       "AND p.categoryID = c.categoryID\n" +
                       "AND p.postID = ? ;";
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
                       rs.getString(5),
                       rs.getInt(6),
                       rs.getInt(7),
                       rs.getString(8),
                       rs.getString(9));
           }
           close();
           return post;
       }catch(Exception e){
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
                "set ptitle = ?, pimage = ?, pcontent = ?, categoryID = ?\n" +
                "where postID = ? ;"; 
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, post.getPtitle());
            ps.setString(2, post.getPimage());
            ps.setString(3, post.getPcontent());
            ps.setInt(4, post.getCategoryID());
            ps.setString(5, postID);
            ps.executeUpdate();
            close();
        }catch(Exception e){
        }
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
    public int getTotalPages(){
        String query = "select count(*) from posts;";
        int pageCount = 1;
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){
                int postCount = rs.getInt(1);
                pageCount = postCount/10;
                if(postCount % 10 != 0){
                    pageCount++;
                }
            }
        }catch(Exception e){
        }
        return pageCount;
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

    public static void main(String[] args) {
        DAO dao = new DAO();
        System.out.println(dao.getTotalPages());
    }
}
