<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
<!--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>-->

    <title>News</title>
    <style>
        * {
    box-sizing: border-box;
    background-clip: border-box;
    position:relative;
    overflow: visible;
  
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
    <header>
        <a href="${pageContext.request.contextPath}/paging">Trang tin tức</a>
    </header>
    
    <!--BODY-->
    <div class="body" style="display: flex; flex-direction: column; align-items: center; ">
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
                                <a href="${pageContext.request.contextPath}/tao-bai">Bài viết của bạn</a>
                            </c:if>
                            <a href="">Tin yêu thích</a>
                            <a href="">Đăng xuất</a>
                        </div>
                    </c:if>
                </div>
            </div>
            <input type="text" placeholder="tìm kiếm" style="height: 40px;">
        </div>


        <!--CÁC CHUYÊN MỤC-->
        <div class="menu" style="display: flex; border: 1px solid black; width: 70%; ">
            <a href="${pageContext.request.contextPath}/paging?mucTin=tin-xu-huong&trang=1">Tin xu hướng</a>
            <a href="${pageContext.request.contextPath}/paging?mucTin=tin-duoc-yeu-thich&trang=1">Tin được yêu thích nhất</a>
            
            <c:forEach var="o" items="${listC}">
                <a href="${pageContext.request.contextPath}/paging?mucTin=${o.cslug}&trang=1" >${o.cname}</a>
            </c:forEach>
            
        </div>
        
        <!--TÊN CHUYÊN MỤC VÀ CÁC BÀI BÁO-->
        <div class="newsContainer1" style="display: flex; flex-direction: column; width: 70%; ">
            
                <c:if test = "${entryName != null}">
                    <h3>${entryName}</h3><hr>
                </c:if>
                <c:forEach var="o" items="${listP}">
                    <div style="display: flex; flex-direction: column; border: 1px solid black">
                        <a href="${pageContext.request.contextPath}/post/${o.pslug}">
                            <h3>${o.ptitle}</h3>
                        </a>
                        
                        <!--<p>${o.pcontent}</p>--> 
                        
                        <div style = "display: flex; ">
                            <img src="${o.pimage}" alt="ảnh" width="30%">
                            <div style = "display: flex; flex-direction: column">
                                <h4>${o.editorName}</h4>
                                <h4>${o.dayOfWeek}, ${o.formattedPtime}</h4>
                                <c:if test="${entry == 'tin-duoc-yeu-thich'}">
                                    <p>Lượt thích: ${o.plikes}</p>
                                </c:if>
                                <c:if test="${entry == 'tin-xu-huong'}">
                                    <p>Lượt xem: ${o.pclicks}</p>
                                </c:if>
                            </div>
                        </div>
                    <!--<pre></pre>-->
                    </div>
                </c:forEach>
        </div>
<!--        <div class="newsContainer2" style="display: none; flex-direction: column; width: 70%; border: 1px solid black;">
            <div class="oneNews" style="border: 1px solid black;">
                <h3>Tiêu đề     trang 2</h3>
                <div style="display: flex;">
                    <img src="https://cdnphoto.dantri.com.vn/DvD5TRVMqbJ0rTyJWlpcebtvTpg=/zoom/774_516/2024/10/06/thumb-1728229784459.png"
                        alt="ảnh" width="30%">
                    <p>Đoạn văn</p>
                </div>

            </div>

        </div>-->
<!--        <div class="newsContainer3" style="display: none; flex-direction: column; width: 70%; border: 1px solid black;">
            <div class="oneNews" style="border: 1px solid black;">
                <h3>tiêu đề trang 333333</h3>
                <div style="display: flex;">
                    <img src="https://cdnphoto.dantri.com.vn/DvD5TRVMqbJ0rTyJWlpcebtvTpg=/zoom/774_516/2024/10/06/thumb-1728229784459.png"
                        alt="ảnh" width="30%">
                    <p>Đoạn văn</p>
                </div>

            </div>

        </div>-->
    </div>
            
    <!--PHÂN TRANG TIN-->
    <div class="button" style="display: flex;  justify-content: center;">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:if test="${mucTin==null}">
                <a href="paging?trang=${i}">${i}</a>
            </c:if>
            <c:if test="${mucTin!=null}">
                <a href="${pageContext.request.contextPath}/paging?mucTin=${entry}&trang=${i}">${i}</a>
            </c:if>
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
        document.querySelector("#button1").addEventListener('click', function(e){
            document.querySelector(".newsContainer1").style.display = "flex"
            document.querySelector(".newsContainer2").style.display = "none"
            document.querySelector(".newsContainer3").style.display = "none"
        })
        document.querySelector("#button2").addEventListener('click', function(e){
            document.querySelector(".newsContainer2").style.display = "flex"
            document.querySelector(".newsContainer1").style.display = "none"
            document.querySelector(".newsContainer3").style.display = "none"
        })
        document.querySelector("#button3").addEventListener('click', function(e){
            document.querySelector(".newsContainer3").style.display = "flex"
            document.querySelector(".newsContainer1").style.display = "none"
            document.querySelector(".newsContainer2").style.display = "none"
        })
    </script>
</body>

</html>