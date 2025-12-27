<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Add New Student</title>
    </head>
    <body>
        <div class="card">
            <h2>Student Profile</h2>
            <form action="StudentProfileServlet" method="POST">
                <label>Name</label>
                <input type="text" name="name" required>
                <label>Student ID</label>
                <input type="text" name="studentId" required>
                <label>Program</label>
                <input type="text" name="program" required>
                <label>Email</label>
                <input type="email" name="email" required>
                <label>Hobbies</label>
                <input type="text" name="hobby" required>
                <label>Self Introduction</label>
                <textarea name="intro" rows="4"></textarea>
                <div style="display: flex; justify-content: center; gap: 15px; ">
                    <button class="btn-save" type="submit" style="width: 120px;">Submit</button>
                    <button onclick="history.back()" class="btn-cancel" style="width: 120px;">Back</button>
                </div>
                
            </form>
        </div>
    </body>
</html>
