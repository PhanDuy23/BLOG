<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <title>Trang đọc báo</title>
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
        <h1>logo</h1>
    </header>

    <div class="body" style="display: flex; flex-direction: column; align-items: center; ">

        <div class="login" style="display: flex;   width: 70%; justify-content: end;">
            <div class="taikhoan"
                style="display: flex; flex-direction: column;z-index: 4;  justify-content: center;align-items: center;  border: 1px solid black;">
                <i class="fa-regular fa-user"></i>
                <p class="taikhoan">Tài khoản</p>
                <div class="thanhtaikhoan">
                    <div style="display: flex; flex-direction: column; justify-content: space-around;">
                        <div
                            style="background-color: #C92127; color: rgb(22, 5, 5); margin: 10px; border-radius: 5px; text-align: center; padding: 10px;">
                            Đăng nhập</div>
                        <div
                            style="background-color: rgb(189, 20, 20);margin: 10px; border: 1px solid #ddd6d7;padding: 10px; border-radius: 5px; text-align: center;">
                            Đăng kí</div>
                    </div>
                </div>
            </div>
        </div>



        <div class="menu" style="display: flex; border: 1px solid black; width: 70%; ">
            <p>Tin mới nhất</p>
            <p>Tin được yêu thích nhiều</p>
            <p>Xã hội</p>
            <p>Kinh tế</p>
            <p>Giáo dục</p>
        </div>
        
        
        <div class="newsContainer1" style="display: flex; flex-direction: column; width: 70%; border: 1px solid black;">
            <c:forEach var="o" items="${listP}">
                <div class="oneNews" style="border: 1px solid black;">
                    <h3>
                        <a href="${pageContext.request.contextPath}/post/${o.pslug}">
                       
                        <h3>${o.ptitle}</h3>
                        </a>
                    </h3>
                    <div style="display: flex;">
                        <a href="${pageContext.request.contextPath}/post/${o.pslug}">
                        <img src="${o.pimage}" alt="?nh" width="30%">
                        </a>
                        <p>${o.ptitle}</p>
                </div>
                </div>
            </c:forEach>
         
        </div>
        
        <div class="newsContainer2" style="display: none; flex-direction: column; width: 70%; border: 1px solid black;">
            <div class="oneNews" style="border: 1px solid black;">
                <h3>Tiêu đề trang 2</h3>
                <div style="display: flex;">
                    <img src="https://cdnphoto.dantri.com.vn/DvD5TRVMqbJ0rTyJWlpcebtvTpg=/zoom/774_516/2024/10/06/thumb-1728229784459.png"
                        alt="?nh" width="30%">
                    <p>?o?n v?n</p>
                </div>

            </div>

        </div>
        <div class="newsContainer3" style="display: none; flex-direction: column; width: 70%; border: 1px solid black;">
            <div class="oneNews" style="border: 1px solid black;">
                <h3>tiêu đề trang 333333</h3>
                <div style="display: flex;">
                    <img src="https://cdnphoto.dantri.com.vn/DvD5TRVMqbJ0rTyJWlpcebtvTpg=/zoom/774_516/2024/10/06/thumb-1728229784459.png"
                        alt="?nh" width="30%">
                    <p>?o?n v?n</p>
                </div>

            </div>

        </div>
    </div>
    
    <div class="button" style="display: flex;  justify-content: center;">
        <button id="button1">Trang 1</button>
        <button id="button2">Trang 2</button>
        <button
            id="button3">Trang 3</button>
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