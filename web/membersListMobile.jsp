<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <title>List of Members</title>
        <link rel="stylesheet" href="https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
        <link rel="stylesheet" href="my.css" />
        <script src="https://s3.amazonaws.com/codiqa-cdn/jquery-1.7.2.min.js">
        </script>
        <script src="https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.js">
        </script>
        <script src="my.js">
        </script>
        <!-- User-generated css -->
        <style>
        </style>
        <!-- User-generated js -->
        <script>
            try {

                $(function() {

                });

            } catch (error) {
                console.error("Your javascript has an error: " + error);
            }
        </script>
    </head>
    <body>
        <div data-role="page" data-theme="b">
            <h1>Members</h1>
            <hr/>
            <div data-role="collapsible-set">
                <c:forEach var="member" items="${members}">
                    <div data-role="collapsible" data-collapsed="true" data-mini="true">
                        <h3>${member.name}</h3>
                        <div id="test">
                            <ul data-role="listview" data-inset="true">
                                <li>ID: 
                                    ${manager.findMember(member.id).id}</li>
                                <li>Title: 
                                    ${manager.findMember(member.id).title}</li>
                                <li>Firstname: 
                                    ${manager.findMember(member.id).firstName}</li>
                                <li>Lastname: 
                                    ${manager.findMember(member.id).lastName}</li>
                                <li>Date of Birth: 
                                    ${manager.findMember(member.id).dateOfBirth.day}/
                                    ${manager.findMember(member.id).dateOfBirth.month}-
                                    ${manager.findMember(member.id).dateOfBirth.year}</li>
                                <li>Voice: ${manager.findMember(member.id).voice.name}</li>
                                <li>Role: 
                                    <c:forEach var="role" items="${manager.findMember(member.id).roles}" varStatus="status">
                                        ${role.name}<c:if test="${not status.last}">,</c:if>
                                    </c:forEach>
                                </li>
                                <li>Street: 
                                    ${manager.findMember(member.id).street}</li>
                                <li>Zipcode: 
                                    ${manager.findMember(member.id).zipCode}</li>
                                <li>City: 
                                    ${manager.findMember(member.id).city}</li>
                                <li>Email: 
                                    <a href="mailto:${manager.findMember(member.id).email}">${manager.findMember(member.id).email}</a></li>
                                <li>Phone: 
                                    <a href="tel:+45${manager.findMember(member.id).phone}">Call ${manager.findMember(member.id).phone}</a>
                                    <a href="sms:+45${manager.findMember(member.id).phone}">SMS</a></li>
                                <li><a href="Controller?command=changeMob&id=${member.id}" data-role="button" data-icon="gear">Edit</a></li>
                            </ul>
                        </div>
                    </div>  
                </c:forEach>
            </div>
            <form action="Controller" method="POST">
                <button name="command" value="createMob" data-inline="true">Create new member</button>
                <button name="command" value="backMob" data-inline="true">Back to the Main page</button>
            </form>
        </div>
    </body>
</html>
