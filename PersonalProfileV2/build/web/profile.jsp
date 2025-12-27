<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="card">
            <h2>Successfully Registered!</h2>
            <jsp:useBean id="student" scope="request" class="profile.bean.ProfileBean"/>

            <div class="profile-row">
                <span class="profile-label">Name</span>
                <span class="profile-value">: <jsp:getProperty name="student" property="name"/></span>
            </div>
            <div class="profile-row">
                <span class="profile-label">Student ID</span>
                <span class="profile-value">: <jsp:getProperty name="student" property="studentId"/></span>
            </div>

            <div class="profile-row">
                <span class="profile-label">Program</span>
                <span class="profile-value">: <jsp:getProperty name="student" property="program"/></span>
            </div>

            <div class="profile-row">
                <span class="profile-label">Email</span>
                <span class="profile-value">: <jsp:getProperty name="student" property="email"/></span>
            </div>

            <div class="profile-row">
                <span class="profile-label">Hobby</span>
                <span class="profile-value">: <jsp:getProperty name="student" property="hobby"/></span>
            </div>

            <div class="profile-row">
                <span class="profile-label">Intro</span>
                <span class="profile-value">: <jsp:getProperty name="student" property="intro"/></span>
            </div>

            <div style="text-align: center; margin-top: 30px;">
                <button onclick="window.location.href='index.html'" style="width: auto; padding: 10px 25px;">
                    Home
                </button>
                <button onclick="window.location.href='viewProfiles.jsp'" style="width: auto; padding: 10px 25px; margin-left: 10px;">
                    View All
                </button>
            </div>           
        </div>
    </body>
</html>
