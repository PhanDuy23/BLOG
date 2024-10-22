 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Đăng Nhập</title>
    <link rel="icon"
    href="https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/1a/30/c4/1a30c461-520e-0983-3a3e-af096574d87a/source/512x512bb.jpg"
    type="image/jpg">
    <link rel="stylesheet" href="all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
   <style>
    *{
        border-radius: 7px;
        
    }
    input{
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

<body style="background-color: gray;">
    <div style="display: flex; justify-content: center; ">
        <div style="width: 30%; background-color: white;">
            <h1 style="text-align: center;">ĐĂNG NHẬP</h1>
            <form action="dang-nhap" method="post" style="display: flex; flex-direction: column;">
                <label for="account">Tên đăng nhập:</label>
                <input type="text" id="account" name="account" value="${account}" required>
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" value="${password}" required>
                <div>
                    <label for="remember">Ghi nhớ đăng nhập</label>
                    <input style="height: 15px;" type="checkbox" id="remember">            

                </div>
                <div style="display: flex; justify-content: center;">
                    <button  type="submit" style="width: 100%;">Đăng nhập</button>

                </div>
            </form>
            <p class="text-danger" style="text-align: center;">${message}</p>
        
            <form action="dang-ki" method="get" style="display: flex; justify-content: center;">
                <button type="submit"  value="Đăng ký">Đăng kí</button>
            </form>
        </div>
    </div>
    
</body>

</html>
