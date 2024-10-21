/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Category;
import entity.Comment;
import entity.Post;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author doanm
 */
@WebServlet(name = "AccountControl", urlPatterns = {"/tai-khoan"})
public class AccountControl extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String muc = request.getParameter("muc");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        DAO dao = new DAO();
        if(muc.equals("thong-tin")){
            request.getRequestDispatcher("acc_info.jsp").forward(request,response);
        }
        else if(muc.equals("binh-luan")){
            List<Comment> comments = dao.getCommentsByUserID(user.getUserID());
            
            request.setAttribute("comments", comments);
            request.getRequestDispatcher("acc_comment.jsp").forward(request,response);
        }
        else if(muc.equals("yeu-thich")){
            List<Post> likedPosts = dao.getLikedPosts(user.getUserID());
            request.setAttribute("likedPosts", likedPosts);
            request.getRequestDispatcher("acc_likedPosts.jsp").forward(request,response);
        }
        else if(muc.equals("bai-viet")){
            List<Post> posts = dao.getPostsByUserID(user.getUserID());
            request.setAttribute("posts", posts);
            request.getRequestDispatcher("acc_posts.jsp").forward(request,response);
        }
        else if(muc.equals("chuyen-muc")){
            List<Category> categories = dao.getAllCategories();
            request.setAttribute("categories",categories);
            request.getRequestDispatcher("acc_categories.jsp").forward(request,response);
        }
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
