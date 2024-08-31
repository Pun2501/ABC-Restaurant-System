<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>View Queries</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="my-4">Customer Queries</h2>

        <!-- Displaying error message if there are no queries or if an error occurred -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Message</th>
                </tr>
            </thead>
            <tbody>
                <!-- Check if the 'queries' attribute contains data -->
                <c:if test="${not empty queries}">
                    <c:forEach var="query" items="${queries}">
                        <tr>
                            <td>${query.id}</td>
                            <td>${query.name}</td>
                            <td>${query.email}</td>
                            <td>${query.message}</td>
                        </tr>
                    </c:forEach>
                </c:if>

                <!-- Display this row if no queries are found -->
                <c:if test="${empty queries}">
                    <tr>
                        <td colspan="4">No queries found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
