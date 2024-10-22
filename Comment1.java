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
        request.setCharacterEncoding("UTF-8");
        HttpSession ss = request.getSession(false);
        if (ss == null || ss.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userID = (int) ss.getAttribute("userID");
        String action = request.getParameter("action");
        String postIDStr = request.getParameter("postID");

        if (postIDStr == null || postIDStr.isEmpty()) {
            response.sendRedirect("article.jsp?error=invalidPost");
            return;
        }

        int postID = Integer.parseInt(postIDStr);
        CommentDAO commentDAO = new CommentDAO();

        if ("edit".equalsIgnoreCase(action)) {
            // Xử lý sửa bình luận
            String commentIDStr = request.getParameter("commentID");
            String newContent = request.getParameter("newContent");
            
            if (commentIDStr == null || newContent == null || newContent.trim().isEmpty()) {
                response.sendRedirect("article.jsp?postID=" + postID + "&error=invalidEdit");
                return;
            }

            int commentID = Integer.parseInt(commentIDStr);
            Comment comment = new Comment(newContent, new Date(), 1, userID, postID);
            comment.setCommentID(commentID);
            boolean updated = commentDAO.updateComment(comment);

            if (updated) {
                System.out.println("Bình luận đã được sửa thành công!");
            } else {
                System.out.println("Sửa bình luận thất bại!");
            }
        } else if ("delete".equalsIgnoreCase(action)) {
            // Xử lý xóa bình luận
            String commentIDStr = request.getParameter("commentID");

            if (commentIDStr == null || commentIDStr.isEmpty()) {
                response.sendRedirect("article.jsp?postID=" + postID + "&error=invalidDelete");
                return;
            }

            int commentID = Integer.parseInt(commentIDStr);
            boolean deleted = commentDAO.deleteComment(commentID);

            if (deleted) {
                System.out.println("Bình luận đã được xóa thành công!");
            } else {
                System.out.println("Xóa bình luận thất bại!");
            }
        } else {
            // Xử lý thêm bình luận
            String content = request.getParameter("comment");

            if (content == null || content.trim().isEmpty()) {
                response.sendRedirect("article.jsp?postID=" + postID + "&error=emptyComment");
                return;
            }

            Date date = new Date();
            Comment cmt = new Comment(content, date, 1, userID, postID);
            boolean result = commentDAO.insertComment(cmt);

            if (result) {
                System.out.println("Bình luận đã được thêm thành công!");
            } else {
                System.out.println("Thêm bình luận thất bại!");
            }
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
