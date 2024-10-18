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
@WebServlet(name = "SearchControl", urlPatterns = {"/tim-kiem"})
public class SearchControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        DAO dao = new DAO();
        List<Category> listC = dao.getAllCategories();
        request.setAttribute("listC", listC);
        int index = 1;
        String str = request.getParameter("trang");
        if(str != null) index = Integer.parseInt(str);
        
        String txt=request.getParameter("txt");
        if(txt == null || txt.isEmpty()){
            request.getRequestDispatcher("search.jsp").forward(request,response);
        }
        else{
            String cate = request.getParameter("cate");
            if(cate.equals("0")) cate = "allCates";
            String time = request.getParameter("time");
            List<Post> listP = dao.searchNPosts(7,index,txt,cate,time);
            request.setAttribute("listP", listP);
            int[] arr = dao.getSearchPages(7, txt, cate, time);
            request.setAttribute("searchPages", arr[0]);
            request.setAttribute("postsNum", arr[1]);
            
            request.setAttribute("Txt", txt);
            request.setAttribute("Cate", cate.equals("allCates")? Integer.valueOf(0):Integer.parseInt(cate));
            request.setAttribute("Time", time);
            request.getRequestDispatcher("search.jsp").forward(request,response);
        }
        
                
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request,response);
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
