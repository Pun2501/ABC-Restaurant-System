<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
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
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Orders</h1>
         <a href="reservations" class="btn btn-primary">View All Reservations</a>
        <table>
    <thead>
        <tr>
            <th>Order ID</th>
            <th>Full Name</th>
            <th>Address</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Total Amount</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.fullName}</td>
                <td>${order.address}</td>
                <td>${order.email}</td>
                <td>${order.phone}</td>
                <td>${order.totalAmount}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
        <p style="text-align: center; margin-top: 20px;">
            <a href="${pageContext.request.contextPath}/index.jsp" class="button">Back to Home</a>
        </p>
    </div>
</body>
</html>
