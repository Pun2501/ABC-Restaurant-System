<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        p {
            font-size: 16px;
            color: #555;
        }
        .bold {
            font-weight: bold;
        }
        .reservation-details {
            margin-top: 20px;
        }
        .reservation-details p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Reservation Successful</h1>
        <p class="bold">Thank you, <%= request.getAttribute("reservationName") %>! Your reservation is confirmed.</p>
        <p>We look forward to serving you on <%= request.getAttribute("reservationDate") %>.</p>

        <div class="reservation-details">
            <h2>Reservation Details</h2>
            <p><strong>Name:</strong> <%= request.getAttribute("reservationName") %></p>
            <p><strong>Email:</strong> <%= request.getAttribute("reservationEmail") %></p>
            <p><strong>Phone:</strong> <%= request.getAttribute("reservationPhone") %></p>
            <p><strong>Reservation Date:</strong> <%= request.getAttribute("reservationDate") %></p>
            <p><strong>Number of People:</strong> <%= request.getAttribute("reservationPeople") %></p>
        </div>

        <p style="text-align: center; margin-top: 20px;">
            <a href="<%= request.getContextPath() %>/menu" class="button">Back to Menu</a>
        </p>
    </div>
</body>
</html>
