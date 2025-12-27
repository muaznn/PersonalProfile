<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>

        <sql:setDataSource var="studentData"
            driver="org.apache.derby.jdbc.ClientDriver"
            url="jdbc:derby://localhost:1527/StudentProfile"
            user="app"
            password="app"/> 

        <c:if test="${not empty param.action && param.action == 'update'}">
            <sql:update dataSource="${studentData}">
                UPDATE PROFILE SET NAME = ?, STUDENTID = ?, PROGRAM = ? , EMAIL = ? , HOBBY = ? , INTRO = ?  WHERE ID = ?
                <sql:param value="${param.name}" />
                <sql:param value="${param.studentId}" />
                <sql:param value="${param.program}" /> 
                <sql:param value="${param.email}" /> 
                <sql:param value="${param.hobby}" /> 
                <sql:param value="${param.intro}" /> 
                <sql:param value="${param.id}" /> 
            </sql:update>
            
            <c:redirect url="viewProfiles.jsp?status=saved" />
        </c:if>

        <sql:query var="result" dataSource="${studentData}">
            SELECT * FROM PROFILE WHERE ID = ?
            <sql:param value="${param.id}" />
        </sql:query>

        <c:forEach var="row" items="${result.rows}">
            
            <div class="card">
                <h2 style="text-align: center; margin-bottom: 20px;">Edit Profile</h2>
                
                <form action="edit.jsp" method="POST">
                    <input type="hidden" name="id" value="${row.id}">
                    <input type="hidden" name="action" value="update">

                    <label>Full Name</label>
                    <input type="text" name="name" value="${row.name}" required>
                    <label>Student ID</label>
                    <input type="text" name="studentId" value="${row.studentId}" required>
                    <label>Program</label>
                    <input type="text" name="program" value="${row.program}" required>
                    <label>Email Address</label>
                    <input type="email" name="email" value="${row.email}" required>
                    <label>Hobby</label>
                    <input type="text" name="hobby" value="${row.hobby}">
                    <label>Intro</label>
                    <textarea name="intro" rows="3" style="width:100%; margin-bottom:15px; border-radius:10px; padding:10px; border:1px solid rgba(0,0,0,0.1); font-family:inherit;">${row.intro}</textarea>

                    <div class="form-actions">
        
                        <button type="submit" class="btn-form btn-save">
                            Save
                        </button>
                        <a href="viewProfiles.jsp" class="btn-form btn-cancel" 
                            style="display: inline-flex; justify-content: center; align-items: center; text-decoration: none;">
                             Cancel
                         </a>
                    </div>
                </form>
            </div>
        </c:forEach>

    </body>
</html>