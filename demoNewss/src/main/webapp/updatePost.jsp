<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Post</title>
    </head>
    <body>
        <c:if test="${p == null}">
            <h1>Tạo bài báo mới</h1>
        </c:if>
        <c:if test="${p != null}">
            <h1>Sửa bài viết</h1>
        </c:if>
        <form action="${p==null? 'tao-bai':'sua-bai'}" method="post">
            <label for="category">Chuyên mục</label>
            <select id="category" name="category">

                <c:if test="${p == null}">
                    <c:forEach var="o" items="${categories}">
                        <option value="${o.categoryID}">${o.cname}</option>
                    </c:forEach>
                </c:if>
                        
                <c:if test="${p != null}">
                    <c:forEach var="o" items="${categories}">
                        <option value="${o.categoryID}" ${p.categoryID == o.categoryID ? "selected":""}>${o.cname}</option>
                    </c:forEach>
                </c:if>
                
                
            </select>
            <br><br>
     
            <label>Tiêu đề</label><br>
            <textarea name="title" rows ="2" cols="80" required>${p.ptitle}</textarea><br>
            <label>Hình ảnh</label><br>
            <input type="text" name ="image" value="${p.pimage}" style="width: 600px;"><br>
            <label>Nội dung</label><br>
            <textarea name="content" rows ="50" cols="80" required>${p.pcontent}</textarea><br>
            <c:if test="${p == null}">
            <input type="submit" value="Tạo bài viết">
        </c:if>
        <c:if test="${p != null}">
            <input type="hidden" name="pid" value="${p.postID}">
            <input type="submit" value="Sửa bài viết">
        </c:if>
        </form>
    </body>
</html>
