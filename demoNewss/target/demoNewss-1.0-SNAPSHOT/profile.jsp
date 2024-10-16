
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Thông tin cá nhân</title>
</head>
<body>
    <div class="sidebar">
        <a href="#" class="active"><i class="fas fa-user"></i>Thông tin tài khoản</a>
        <a href="#"><i class="fas fa-comments"></i>Hoạt động bình luận</a>
        <a href="#"><i class="fas fa-newspaper"></i>Bài viết của bạn</a>
        <a href="#"><i class="fas fa-like"></i>Tin yêu thích</a>
        <a href="#"><i class="fas fa-sign-out-alt"></i>Đăng xuất</a>
    </div>
    <div class="content">
        <h1>Thông tin cá nhân</h1>
        <div class="info-item">
            <i class="fas fa-user"></i>
            <div>
                <div>Họ và tên</div>
                <p> ${sessionScope.user.uname} </p>
                <span></span>
            </div>
        </div>
        <div class="info-item">
            <i class="fas fa-birthday-cake"></i>
            <div>
                <div>Ngày sinh</div>
                <span>dd/mm/yyyy</span>
            </div>
        </div>        
        <div class="info-item">
            <i class="fas fa-birthday-cake"></i>
            <div>
                <div>Ngày sinh</div>
                <span>dd/mm/yyyy</span>
            </div>
        </div>
        <div class="info-item">
            <i class="fas fa-venus-mars"></i>
            <div>
                <div>Giới tính</div>
                <span>Khác</span>
            </div>
        </div>
        <div class="info-item">
            <i class="fas fa-phone"></i>
            <div>
                <div>Số điện thoại</div>
                <span>Chưa có thông tin</span>
            </div>
        </div>
        <div class="info-item">
            <i class="fas fa-map-marker-alt"></i>
            <div>
                <div>Địa chỉ</div>
                <span>Chưa có thông tin</span>
            </div>
        </div>
    </div>
</body>
</html>