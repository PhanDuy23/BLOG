<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon"
        href="https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/1a/30/c4/1a30c461-520e-0983-3a3e-af096574d87a/source/512x512bb.jpg"
        type="image/jpg">
    <link rel="stylesheet" href="all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <!--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>-->
    <base href="${pageContext.request.contextPath}/">
    <title>Tác giả</title>

</head>

<body>
    <div>
        <img src="https://theme.hstatic.net/200000333665/1000707799/14/blog_news_banner.png?v=296" alt="ảnh"
            style="width: 100%; height: auto;">
    </div>

    <!--BODY-->
    <div class="body" style="display: flex; flex-direction: column; align-items: center; ">
        <!--Ô TÀI KHOẢN-->
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
            <a style="padding-left: 0; margin-left: 0; " href="paging?mucTin=tin-xu-huong&trang=1">Tin xu hướng</a>
            <a href="paging?mucTin=tin-duoc-yeu-thich&trang=1">Tin được yêu thích nhất</a>

            <c:forEach var="o" items="${listC}" >
                <a href="paging?mucTin=${o.cslug}&trang=1">${o.cname}</a>
            </c:forEach>
            <a href="tim-kiem">Tìm kiếm</a>
        </div>

        <div>
            <img width="200px" height="auto"  src="https://phunugioi.com/wp-content/uploads/2020/10/trend-anh-dai-dien-nguoi-giau-mat.jpeg" alt="avatar">
            <h3 style="text-align: center;">${editor.uname}</h3>
        </div>

        <!--TÊN CHUYÊN MỤC VÀ CÁC BÀI BÁO-->
        <div class="container" style="display: flex; flex-direction: column; width: 70%; ">
            <h3>Các bài viết từ tác giả: ${editor.uname}</h3>
            <c:forEach var="o" items="${posts}">
                <div style="display: flex; flex-direction: column; ">
                    <a href="post/${o.pslug}">
                        <h3>${o.ptitle}</h3>
                    </a>
                    <div style="display: flex; ">
                        <img src="${o.pimage}" alt="ảnh" width="30%">
                        <div style="display: flex; flex-direction: column">

                            <p>${o.description}</p>
                            <c:if test="${entry == 'tin-duoc-yeu-thich'}">
                                <p>Lượt thích: ${o.plikes}</p>
                            </c:if>
                            <c:if test="${entry == 'tin-xu-huong'}">
                                <p>Lượt xem: ${o.pclicks}</p>
                                <p>${o.dayOfWeek}, ${o.formattedPtime}</p>
                            </c:if>
                        </div>
                    </div>
                    <!--<pre></pre>-->
                </div>
            </c:forEach>
        </div>

    </div>

    <!--PHÂN TRANG TIN-->
    <div class="button" style="display: flex;  justify-content: center;">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:if test="${mucTin==null}">
                <a href="paging?trang=${i}">${i}</a>
            </c:if>
            <c:if test="${mucTin!=null}">
                <a href="paging?mucTin=${entry}&trang=${i}">${i}</a>
            </c:if>
        </c:forEach>
    </div>

    <div class="footer" style="display: flex; justify-content: center; border-top: 2px solid rgb(206, 193, 193);">
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