
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body> 
        <h1> Hi student ${sessionScope.user.displayname}</h1>
        

         <a href="../../exam/student"> Báo cáo điểm</a> <br/>
       
        
       
    </body>
</html>
