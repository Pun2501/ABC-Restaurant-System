<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Food - ABC Restaurant</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <header>
        <h1>ABC Restaurant</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="reservations.jsp">Reservations</a></li>
                <li><a href="gallery.jsp">Gallery</a></li>
                <li><a href="menu.jsp">Menu</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a href="query.jsp">Queries</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>Order Food</h2>
        <form action="submit_order.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" required>
            
            <label for="order">Your Order:</label>
            <textarea id="order" name="order" rows="4" required></textarea>
            
            <input type="submit" value="Place Order">
        </form>
    </div>
</body>
</html>
