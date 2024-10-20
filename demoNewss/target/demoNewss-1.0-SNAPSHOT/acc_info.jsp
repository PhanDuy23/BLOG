<%-- 
    Document   : acc_info
    Created on : Oct 19, 2024, 8:44:27 AM
    Author     : doanm
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="home.css">
        <base href="${pageContext.request.contextPath}/">
        <title>Thông tin tài khoản</title>

    </head>
    <body>
        <div class="body" style="display: flex; flex-direction: column; align-items: center; ">
            <!--THANH TAI KHOAN-->
            <div class="login" style="display: flex;   width: 70%; justify-content: end;">
                <div class="taikhoan" style="display: flex; flex-direction: column;z-index: 4;  justify-content: center;align-items: center;  border: 1px solid black;">
                    <i class="fa-regular fa-user"></i>
                    <c:if test="${sessionScope.user == null}">
                        <p class="taikhoan">Tài khoản</p>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <p class="taikhoan">Xin chào, ${user.uname} </p>
                    </c:if>
                    <div class="thanhtaikhoan">
                        <c:if test="${sessionScope.user == null}">
                            <div style="display: flex; flex-direction: column; justify-content: space-around;">
                                <div
                                    style="background-color: #C92127; color: rgb(22, 5, 5); margin: 10px; border-radius: 5px; text-align: center; padding: 10px;">
                                    <a href="dang-nhap">Đăng nhập</a></div>
                                <div
                                    style="background-color: rgb(189, 20, 20);margin: 10px; border: 1px solid #ddd6d7;padding: 10px; border-radius: 5px; text-align: center;">
                                    <a href="dang-ki">Đăng kí</a></div>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.user != null}">
                            <div class="loggedIn" style="display: flex; flex-direction: column; background-color: rgb(118, 112, 112);">
                                <a href="tai-khoan?muc=thong-tin">Thông tin tài khoản</a>
                                <a href="tai-khoan?muc=binh-luan">Hoạt động bình luận</a>
                                <c:if test="${sessionScope.user.ueditor == true}">
                                    <a href="tai-khoan?muc=bai-viet">Bài viết của bạn</a>
                                </c:if>
                                <a href="tai-khoan?muc=yeu-thich">Tin yêu thích</a>
                                <a href="dang-xuat">Đăng xuất</a>
                            </div>
                        </c:if>
                    </div>
                </div>
                <a href="tim-kiem">search</a>
                <input type="text" placeholder="tìm kiếm" style="height: 40px;">
            </div>


            <!--CÁC CHUYÊN MỤC-->
            <div class="menu" style="display: flex; border: 1px solid black; width: 70%; ">
                <a href="paging?mucTin=tin-xu-huong&trang=1">Tin xu hướng</a>
                <a href="paging?mucTin=tin-duoc-yeu-thich&trang=1">Tin được yêu thích nhất</a>

                <c:forEach var="o" items="${listC}">
                    <a href="paging?mucTin=${o.cslug}&trang=1" >${o.cname}</a>
                </c:forEach>
            </div>

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

            <!--CAC THONG TIN CUA TAI KHOAN-->
            <div class="content">
                <h1>Thông tin cá nhân</h1>
                <div class="info-item">
                    <i class="fas fa-user"></i>
                    <div>
                        <div>Họ và tên</div>
                        <span>${sessionScope.user.uname}</span>

                    </div>
                </div>

                <div class="info-item">
                    <i class="fas fa-birthday-cake"></i>
                    <div>
                        <div>Tên đăng nhập</div>
                        <span>${sessionScope.user.uaccount}</span>
                    </div>
                </div>

                <div class="info-item">
                    <i class="fas fa-key"></i>
                    <div>
                        <div>Mật khẩu</div>
                        <span>
                            <input type="password" value="${sessionScope.user.upassword}" id="pass">
                            <input type="checkbox" onclick="togglePass()">Hiện mật khẩu
                        </span> 

                    </div>
                </div>
                <!--        <div class="info-item">
                            <i class="fas fa-phone"></i>
                            <div>
                                <div>Số điện thoại</div>
                                <span>Chưa có thông tin</span>
                            </div>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-map-marker-alt"></i>
                            <div>
                                <div>Địa chỉ</div>
                                <span>Chưa có thông tin</span>
                            </div>
                        </div>-->
            </div>
        </div>
        <script>
            function togglePass() {
                var x = document.getElementById("pass");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>
    </body>
</html>