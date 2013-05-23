<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" type="text/css" href="StyleSheet.css">   <!--StyleSheet-->
    </head>
    <body>
        <h1>Change password for:<br> ${member.firstName} ${member.lastName}</h1>
        <form action="Controller" method="POST">
            <div class="table">
                <div class="row">
                    <div class="cell">
                        Old password:
                    </div>
                    <input type="password" name="oldPass">
                </div>
                <div class="row">
                    <div class="cell">
                        New password:
                    </div>
                    <input type="password" name="newPass">
                </div>
                <div class="row">
                    <div class="cell">
                        New password again:
                    </div>
                    <input type="password" name="newPassAgain">
                </div>
                <div class="row">
                    <div class="cell">

                    </div>
                    <div class="cell">
                        <button type="submit" name="command" value="changePass">Save</button>
                        <button type="submit" name="command" value="back">Cancel</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
