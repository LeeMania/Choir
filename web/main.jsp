<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>main</title>
        <link rel="stylesheet" type="text/css" href="StyleSheet.css">   <!--StyleSheet-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script>
            var index = navigator.appVersion.indexOf("Mobile");
            
            if (index > -1) {
                window.location = "mainMobile.jsp";
            }
        </script>
    </head>
    <body>
        <h1>Choir Main</h1>
        <hr/>
        <div class="menu">
            <form action="Controller" method="POST">
                <button type="submit" name="command" value="password">Change password</button>
                <button type="submit" name="command" value="memList">List members</button>
                <button type="submit" name="command" value="artList">List artist</button>
                <button type="submit" name="command" value="chat">Chat</button>
            </form>
        </div>

    </body>
</html>
