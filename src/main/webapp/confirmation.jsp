<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
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
        .order-details {
            margin-top: 20px;
        }
        .order-details p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order Successful</h1>
        <p class="bold">Thank you for your order! We will inform you once the order is placed.</p>
        <p>Have a nice day :)</p>
        <p>Your Order ID is: <strong><%= request.getAttribute("orderId") %></strong></p>

        <div class="order-details">
            <h2>Order Details</h2>
            <p><strong>Name:</strong> <%= request.getAttribute("fullName") %></p>
            <p><strong>Address:</strong> <%= request.getAttribute("address") %></p>
            <p><strong>Email:</strong> <%= request.getAttribute("email") %></p>
            <p><strong>Phone:</strong> <%= request.getAttribute("phone") %></p>
            <p><strong>Total Amount:</strong> <%= request.getAttribute("totalAmount") %></p>
        </div>
        <p style="text-align: center; margin-top: 20px;">
            <a href="home.jsp" class="button">Back to Home</a>
        </p>
    </div>
</body>
</html>
