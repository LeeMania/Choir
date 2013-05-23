
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="cc" uri="http://java.sun.com/jstl/core_rt" %>
<% String isTrue = "";%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${status}</title>
        <link rel="stylesheet" type="text/css" href="StyleSheet.css">   <!--StyleSheet-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="validateEdit.js"></script>
        <script>
            $(document).ready(function(e) {


//                $.ajax({
//                    url : "http://localhost:8080/RestKA/webresources/rest.persons/phone/"+phone
//                    
//                });
            
            
            
            
            $("#phoneToAdd").click(function(){
                
                console.log($("#nr").val());
                
                $.ajax({
                    url:"http://localhost:8080/ChoirFrontend/AjaxServlet?phone="+$("#nr").val(),
                    cache: false,
                    dataType: "json",
                    success: dataReady
                });
                return false;
            });
            

                function dataReady(data) {
                    console.log(data.persons);
                   $("input[name='fName']").val(data.persons.fname);
                   $("input[name='lName']").val(data.persons.lname);
                   $("input[name='street']").val(data.persons.street);
                   $("input[name='zipCode']").val(data.persons.zipcode);
                   $("input[name='city']").val(data.persons.city);
                }
                $('#save').click(function() {
                    return checkVal();
                });
            });

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
                    <div class="tableData"><input type="text" id="nr" name="phone" value="${member.phone}"></div>
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
                <div><button id="phoneToAdd">get address</button></div>
            </div>
        </form>
    </body>
</html>
