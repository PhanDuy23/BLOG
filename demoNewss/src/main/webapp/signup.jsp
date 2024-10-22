<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <link rel="icon" href="https://is5-ssl.mzstatic.com/image/thumb/Purple71/v4/1a/30/c4/1a30c461-520e-0983-3a3e-af096574d87a/source/512x512bb.jpg"    type="image/jpg">
        <link rel="stylesheet" href="all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <style>
            *{
                border-radius: 7px;
                
            }
            input{
                height: 50px;
                background-color: #E8F0FE;
                font-size: larger;
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
        <div style="display: flex; justify-content: center;">
            <div style="width: 30%;  background-color: white;">
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
                        <button type="submit" value ="Đăng kí" style="width: 30%;">Đăng kí</button>
                    </div> 
                        
                    <input type="hidden" name="action" value="signup">
                </form>
                <p style="text-align: center;">${errorMessage}</p>
            </div>
        </div>
        
    </body>
</html>
