/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Comment {
    private int commentID;
    private String ccontent;
    private Date ctime;
    private int caccept;
    private int userID;
    private int postID;
    private String uname;

    public Comment(String ccontent, Date ctime, int caccept, int userID, int postID) {
        this.ccontent = ccontent;
        this.ctime = ctime;
        this.caccept = caccept;
        this.userID = userID;
        this.postID = postID;
    }

    public Comment() {
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
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

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    public int getCaccept() {
        return caccept;
    }

    public void setCaccept(int caccept) {
        this.caccept = caccept;
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
    
}
