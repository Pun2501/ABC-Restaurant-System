<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/NavBar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .card {
            width: 18rem;
            border: 1px solid #ddd;
            border-radius: 0.25rem;
            box-shadow: 0 0 0.125rem rgba(0, 0, 0, 0.075);
        }
        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .card-title {
            text-align: center;
            font-size: 1.25rem;
            font-weight: bold;
        }
        .card-text {
            text-align: center;
        }
        .price {
            font-weight: bold;
            color: #007bff;
        }
        .add-to-cart-btn {
            display: block;
            width: 100%;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <!-- Search Form -->
        <form id="searchForm" class="mb-4">
            <div class="input-group">
                <input type="text" id="searchQuery" class="form-control" placeholder="Search for food items...">
                <div class="input-group-append">
                    <button type="button" class="btn btn-primary" onclick="search()">Search</button>
                </div>
            </div>
        </form>

        <h1 class="mb-4">Menu</h1>
        <div id="foodItems" class="card-container">
            <c:forEach var="food" items="${foods}">
                <div class="card food-item" 
                     data-name="${food.name.toLowerCase()}" 
                     data-description="${food.description.toLowerCase()}" 
                     data-category="${food.category.toLowerCase()}">
                    <img src="${pageContext.request.contextPath}/${food.imagePath}" alt="${food.name}" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${food.name}</h5>
                        <p class="card-text">${food.description}</p>
                        <p class="card-text price">${food.price}</p>
                        <p class="card-text"><small class="text-muted">${food.category}</small></p>
                        <!-- Add to Cart button -->
                        <form action="${pageContext.request.contextPath}/cart" method="post" class="form-inline">
                            <input type="hidden" name="foodId" value="${food.id}">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group mb-2">
                                <label for="quantity-${food.id}" class="form-label mr-2">Quantity:</label>
                                <input type="number" id="quantity-${food.id}" name="quantity" min="1" value="1" class="form-control form-control-sm" style="width: 70px;">
                            </div>
                            <button type="submit" class="btn btn-primary add-to-cart-btn">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script>
        function search() {
            const query = document.getElementById('searchQuery').value.toLowerCase();
            const items = document.querySelectorAll('.food-item');

            items.forEach(item => {
                const name = item.getAttribute('data-name');
                const description = item.getAttribute('data-description');
                const category = item.getAttribute('data-category');
                
                if (name.includes(query) || description.includes(query) || category.includes(query)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>
