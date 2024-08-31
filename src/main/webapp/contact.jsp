<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - ABC Restaurant</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333333; /* Grey background color */
            color: white;
            padding: 20px;
            font-family: 'Arial', sans-serif; /* Font style */
        }
        .header h1 {
            margin: 0;
            font-size: 1.5em;
            font-weight: bold;
        }
        .header a {
            color: white;
            text-decoration: none;
            font-size: 1em;
        }
        .header a:hover {
            text-decoration: underline;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="number"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>ABC Restaurant</h1>
        <a href="home.jsp">Back to Home Page</a>
    </header>

    <div class="container">
        <h2>Contact Us</h2>
        <form action="contactUsServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="4" required></textarea>
            
            <input type="submit" value="Send Message">
        </form>
    </div>
</body>
</html>
