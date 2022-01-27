<%@ page import="com.app.models.Admin" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Design by foolishdeveloper.com -->
    <title>Employ | Work Marketplace.</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <!--Stylesheet-->
    <link rel="stylesheet" media="screen" href="../style/css/adminLogin.css" >
</head>
<body>
<%  Admin admin = (Admin) session.getAttribute("admin");

    if (admin != null)
        response.sendRedirect("Admin/HomeAdmin.jsp");
%>
<div class="background">
    <div class="shape"></div>
    <div class="shape"></div>
</div>
<% if (request.getAttribute("error") != null) { %>
<p class='p-4 text-xl text-red-600 text-center font-body'><% out.println(request.getAttribute("error")); %></p>
<% } %>
<form action="../LoginAdmin" method="post">
    <h3>Admin Login Panel</h3>

    <label for="username">Username</label>
    <input type="text" name="username" placeholder="Email or Phone" id="username" required>

    <label for="password">Password</label>
    <input type="password" name="password" placeholder="Password" id="password" required>

    <button type="submit">Log In</button>
</form>
</body>
</html>
