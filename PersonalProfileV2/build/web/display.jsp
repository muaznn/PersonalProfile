<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Details</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: "Inter", Arial, sans-serif;
                background: url("image/bg3.jpg");
                background-repeat: repeat;      
                background-size: auto;          
                background-position: top left;  
            }
            .card {
                width: 600px;
                margin: 90px auto;
                padding: 35px;
                background: rgba(255, 255, 255, 0.5);
                backdrop-filter: blur(10px);
                border-radius: 20px;
            }
            h2 {
                font-size: 22px;
                font-weight: 600;
                margin-bottom: 25px;
                color: #222;
                text-align: center;
            }
            .field {
                margin-bottom: 18px;
            }
            .text {
                font-weight: 600;
                color: #333;
                font-size: 14px;
                margin-bottom: 6px;
            }
/*            .value1 {
                background: rgba(250, 250, 250, 0.7);
                background: #f5f5f5;
                padding: 12px;
                border-radius: 8px;
                border: 1px solid #ccc;
            }*/
            button {
                width: 30%;
                padding: 12px;
                font-size: 15px;
                font-weight: 600;
                border: none;
                border-radius: 8px;
                background: #41A67E;
                color: #fff;
                cursor: pointer;
                display: block;
                margin-left: auto;
                }
            button:hover { background: #2F5755; }
        </style>
    </head>
    <body>
        <div class="card">
            <h2><%= request.getAttribute("name") %>'s Profile</h2>
            <div class="field">
                <div class="text">Name : <%= request.getAttribute("name") %></div>
<!--                <div class="value"><%= request.getAttribute("name") %></div>-->
            </div>
            <div class="field">
                <div class="text">Student ID : <%= request.getAttribute("studentId") %></div>
<!--                <div class="value"><%= request.getAttribute("studentId") %></div>-->
            </div>
            <div class="field">
                <div class="text">Program : <%= request.getAttribute("program") %></div>
<!--                <div class="value"><%= request.getAttribute("program") %></div>-->
            </div>
            <div class="field">
                <div class="text">Email : <%= request.getAttribute("email") %></div>
<!--                <div class="value"><%= request.getAttribute("email") %></div>-->
            </div>
            <div class="field">
                <div class="text">Hobbies : <%= request.getAttribute("hobby") %></div>
<!--                <div class="value"><%= request.getAttribute("hobby") %></div>-->
            </div>
            <div class="field">
                <div class="text">Self Introduction : <%= request.getAttribute("intro") %></div>
<!--                <div class="value"><%= request.getAttribute("intro") %></div>-->
           </div>
           
           <button onclick="window.location.href='index.html'">
                New Form
           </button>
        </div>
           
           <jsp:useBean id="profileBean" class="profile.bean.ProfileBean">
            <jsp:setProperty name="profileBean" property="name" param="name"/>
            <jsp:setProperty name="profileBean" property="studentId" param="studentId"/>
            <jsp:setProperty name="profileBean" property="program" param="program"/>
            <jsp:setProperty name="profileBean" property="email" param="email"/>
            <jsp:setProperty name="profileBean" property="hobby" param="hobby"/>
            <jsp:setProperty name="profileBean" property="intro" param="intro"/>
            
            
            
        </jsp:useBean>
    </body>
</html>
