
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chuyên mục</title>
        <base href="${pageContext.request.contextPath}/">
    </head>
    <body>
        <form action="${category == null? 'them-muc':'sua-muc'}" method="post">
             
            <c:if test="${category != null}">
                <label id="cname">Tên chuyên mục</label><br>
                <input type="text" name="cname" id="cname" style="width: 600px;" value="${category.cname}" required>
                <p>${cateErr}</p>
                <label id="cdesc">Mô tả</label>
                <textarea id="cdesc" name="cdesc" rows="3" cols="50" required>${category.cdescription}</textarea>
                <input type="hidden" name="cid" value="${category.categoryID}">
                <p>${descErr}</p>
                
            </c:if>
            <c:if test="${category == null}">
                <label id="cname">Tên chuyên mục</label><br>
                <input type="text" name="cname" id="cname" style="width: 600px;" value="${failedName}" required>
                <p>${cateErr}</p>
                <label id="cdesc">Mô tả</label><br>
                <textarea id="cdesc" name="cdesc" rows="3" cols="50" required>${failedDesc}</textarea>
                <p>${descErr}</p>
            </c:if>
            <input type="submit" value="${category == null? 'Thêm mục':'Sửa mục'}">
        </form>
    </body>
</html>
