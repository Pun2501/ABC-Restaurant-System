<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 50px;
        }
        .dashboard-container {
            max-width: 1000px;
            margin: auto;
            text-align: center;
        }
        .card {
            margin: 20px;
            border: none;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card img {
            width: 80px;
            height: 80px;
            margin-top: 20px;
        }
        .card-title {
            color: #333;
            font-weight: bold;
            margin: 15px 0;
        }
        .btn {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="row">
            <!-- Reservations Box -->
            <div class="col-md-4">
                <div class="card">
                    <img src="images/reserved.png" alt="Reservations Logo" class="card-img-top mx-auto">
                    <div class="card-body">
                        <h5 class="card-title">View All Reservations</h5>
                        <a href="reservations" class="btn btn-primary">Go to Reservations</a>
                    </div>
                </div>
            </div>

            <!-- Orders Box -->
            <div class="col-md-4">
                <div class="card">
                    <img src="images/checklist.png" alt="Orders Logo" class="card-img-top mx-auto">
                    <div class="card-body">
                        <h5 class="card-title">View All Orders</h5>
                        <a href="staffDashboard" class="btn btn-primary">Go to Orders</a>
                    </div>
                </div>
            </div>

            <!-- Queries Box -->
            <div class="col-md-4">
                <div class="card">
                    <img src="images/query.png" alt="Queries Logo" class="card-img-top mx-auto">
                    <div class="card-body">
                        <h5 class="card-title">View All Queries</h5>
                        <a href="viewQueries" class="btn btn-primary">Go to Queries</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
