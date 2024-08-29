<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/NavBar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .cart-item {
            margin-bottom: 20px;
        }
        .cart-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
        }
        .cart-item-details {
            display: flex;
            align-items: center;
        }
        .cart-item-details div {
            margin-left: 10px;
        }
        .cart-total {
            font-weight: bold;
            font-size: 1.25rem;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Your Cart</h1>
        <c:if test="${not empty cart}">
            <c:set var="cartTotal" value="0"/>
            <div id="cartItems">
                <c:forEach var="item" items="${cart.values()}">
                    <div class="cart-item">
                        <div class="cart-item-details">
                            <img src="${pageContext.request.contextPath}/${item.food.imagePath}" alt="${item.food.name}">
                            <div>
                                <h5>${item.food.name}</h5>
                                <p>${item.food.description}</p>
                                <p><strong>Price: </strong>${item.food.price}</p>
                                <p><strong>Quantity: </strong>
                                    <form action="${pageContext.request.contextPath}/CartServlet" method="post" class="form-inline">
                                        <input type="hidden" name="foodId" value="${item.food.id}">
                                        <input type="number" name="quantity" min="1" value="${item.quantity}" class="form-control mr-2" style="width: 70px;">
                                        <button type="submit" name="action" value="update" class="btn btn-secondary">Update Quantity</button>
                                        <button type="submit" name="action" value="remove" class="btn btn-danger ml-3">Remove</button>
                                    </form>
                                </p>
                            </div>
                        </div>
                        <c:set var="itemTotal" value="${item.food.price * item.quantity}"/>
                        <c:set var="cartTotal" value="${cartTotal + itemTotal}"/>
                    </div>
                </c:forEach>
            </div>
            <hr>
            <p class="cart-total">Total: ${cartTotal}</p>
            <a href="${pageContext.request.contextPath}/menu" class="btn btn-primary mt-3">Back to Menu</a>
            <button onclick="proceedToCheckout()" class="btn btn-success mt-3 ml-3">Checkout</button>
        </c:if>
        <c:if test="${empty cart}">
            <p>Your cart is empty.</p>
        </c:if>
    </div>

    <script>
    function proceedToCheckout() {
        const cartItems = [];
        const cartElements = document.querySelectorAll('.cart-item');

        cartElements.forEach(function(element) {
            const name = element.querySelector('h5').textContent.trim();
            const priceText = element.querySelector('p:nth-of-type(2)').textContent.trim(); // Updated selector
            const price = parseFloat(priceText.replace(/[^0-9.]/g, ''));
            const quantity = parseInt(element.querySelector('input[name="quantity"]').value, 10);
            const imagePath = element.querySelector('img').getAttribute('src');

            cartItems.push({ name, price, quantity, imagePath });
        });

        const cartTotalText = document.querySelector('.cart-total').textContent.trim();
        const cartTotal = parseFloat(cartTotalText.replace(/[^0-9.]/g, ''));

        // Store data in sessionStorage
        sessionStorage.setItem('cart', JSON.stringify(cartItems));
        sessionStorage.setItem('cartTotal', cartTotal);

        // Redirect to checkout page
        window.location.href = '${pageContext.request.contextPath}/checkout.jsp';
    }


</script>


    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
