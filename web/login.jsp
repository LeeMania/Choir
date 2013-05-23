<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="StyleSheet.css">   <!--StyleSheet-->
    </head>
    <body>
        <h1>Login</h1>
        <form action="Controller" method="POST">
            <div class="table">
                <div class="row">
                    <div class="cell">
                        Username:
                    </div>
                    <input type="text" name="userName">
                </div>
                <div class="row">
                    <div class="cell">
                        Password:
                    </div>
                    <input type="password" name="password">
                </div>
                <div class="row">
                    <div class="cell">

                    </div>
                    <div class="cell">
                        <button type="submit" name="command" value="login">Login</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
