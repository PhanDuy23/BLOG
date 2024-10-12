package control;

import DBContext.CommentDAO;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Comment;

public class Comment1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    HttpSession ss = request.getSession(false);
    if (ss == null || ss.getAttribute("userID") == null) {
            // Nếu session không tồn tại hoặc userID không có trong session, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

    // Lấy dữ liệu từ session và request
    int userID = (int) ss.getAttribute("userID");
    String content = request.getParameter("comment");
    String postIDStr = request.getParameter("postID");

    // In ra log để kiểm tra giá trị nhận được
    System.out.println("Bình luận: " + content);
    System.out.println("Post ID: " + postIDStr);

    if (content == null || content.trim().isEmpty()) {
        response.sendRedirect("article.jsp?error=emptyComment");
        return;
    }

    int postID = Integer.parseInt(postIDStr);
    Date date = new Date();
    Comment cmt = new Comment(content, date, 1, userID, postID);

    // Tạo đối tượng DAO và thêm bình luận
    CommentDAO commentDAO = new CommentDAO();
    boolean result = commentDAO.insertComment(cmt);

    if (result) {
        System.out.println("Bình luận đã được thêm thành công!");
    } else {
        System.out.println("Thêm bình luận thất bại!");
    }

    // Lấy lại danh sách bình luận để hiển thị
    List<Comment> list = commentDAO.getCommentsByPostID1(postID);
    request.setAttribute("comments", list);
    request.getRequestDispatcher("article.jsp").forward(request, response);
}


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
