<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - ABC Restaurant</title>
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
                <li><a href="ordering.jsp">Order Food</a></li>
                <li><a href="query.jsp">Queries</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>Contact Us</h2>
        <form action="submit_contact.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="4" required></textarea>
            
            <input type="submit" value="Send Message">
        </form>
    </div>
</body>
</html>
