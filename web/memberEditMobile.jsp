<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="cc" uri="http://java.sun.com/jstl/core_rt" %>
<% String isTrue = "";%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <title>${status}</title>
        <link rel="stylesheet" href="https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
        <link rel="stylesheet" href="my.css" />
        <script src="https://s3.amazonaws.com/codiqa-cdn/jquery-1.7.2.min.js"></script>
        <script src="https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.js"> </script>
        <script src="validateEdit.js"></script>
        <!-- User-generated js -->
        <script>
            try {
            $(document).ready(function(e) {
                $('#save').click(function() {
                    return checkVal();
                });
            });
            } catch (error) {
                console.error("Your javascript has an error: " + error);
            }
        </script>
    </head>
    <body>
        <h1>${status}</h1>
        <hr>
        <form action="Controller" method="POST">
            <!--Table-->
            <div class="table">
                <div class="tableRow">
                    <div class="tableData" id="statusField"></div>
                </div>
                <div class="tableRow">
                    <div class="tableData">ID: <input type="hidden" name="id" value="${member.id}" class="label">${member.id}</div>
                </div>
                <div class="tableRow">
                    <div class="tableData">First name:</div>
                    <div class="tableData"><input type="text" name="fName" value="${member.firstName}" id="fName"><p class="label" id="fNReq">*</p></div>
                </div>
                <div class="tableRow">
                    <div class="tableData">Last name</div>
                    <div class="tableData"><input type="text" name="lName" value="${member.lastName}" id="lName"><p class="label" id="lNReq">*</p></div>
                </div>
                <div class="tableRow">
                    <div class="tableData">Title:</div>
                    <div class="tableData"><input type="text" name="title" value="${member.title}"></div>
                </div>
                <div class="tableRow">
                    <div class="tableData">Date of Birth:</div>
                    <div class="tableData"><input type="date" name="bDay" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${member.dateOfBirth}'/>" id="dOB"><p class="label" id="dOBReq">*</p></h6></div>
                </div>
                <div class="tableRow">
                    <div class="tableData">Voice:</div>
                    <div class="tableData">
                        <select name="voice">
                            <c:forEach var="voice" items="${voices}">
                                <c:choose>
                                    <c:when test="${member.voice == null}">
                                        <option value="${voice.code}">${voice.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${member.voice.code == voice.code}">
                                                <option value="${voice.code}" selected>${voice.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${voice.code}">${voice.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="tableRow">
                    <div class="tableData">Roles:</div>
                    <div class="tableData">

                        <c:forEach var="role" items="${roles}">
                            <li>
                                <c:forEach var="memRole" items="${memRoles}">
                                    <c:if test="${memRole == role.code}">
                                        <% isTrue = "checked";%>
                                    </c:if>
                                </c:forEach>
                                <input type="checkbox" name="role" <%=isTrue%> value="${role.code}">
                                ${role.code}
                                <%isTrue = "";%>
                            </li>
                        </c:forEach>
                    </div>
                </div>

            </div>
            <div class="table" >
                <div class="tableRow">
                    <div class="tableData">Street:</div>
                    <div class="tableData"><input type="text" name="street" value="${member.street}"></div>
                </div>
                <div class="tableRow">
                    <div class="tableData">Zip Code:</div>
                    <div class="tableData"><input type="number" name="zipCode" value="${member.zipCode}" id="zip"></div>
                </div>
                <div class="tableRow">
                    <div class="tableData">City:</div>
                    <div class="tableData"><input type="text" name="city" value="${member.city}"></div>
                </div>
                <div class="tableRow">
                    <div class="tableData">Email:</div>
                    <div class="tableData"><input type="email" name="email" value="${member.email}" id="email"><p class="label" id="eReq">*</p></div>
                </div>
                <div class="tableRow">
                    <div class="tableData">Phone</div>
                    <div class="tableData"><input type="text" name="phone" value="${member.phone}"></div>
                </div>
                <div class="tableRow">
                    <td style="text-align:center" colspan="2">
                        <button type="submit" name="command" value="save" id="save">Save</button>
                        <button name="command" value="cancelEdit">Cancel</button>
                </div>
                <div class="tableRow">
                    <h6 id="fBox" style="color: red"></h6>
                    <h6 id="lBox" style="color: red"></h6>
                    <h6 id="dBox" style="color: red"></h6>
                    <h6 id="eBox" style="color: red"></h6>
                </div>
            </div>
        </form>
    </body>
</html>
