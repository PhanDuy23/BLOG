<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Article</title>
    </head>
    <body>
        <h1>Bài viết</h1>
        <!-- Phần hiển thị bài viết có thể đặt ở đây -->

        <h2>Bình luận</h2>
        <div class="comments-section">
            <c:if test="${not empty comments}">
                <ul>
                    <c:forEach var="comment" items="${comments}">
                        <li>
                            <p><strong>Người dùng : ${comment.uname}</strong></p>
                            <p>Thời gian: ${comment.dayOfWeek}, ${comment.formattedCtime}</p>
                            <p>Nội dung: ${comment.ccontent}</p>
                            <!-- Form sửa bình luận, chỉ hiển thị nếu đây là bình luận của người dùng hiện tại -->
                            <c:if test="${comment.userID == sessionScope.userID}">
                                <form action="Comment1" method="post">
                                    <input type="hidden" name="action" value="edit"/>
                                    <input type="hidden" name="commentID" value="${comment.commentID}"/>
                                    <input type="hidden" name="postID" value="${comment.postID}"/>
                                    <textarea name="newContent"></textarea>
                                    <button type="submit">Sửa</button>
                                </form>

                                <!-- Nút xóa bình luận -->
                                <form action="Comment1" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="delete"/>
                                    <input type="hidden" name="commentID" value="${comment.commentID}"/>
                                    <input type="hidden" name="postID" value="${comment.postID}"/>
                                    <button type="submit">Xóa</button>
                                </form>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>

            <c:if test="${empty comments}">
                <p>Không có bình luận nào.</p>
            </c:if>
        </div>

        <!-- Form để người dùng gửi bình luận mới -->
        <form action="Comment1" method="post">
            <input type="hidden" name="postID" value="1"/>
            <input type="hidden" name="action" value="add"/>
            <label for="comment">Bình luận:</label>
            <textarea id="comment" name="comment" required></textarea><br>
            <button type="submit">Gửi bình luận</button>
        </form>
    </body>
</html>
