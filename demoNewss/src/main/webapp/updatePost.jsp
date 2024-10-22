<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tạo bài viết</title>
    <link rel="icon"
        href="https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/1a/30/c4/1a30c461-520e-0983-3a3e-af096574d87a/source/512x512bb.jpg"
        type="image/jpg">
    <link rel="stylesheet" href="all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
        * {
            border-radius: 7px;
        }

        input {
            height: 50px;
            /* background-color: #E8F0FE; */
            font-size: large;
        }

        button {
            width: 40%;
            height: 50px;
            background-color: rgb(82, 143, 82);
            font-size: larger;
            font-weight: 700;
        }

        input:hover {
            opacity: 0.7;
        }

        h1 {
            text-align: center;
        }
        label, p{
            font-size: large;
            font-weight: 600;
        }
    </style>
</head>

<body style="background-color: gray;">
    <div style="display: flex; justify-content: center; ">
        <form action="${p==null? 'tao-bai':'sua-bai'}" method="post" style="display: flex; flex-direction: column;  background-color: white;">
            <c:if test="${p == null}">
                <h1>Tạo bài báo mới</h1>
            </c:if>
            <c:if test="${p != null}">
                <h1>Sửa bài viết</h1>
            </c:if>
            <label for="category">Chuyên mục</label>
            <select id="category" name="category">
                <c:if test="${p == null}">
                    <c:forEach var="o" items="${categories}">
                        <option value="${o.categoryID}">${o.cname}</option>
                    </c:forEach>
                </c:if>

                <c:if test="${p != null}">
                    <c:forEach var="o" items="${categories}">
                        <option value="${o.categoryID}" ${p.categoryID==o.categoryID ? "selected" :""}>${o.cname}
                        </option>
                    </c:forEach>
                </c:if>
            </select>
            <label>Tiêu đề</label>
            <textarea name="title" rows="2" cols="80" required>${p.ptitle}</textarea>
            <label>Hình ảnh</label>
            <input type="text" name="image" value="${p.pimage}" style="width: 100%; ">
            <label>Nội dung</label>
            <textarea name="content" max-rows="50" rows="20" cols="80" required>${p.pcontent}</textarea>
            <div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                <c:if test="${p == null}">
                    <input type="submit" value="Tạo bài viết">
                </c:if>
                <c:if test="${p != null}">
                    <input type="hidden" name="pid" value="${p.postID}">
                    <input type="submit" value="Sửa bài viết">
                </c:if>
            </div>
            
        </form>
    </div>
</body>

</html>