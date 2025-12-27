<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student List</title>
        <link rel="stylesheet" href="style.css">
        
    </head>
    <body>
        <c:if test="${param.status == 'saved'}">
            <div id="toast" style="
                 position: fixed;
                 top: 20px;
                 right: 20px;
                 background: #28a745; /* Green */
                 color: white;
                 padding: 15px 25px;
                 border-radius: 10px;
                 box-shadow: 0 4px 12px rgba(0,0,0,0.2);
                 font-weight: bold;
                 z-index: 1000;
                 animation: fadeOut 4s forwards; /* Simple auto-hide animation */
            ">
                Profile Updated Successfully.
            </div>
            <style>
                    @keyframes fadeOut {
                        0% { opacity: 1; top: 20px; }
                        70% { opacity: 1; top: 20px; }
                        100% { opacity: 0; top: -100px; } /* Moves up and disappears */
                    }
                </style>
        </c:if>

        <div class="main-container">
            
            <h1 style="color: #222222; text-shadow: 0 0 5px #ffffff,0 0 10px #ffffff,0 0 15px #ffffff; font-weight: 800;">Student Directory</h1>

            <sql:setDataSource var="studentData" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/StudentProfile" user="app" password="app"/>
            <sql:query var="progList" dataSource="${studentData}">SELECT DISTINCT PROGRAM FROM PROFILE ORDER BY PROGRAM</sql:query>
            <sql:query var="hobbyList" dataSource="${studentData}">SELECT DISTINCT HOBBY FROM PROFILE ORDER BY HOBBY</sql:query>
            
            <c:choose>
                <c:when test="${not empty param.search}">
                    <sql:query var="result" dataSource="${studentData}">SELECT * FROM PROFILE WHERE NAME LIKE ? OR STUDENTID LIKE ?
                        <sql:param value="%${param.search}%" /><sql:param value="%${param.search}%" />
                    </sql:query>
                </c:when>
                <c:when test="${not empty param.filter}">
                    <sql:query var="result" dataSource="${studentData}">SELECT * FROM PROFILE WHERE PROGRAM LIKE ? OR HOBBY LIKE ?
                        <sql:param value="%${param.filter}%" />
                        <sql:param value="%${param.filter}%" />
                    </sql:query>
                </c:when>
                <c:otherwise>
                    <sql:query var="result" dataSource="${studentData}">SELECT * FROM PROFILE</sql:query>
                </c:otherwise>
            </c:choose>    

            <div style="display: flex; justify-content: space-between; align-items: flex-start; width: 100%;">
                <div class="floating-search">
                    <span style="font-weight:bold;">Search:</span>
                    <form action="viewProfiles.jsp" method="GET" style="display:flex; flex:1; gap:10px;">
                        <input type="text" name="search" placeholder="Name or ID" value="${param.search}">
                        <button type="submit" class="btn-fit btn-save-blue">Search</button>
                    </form>
                        
                    <div style="border-left: 1px solid rgba(255,255,255,0.3); height: 25px;"></div>
                    
                    <span style="font-weight:bold;">Filter:</span>
                    <form action="viewProfiles.jsp" method="GET" style="display:flex; flex:1; gap:10px;">
                        <input type="text" name="filter" list="mixedList" placeholder="Program or Hobby" value="${param.filter}">
                        <datalist id="mixedList">
                            <option value="" disabled>-- Programs --</option>
                            <c:forEach var="p" items="${progList.rows}">
                                <option value="${p.program}">
                            </c:forEach>

                            <option value="" disabled>-- Hobbies --</option>
                            <c:forEach var="h" items="${hobbyList.rows}">
                                <option value="${h.hobby}">
                            </c:forEach>
                        </datalist>

                        <button type="submit" class="btn-fit btn-save-blue">Filter</button>
                    </form>
                    <form action="viewProfiles.jsp" method="GET">
                        <button type="submit" class="btn-fit btn-cancel">Reset</button>
                    </form>
                    
                </div>
                <div style="display: flex; gap: 10px; align-items: flex-start; margin-bottom: 25px;">
                    <button class="btn-fit btn-save-blue" onclick="window.location.href='index.html'" style="height: 52px; display: flex; align-items: center;">
                        Home
                    </button>
                    <button class="btn-fit btn-save" onclick="window.location.href='new.jsp'" style="height: 52px; display: flex; align-items: center;">
                        + Add New Student
                    </button>
                </div>           
            </div>
            <%-- Pagination --%>
            <c:set var="recordsPerPage" value="10" />
            <c:set var="currentPage" value="${empty param.page ? 1 : param.page}" />
            <c:set var="start" value="${(currentPage - 1) * recordsPerPage}" />
            <c:set var="end" value="${start + recordsPerPage - 1}" />

            <c:set var="totalPages" value="${(result.rowCount + recordsPerPage - 1) / recordsPerPage}" />
            <fmt:parseNumber var="totalPages" integerOnly="true" type="number" value="${totalPages}" />
            
            <table class="modern-table">
                <thead>
                    <tr>
                        <c:forEach var="columnName" items="${result.columnNames}">
                            <th><c:out value="${columnName}"/></th>
                        </c:forEach>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${result.rowsByIndex}" begin="${start}" end="${end}">
                        <tr>
                            <c:forEach var="column" items="${row}">
                                <td><c:out value="${column}"/></td>
                            </c:forEach>
                            <td style="white-space: nowrap;">
                                <form action="edit.jsp" method="get" style="display:inline;">
                                    <input type="hidden" name="id"  value="${row[0]}">
                                    <button type="submit" class="btn-fit">Edit</button>
                                </form>
                                <a href="delete.jsp?id=${row[0]}" onclick="return confirm('Delete this student?');">
                                    <button class="btn-fit btn-red">Delete</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div style="text-align: center; margin-top: 20px; font-size: 18px;">
    
                

                <c:forEach begin="1" end="${totalPages}" var="i">
                    <c:choose>
                        <c:when test="${currentPage eq i}">
                            <span style="font-weight: 900; color: activeborder; text-decoration: underline; margin: 0 5px; cursor: default;">
                                ${i}
                            </span>
                        </c:when>
                        <c:otherwise>
                            <a href="viewProfiles.jsp?page=${i}&search=${param.search}&filter=${param.filter}" 
                               style="font-weight: bold; color: chocolate; text-decoration: none; margin: 0 5px;">
                                ${i}
                            </a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

            </div>

            <c:if test="${result.rowCount == 0}">
                <div style="text-align: center; color: black; margin-top: 50px; font-size: 18px; font-weight:bold; text-shadow: 0 2px 4px rgba(0,0,0,0.3);">No records found.</div>
            </c:if>
        </div>
    </body>
</html>