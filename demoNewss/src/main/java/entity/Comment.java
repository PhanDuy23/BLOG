/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;

/**
 *
 * @author doanm
 */
public class Comment implements Serializable{
    private int commentID;
    private String ccontent, ctime, userName;
    private int userID, postID;

    public Comment(int commentID, String ccontent, String ctime, String userName, int userID, int postID) {
        this.commentID = commentID;
        this.ccontent = ccontent;
        this.ctime = ctime;
        this.userName = userName;
        this.userID = userID;
        this.postID = postID;
    }

    public Comment(String ccontent, int userID, int postID) {
        this.ccontent = ccontent;
        this.userID = userID;
        this.postID = postID;
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

    public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
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
    
    
}
