<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Logout</title>
    <script>
        // Function to redirect after a delay
        function redirectToLogin() {
            // Set a timeout to redirect after 3 seconds (3000 milliseconds)
            setTimeout(function() {
                window.location.href = 'login.jsp';
            }, 3000);
        }
    </script>
</head>
<body onload="redirectToLogin()">
    <h1>You have been logged out!</h1>
    <p>You will be redirected to the login page in 3 seconds.</p>
    <p>If you are not redirected automatically, <a href="login.jsp">click here</a>.</p>
    <%
        // Invalidate the session to log out the user
        session.invalidate();
    %>
</body>
</html>
