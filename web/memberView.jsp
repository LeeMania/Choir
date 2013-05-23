<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="StyleSheet.css">   <!--StyleSheet-->
    </head>
    <body>
        <h1>Member view for:<br> ${member.firstName} ${member.lastName}</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>${member.id}</td>
            </tr>
            <tr>
                <td>First name</td>
                <td>${member.firstName}</td>
            </tr>
            <tr>
                <td>Last name</td>
                <td>${member.lastName}</td>
            </tr>
            <tr>
                <td>Title:</td>
                <td>${member.title}</td>
            </tr>
            <tr>
                <td>Date of Birth:</td>
                <td><fmt:formatDate pattern="dd/MM-yyyy" value="${member.dateOfBirth}"/></td>
            </tr>
            <tr>
                <td>Voice:</td>
                <td>${member.voice.name}</td>
            </tr>
            <tr>
                <td>Roles:</td>
                <td>
                    <c:forEach var="role" items="${member.roles}">
                        <li>
                            ${role.name}
                            ${roles.role.name}
                        </li>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <br>
            </tr>
            <tr>
                <td>Street:</td>
                <td>${member.street}</td>
            </tr>
            <tr>
                <td>Zip Code:</td>
                <td>${member.zipCode}</td>
            </tr>
            <tr>
                <td>City:</td>
                <td>${member.city}</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>${member.email}</td>
            </tr>
            <tr>
                <td>Phone</td>
                <td>${member.phone}</td>
            </tr>
        </table>
        <form action="Controller" method="POST">
            <button type="submit" name="command" value="memList">Back to list</button>
        </form>
    </body>
</html>
