
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Bài viết của bạn</title>
    <base href="${pageContext.request.contextPath}/">
</head>
<body>
    
    <!--CAC MUC TRONG TAI KHOAN-->
    <div class="sidebar">
        <a href="tai-khoan?muc=thong-tin" class="active"><i class="fas fa-user"></i>Thông tin tài khoản</a>
        <a href="tai-khoan?muc=binh-luan"><i class="fas fa-comments"></i>Hoạt động bình luận</a>
        <c:if test="${sessionScope.user.ueditor == true}">
            <a href="tai-khoan?muc=bai-viet"<i class="fas fa-newspaper"></i>Bài viết của bạn</a>
        </c:if>
        <a href="tai-khoan?muc=yeu-thich"><i class="fas fa-like"></i>Tin yêu thích</a>
        <a href="dang-xuat"><i class="fas fa-sign-out-alt"></i>Đăng xuất</a>
    </div>
    
    <!--NOI DUNG TRANG BAI VIET CUA BAN-->
    <div class="content">
        <div class="content-header">
         <h1>
          BÀI VIẾT CỦA BẠN
         </h1>
         <button>
             <a href="tao-bai"> Thêm bài viết </a>
         </button>
        </div>
         
        <c:forEach var="o" items="${posts}">
            <div class="post">
            <img alt="image of post" height="100" src="${o.pimage}" width="100"/>
             <div class="post-content">
              <p>
               ${o.formattedPtime}
              </p>
              <h2>
                  <a href="post/${o.pslug}">${o.ptitle}</a>
              </h2>
              <p>
               ${o.categoryName}
              </p>
              <div class="post-actions">
               <button>
                   <a href="sua-bai?pid=${o.postID}">Sửa</a>
               </button>
               <button>
                   <a href="xoa-bai?pid=${o.postID}">Xoá</a>
               </button>
              </div>
             </div>
            </div>     
        </c:forEach>
        
    </div>
       
</body>
</html>