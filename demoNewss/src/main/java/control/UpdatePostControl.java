/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Category;
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
import java.util.List;

/**
 *
 * @author doanm
 */
@WebServlet(name = "UpdatePostControl", urlPatterns = {"/tao-bai","/sua-bai"})
public class UpdatePostControl extends HttpServlet {

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
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");      
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getServletPath();
        DAO dao = new DAO();
        if(action.equals("/tao-bai")){
            List<Category> categories = dao.getAllCategories();
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/updatePost.jsp").forward(request, response);
        }
        else if(action.equals("/sua-bai")){
            String pid = request.getParameter("pid");
            Post post = dao.getPostByID(pid);
            request.setAttribute("p", post);
            request.getRequestDispatcher("/updatePost.jsp").forward(request, response);
        }
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");      
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getServletPath();
        DAO dao = new DAO();
        if(action.equals("/tao-bai")){
            int categoryID = Integer.parseInt(request.getParameter("category"));
            String title = request.getParameter("title");
            String image = request.getParameter("image");
            String content = request.getParameter("content");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int editorID = user.getUserID();
            Post post = new Post(title,image,content,categoryID, editorID);
            dao.addPost(post);
            response.sendRedirect("paging");
        }else if(action.equals("/sua-bai")){
            String pid = request.getParameter("pid");
            // lay thong tin cua bai viet moi
            int categoryID = Integer.parseInt(request.getParameter("category"));
            String title = request.getParameter("title");
            String image = request.getParameter("image");
            String content = request.getParameter("content");
            Post post = new Post(title,image,content,categoryID);
            dao.updatePost(pid,post);
            response.sendRedirect("paging");
        }
    }

    
   

}
