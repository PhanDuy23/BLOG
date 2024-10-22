<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/1a/30/c4/1a30c461-520e-0983-3a3e-af096574d87a/source/512x512bb.jpg"        type="image/jpg">
    <link rel="stylesheet" href="all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <base href="${pageContext.request.contextPath}/">
    <title>Chuyên mục</title>
    <style>
        table, td, th{
            border: 1px solid black;
            border-collapse:collapse;
        }
    </style>
</head>
<body>
    <div class="header">
        <img src="https://theme.hstatic.net/200000333665/1000707799/14/blog_news_banner.png?v=296" alt="ảnh"
            style="width: 100%; height: auto;">
    </div>

    <div class="body" style="display: flex; flex-direction: column; align-items: center; ">
        <!--THANH TAI KHOAN-->
        <div class="login" style="display: flex;   width: 70%; justify-content: left; ">
            <div style="display: flex; justify-content:  left; flex-grow: 1; margin: 0; padding: 0;">
                <a href="paging" style="margin: 0; padding: 0; ">
                    <img src="https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/1a/30/c4/1a30c461-520e-0983-3a3e-af096574d87a/source/512x512bb.jpg"
                        alt="logo" style=" width: 200px; height: 200px; border-radius: 20px;">
                </a>
            </div>

            <div class="taikhoan">
                <i class="fa-regular fa-user"></i>
                <c:if test="${sessionScope.user == null}">
                    <p>Tài khoản</p>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <p>Xin chào, ${user.uname} </p>
                </c:if>
                <div class="thanhtaikhoan">
                    <c:if test="${sessionScope.user == null}">
                        <div
                            style="display: flex; flex-direction: column; justify-content: space-around;background-color: rgb(118, 112, 112); border-radius: 8px;">
                            <div
                                style="background-color: #C92127; color: rgb(22, 5, 5); margin: 10px; border-radius: 5px; text-align: center; padding: 10px;">
                                <a href="dang-nhap">Đăng nhập</a>
                            </div>
                            <div
                                style="background-color: rgb(189, 20, 20);margin: 10px; padding: 10px; border-radius: 5px; text-align: center;">
                                <a href="dang-ki">Đăng kí</a>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <div class="loggedIn"
                            style="display: flex; flex-direction: column; background-color: rgb(118, 112, 112); border-radius: 8px;">
                            <a href="tai-khoan?muc=thong-tin">Thông tin tài khoản</a>
                            <a href="tai-khoan?muc=binh-luan">Hoạt động bình luận</a>
                            <c:if test="${sessionScope.user.ueditor == true}">
                                <a href="tai-khoan?muc=bai-viet">Bài viết của bạn</a>
                                <a href="tai-khoan?muc=chuyen-muc">Chuyên mục</a>
                            </c:if>
                            <a href="tai-khoan?muc=yeu-thich">Tin yêu thích</a>
                            <a href="dang-xuat">Đăng xuất</a>
                        </div>
                    </c:if>
                </div>
            </div>

        </div>

        <!--CÁC CHUYÊN MỤC-->
        <div class="menu"
            style="display: flex; border-bottom: 1px solid rgb(194, 190, 190); width: 70%;padding-bottom: 0; padding-left: 0;">
            <a style="padding-left: 0; margin-left: 0; " href="paging?mucTin=tin-xu-huong&trang=1">Tin xu
                hướng</a>
            <a href="paging?mucTin=tin-duoc-yeu-thich&trang=1">Tin được yêu thích nhất</a>

            <c:forEach var="o" items="${listC}" >
                <a href="paging?mucTin=${o.cslug}&trang=1">${o.cname}</a>
            </c:forEach>
            <a href="tim-kiem">Tìm kiếm</a>
        </div>

        <!--CAC MUC TRONG TAI KHOAN-->
        <div class="container" style="display: flex; width: 70%; ">
            <div class="sidebar" style="display: flex; flex-direction: column;border-right: 3px solid rgb(181, 176, 176);">
                <a href="tai-khoan?muc=thong-tin" class="active"><i class="fas fa-user"></i>Thông tin tài khoản</a>
                <a href="tai-khoan?muc=binh-luan"><i class="fas fa-comments"></i>Hoạt động bình luận</a>
                <c:if test="${sessionScope.user.ueditor == true}" >
                    <a href="tai-khoan?muc=bai-viet"><i class="fas fa-newspaper"></i>Bài viết của bạn</a>
                    <a href="tai-khoan?muc=chuyen-muc"><i class="fa fa-list" ></i>Chuyên mục</a>
                </c:if>
                <a href="tai-khoan?muc=yeu-thich"><i class="fa-solid fa-heart"></i>Tin yêu thích</a>
                <a href="dang-xuat"><i class="fas fa-sign-out-alt"></i>Đăng xuất</a>
            </div>

            <!--CAC THONG TIN CUA TAI KHOAN-->
            <div class="content">
                <h2>Quản lý chuyên mục</h2>
                <a href="them-muc"><i class="fa-solid fa-plus"></i>Thêm chuyên mục</a>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Tên chuyên mục</th>
                        <th>Mô tả</th>
                        <th></th>
                    </tr>
                    <c:forEach var="o" items="${categories}">
                        <tr>
                            <td>${o.categoryID}</td>
                            <td>${o.cname}</td>
                            <td>${o.cdescription}</td>
                            <td>
                                <a href="sua-muc?cid=${o.categoryID}">Sửa</a>
                                <a href="xoa-muc?cid=${o.categoryID}">Xoá</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>

    </div>

    <div class="footer" style="display: flex; justify-content: center; border-top: 2px solid rgb(188, 178, 178);">
        <div style="display: flex; justify-content: center; flex-direction: column; align-items: center;">
            <img src="https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/1a/30/c4/1a30c461-520e-0983-3a3e-af096574d87a/source/512x512bb.jpg"
                alt="logo" style="width: 100px ; border-radius: 20px;" height="auto">
            <h3>BÁO ĐIỆN TỬ TIN TỨC SV</h3>
            <P>Tổng biên tập: nhóm Java</P>
            <p><i class="fa-solid fa-phone"></i>Hotline: 0975758544</p>
            <div>
                <a href="https://www.facebook.com/nguyenhw">
                    <i class="fa-brands fa-facebook"></i>
                </a>
                <a href="https://www.youtube.com/@DuyPhan-f8m">
                    <i class="fa-brands fa-youtube"></i>
                </a>
                <a href="https://github.com/PhanDuy23/BLOG">
                    <i class="fa-brands fa-github"></i>
                </a>
            </div>
        </div>
    </div>

    <script>
        document.querySelector(".taikhoan").addEventListener('click', function (e) {
            if (document.querySelector(".thanhtaikhoan").style.display == "none") {
                document.querySelector(".thanhtaikhoan").style.display = "block"
            } else {
                document.querySelector(".thanhtaikhoan").style.display = "none"
            }
        })
    </script>       
</body>
</html>