/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
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
@WebServlet(name = "SignUpControl", urlPatterns = {"/dang-ki"})
public class SignUpControl extends HttpServlet {

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
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect("signup.jsp");
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
        String acc = request.getParameter("account");
        DAO dao = new DAO();
        if(dao.checkUserExist(acc)!=null){
            request.setAttribute("errorMessage", "Tài khoản đã tồn tại");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        String pass = request.getParameter("password");
        String repass = request.getParameter("repassword");
        if(!pass.equals(repass)){
            request.setAttribute("errorMessage", "Mật khẩu nhập vào không trùng nhau");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        }else{
            String name = request.getParameter("name");
            User user = new User(acc,pass,name);
            dao.signup(user);
            user = dao.getUserByAccount(acc);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(-1);
            
            response.sendRedirect("paging");
        }
    }

    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
