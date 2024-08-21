<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            color: #333;
        }

        header {
            background-color: #002F6C; /* Navy Blue */
            color: white;
            padding: 20px;
            text-align: center;
        }

        h1 {
            margin: 0;
            font-size: 36px;
        }

        .admin-panel-header {
            background-color: #e0e0e0;
            color: #002F6C; /* Navy Blue */
            padding: 15px;
            text-align: center;
            border-radius: 4px;
            margin: 20px 0;
            font-size: 24px;
        }

        p {
            font-size: 18px;
            color: #002F6C; /* Navy Blue */
            text-align: center;
            margin: 20px 0;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 60vh;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 40px auto;
            padding: 30px;
            width: 50%;
        }

        a {
            display: inline-block;
            background-color: #002F6C; /* Navy Blue */
            color: white;
            text-decoration: none;
            padding: 15px 30px;
            margin: 10px;
            border-radius: 4px;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #001A43; /* Darker Navy Blue */
        }

        footer {
            background-color: #002F6C; /* Navy Blue */
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        footer p {
            margin: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome, Admin</h1>
    </header>

    <div class="container">
        <div class="admin-panel-header">
            ABC Restaurant Admin Panel
        </div>
        <p>Please choose your management area:</p>
        <a href="staffManagement.jsp">Staff Management</a>
        <a href="adminDashboard.jsp">Restaurant Management</a>
    </div>

    <footer>
        <p>&copy; 2024 ABC Restaurant Management</p>
    </footer>
</body>
</html>
