<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm kiếm</title>
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <base href="${pageContext.request.contextPath}/">
    <style>
        * {
            box-sizing: border-box;
            background-clip: border-box;
            position: relative;
            overflow: visible;
            box-sizing: border-box;
            margin: 5px;
            padding: 5px;
            color: black;
            font-family: 'Times New Roman', Times, serif;
            font-size: large;

        }

        .thanhtaikhoan {
            display: none;
            width: 250px;
            height: 150px;
            position: absolute;
            border-radius: 6px;
            background-color: rgb(184, 173, 173);
            overflow: visible;
            top: 85px;

        }
    </style>
</head>

<body>
    <div class="header">
        <a href="paging">
            <h1>Trang tin tức</h1>
        </a>
        

    </div>

    <div class="body" style="display: flex; flex-direction: column; align-items: center;">
        <!--Ô TÀI KHOẢN-->
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
                            <a href="">Thông tin tài khoản</a>
                            <a href="">Hoạt động bình luận</a>
                            <c:if test="${sessionScope.user.ueditor == true}">
                                <a href="tao-bai">Bài viết của bạn</a>
                            </c:if>
                            <a href="">Tin yêu thích</a>
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
        
        <!--PHẦN TÌM KIẾM-->
        <div class="search" style="border: 1px solid black; width: 70%;">
            <form action="tim-kiem" method="get">
                <input type="text" placeholder="tìm kiếm" value="${Txt}" name="txt" style="width: 80%;">
                <div style="display: flex;">
                <label for="cate">Chuyên mục</label>
                <br>
                <select name="cate" id="cate">
                    <option value="allCates" ${Cate == 0 || Cate == null ? 'selected':''}>Tất cả</option>
                    <c:forEach var="o" items="${listC}">
                        <option value="${o.categoryID}" ${Cate == o.categoryID? 'selected':''}>${o.cname}</option>
                    </c:forEach>
                </select>
                
                <label for="time">Thời gian</label>
                <br>
                <select name="time" id="time">
                    <option value="allTime" ${Time == 'allTime' || Time == null? 'selected':''}>Tất cả</option>
                    <option value="day" ${Time == 'day'? 'selected':''}>1 ngày qua</option>
                    <option value="week" ${Time == 'week'? 'selected':''}>1 tuần qua</option>
                    <option value="month" ${Time == 'month'? 'selected':''}>1 tháng qua</option>
                </select>
                </div>
                
                <button type="submit">Tìm</button>
            </form>
            
            <p>Số kết quả tìm kiếm: ${postsNum}</p>
            
<!--            <p>các bài viết tìm kiếm được</p>-->
            
            <div class="newsContainer1" style="display: flex; flex-direction: column; width: 70%; ">
                
                <c:forEach var="o" items="${listP}">
                    <div style="display: flex; flex-direction: column; border: 1px solid black">
                        <a href="post/${o.pslug}">
                            <h3>${o.ptitle}</h3>
                        </a>
                        <div style = "display: flex; ">
                            <img src="${o.pimage}" alt="ảnh" width="30%">
                            <div style = "display: flex; flex-direction: column">                              
                                <p>${o.description}</p>
                            </div>
                        </div>
                    
                    </div>
                </c:forEach>
            </div>
        </div>
        
    <!--PHÂN TRANG-->
    <div class="button" style="display: flex;  justify-content: center;">
        <c:forEach var="i" begin="1" end="${searchPages}">
            <a href="tim-kiem?txt=${Txt}&cate=${Cate}&time=${Time}&trang=${i}">${i}</a>
        </c:forEach>
    </div>

    </div>
    <div class="footer">
        <h1>chân</h1>
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