<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${p.ptitle}</title>
        <!--<link rel="stylesheet" href="main.css">-->
<!--        <style>
            body {
                max-width: 50%;
                overflow-x: hidden;
            }
            .article-content {
                width: 300px; /* Adjust the width as needed */
                white-space: pre-wrap; /* Preserve newlines and wrap text */
                overflow-wrap: normal; /* Prevent breaking long words */
                margin: 0 auto; /* Center the content */
            }
        </style>-->
    </head>
    <body>
        <h1>Đây là trang tin tức</h1>
        <a href="form.jsp">Đăng nhập</a>
        <table border="1">
            <tr>
                <c:forEach var="o" items="${listC}">
                    <td><a href="${pageContext.request.contextPath}/category/${o.cslug}" >${o.cname}</a></td>
                </c:forEach>
            </tr>
        </table>
        
            <c:if test = "${category != null}">
                <h3>${category}</h3><hr>
            </c:if>
            <h3>${p.categoryName}</h3>
            <h3>${p.ptitle}</h3>
            <img src="${p.pimage}" height="200" width="500">
            <h4>${p.editorName} ${p.ptime}</h4>

            <!-- đây là phần nội dung bài viết -->
            
            <pre>${p.pcontent}</pre>
            <p> Neu ban thay hay, hay like</p>
            <a href="${pageContext.request.contextPath}/like?pid=${p.postID}">&#128077; ${p.plikes}</a>

            
        
        <!--<pre></pre>-->
        
    </body>
</html>
