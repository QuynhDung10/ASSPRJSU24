<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FAP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/stylelogin.css">
    </head>
    <body>
         <form action="login" method="POST">
     <div class="wrapper">
        <div class="logo">
            <img src="https://inkythuatso.com/uploads/images/2021/11/logo-fpt-inkythuatso-1-01-01-14-33-19.jpg" alt="">
        </div>
        <div class="text-center mt-4 name">
           FPT University
        </div>
        <form class="p-3 mt-3">
            <div class="form-field d-flex align-items-center">
                <span class="far fa-user"></span>
                <input type="text" name="username" id="userName" placeholder="Username">
            </div>
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-key"></span>
                <input type="password" name="password" id="password" placeholder="Password">
            </div>
            <button class="btn mt-3">Login</button>
        </form>
        </form>
    </div>
    </body>
</html>

