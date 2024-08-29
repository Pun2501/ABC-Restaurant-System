<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .login-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 400px;
            width: 100%;
        }
        
        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            color: #666666;
            font-size: 14px;
        }
        
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }
        
        button {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        button:hover {
            background-color: #0056b3;
        }
        
        .register-link, .staff-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }
        
        .register-link a, .staff-link a {
            color: #007bff;
            text-decoration: none;
        }
        
        .register-link a:hover, .staff-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
            <p class="register-link">Don't have an account? <a href="register.jsp">Register</a></p>
            <p class="staff-link">Are you a staff member? <a href="staffLogin.jsp">Staff Login</a></p>
        </form>
    </div>
</body>
</html>
