/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Category;
import entity.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author doanm
 */
@WebServlet(name = "PagingControl", urlPatterns = {"/paging"})
// href = "paging?index=${i}
// c:forEach var="i" begin="1" end="${totalPage}" totalPage using session
public class PagingControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String txt = request.getParameter("trang");
        int index = 1;
        if(txt != null) index = Integer.parseInt(txt);
        
        HttpSession session = request.getSession();

        String entry="";
        String entry1 = (String)session.getAttribute("mucTin");
        String entry2 = request.getParameter("mucTin");
        System.out.println("entry1="+entry1);
        System.out.println("entry2="+entry2);
        if(entry1 == null && entry2 == null){
            entry="";
        }else if(entry1 != null && entry2 == null){
            if(txt == null) entry = "";
            else entry = entry1;
        }else if(entry1 == null && entry2 != null){
            entry = entry2;
            session.setAttribute("mucTin", entry);
        }else{// entry1.equals(entry2) or not 
            entry = entry2;
            session.setAttribute("mucTin",entry);
        }
        DAO dao = new DAO();

        if(!entry.isEmpty()){
            request.setAttribute("entry",entry);
            if(entry.equals("tin-xu-huong")){
                request.setAttribute("entryName", "Tin xu hướng");
            }
            else if(entry.equals("tin-duoc-yeu-thich")){
                request.setAttribute("entryName", "Tin được yêu thích nhất");
            }else{
                List<Category> l = dao.getAllCategories();
                for(Category c : l){
                    if(c.getCslug().equals(entry)){
                        entry = c.getCategoryID()+"";
                        request.setAttribute("entryName",c.getCname());
                        break;
                    }
                }
            }
        }
        System.out.println("entry="+entry);
        System.out.println("index="+index);
        List<Post> listP = dao.get10Posts(entry, index);
        request.setAttribute("listP", listP);
        List<Category> listC = dao.getAllCategories();
        request.setAttribute("listC", listC);
        
        request.setAttribute("totalPages", dao.getTotalPages(entry));
        
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
