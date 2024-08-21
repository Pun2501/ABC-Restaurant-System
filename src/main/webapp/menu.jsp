<!-- menu.jsp -->
<%@ page import="java.util.List" %>
<%@ page import="com.abc.model.Food" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Items</title>
    <style>
        .menu-item {
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
        }
        .menu-item img {
            max-width: 100px;
            height: auto;
        }
    </style>
</head>
<body>
    <h1>Menu Items</h1>
    <div id="menuContainer"></div>

    <script>
        async function fetchMenuItems() {
            try {
                const response = await fetch('/getMenuItems');
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const foodItems = await response.json();
                displayMenuItems(foodItems);
            } catch (error) {
                console.error('Error fetching menu items:', error);
                document.getElementById('menuContainer').innerText = 'Failed to load menu items.';
            }
        }

        function displayMenuItems(foodItems) {
            const container = document.getElementById('menuContainer');
            container.innerHTML = ''; // Clear any existing content
            foodItems.forEach(item => {
                const itemDiv = document.createElement('div');
                itemDiv.classList.add('menu-item');
                itemDiv.innerHTML = `
                    <h2>${item.name}</h2>
                    <p>${item.description}</p>
                    <p>Price: $${item.price}</p>
                    <img src="/images/${item.image}" alt="${item.name}">
                `;
                container.appendChild(itemDiv);
            });
        }

        // Fetch and display menu items when the page loads
        window.onload = fetchMenuItems;
    </script>
</body>
</html>
