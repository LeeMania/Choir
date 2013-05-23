<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Members</title>
        <link rel="stylesheet" type="text/css" href="StyleSheet.css">   <!--StyleSheet-->
    </head>
    <body>
        <h1>List of Members</h1>
        <hr/>
        <ul>
            <c:forEach var="member" items="${members}">
                <li>
                    ${member.name}
                    <a href="Controller?command=change&id=${member.id}">
                        Edit
                    </a>
                    <a href="Controller?command=view&id=${member.id}">
                        View
                    </a>
                </li>
            </c:forEach>
        </ul>
        <form action="Controller" method="POST">
            <button name="command" value="create">Create new member</button>
            <button name="command" value="back">Back to the Main page</button>
        </form>
    </body>
</html>
