<%-- 
    Document   : form
    Created on : Oct 3, 2024, 10:22:30 PM
    Author     : doanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Form Đăng Nhập</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Đăng nhập</h1>
        <form action="dang-nhap" method="post">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Đăng nhập</button>
        </form>
        <p class="text-danger">${message}</p>
        
        <form action="signup" method="post">
            <input type="submit" value="Đăng ký">
        </form>
    </div>   

    <script src="script.js"></script>
</body>
</html>

