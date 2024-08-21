<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.abc.model.Food" %>
<%@ page import="com.abc.service.FoodService" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
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

        h1, h2 {
            margin: 0;
            color: white; /* White for headings */
        }

        h2 {
            color: #002F6C; /* Navy Blue for sub-headings */
        }

        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #002F6C; /* Navy Blue */
        }

        input[type="text"],
        input[type="number"],
        select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="file"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            background-color: #002F6C; /* Navy Blue */
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        button:hover {
            background-color: #001A43; /* Darker Navy Blue */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #e0e0e0;
            color: #002F6C; /* Navy Blue */
        }

        .actions {
            display: flex;
            justify-content: center;
        }

        .actions form {
            margin: 0 5px;
        }

        .alert, .success {
            color: white;
            font-weight: bold;
            padding: 10px;
            text-align: center;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .alert {
            background-color: #d9534f; /* Red */
        }

        .success {
            background-color: #5bc0de; /* Light Blue */
        }
    </style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
    </header>
    <div class="container">
        <h2>Add New Food Item</h2>
        <form action="FoodController" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="add">
            <label for="foodName">Food Name:</label>
            <input type="text" id="foodName" name="foodName" required>

            <label for="description">Description:</label>
            <input type="text" id="description" name="description" required>

            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required>

            <label for="image">Image Upload:</label>
            <input type="file" id="image" name="image" accept="image/*" required>

            <label for="category">Category:</label>
            <select id="category" name="category" required>
                <option value="Food">Food</option>
                <option value="Dessert">Dessert</option>
                <option value="Beverage">Beverage</option>
            </select>

            <button type="submit">Add Food</button>
        </form>

        <h2>Manage Existing Food Items</h2>
        <% 
            String message = request.getParameter("message");
            if (message != null) {
        %>
        <div class="<%= message.contains("success") ? "success" : "alert" %>">
            <%= message %>
        </div>
        <% 
            }
            FoodService foodService = new FoodService();
            List<Food> foodItems = foodService.getAllFoodItems();
        %>
        <table>
            <thead>
                <tr>
                    <th>Food Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (Food food : foodItems) {
                %>
                <tr>
                    <td><%= food.getName() %></td>
                    <td><%= food.getDescription() %></td>
                    <td><%= food.getPrice() %></td>
                    <td><%= food.getCategory() %></td>
                    <td>
                        <img src="images/<%= food.getImage() %>" alt="<%= food.getName() %>" style="width: 100px; height: auto;">
                    </td>
                    <td class="actions">
                        <!-- Edit Form -->
                        <form action="editFood.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="foodId" value="<%= food.getId() %>">
                            <button type="submit">Edit</button>
                        </form>

                        <!-- Delete Form -->
                        <form action="FoodController" method="post" style="display:inline;" onsubmit="return confirmDelete();">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="foodId" value="<%= food.getId() %>">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this food item?");
        }
    </script>
</body>
</html>

