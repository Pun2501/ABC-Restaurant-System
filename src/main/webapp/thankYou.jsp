<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You - ABC Restaurant</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        
        
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333333; /* Grey background color */
            color: white;
            padding: 20px;
            font-family: 'Arial', sans-serif; /* Font style */
        }
        header h1 {
            margin: 0;
            font-size: 1.5em;
            font-weight: bold;
        }
        header a {
            color: white;
            text-decoration: none;
            font-size: 1em;
        }
        header a:hover {
            text-decoration: underline;
        }
        nav ul {
            list-style: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin: 0 15px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #00274d; /* Navy blue */
        }
        p {
            font-size: 1.2em;
            line-height: 1.6;
        }
        .query-id {
            font-size: 1.2em;
            color: #d9534f; /* Bootstrap's danger color */
            margin-top: 20px; /* Space above the query ID */
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>ABC Restaurant</h1>
        <a href="home.jsp">Back to Home Page</a>
    </header>


    <div class="container">
        <h2>Thank You for Your Query!</h2>
        <p>We have received your message and will respond within 24 hours.</p>
        <p class="query-id">Your query ID is: <strong>${param.queryId}</strong></p>
    </div>
</body>
</html>
