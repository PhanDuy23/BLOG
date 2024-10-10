/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import util.URLSlug;

/**
 *
 * @author doanm
 */
public class Category implements Serializable{
    private int categoryID;
    private String cname;
    private String cslug;
    public Category(){
    }
    public Category(int categoryID, String cname) {
        this.categoryID = categoryID;
        this.cname = cname;
        this.cslug = URLSlug.generateSlug(cname,"");
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCslug() {
        return cslug;
    }

    public void setCslug(String cslug) {
        this.cslug = cslug;
    }
    
    @Override
    public String toString() {
        return "Category{" + "categoryID=" + categoryID + ", cname=" + cname + ", cslug=" + cslug + '}';
    }
    
}
