package DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Comment;

public class CommentDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    // Thêm bình luận vào cơ sở dữ liệu
    public boolean insertComment(Comment comment) {

        try {
            String query = "INSERT INTO news.comments (ccontent, ctime, caccept, userID, postID) VALUES (?, ?, ?, ?, ?)";
            ps = connection.prepareStatement(query);
            ps.setString(1, comment.getCcontent());
            ps.setTimestamp(2, new Timestamp(comment.getCtime().getTime()));
            ps.setInt(3, comment.getCaccept());
            ps.setInt(4, comment.getUserID());
            ps.setInt(5, comment.getPostID());

            // Thực thi câu lệnh và in ra log để kiểm tra số hàng được thêm
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy danh sách bình luận theo postID
    public List<Comment> getCommentsByPostID(int postID) {
        PreparedStatement ps = null;
        List<Comment> comments = new ArrayList<>();

        try {
            String query = "SELECT * FROM news.comments WHERE postID = ? AND caccept = 1";
            ps = connection.prepareStatement(query);
            ps.setInt(1, postID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentID(rs.getInt("commentID"));
                comment.setCcontent(rs.getString("ccontent"));
                comment.setCtime(rs.getTimestamp("ctime"));
                comment.setCaccept(rs.getInt("caccept"));
                comment.setUserID(rs.getInt("userID"));
                comment.setPostID(rs.getInt("postID"));
                comments.add(comment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }

    public List<Comment> getCommentsByPostID1(int postID) {
        PreparedStatement ps = null;
        List<Comment> comments = new ArrayList<>();

        try {
           String query = "SELECT c.commentID, c.userID, c.ccontent, u.uname, c.ctime, c.caccept, c.postID " +
               "FROM news.comments c " +
               "JOIN news.users u ON c.userID = u.userID " +
               "WHERE c.postID = ? AND c.caccept = 1 " +
               "ORDER BY c.ctime DESC;";
            ps = connection.prepareStatement(query);
            ps.setInt(1, postID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentID(rs.getInt("commentID"));
                comment.setUserID(rs.getInt("userID"));
                comment.setCcontent(rs.getString("ccontent"));
                comment.setCtime(rs.getTimestamp("ctime"));
                comment.setCaccept(rs.getInt("caccept"));
                comment.setPostID(rs.getInt("postID"));
                comment.setUname(rs.getString("uname"));
                comments.add(comment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }
    // Sửa bình luận trong cơ sở dữ liệu

    public boolean updateComment(Comment comment) {
        PreparedStatement ps = null;
        try {
            String query = "UPDATE news.comments SET ccontent = ?, ctime = ? WHERE commentID = ?";
            ps = connection.prepareStatement(query);
            ps.setString(1, comment.getCcontent());
            ps.setTimestamp(2, new Timestamp(comment.getCtime().getTime()));
            ps.setInt(3, comment.getCommentID());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu cập nhật thành công

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    // Xóa bình luận trong cơ sở dữ liệu

    public boolean deleteComment(int commentID) {
         PreparedStatement ps = null;
        try {
            String query = "DELETE FROM news.comments WHERE commentID = ?";
            ps = connection.prepareStatement(query);
            ps.setInt(1, commentID);

            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0; // Trả về true nếu xóa thành công

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
