/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;
import java.text.Normalizer;

/**
 *
 * @author doanm
 */
public class URLSlug {
    public static String generateSlug(String title, String id) {
        // Normalize string (remove accents and special characters)
        
        String normalized = Normalizer.normalize(title, Normalizer.Form.NFKD)// decomposed accented characters into base characters and diacritical marks
                                      .replaceAll("[^\\p{ASCII}]", "") // non-ASCII character to ""
                                      .toLowerCase();
        //System.out.println(normalized);
        // Replace spaces with hyphens and remove any non-alphanumeric characters
        String slug = normalized.replaceAll("[\\s+]", "-")
                                .replaceAll("[^a-z0-9-]", "");
        if(id.isEmpty()) return slug;
        return slug + "-" + id;
    }
    public static void main(String[] args) {
        String msg = "Lễ đón Tổng Bí thư, Chủ tịch nước Tô Lâm thăm chính thức Cộng hòa Pháp";
        System.out.println(generateSlug(msg,""));
    }
}
