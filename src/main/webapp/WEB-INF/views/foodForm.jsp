<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${food == null ? "Add New Food" : "Edit Food"}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }
        .container {
            width: 80%;
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="file"],
        input[type="submit"] {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>${food == null ? "Add New Food" : "Edit Food"}</h1>

    <form action="food" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${food != null ? food.id : 0}"/>

        <label for="name">Name:</label>
        <input type="text" name="name" value="${food != null ? food.name : ''}" required/><br>

        <label for="description">Description:</label>
        <input type="text" name="description" value="${food != null ? food.description : ''}" required/><br>

        <label for="price">Price:</label>
        <input type="text" name="price" value="${food != null ? food.price : ''}" required/><br>

        <label for="image">Image:</label>
        <input type="file" name="image" required/><br>

        <label for="category">Category:</label>
        <input type="text" name="category" value="${food != null ? food.category : ''}" required/><br>

        <input type="hidden" name="action" value="${food == null ? 'add' : 'edit'}"/>

        <input type="submit" value="${food == null ? 'Add' : 'Update'}"/>
    </form>

    <a href="food?action=list">Back to List</a>
</body>
</html>
