<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${p.ptitle}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <base href="${pageContext.request.contextPath}/">
    <style>
        * {
            box-sizing: border-box;
            background-clip: border-box;
            position: relative;
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
            <input type="text" placeholder="tìm kiếm" style="height: 40px;">
        </div>
        
        <!--CAC MUC TIN-->
        <div class="menu" style="display: flex; border: 1px solid black; width: 70%; ">
            <a href="paging?mucTin=tin-xu-huong&trang=1">Tin xu hướng</a>
            <a href="paging?mucTin=tin-duoc-yeu-thich&trang=1">Tin được yêu thích nhất</a>
            
            <c:forEach var="o" items="${listC}">
                <a href="paging?mucTin=${o.cslug}&trang=1" >${o.cname}</a>
            </c:forEach>
            
        </div>
        
        <div class="articel" style="border: 1px solid black; width: 70%;">
            <p>Chuyên mục: ${p.categoryName}</p>
            <h3>${p.ptitle}</h3>
            
            <a href="tac-gia?eid=${p.editorID}">${p.editorName}</a>
            <p>${p.dayOfWeek}, ${p.formattedPtime}</p>
            <img src="${p.pimage}" alt="ảnh" width="90%" >
            
            <div>
                ${p.pcontent}
            </div>
            
            <!--<pre></pre>-->
            <p id="cntLike">Số lượt thích:</p>
            <a href="like?pid=${p.postID}">&#128077; ${p.plikes}</a>
            <button id="like" style="background-color:white;">like</button>
            <p>Bình luận(${comments.size()}) </p>
            
            <!--Khong update comment-->
            <c:if test="${sessionScope.updateComment == null}">
                <c:forEach var="o" items="${comments}">
                    <div style=" border: 1px solid black"> 
                        <a href="#">${o.userName}</a>
                        <p>${o.dayOfWeek}, ${o.formattedCtime}</p>
                        <p>${o.ccontent}</p>
                    </div>
                </c:forEach>
            </c:if>
            
            <!--Khi update comment-->
            <c:if test="${sessionScope.updateComment == true}">
                <c:forEach var="o" items="${comments}">
                    <div style=" border: 1px solid black"> 
                        <c:if test="${o.commentID != Comment.commentID}">
                            <a href="#">${o.userName}</a>
                            <p>${o.dayOfWeek}, ${o.formattedCtime}</p>
                            <p>${o.ccontent}</p>
                        </c:if>
                    </div>
                </c:forEach>
            </c:if>
                
            <div>
                <!--Khi khong sua comment-->
                <c:if test="${sessionScope.updateComment == null}">
                    <form action="binh-luan" method="post">
                        <!--<label for="comment">Bình luận của bạn</label>-->
                        <textarea name="comment" id="comment" placeholder="bình luận của bạn" rows="10" cols="50"></textarea>
                        <input type="hidden" name="postID" value="${p.postID}">
                        <button type="submit">Gửi bình luận</button>
                    </form>
                </c:if>
                
                <!--KHI SUA COMMENT-->
                <c:if test="${sessionScope.updateComment == true}">
                    <form action="binh-luan" method="post">
                        <label for="comment">Bình luận của bạn</label>
                        <textarea name="comment" id="comment" placeholder="bình luận" rows="10" cols="50" required>${sessionScope.Comment.ccontent}</textarea>
                        <input type="hidden" name="postID" value="${p.postID}">
                        <input type="hidden" name="action" value="update">
                        <button type="submit">Gửi</button>
                    </form>
                </c:if>
                
            </div>
        </div>
    </div>
                    
        <!--CAC TIN LIEN QUAN-->
        <div class="newsContainer1" style="display: flex; flex-direction: column; width: 70%; ">
            <h3>${p.categoryName}</h3>
                <c:forEach var="o" items="${relatedPosts}">
                    <div style="display: flex; flex-direction: column; border: 1px solid black">
                        <a href="post/${o.pslug}">
                            <h3>${o.ptitle}</h3>
                        </a>
                        <div style = "display: flex; ">
                            <img src="${o.pimage}" alt="ảnh" width="30%">
                            <div style = "display: flex; flex-direction: column">
<!--                                <h4>${o.editorName}</h4>
                                <h4>${o.dayOfWeek}, ${o.formattedPtime}</h4>-->
                                <p>${o.description}</p>
                                
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
        document.querySelector("#like").addEventListener('click', function (e) {
            if (document.querySelector("#like").style.backgroundColor == "white") {
                document.querySelector("#like").style.backgroundColor = "blue"
            } else {
                document.querySelector("#like").style.backgroundColor = "white";
            }
        })
    </script>
</body>

</html>
