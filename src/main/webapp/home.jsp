<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.abc.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABCD Restaurant</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        header {
            background-color: #343a40;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .carousel-caption {
            bottom: 20%;
            background: rgba(0, 0, 0, 0.5); /* Semi-transparent background for better readability */
            padding: 20px; /* Padding around the text */
            border-radius: 10px; /* Rounded corners */
        }
        .carousel-caption h5 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 10px; /* Space between heading and paragraph */
        }
        .carousel-caption p {
            font-size: 1.25rem;
        }
        #intro {
            background-color: #f8f9fa;
            color: #333;
        }
        #menu-preview .card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
        }
        #menu-preview .card-img-top {
            border-bottom: 2px solid #ddd;
        }
        #offers, #reviews {
            background-color: #e9ecef;
        }
        #offers h2, #reviews h2 {
            font-size: 1.75rem;
            font-weight: bold;
        }
        footer {
            background-color: #343a40;
        }
        footer a {
            color: #f8f9fa;
        }
        footer a:hover {
            color: #e9ecef;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
 <header class="bg-dark text-white">
    <nav class="navbar navbar-expand-lg navbar-dark container">
        <img src="images/logo1.png" alt="Logo" style="width: 40px; height: 40px; margin-right: 10px; object-fit: contain;">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">ABC Restaurant</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="gallery.jsp">Gallery</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="reservation.jsp">Reservations</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%
                            User user = (User) session.getAttribute("user");
                            if (user != null) {
                                out.print("Hello, " + user.getUsername());
                            } else {
                                out.print("Login");
                            }
                        %>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <%
                            if (user != null) {
                        %>
                            <a class="dropdown-item disabled" href="#">Email: <%= user.getEmail() %></a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="logout.jsp">Logout</a>
                        <%
                            } else {
                        %>
                            <a class="dropdown-item" href="login.jsp">Login</a>
                            <a class="dropdown-item" href="register.jsp">Register</a>
                        <%
                            }
                        %>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>




    <!-- Main Banner/Slider Section -->
    <section id="banner">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="images/banner1.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Welcome to ABC Restaurant</h5>
                        <p>Experience the taste of excellence.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/banner3.webp" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Delicious & Fresh</h5>
                        <p>Only the best ingredients for our dishes.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/banner2.webp" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Make a Reservation</h5>
                        <p>Book a table easily and quickly online.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/banner.webp" alt="Fourth slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Exquisite Desserts</h5>
                        <p>Enjoy our wide range of exquisite desserts.</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </section>

    <!-- Introduction Section -->
    <section id="intro" class="py-5 text-center">
        <div class="container">
            <h2>Welcome to ABC Restaurant</h2>
            <p>At ABCD Restaurant, we are dedicated to bringing you the finest culinary experience with a menu that blends creativity and flavor in every dish. Our chefs use only the freshest ingredients to create meals that delight the senses.</p>
        </div>
    </section>

   <!-- Menu Preview Section -->
<section id="menu-preview" class="py-5">
    <div class="container">
        <h2 class="text-center">Featured Dishes</h2>
        <div class="row">
            <!-- Featured Dish 1 -->
            <div class="col-md-4 mb-4">
                <div class="d-flex align-items-center">
                    <img src="images/food1.jpg" class="img-fluid rounded-circle mr-3" alt="Chicken Cheese Pizza" style="width: 100px; height: 100px; object-fit: cover;">
                    <div>
                        <h5 class="mb-1">Chicken Cheese Pizza</h5>
                        <p class="mb-1">Pan Pizza topped with chicken, tomatoes, cheese, garlic, and basil.</p>
                        <p class="mb-2"><strong>Price:</strong> 1800.00</p>
                    </div>
                </div>
            </div>

            <!-- Featured Dish 2 -->
            <div class="col-md-4 mb-4">
                <div class="d-flex align-items-center">
                    <img src="images/food8.jpg" class="img-fluid rounded-circle mr-3" alt="Rice and Curry" style="width: 100px; height: 100px; object-fit: cover;">
                    <div>
                        <h5 class="mb-1">Rice and Curry</h5>
                        <p class="mb-1">Basmati rice with chicken curry.</p>
                        <p class="mb-2"><strong>Price:</strong> 1500.00</p>
                    </div>
                </div>
            </div>

            <!-- Featured Dish 3 -->
            <div class="col-md-4 mb-4">
                <div class="d-flex align-items-center">
                    <img src="images/salmon.jpg" class="img-fluid rounded-circle mr-3" alt="Grilled Salmon" style="width: 100px; height: 100px; object-fit: cover;">
                    <div>
                        <h5 class="mb-1">Grilled Salmon</h5>
                        <p class="mb-1">Fresh salmon fillet grilled to perfection.</p>
                        <p class="mb-2"><strong>Price:</strong> 1850.00</p>
                    </div>
                </div>
            </div>
            
            <!-- Featured Dish 4 -->
            <div class="col-md-4 mb-4">
                <div class="d-flex align-items-center">
                    <img src="images/food3.jpg" class="img-fluid rounded-circle mr-3" alt="Chicken Avocado Salad" style="width: 100px; height: 100px; object-fit: cover;">
                    <div>
                        <h5 class="mb-1">Chicken Avocado Salad</h5>
                        <p class="mb-1">Chicken with Avocado Salad.</p>
                        <p class="mb-2"><strong>Price:</strong> 2150.00</p>
                    </div>
                </div>
            </div>

            <!-- Featured Dish 5 -->
            <div class="col-md-4 mb-4">
                <div class="d-flex align-items-center">
                    <img src="images/food4.jpg" class="img-fluid rounded-circle mr-3" alt="Spicy Meatball Spaghetti" style="width: 100px; height: 100px; object-fit: cover;">
                    <div>
                        <h5 class="mb-1">Spicy Meatball Spaghetti</h5>
                        <p class="mb-1">Spaghetti with spicy chicken meatballs.</p>
                        <p class="mb-2"><strong>Price:</strong> 2350.00</p>
                    </div>
                </div>
            </div>

            <!-- Featured Dish 6 -->
            <div class="col-md-4 mb-4">
                <div class="d-flex align-items-center">
                    <img src="images/food6.jpg" class="img-fluid rounded-circle mr-3" alt="Grilled Chicken Sandwich" style="width: 100px; height: 100px; object-fit: cover;">
                    <div>
                        <h5 class="mb-1">Grilled Chicken Sandwich</h5>
                        <p class="mb-1">Grilled chicken sandwich with French fries.</p>
                        <p class="mb-2"><strong>Price:</strong> 1650.00</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
    <a href="<%= request.getContextPath() %>/menu" class="btn btn-primary">See More</a>
</div>
    </div>
</section>

    <!-- Special Offers Section -->
<section id="offers" class="py-5 text-center">
    <div class="container">
        <h2>Special Offers</h2>
        <p>Check out our latest offers and save big on your favorite dishes!</p>
        <div class="row">
            <!-- Offer 1 -->
            <div class="col-md-4 mb-4">
                <div class="offer-card">
                    <img src="images/offer1.jpg" class="img-fluid mb-3" alt="Exclusive Discount">
                    <h4 class="offer-title">Exclusive Discount</h4>
                    <p>Enjoy 20% off on all main course dishes every Friday!</p>
                </div>
            </div>

            <!-- Offer 2 -->
            <div class="col-md-4 mb-4">
                <div class="offer-card">
                    <img src="images/offer2.jpg" class="img-fluid mb-3" alt="Buy 2 Get 1 Free">
                    <h4 class="offer-title">Buy 2 Get 1 Free</h4>
                    <p>Buy any two pizzas and get one free of your choice! Available all week long.</p>
                </div>
            </div>

            <!-- Offer 3 -->
            <div class="col-md-4 mb-4">
                <div class="offer-card">
                    <img src="images/offer3.jpg" class="img-fluid mb-3" alt="Weekend Brunch Special">
                    <h4 class="offer-title">Weekend Brunch Special</h4>
                    <p>Get a free dessert with every brunch order on Saturdays and Sundays!</p>
                </div>
            </div>
        </div>
    </div>
</section>



    <!-- Customer Reviews Section -->
    <section id="reviews" class="py-5">
        <div class="container">
            <h2 class="text-center">What Our Customers Say</h2>
            <div class="row">
                <div class="col-md-4">
                    <blockquote class="blockquote">
                        <p class="mb-0">"A wonderful dining experience with a great atmosphere. Highly recommend."</p>
                        <footer class="blockquote-footer">Jane Smith</footer>
                    </blockquote>
                </div>
                <div class="col-md-4">
                    <blockquote class="blockquote">
                        <p class="mb-0">"The food was amazing, and the service was excellent. Will definitely come back!"</p>
                        <footer class="blockquote-footer">John Doe</footer>
                    </blockquote>
                </div>
                <div class="col-md-4">
                    <blockquote class="blockquote">
                        <p class="mb-0">"Delicious food and great service. The desserts are to die for!"</p>
                        <footer class="blockquote-footer">Emily Johnson</footer>
                    </blockquote>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer Section -->
    <footer class="py-4 text-white">
        <div class="container text-center">
            <p>&copy; 2024 ABCD Restaurant. All rights reserved.</p>
            <p><a href="${pageContext.request.contextPath}/privacy.jsp">Privacy Policy</a> | <a href="${pageContext.request.contextPath}/terms.jsp">Terms of Service</a></p>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
