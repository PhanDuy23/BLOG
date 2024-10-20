<!--
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <base href="${pageContext.request.contextPath}/">
    <title>Hoạt động bình luận</title>
</head>
<body>
    
    CAC MUC CUA TAI KHOAN
    <div class="sidebar">
        <a href="tai-khoan?muc=thong-tin" class="active"><i class="fas fa-user"></i>Thông tin tài khoản</a>
        <a href="tai-khoan?muc=binh-luan"><i class="fas fa-comments"></i>Hoạt động bình luận</a>
        <%--<c:if test="${sessionScope.user.ueditor == true}">--%>
            <a href="tai-khoan?muc=bai-viet"<i class="fas fa-newspaper"></i>Bài viết của bạn</a>
        <%--</c:if>--%>
        <a href="tai-khoan?muc=yeu-thich"><i class="fas fa-like"></i>Tin yêu thích</a>
        <a href="dang-xuat"><i class="fas fa-sign-out-alt"></i>Đăng xuất</a>
    </div>
    
    CAC BÌNH LUẬN CỦA NGƯỜI DÙNG
    <div class="content">
        <h1>
         Hoạt động bình luận
        </h1>
        <%--<c:forEach var="o" items="${comments}">--%>
            <div class="comment-date">
                <!--${o.formattedCtime}-->
<!--            </div>
            <div class="comment">
                <img alt="User avatar" height="50" src="https://storage.googleapis.com/a1aa/image/RVO2GAGSBbK3I5Sn4hhRftktQcJLfYxd5xlA4JxurQ0WvinTA.jpg" width="50"/>
                    <div class="comment-text">
                     <p class="comment-status">
                         Bình luận của bạn trong bài viết: <a href="post/${o.post.pslug}">${o.post.ptitle}</a>
                     </p>
                     <p class="comment-content">
                         ${o.ccontent}
                     </p>
                     <div class="post-actions">
                       <button>
                           <a href="binh-luan?cid=${o.commentID}&pslug=${o.post.pslug}">Sửa</a>
                       </button>
                       <button>
                           <a href="binh-luan?action=delete&cid=${o.commentID}">Xoá</a>
                       </button>
                      </div>
                    </div>
            </div>
        <%--</c:forEach>--%>
        

       </div>
</body>
</html>-->-->
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <!--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>-->

    <title>News</title>


</head>

<body>




    <div class="body" style="display: flex; flex-direction: column; align-items: center; ">

        <div class="login" style="display: flex;   width: 70%; justify-content: space-between;">
            <a href="${pageContext.request.contextPath}/paging">
                <img
                    src="https://png.pngtree.com/template/20220505/ourmid/pngtree-red-hot-news-logo-banner-image_1335492.jpg"
                    alt="logo" width="50%" height="auto">
            </a>
            <div>
                <div class="taikhoan"
                    style="display: flex; flex-direction: column;z-index: 4;  justify-content: center;align-items: center;  border: 1px solid black;">
                    <i class="fa-regular fa-user"></i>
                    <c:if test="${sessionScope.user == null}">
                        <p class="taikhoan">Tài khoản</p>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <p class="taikhoan">Xin chào, ${user.uname} </p>
                    </c:if>
                    <div class="thanhtaikhoan">
                        <c:if test="${sessionScope.user == null}">
                            <div
                                style="display: flex; flex-direction: column; justify-content: space-around;  background-color: #B8ADAD; width: 100%; border-radius: 5px;">
                                <div style="background-color: #C92127;  border-radius: 5px; text-align: center; ">
                                    <a href="dang-nhap">Đăng nhập</a>
                                </div>
                                <div
                                    style="background-color: rgb(189, 20, 20);  border-radius: 5px; text-align: center;">
                                    <a href="dang-ki">Đăng kí</a>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.user != null}">
                            <div class="loggedIn"
                                style="display: flex; flex-direction: column; background-color: #B8ADAD; width: 100%; border-radius: 5px;">
                                <a href="">Thông tin tài khoản</a>
                                <a href="">Hoạt động bình luận</a>
                                <c:if test="${sessionScope.user.ueditor == true}">
                                    <a href="">Bài viết của bạn</a>
                                </c:if>
                                <a href="">Tin yêu thích</a>
                                <a href="">Đăng xuất</a>
                            </div>
                        </c:if>
                    </div>
                </div>
                <input type="text" placeholder="tìm kiếm" style="height: 40px;">
            </div>


        </div>



        <div class="menu" style="display: flex;  width: 70%; ">
            <a href="link">Tin mới nhất</a>
            <a href="link">Tin được yêu thích nhất</a>

            <c:forEach var="o" items="${listC}">
                <a href="${pageContext.request.contextPath}/paging?condition=${o.categoryID}">${o.cname}</a>
            </c:forEach>

        </div>

        <div class="newsContainer1" style="display: flex; flex-direction: column; width: 70%; ">
 <!--CAC MUC CUA TAI KHOAN-->
 <div class="sidebar">
    <a href="tai-khoan?muc=thong-tin" class="active"><i class="fas fa-user"></i>Thông tin tài khoản</a>
    <a href="tai-khoan?muc=binh-luan"><i class="fas fa-comments"></i>Hoạt động bình luận</a>
    <c:if test="${sessionScope.user.ueditor == true}">
        <a href="tai-khoan?muc=bai-viet"<i class="fas fa-newspaper"></i>Bài viết của bạn</a>
    </c:if>
    <a href="tai-khoan?muc=yeu-thich"><i class="fas fa-like"></i>Tin yêu thích</a>
    <a href="dang-xuat"><i class="fas fa-sign-out-alt"></i>Đăng xuất</a>
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
                     Bình luận của bạn trong bài viết: <a href="post/${o.post.pslug}">${o.post.ptitle}</a>
                 </p>
                 <p class="comment-content">
                     ${o.ccontent}
                 </p>
                 <div class="post-actions">
                   <button>
                       <a href="binh-luan?cid=${o.commentID}&pslug=${o.post.pslug}">Sửa</a>
                   </button>
                   <button>
                       <a href="binh-luan?action=delete&cid=${o.commentID}">Xoá</a>
                   </button>
                  </div>
                </div>
        </div>
    </c:forEach>
    

   </div>

        </div>
       

    </div>
    <div class="button" style="display: flex;  justify-content: center;">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="paging?index=${i}">${i}</a>
        </c:forEach>
    </div>

    <script>
        document.querySelector(".taikhoan").addEventListener('click', function (e) {
            if (document.querySelector(".thanhtaikhoan").style.display == "none") {
                document.querySelector(".thanhtaikhoan").style.display = "block"
            } else {
                document.querySelector(".thanhtaikhoan").style.display = "none"
            }

        })
        document.querySelector("#button1").addEventListener('click', function (e) {
            document.querySelector(".newsContainer1").style.display = "flex"
            document.querySelector(".newsContainer2").style.display = "none"
            document.querySelector(".newsContainer3").style.display = "none"
        })
        document.querySelector("#button2").addEventListener('click', function (e) {
            document.querySelector(".newsContainer2").style.display = "flex"
            document.querySelector(".newsContainer1").style.display = "none"
            document.querySelector(".newsContainer3").style.display = "none"
        })
        document.querySelector("#button3").addEventListener('click', function (e) {
            document.querySelector(".newsContainer3").style.display = "flex"
            document.querySelector(".newsContainer1").style.display = "none"
            document.querySelector(".newsContainer2").style.display = "none"
        })
    </script>
</body>

</html>