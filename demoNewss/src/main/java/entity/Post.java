/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import dao.DAO;
import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Locale;
import util.URLSlug;

/**
 *
 * @author doanm
 */
public class Post implements Serializable{
    private int postID;
    private String ptitle;
    private String pimage;
    private String pcontent;
    private Timestamp ptime;
    private int pclicks;
    private int plikes;
    private String editorName;
    private String categoryName;
    private String pslug;
    private int editorID;
    private int categoryID;
    public Post() {
    }
    // dung khi lay du lieu
    public Post(int postID, String ptitle, String pimage, String pcontent, Timestamp ptime, int plikes, int pclicks, String editorName, String categoryName) {
        this.postID = postID;
        this.ptitle = ptitle;
        this.pimage = pimage;
        this.pcontent = pcontent;
        this.ptime = ptime;
        this.pclicks = pclicks;
        this.plikes = plikes;
        this.editorName = editorName;
        this.categoryName = categoryName;
        this.pslug = URLSlug.generateSlug(this.ptitle, this.postID+"");
        DAO dao = new DAO();
        this.categoryID = dao.getCategoryIDByName(this.categoryName);
        this.editorID = dao.getEditorIDByPostID(this.postID);
    }
    // dung khi tao bai viet moi
    public Post(String title, String image, String content, int categoryID, int editorID){
        this.ptitle = title;
        this.pimage = image;
        this.pcontent = content;
        this.categoryID = categoryID;
        this.editorID = editorID;
    }
    // dung khi sua bai viet
    public Post(String title, String image, String content, int categoryID){
        this.ptitle = title;
        this.pimage = image;
        this.pcontent = content;
        this.categoryID = categoryID;
        
    }
    public String getDayOfWeek() {
        if (this.ptime == null) {
            return "N/A"; // hoặc một giá trị mặc định khác
        }
        Locale vietnam = new Locale.Builder().setLanguage("vi").setRegion("VN").build();
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE", vietnam);
        return sdf.format(this.ptime);
    }

    public String getFormattedPtime() {
        if (this.ptime == null) {
            return "N/A"; // hoặc một giá trị mặc định khác
        }
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        return sdf.format(ptime);
    }
    public String getDescription(){
        if(pcontent.contains("\n")) return pcontent.substring(0,pcontent.indexOf("\n"));
        if(pcontent.matches(".*[.!?].*")){
            int i1 = pcontent.indexOf("."), i2 = pcontent.indexOf("?"), i3 = pcontent.indexOf("!");
            int idx = pcontent.length();
            if(i1 != -1 && idx > i1) idx = i1;
            if(i2 != -1 && idx > i2) idx = i2;
            if(i3 != -1 && idx > i3) idx = i3;
            return pcontent.substring(0,idx+1);
        }
        return pcontent;
    }
    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getEditorName() {
        return editorName;
    }

    public void setEditorName(String editorName) {
        this.editorName = editorName;
    }

    
    
    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public Timestamp getPtime() {
        return ptime;
    }

    public void setPtime(Timestamp ptime) {
        this.ptime = ptime;
    }

    public int getPclicks() {
        return pclicks;
    }

    public void setPclicks(int pclicks) {
        this.pclicks = pclicks;
    }

    public int getPlikes() {
        return plikes;
    }

    public void setPlikes(int plikes) {
        this.plikes = plikes;
    }
    
    public String getPslug() {
        return pslug;
    }

    public void setPslug(String pslug) {
        this.pslug = pslug;
    }

    public int getEditorID() {
        return editorID;
    }

    public void setEditorID(int editorID) {
        this.editorID = editorID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
    
    @Override
    public String toString() {
        return "Post{" + "postID=" + postID + ", ptitle=" + ptitle + ", pimage=" + pimage + ", pcontent=" + pcontent + ", ptime=" + ptime + ", pclicks=" + pclicks + ", plikes=" + plikes + ", editorName=" + editorName + ", categoryName=" + categoryName + ", slug=" +pslug +'}';
    }
}
