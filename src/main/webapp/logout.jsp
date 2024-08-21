<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
    <%
        // Invalidate the session
        session.invalidate();
        
        // Redirect to login page or home page
        response.sendRedirect("login.jsp");
    %>
    <h2>Logging out...</h2>
</body>
</html>
