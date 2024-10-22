<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${p.ptitle}</title>
    <base href="${pageContext.request.contextPath}/">
    <link  rel="icon" href="https://is1-ssl.mzstatic.com/image/thumb/Purple117/v4/8f/88/10/8f88108c-416f-3771-1353-32c31baeb6b1/source/512x512bb.jpg" type="image/jpg">
    <link rel="stylesheet" href="all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    
</head>

<body>
    <div>
        <img src="https://theme.hstatic.net/200000333665/1000707799/14/blog_news_banner.png?v=296" alt="ảnh"
            style="width: 100%; height: auto;">
    </div>

    <div class="body" style="display: flex; flex-direction: column; align-items: center;">

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
            <a style="padding-left: 0; margin-left: 0; " href="paging?mucTin=tin-xu-huong&trang=1">Tin xu
                hướng</a>
            <a href="paging?mucTin=tin-duoc-yeu-thich&trang=1">Tin được yêu thích nhất</a>

            <c:forEach var="o" items="${listC}" >
                <a href="paging?mucTin=${o.cslug}&trang=1">${o.cname}</a>
            </c:forEach>
            <a href="tim-kiem">Tìm kiếm</a>
        </div>

        <div class="articel" style="width: 70%;">
            <p>Chuyên mục: ${p.categoryName}</p>
            <h3>${p.ptitle}</h3>

            <a href="tac-gia?eid=${p.editorID}">${p.editorName}</a>
            <p>${p.dayOfWeek}, ${p.formattedPtime}</p>
            <img src="${p.pimage}" alt="ảnh" width="90%">

            <div>
                ${p.pcontent}
            </div>

            <!--<pre></pre>-->
            <p id="cntLike">Số lượt thích:</p>
            <a href="like?pid=${p.postID}">&#128077; ${p.plikes}</a>
            
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
                        <textarea name="comment" id="comment" placeholder="bình luận của bạn" rows="1"
                            cols="50"></textarea>
                        <input type="hidden" name="postID" value="${p.postID}">
                        <button style="top: -15px;" type="submit">Gửi bình luận</button>
                    </form>
                </c:if>

                <!--KHI SUA COMMENT-->
                <c:if test="${sessionScope.updateComment == true}">
                    <form action="binh-luan" method="post">
                        <label for="comment" style="top: -15px;">Bình luận của bạn</label>
                        <textarea name="comment" id="comment" placeholder="bình luận" rows="1" cols="50"
                            required>${sessionScope.Comment.ccontent}</textarea>
                        <input type="hidden" name="postID" value="${p.postID}">
                        <input type="hidden" name="action" value="update">
                        <button type="submit" style="top: -15px;">Gửi</button>
                    </form>
                </c:if>

            </div>
        </div>
    
         <!--CAC TIN LIEN QUAN-->
    <div class="container" style="display: flex; flex-direction: column; width: 70%; ">
        <h3>${p.categoryName}</h3>
        <c:forEach var="o" items="${relatedPosts}">
            <div style="display: flex; flex-direction: column;">
                <a href="post/${o.pslug}">
                    <h3>${o.ptitle}</h3>
                </a>
                <div style="display: flex; ">
                    <img src="${o.pimage}" alt="ảnh" width="30%">
                    <div style="display: flex; flex-direction: column">
                        <!--                                <h4>${o.editorName}</h4>
                                <h4>${o.dayOfWeek}, ${o.formattedPtime}</h4>-->
                        <p>${o.description}</p>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>    
    
    </div>

   

    <div class="footer" style="display: flex; justify-content: center; border-top: 2px solid rgb(180, 169, 169);">
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