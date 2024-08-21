<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.abc.service.FoodService, com.abc.model.Food" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Food Item</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/styles/admin.css' />">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #000000;
            margin: 0;
            padding: 0;
        }
        h1 {
            background-color: #002366; /* Navy blue */
            color: #ffffff; /* White */
            padding: 20px;
            text-align: center;
        }
        form {
            width: 50%;
            margin: 50px auto;
            background-color: #f8f8f8;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #002366; /* Navy blue */
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #cccccc;
            border-radius: 5px;
        }
        input[type="file"] {
            margin-bottom: 20px;
        }
        input[type="submit"] {
            background-color: #002366; /* Navy blue */
            color: #ffffff; /* White */
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #001a4d; /* Darker navy blue */
        }
    </style>
</head>
<body>
    <h1>Edit Food Item</h1>
    <%
        int foodId = Integer.parseInt(request.getParameter("foodId"));
        FoodService foodService = new FoodService();
        Food food = foodService.getFoodItemById(foodId);
    %>
    <form action="foodController" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="foodId" value="<%= food.getId() %>">
        <label for="foodName">Name:</label>
        <input type="text" id="foodName" name="foodName" value="<%= food.getName() %>">
        <br>
        <label for="description">Description:</label>
        <textarea id="description" name="description"><%= food.getDescription() %></textarea>
        <br>
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" value="<%= food.getPrice() %>">
        <br>
        <label for="category">Category:</label>
        <select id="category" name="category">
            <option value="Food" <%= food.getCategory().equals("Food") ? "selected" : "" %>>Food</option>
            <option value="Dessert" <%= food.getCategory().equals("Dessert") ? "selected" : "" %>>Dessert</option>
            <option value="Beverage" <%= food.getCategory().equals("Beverage") ? "selected" : "" %>>Beverage</option>
        </select>
        <br>
        <label for="image">Image:</label>
        <input type="file" id="image" name="image">
        <br>
        <input type="submit" value="Update Food Item">
    </form>
</body>
</html>
