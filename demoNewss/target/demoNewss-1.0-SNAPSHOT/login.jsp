<!--
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>

<head>
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="home.css">
    
    <style>
        .container {
            text-align: center;
            margin-top: 100px;
        }

        input[type=text],
        input[type=password] {
            width: 200px;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;

        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 200px;
        }

        button:hover {
            opacity: 0.8;

        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Đăng nhập</h1>
        <form action="dang-nhap" method="post">
            <label for="account">Tên đăng nhập:</label>
            <input type="text" id="account" name="account" value="${account}" required><br>

            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" value="${password}" required><br>
            <label for="remember">Ghi nhớ đăng nhập</label>
            <input type="checkbox" name="remember"><br>
         
            <button type="submit">Đăng nhập</button>
        </form>
    </div>  
    <p class="text-danger">${message}</p>
        
        <form action="dang-ki" method="get">
            <input type="submit" value="Đăng ký">
        </form>
    <script>
        const form = document.querySelector('form');

        form.addEventListener('submit', (event) => {
            event.preventDefault();
            // Thêm logic kiểm tra dữ liệu ở đây
            console.log('Form submitted');
        });
    </script>
</body>

</html>-->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Đăng Nhập</title>
    <!--<link rel="stylesheet" href="style.css">-->
   <link rel="stylesheet" href="home.css">
   
</head>

<body>
    <div style="display: flex; justify-content: center;">
        <div style="width: 30%;">
            <h1 style="text-align: center;">ĐĂNG NHẬP</h1>
            <form action="dang-nhap" method="post" style="display: flex; flex-direction: column;">
                <label for="account">Tên đăng nhập:</label>
                <input type="text" id="account" name="account" value="${account}" required>
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" value="${password}" required>
                <div>
                    <label for="remember">Ghi nhớ đăng nhập</label>
                    <input type="checkbox" name="remember" id="remember">            
                </div>
                <button type="submit">Đăng nhập</button>
            </form>
            <p class="text-danger">${message}</p>
        
            <form action="dang-ki" method="get" style="display: flex; justify-content: center;">
                <input type="submit" value="Đăng ký">
            </form>
        </div>
    </div>
    
   

</body>

</html>
