<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - ABC Restaurant</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        header {
            background-color: #333;
            color: white;
            padding: 10px 0;
            text-align: center;
            position: relative;
        }
        header h1 {
            margin: 0;
            font-size: 2.5em;
        }
        .back-home {
            position: absolute;
            top: 10px;
            right: 20px;
            background-color: #555;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1em;
        }
        .back-home:hover {
            background-color: #777;
        }
        .content {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .content h2 {
            font-size: 2em;
            color: #333;
        }
        .content p {
            line-height: 1.6;
            color: #555;
        }
        .team-section {
            margin-top: 20px;
        }
        .team-section h3 {
            font-size: 1.8em;
            color: #333;
        }
        .team-member {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        .team-member img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
            margin-right: 15px;
        }
        .team-member h4 {
            margin: 0;
            color: #333;
        }
        .team-member p {
            margin: 5px 0 0;
            color: #777;
        }
        footer {
            background-color: #333;
            color: white;
            padding: 10px 0;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>ABC Restaurant</h1>
        <a class="back-home" href="home.jsp">Back to Home Page</a>
    </header>

    <div class="container">
        <div class="content">
            <h2>About Us</h2>
            <p>Welcome to ABC Restaurant, where we offer a delightful dining experience with a touch of elegance. Our restaurant is dedicated to serving high-quality, delicious meals in a warm and inviting atmosphere. From our carefully crafted menu to our exceptional customer service, we strive to make every visit memorable.</p>

            <p>At ABC Restaurant, we pride ourselves on using the freshest ingredients to create mouth-watering dishes that cater to a variety of tastes. Whether you're here for a casual meal with family or a special occasion with friends, we have something for everyone.</p>

            <div class="team-section">
                <h3>Meet Our Team</h3>
                <div class="team-member">
                    <img src="images/chef.jpg" alt="Chef John Doe">
                    <div>
                        <h4>Chef John Doe</h4>
                        <p>Head Chef</p>
                        <p>With over 20 years of experience, Chef John Doe brings his culinary expertise and passion to every dish. His dedication to quality and innovation ensures that every meal is a masterpiece.</p>
                    </div>
                </div>
                <div class="team-member">
                    <img src="images/manager.jpg" alt="Sarah Smith">
                    <div>
                        <h4>Sarah Smith</h4>
                        <p>Restaurant Manager</p>
                        <p>Sarah Smith is the driving force behind our restaurant’s exceptional service. Her commitment to creating a welcoming environment ensures that every guest feels like a part of our family.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        &copy; 2024 ABC Restaurant. All Rights Reserved.
    </footer>
</body>
</html>
