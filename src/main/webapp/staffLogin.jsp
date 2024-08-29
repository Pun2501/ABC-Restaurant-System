<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            max-width: 400px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .error-message {
            color: #dc3545;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Staff Login</h2>
        <form action="${pageContext.request.contextPath}/staffLoginController" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required />
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
        </form>
        <p class="text-center mt-3"><a href="login.jsp">Back to User Login</a></p>
    </div>
</body>
</html>
