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
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #343a40;
        }
        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
            font-size: 2rem;
            letter-spacing: 1px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #dee2e6;
        }
        th {
            background-color: #007bff;
            color: #ffffff;
            font-weight: 600;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9ecef;
        }
        .button {
            display: inline-block;
            padding: 10px 25px;
            font-size: 16px;
            color: #ffffff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #0056b3;
        }
        @media (max-width: 768px) {
            th, td {
                padding: 10px;
                font-size: 14px;
            }
            h1 {
                font-size: 1.5rem;
            }
            .button {
                font-size: 14px;
                padding: 8px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Orders</h1>
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
        <p style="text-align: center;">
            <a href="${pageContext.request.contextPath}/index.jsp" class="button">Back to Home</a>
        </p>
    </div>
</body>
</html>
