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
import java.util.List;

/**
 *
 * @author doanm
 */
@WebServlet(name = "CategoryControl", urlPatterns = {"/them-muc","/sua-muc","/xoa-muc"})
public class CategoryControl extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();
        DAO dao = new DAO();
        if(action.equals("/them-muc")){
            response.sendRedirect("updateCategories.jsp");
        }
        else if(action.equals("/sua-muc")){
            String cid = request.getParameter("cid");
            Category cate = dao.getCategoryByID(cid);
            request.setAttribute("category",cate);
            request.getRequestDispatcher("updateCategories.jsp").forward(request,response);
        }
        else if(action.equals("/xoa-muc")){
            String cid = request.getParameter("cid");
            dao.deleteCategory(cid);
            response.sendRedirect("tai-khoan?muc=chuyen-muc");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();
        DAO dao = new DAO();
        if(action.equals("/them-muc")){
            String cname = request.getParameter("cname").strip();
            String cdesc = request.getParameter("cdesc").strip();
            Category cate = new Category(cname,cdesc);
            int add = dao.addCategory(cate);
            if(add == 1){
                request.setAttribute("cateErr", "Chuyên mục đã tồn tại");
                request.setAttribute("failedName", cname);
                request.setAttribute("failedDesc", cdesc);
                request.getRequestDispatcher("updateCategories.jsp").forward(request, response);
            }
            else if (add == 2){
                request.setAttribute("descErr", "Mô tả đã tồn tại");
                request.setAttribute("failedName", cname);
                request.setAttribute("failedDesc", cdesc);
                request.getRequestDispatcher("updateCategories.jsp").forward(request, response);
            }
            else{
                response.sendRedirect("tai-khoan?muc=chuyen-muc");
            }
        }
        else if(action.equals("/sua-muc")){
            String cid = request.getParameter("cid").strip();
            String cname = request.getParameter("cname").strip();
            String cdesc = request.getParameter("cdesc").strip();
            Category newCate = new Category(Integer.parseInt(cid),cname,cdesc);
            
            int update = dao.updateCategory(newCate);
            if(update == 1){
                request.setAttribute("cateErr", "Chuyên mục đã tồn tại");
                request.setAttribute("category", newCate);
               
                request.getRequestDispatcher("updateCategories.jsp").forward(request, response);
            }
            else if(update == 2){
                request.setAttribute("descErr", "Mô tả đã tồn tại");
                request.setAttribute("category", newCate);
                request.getRequestDispatcher("updateCategories.jsp").forward(request, response);
            }
            else{
                response.sendRedirect("tai-khoan?muc=chuyen-muc");
            }
        }
        
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
