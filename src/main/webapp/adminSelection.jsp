<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Selection</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

        .container {
            margin: 40px auto;
            padding: 30px;
        }

        .card {
            margin: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card img {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            width: 100%;
            height: 200px; /* Fixed height */
            object-fit: cover; /* Cover the card area */
        }

        .card-body {
            text-align: center;
        }

        .card-title {
            font-size: 24px;
            color: #002F6C; /* Navy Blue */
        }

        .btn-primary {
            background-color: #002F6C; /* Navy Blue */
            border-color: #002F6C;
        }

        .btn-primary:hover {
            background-color: #001A43; /* Darker Navy Blue */
            border-color: #001A43;
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
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="images/staff.png" alt="Staff Management">
                    <div class="card-body">
                        <h5 class="card-title">Staff Management</h5>
                        <a href="staffManagement.jsp" class="btn btn-primary">Manage Staff</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="images/cutlery.png" alt="Restaurant Management">
                    <div class="card-body">
                        <h5 class="card-title">Restaurant Management</h5>
                        <a href="food" class="btn btn-primary">Manage Restaurant</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 ABC Restaurant Management</p>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
