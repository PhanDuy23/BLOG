/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import context.DBContext;
import dao.DAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;



@WebServlet(name = "LoginControl", urlPatterns = {"/dang-nhap"})
public class LoginControl extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        // lay cookie de hien thi len phan dang nhap
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie c:cookies){
                if(c.getName().equals("account")){
                    request.setAttribute("account", c.getValue());
                }
                if(c.getName().equals("password")){
                    request.setAttribute("password", c.getValue());
                }
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String acc = request.getParameter("account");
        String pass = request.getParameter("password");
        String remember = request.getParameter("remember");
        System.out.println(acc + " " + pass);
        DAO dao = new DAO();
        User user = dao.login(acc,pass);
        if(user == null){
            request.setAttribute("message", "Tài khoản hoặc mật khẩu sai");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(-1);
//            response.sendRedirect("home");
            Cookie account = new Cookie("account", acc);
            Cookie password = new Cookie("password",pass);
            account.setMaxAge(60*60*24*365);
            if(remember != null){
                password.setMaxAge(60*60*24*365);
            }else{
                password.setMaxAge(0);
            }
            response.addCookie(account);
            response.addCookie(password);
//            request.getRequestDispatcher("home").forward(request,response);
            response.sendRedirect("home");
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
