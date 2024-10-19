/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.*;
import entity.Comment;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author doanm
 */
@WebServlet(name = "CommentControl", urlPatterns = {"/binh-luan"})
public class CommentControl extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // lấy user từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Nếu user không có trong session, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy dữ liệu từ và request
       
        String content = request.getParameter("comment");
        int postID = Integer.parseInt(request.getParameter("postID"));

        // In ra log để kiểm tra giá trị nhận được
        System.out.println("Bình luận: " + content);
        System.out.println("Post ID: " + postID);
        
        Comment cmt = new Comment(content,user.getUserID(), postID);

        // Tạo đối tượng DAO và thêm bình luận
        DAO dao = new DAO();
        boolean result = dao.insertComment(cmt);
        
        String url = "post/" + dao.getPostByID(postID+"").getPslug();
        response.sendRedirect(url);
    }

    
    @Override
    // gọi đến trang sửa và xoá bình luận
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action =  request.getParameter("action");
        if(action == null){
            action = "update";
        }
        DAO dao = new DAO();
        if(action.equals("update")){
            HttpSession ss = request.getSession();
            String pslug = request.getParameter("pslug");
            String cid = request.getParameter("cid");
            ss.setAttribute("updateComment", true);
            ss.setAttribute("Comment", dao.getCommentByID(cid));
            request.getRequestDispatcher("post/"+pslug).forward(request, response);
        }
        else {
            String cid = request.getParameter("cid");
            dao.deleteComment(cid);
            response.sendRedirect("tai-khoan?muc=binh-luan");
        }
        
    }

    
    @Override
    // đăng và cập nhật bình luận
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "add";
        }
        DAO dao = new DAO();
        if(action.equals("add")){
            // lấy user từ session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                // Nếu user không có trong session, chuyển hướng đến trang đăng nhập
                response.sendRedirect("login.jsp");
                return;
            }

            // Lấy dữ liệu từ và request

            String content = request.getParameter("comment");
            int postID = Integer.parseInt(request.getParameter("postID"));

            // In ra log để kiểm tra giá trị nhận được
            System.out.println("Bình luận: " + content);
            System.out.println("Post ID: " + postID);

            Comment cmt = new Comment(content,user.getUserID(), postID);

            // Tạo đối tượng DAO và thêm bình luận
            
            boolean result = dao.insertComment(cmt);

            String url = "post/" + dao.getPostByID(postID+"").getPslug();
            response.sendRedirect(url);
        }
        else if (action.equals("update")){
            HttpSession ss = request.getSession();
            Comment cmt = (Comment)ss.getAttribute("Comment");
            ss.removeAttribute("Comment");
            ss.removeAttribute("updateComment");
            
            cmt.setCcontent(request.getParameter("comment"));
            dao.updateComment(cmt);
            
            String pslug = dao.getPostByID(request.getParameter("postID")).getPslug();
            response.sendRedirect("post/"+pslug);
        }
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
