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
public class User implements Serializable{
    private int userID;
    private String uaccount;
    private String upassword;
    private String uname;
    private boolean ueditor;

    public User(String uaccount, String upassword, String uname) {
        this.uaccount = uaccount;
        this.upassword = upassword;
        this.uname = uname;
    }
    public User(int userID, String uaccount, String upassword, String uname, boolean ueditor) {
        this.userID = userID;
        this.uaccount = uaccount;
        this.upassword = upassword;
        this.uname = uname;
        this.ueditor = ueditor;
    }
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUaccount() {
        return uaccount;
    }

    public void setUaccount(String uaccount) {
        this.uaccount = uaccount;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public boolean isUeditor() {
        return ueditor;
    }

    public void setUeditor(boolean ueditor) {
        this.ueditor = ueditor;
    }
    
}
