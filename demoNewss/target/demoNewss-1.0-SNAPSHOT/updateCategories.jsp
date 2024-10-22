<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chuyên mục</title>
    <link rel="icon"
        href="https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/1a/30/c4/1a30c461-520e-0983-3a3e-af096574d87a/source/512x512bb.jpg"
        type="image/jpg">
    <link rel="stylesheet" href="all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <base href="${pageContext.request.contextPath}/">
    <style>
        *{
            border-radius: 7px;
            
        }
        input, textarea{
            height: 50px;
            background-color: #E8F0FE;
            font-size: large;
        }
        button{
            width: 40%; height: 50px; background-color: rgb(82, 143, 82);
            font-size: larger;
            font-weight: 700;
        }
        button:hover{
            opacity: 0.7;
        }
       </style>
</head>

<body  style="background-color: gray;">
<div style="display: flex; justify-content: center;">
    <form action="${category == null? 'them-muc':'sua-muc'}" method="post" style="display: flex; flex-direction: column; background-color: white;">

        <c:if test="${category != null}">
            <label for="cname">Tên chuyên mục</label> <br>
            <input type="text" name="cname" id="cname" style="width: 600px;" value="${category.cname}" required>
            <p>${cateErr}</p> <br>
            <label for="cdesc">Mô tả</label><br>
            <textarea id="cdesc" name="cdesc" rows="3" cols="50" style="width: 600px;"  required>${category.cdescription}</textarea>
            <input type="hidden" name="cid" value="${category.categoryID}">
            <p>${descErr}</p>
        </c:if>

        <c:if test="${category == null}">
            <label for="cname">Tên chuyên mục</label><br>
            <input type="text" name="cname" id="cname" style="width: 600px;" value="${failedName}" required>
            <p>${cateErr}</p><br>
            <label for="cdesc">Mô tả</label><br>
            <textarea id="cdesc" name="cdesc" rows="3" cols="50" style="width: 600px;" required>${failedDesc}</textarea>
            <p>${descErr}</p>
        </c:if>
        <div style="display: flex; justify-content: center;">
            <button value="${category == null? 'Thêm mục':'Sửa mục'}" width="100px">${category == null? 'Thêm mục':'Sửa mục'}</button>
            
        </div>
    </form>
</div>
    
</body>

</html>