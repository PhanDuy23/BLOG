
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Hoạt động bình luận</title>
</head>
<body>
    <!--CAC MUC CUA TAI KHOAN-->
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/tai-khoan?muc=thong-tin" class="active"><i class="fas fa-user"></i>Thông tin tài khoản</a>
        <a href="${pageContext.request.contextPath}/tai-khoan?muc=binh-luan"><i class="fas fa-comments"></i>Hoạt động bình luận</a>
        <c:if test="${sessionScope.user.ueditor = true}">
            <a href="${pageContext.request.contextPath}/tai-khoan?muc=bai-viet"<i class="fas fa-newspaper"></i>Bài viết của bạn</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/tai-khoan?muc=yeu-thich"><i class="fas fa-like"></i>Tin yêu thích</a>
        <a href="${pageContext.request.contextPath}/dang-xuat"><i class="fas fa-sign-out-alt"></i>Đăng xuất</a>
    </div>
    
    <!--CAC BÌNH LUẬN CỦA NGƯỜI DÙNG-->
    <div class="content">
        <h1>
         Hoạt động bình luận
        </h1>
        <c:forEach var="o" items="${comments}">
            <div class="comment-date">
                ${o.formattedCtime}
            </div>
            <div class="comment">
                <img alt="User avatar" height="50" src="https://storage.googleapis.com/a1aa/image/RVO2GAGSBbK3I5Sn4hhRftktQcJLfYxd5xlA4JxurQ0WvinTA.jpg" width="50"/>
                    <div class="comment-text">
                     <p class="comment-status">
                         Bình luận của bạn trong bài viết: <a href="${pageContext.request.contextPath}/post/${o.post.pslug}">${o.post.ptitle}</a>
                     </p>
                     <p class="comment-content">
                         ${o.ccontent}
                     </p>
                     <div class="post-actions">
                       <button>
                           <a href="${pageContext.request.contextPath}/binh-luan?cid=${o.commentID}&pslug=${o.post.pslug}">Sửa</a>
                       </button>
                       <button>
                        xóa
                       </button>
                      </div>
                    </div>
            </div>
        </c:forEach>
        
        
<!--        <div class="comment-date">
          dd/mm/yyyy
         </div>
         <div class="comment">
         <img alt="User avatar" height="50" src="https://storage.googleapis.com/a1aa/image/RVO2GAGSBbK3I5Sn4hhRftktQcJLfYxd5xlA4JxurQ0WvinTA.jpg" width="50"/>
          <div class="comment-text">
           <p class="comment-status">
            Bình luận của bạn trong một bài viết đã được duyệt • _ ngày trước
           </p>
           <p class="comment-content">
            _______________
           </p>
           <div class="post-actions">
             <button>
              sửa
             </button>
             <button>
              xóa
             </button>
            </div>
          </div>
         </div>-->
       </div>
</body>
</html>