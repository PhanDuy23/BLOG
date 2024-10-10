<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Post</title>
    </head>
    <body>
        
        <h1>Tạo bài báo mới</h1>
        <form action="tao-bai" method="post">
            <label for="category">Thể loại</label>
            <select id="category" name="category" value="${p.categoryName}">
                
                <c:forEach var="o" items="${categories}">
                    <option value="${o.categoryID}">${o.cname}</option>
                </c:forEach>
                
            </select>
            <br><br>
     
        <label>Tiêu đề</label>
        <textarea name="title" rows ="2" cols="80" >${p.ptitle}</textarea><br>
        <label>Hình ảnh</label>
        <input type="text" name ="image">${p.pimage}<br>
        <label>Nội dung</label>
        <textarea name="content" rows ="50" cols="80">${p.pcontent}</textarea><br>
        <c:if test="${p == null}">
            <input type="hidden" name="action" value="create">
            <input type="submit" value="Tạo bài viết">
        </c:if>
        <c:if test="${p != null}">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="pid" value="${p.postID}">
            <input type="submit" value="Sửa bài viết">
        </c:if>
        </form>
    </body>
</html>
