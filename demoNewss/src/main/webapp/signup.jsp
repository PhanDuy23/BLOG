<!--

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="home.css">
        <title>Sign up</title>
    </head>
    <body>
        <h1>ĐĂNG KÝ</h1>
        <form action="dang-ki" method="post">
            <label>Họ tên</label>
            <input type ="text" name ="name" required><br>
            <label>Tài khoản</label>
            <input type ="text" name ="account" required><br>
            <label>mật khẩu</label>
            <input type ="password" name ="password" required><br>
            <label>Nhập lại mật khẩu</label>
            <input type ="password" name ="repassword" required><br>
            <input type="submit" value ="Sign up">
            <input type="hidden" name="action" value="signup">
        </form>
        <p>${errorMessage}</p>
    </body>
</html>-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <link rel="stylesheet" href="home.css">
    </head>
    <body>
        <div style="display: flex; justify-content: center;">
            <div style="width: 30%;">
                <h1 style="text-align: center;">ĐĂNG KÝ</h1>
                <form action="dang-ki" method="post" style="display: flex; flex-direction: column;">
                    <label>Họ tên</label>
                    <input type ="text" name ="name" required>
                    <label>Tài khoản</label>
                    <input type ="text" name ="account" required>
                    <label>Mật khẩu</label>
                    <input type ="password" name ="password" required>
                    <label>Nhập lại mật khẩu</label>
                    <input type ="password" name ="repassword" required>
                    <div style="display: flex; justify-content: center;">
                        <input type="submit" value ="Đăng kí" style="width: 30%;">
                    </div> 
                        
                    <input type="hidden" name="action" value="signup">
                </form>
                <p>${errorMessage}</p>
            </div>
        </div>
        
    </body>
</html>
