<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Artist</title>
        <link rel="stylesheet" type="text/css" href="StyleSheet.css">   <!--StyleSheet-->
    </head>
    <body>
        <h1>Member view for:<br> ${artist.firstName} ${artist.lastName}</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>${artist.id}</td>
            </tr>
            <tr>
                <td>Artist: </td>
                <td>${artist.firstName} ${artist.lastName}</td>
            </tr>
            <tr>
                <td>Wiki:</td>
                <td><a href="http://${artist.wikiUrl}">${artist.wikiUrl}</a></td>
            </tr>
            <tr>
                <td>Country: </td>
                <td>${artist.country}</td>
            </tr>
            <tr>
                <td>Date of Birth: </td>
                <td><fmt:formatDate pattern="dd/MM-yyyy" value="${artist.dateOfBirth}"/></td>
            </tr>
            <tr>
                <td>Date of Death: </td>
                <td><fmt:formatDate pattern="dd/MM-yyyy" value="${artist.dateOfDeath}"/></td>
            </tr>
        </table>
        <form action="Controller" method="POST">
            <button type="submit" name="command" value="artList">Back to list</button>
        </form>
    </body>
</html>
