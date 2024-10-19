/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import dao.DAO;
import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author doanm
 */
public class Comment implements Serializable{
    private int commentID;
    private String ccontent, userName;
    private int userID, postID;
    private Timestamp ctime;
    
    // khi lấy bình luận từ csdl
    public Comment(int commentID, String ccontent, Timestamp ctime, String userName, int userID, int postID) {
        this.commentID = commentID;
        this.ccontent = ccontent;
        this.ctime = ctime;
        this.userName = userName;
        this.userID = userID;
        this.postID = postID;
    }
    // khi đăng bình luận
    public Comment(String ccontent, int userID, int postID) {
        this.ccontent = ccontent;
        this.userID = userID;
        this.postID = postID;
    }
    public String getDayOfWeek() {
        if (this.ctime == null) {
            return "N/A"; // hoặc một giá trị mặc định khác
        }
        Locale vietnam = new Locale.Builder().setLanguage("vi").setRegion("VN").build();
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE", vietnam);
        return sdf.format(this.ctime);
    }

    public String getFormattedCtime() {
        if (this.ctime == null) {
            return "N/A"; // hoặc một giá trị mặc định khác
        }
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        return sdf.format(ctime);
    }

    public Post getPost() {
        DAO dao = new DAO();
        Post post = dao.getPostByID(postID+"");
        return post;
    }

    
    
    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public String getCcontent() {
        return ccontent;
    }

    public void setCcontent(String ccontent) {
        this.ccontent = ccontent;
    }

    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Timestamp ctime) {
        this.ctime = ctime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }
    public static void main(String[] args) {
//        Locale vietnam = new Locale.Builder().setLanguage("vi").setRegion("VN").build();
//        SimpleDateFormat sdf = new SimpleDateFormat("EEEE", vietnam);
//        Date d = new Date("2024-07-12 12:12:12")
//        String wd = sdf.format();
//        
//        sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
//        String date = sdf.format("2024-07-12 12:12:12");
//        
//        System.out.println(wd + " " + date);
        
    }
    
}
