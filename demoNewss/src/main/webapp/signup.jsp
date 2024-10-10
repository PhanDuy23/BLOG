

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
    </head>
    <body>
        <h1>ĐĂNG KÝ</h1>
        <form action="signup" method="post">
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
</html>
