<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit a Query - ABC Restaurant</title>
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
                <li><a href="contact.jsp">Contact Us</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>Submit a Query</h2>
        <form action="submit_query.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="query">Your Query:</label>
            <textarea id="query" name="query" rows="4" required></textarea>
            
            <input type="submit" value="Submit Query">
        </form>
    </div>
</body>
</html>
