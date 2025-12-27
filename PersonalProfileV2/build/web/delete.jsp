<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Student</title>
    </head>
    <body>
        <h1>Delete</h1>
        <sql:setDataSource var="studentData"
            driver="org.apache.derby.jdbc.ClientDriver"
            url="jdbc:derby://localhost:1527/StudentProfile"
            user="app" password="app"/>

        <c:if test="${not empty param.id}">
            <sql:update dataSource="${studentData}">
                DELETE FROM PROFILE WHERE ID = ?
                <sql:param value="${param.id}" />
            </sql:update>
        </c:if>

        <c:redirect url="viewProfiles.jsp"/>
    </body>
</html>
