<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.abc.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return; // Ensure the rest of the page is not executed if redirected
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Dashboard - ABC Restaurant</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
        }
        .header {
            background-color: #002F6C; /* Navy Blue */
            color: white;
            padding: 15px 0;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000; /* Ensure it overlays other content */
        }
        .header h1 {
            margin: 0;
            font-size: 2em;
        }
        .header nav ul {
            list-style: none;
            padding: 0;
            margin: 10px 0 0;
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .header nav ul li {
            display: inline;
        }
        .header nav ul li a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .header nav ul li a:hover {
            background-color: rgba(255, 255, 255, 0.3);
        }
        .banner {
            position: relative;
            width: 100%;
            height: 400px;
            overflow: hidden;
            margin-top: 60px; /* Space for fixed header */
        }
        .banner img {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0;
            transition: opacity 1s;
        }
        .banner img.active {
            opacity: 1;
        }
        .content {
            padding: 20px;
            padding-top: 30px; /* Extra space for banner */
            background-color: #f4f4f4;
            min-height: 600px; /* Ensure enough space */
        }
        .menu, .reviews {
            margin: 20px auto;
            max-width: 800px;
        }
        .menu h3, .reviews h3 {
            color: #002F6C; /* Navy Blue */
            border-bottom: 2px solid #FFD700; /* Gold */
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .menu ul {
            list-style: none;
            padding: 0;
        }
        .menu li {
            margin: 10px 0;
        }
        .menu li a {
            color: #002F6C; /* Navy Blue */
            text-decoration: none;
            font-weight: bold;
        }
        .menu li a:hover {
            text-decoration: underline;
        }
        .reviews blockquote {
            border-left: 4px solid #002F6C; /* Navy Blue */
            padding-left: 15px;
            margin: 15px 0;
            font-style: italic;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
        }
        .footer {
            background-color: #002F6C; /* Navy Blue */
            color: white;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
            left: 0;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>ABC Restaurant</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="reservations.jsp">Reservations</a></li>
                <li><a href="gallery.jsp">Gallery</a></li>
                <li><a href="menu.jsp">Menu</a></li>
                <li><a href="ordering.jsp">Order Food</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a href="query.jsp">Queries</a></li>
            </ul>
        </nav>
    </header>
    
    <div class="banner">
        <img src="<%= request.getContextPath() %>/images/banner1.png" alt="Delicious Food" class="active">
        <img src="<%= request.getContextPath() %>/images/banner2.jpeg" alt="Elegant Dining">
        <img src="<%= request.getContextPath() %>/images/banner3.jpeg" alt="Great Service">
    </div>
    
    <main class="content">
        <h2>Welcome, <%= user.getUsername() %>!</h2>
        <p>You are logged in as <%= user.getRole() %>.</p>
        
        <p>At ABC Restaurant, we pride ourselves on offering a warm, inviting atmosphere with a menu full of delightful dishes made from the freshest ingredients. Whether you're here for a casual meal or a special occasion, we ensure an unforgettable dining experience.</p>
        
        <section class="menu">
            <h3>Our Menu:</h3>
            <ul>
                <li><a href="menu/starters.jsp">Starters</a></li>
                <li><a href="menu/main_courses.jsp">Main Courses</a></li>
                <li><a href="menu/desserts.jsp">Desserts</a></li>
                <li><a href="menu/drinks.jsp">Drinks</a></li>
            </ul>
        </section>
        
        <section class="reviews">
            <h3>Customer Reviews:</h3>
            <blockquote>
                “The food was amazing and the service was top-notch. I’ll definitely be coming back!” – Jane D.
            </blockquote>
            <blockquote>
                “A fantastic dining experience with a great ambiance. Highly recommended!” – John S.
            </blockquote>
            <blockquote>
                “Best restaurant in town! The desserts are out of this world.” – Emily R.
            </blockquote>
        </section>
    </main>
    
    <footer class="footer">
        <p>&copy; 2024 ABC Restaurant. All rights reserved.</p>
    </footer>
    
    <script>
        window.onload = function() {
            let currentIndex = 0;
            const slides = document.querySelectorAll('.banner img');
            const totalSlides = slides.length;

            function showSlide(index) {
                slides.forEach((slide, i) => {
                    slide.classList.toggle('active', i === index);
                });
            }

            function nextSlide() {
                currentIndex = (currentIndex + 1) % totalSlides;
                showSlide(currentIndex);
            }

            setInterval(nextSlide, 5000); // Change slide every 5 seconds

            // Initialize the first slide
            showSlide(currentIndex);
        };
    </script>
</body>
</html>
