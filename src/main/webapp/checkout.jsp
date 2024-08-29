
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }
        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="hidden"] {
            display: none;
        }
        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #0056b3;
        }
        #cartItems {
            margin-top: 20px;
        }
        #cartItems div {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
            color: #555;
            display: block; /* Stack items vertically */
            margin-bottom: 10px; /* Spacing between items */
            overflow: hidden; /* Clear floats */
        }
        #cartItems img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 20px;
            float: left; /* Align image to the left */
        }
        #cartItems div div {
            overflow: hidden; /* Clear floats within each item */
        }
        #cartItems h5 {
            font-size: 16px; /* Adjusted font size to match other text */
            margin: 0; /* Remove default margin */
            font-weight: normal; /* Optional: to make it consistent */
        }
        .total-amount {
            font-weight: bold;
            font-size: 1.25rem;
            margin-top: 20px;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cart = JSON.parse(sessionStorage.getItem('cart')) || [];
            const totalAmount = sessionStorage.getItem('cartTotal') || 0;

            console.log('Cart:', cart); // Debugging
            console.log('Total Amount:', totalAmount); // Debugging

            if (totalAmount) {
                document.getElementById('totalAmount').value = totalAmount;
                document.getElementById('totalAmountDisplay').textContent = `Total Amount: ${totalAmount}`;
            }

            displayCartItems(cart);
        });

        function displayCartItems(cart) {
            const cartItemsContainer = document.getElementById('cartItems');
            cartItemsContainer.innerHTML = ''; // Clear existing items

            cart.forEach(item => {
                console.log('Displaying item:', item); // Debugging

                const itemElement = document.createElement('div');
                itemElement.innerHTML = `
                    <img src="${item.imagePath}" alt="${item.name}">
                    <div>
                        <h5>${item.name}</h5>
                        <p><strong>Price:</strong> ${item.price}</p>
                        <p><strong>Quantity:</strong> ${item.quantity}</p>
                    </div>
                `;
                cartItemsContainer.appendChild(itemElement);
            });
        }
    </script>
</head>
<body>
    <h1>Checkout</h1>
    <form action="checkout" method="post">
        <label for="full_name">Full Name:</label>
        <input type="text" id="full_name" name="full_name" required><br>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required><br>
        <input type="hidden" id="totalAmount" name="total_amount">
        <div id="cartItems"></div>
        <p id="totalAmountDisplay" class="total-amount"></p>
        <button type="submit">Place Order</button>
    </form>
</body>
</html>
