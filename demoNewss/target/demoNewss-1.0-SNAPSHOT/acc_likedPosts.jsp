<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <base href="${pageContext.request.contextPath}/">
    <title>Tin yêu thích</title>
</head>
<body>
    <div class="container">
    <!--CAC MUC CUA TAI KHOAN-->
    <div class="sidebar">
        <a href="tai-khoan?muc=thong-tin" class="active"><i class="fas fa-user"></i>Thông tin tài khoản</a>
        <a href="tai-khoan?muc=binh-luan"><i class="fas fa-comments"></i>Hoạt động bình luận</a>
        <c:if test="${sessionScope.user.ueditor == true}">
            <a href="tai-khoan?muc=bai-viet"<i class="fas fa-newspaper"></i>Bài viết của bạn</a>
            <a href="tai-khoan?muc=chuyen-muc">Chuyên mục</a>
        </c:if>
        <a href="tai-khoan?muc=yeu-thich"><i class="fas fa-like"></i>Tin yêu thích</a>
        <a href="dang-xuat"><i class="fas fa-sign-out-alt"></i>Đăng xuất</a>
    </div>
    <div class="content">
         <h1>
          TIN YÊU THÍCH
         </h1>
         <c:forEach var="o" items="${likedPosts}">
         <div class="news-item">
         <img alt="Image of various football players" height="60" src="${o.pimage}" width="100"/>
          <div class="details">
           <h2>
               <a href="post/${o.pslug}">${o.ptitle}</a>
           </h2>
           <p>
            ${o.categoryName} - ${o.formattedPtime}
           </p>
          </div>
          <button class="unlike-button">
              <a href="unlike?pid=${o.postID}">Bỏ thích</a>
          </button>
         </div>
         </c:forEach>
        </div>
    </div>
</body>
</html>