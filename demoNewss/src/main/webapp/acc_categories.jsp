<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <base href="${pageContext.request.contextPath}/">
    <title>Chuyên mục</title>
</head>
<body>
    
    <!--CAC MUC CUA TAI KHOAN-->
    <div class="sidebar">
        <a href="tai-khoan?muc=thong-tin" class="active"><i class="fas fa-user"></i>Thông tin tài khoản</a>
        <a href="tai-khoan?muc=binh-luan"><i class="fas fa-comments"></i>Hoạt động bình luận</a>
        <c:if test="${sessionScope.user.ueditor == true}">
            <a href="tai-khoan?muc=bai-viet"<i class="fas fa-newspaper"></i>Bài viết của bạn</a>
            <a href="tai-khoan?muc=chuyen-muc">Chuyên mục</a>
        </c:if>
        <a href="tai-khoan?muc=yeu-thich"><i class="fas fa-like"></i>Tin yêu thích</a>
        <a href="dang-xuat"><i class="fas fa-sign-out-alt"></i>Đăng xuất</a>
    </div>
    
        <div class="content">
            <h2>Quản lý chuyên mục</h2>
            <a href="them-muc">Thêm chuyên mục</a>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Tên chuyên mục</th>
                    <th>Mô tả</th>
                    <th></th>
                </tr>
                <c:forEach var="o" items="${categories}">
                    <tr>
                        <td>${o.categoryID}</td>
                        <td>${o.cname}</td>
                        <td>${o.cdescription}</td>
                        <td>
                            <a href="sua-muc?cid=${o.categoryID}">Sửa</a>
                            <a href="xoa-muc?cid=${o.categoryID}">Xoá</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        
</body>
</html>