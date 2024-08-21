<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery - ABC Restaurant</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Gallery Sections */
        .gallery-section {
            margin-bottom: 40px;
        }
        .gallery-section h2 {
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
            margin-bottom: 20px;
            font-size: 1.5em;
        }
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 10px;
        }
        .gallery img {
            width: 100%;
            height: auto;
            cursor: pointer;
            border-radius: 8px;
        }

        /* Lightbox Styles */
        .lightbox {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        .lightbox img {
            max-width: 90%;
            max-height: 80%;
        }
        .lightbox:target {
            display: flex;
        }
        .lightbox .close {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 24px;
            color: #fff;
            cursor: pointer;
        }
        .lightbox .prev, .lightbox .next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 24px;
            color: #fff;
            cursor: pointer;
            background: rgba(0, 0, 0, 0.5);
            border: none;
            padding: 10px;
        }
        .lightbox .prev {
            left: 20px;
        }
        .lightbox .next {
            right: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>ABC Restaurant</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="reservations.jsp">Reservations</a></li>
                <li><a href="menu.jsp">Menu</a></li>
                <li><a href="ordering.jsp">Order Food</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a href="query.jsp">Queries</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <div class="gallery-section">
            <h2>Our Dishes</h2>
            <div class="gallery">
                <a href="#lightbox1"><img src="images/food1.jpg" alt="Dish 1"></a>
                <a href="#lightbox2"><img src="images/food3.jpg" alt="Dish 2"></a>
                <a href="#lightbox3"><img src="images/food4.jpg" alt="Dish 3"></a>
                <a href="#lightbox4"><img src="images/food9.jpg" alt="Dish 4"></a>
                <a href="#lightbox5"><img src="images/food6.jpg" alt="Dish 5"></a>
                <a href="#lightbox6"><img src="images/food10.jpg" alt="Dish 6"></a>
                <a href="#lightbox7"><img src="images/food8.jpg" alt="Dish 7"></a>
            </div>
        </div>
        
        <div class="gallery-section">
            <h2>Restaurant</h2>
            <div class="gallery">
                <a href="#lightbox8"><img src="images/res1.jpg" alt="Restaurant Interior"></a>
                <a href="#lightbox9"><img src="images/res2.jpg" alt="Restaurant Interior1"></a>
                <a href="#lightbox10"><img src="images/res3.jpg" alt="Restaurant Interior2"></a>
                <a href="#lightbox11"><img src="images/res4.jpg" alt="Restaurant Interior3"></a>
                <a href="#lightbox12"><img src="images/res5.jpg" alt="Restaurant Interior4"></a>
            </div>
        </div>
        
        <!-- Lightbox elements -->
        <div id="lightbox1" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'food')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'food')">&#10095;</button>
            <img src="images/food1.jpg" alt="Dish 1">
        </div>
        <div id="lightbox2" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'food')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'food')">&#10095;</button>
            <img src="images/food3.jpg" alt="Dish 2">
        </div>
        <div id="lightbox3" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'food')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'food')">&#10095;</button>
            <img src="images/food4.jpg" alt="Dish 3">
        </div>
        <div id="lightbox4" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'food')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'food')">&#10095;</button>
            <img src="images/food5.jpg" alt="Dish 4">
        </div>
        <div id="lightbox5" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'food')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'food')">&#10095;</button>
            <img src="images/food6.jpg" alt="Dish 5">
        </div>
        <div id="lightbox6" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'food')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'food')">&#10095;</button>
            <img src="images/food7.jpg" alt="Dish 6">
        </div>
        <div id="lightbox7" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'food')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'food')">&#10095;</button>
            <img src="images/food8.jpg" alt="Dish 7">
        </div>
        <div id="lightbox8" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'restaurant')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'restaurant')">&#10095;</button>
            <img src="images/res1.jpg" alt="Restaurant Interior">
        </div>
        <div id="lightbox9" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'restaurant')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'restaurant')">&#10095;</button>
            <img src="images/res2.jpg" alt="Restaurant Interior1">
        </div>
        <div id="lightbox10" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'restaurant')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'restaurant')">&#10095;</button>
            <img src="images/res3.jpg" alt="Restaurant Interior2">
        </div>
        <div id="lightbox11" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'restaurant')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'restaurant')">&#10095;</button>
            <img src="images/res4.jpg" alt="Restaurant Interior3">
        </div>
        <div id="lightbox12" class="lightbox">
            <span class="close" onclick="closeLightbox()">&times;</span>
            <button class="prev" onclick="changeSlide(-1, 'restaurant')">&#10094;</button>
            <button class="next" onclick="changeSlide(1, 'restaurant')">&#10095;</button>
            <img src="images/res5.jpg" alt="Restaurant Interior4">
        </div>
    </div>

    <script>
        function closeLightbox() {
            window.location.hash = '';
        }

        function changeSlide(direction, type) {
            const lightbox = document.querySelector('.lightbox:target');
            if (!lightbox) return;

            const prefix = type === 'food' ? 'lightbox' : 'lightbox';
            const lightboxes = Array.from(document.querySelectorAll(`.lightbox[id^="${prefix}"]`));
            const currentIndex = lightboxes.indexOf(lightbox);
            if (currentIndex === -1) return;

            const nextIndex = (currentIndex + direction + lightboxes.length) % lightboxes.length;
            const nextLightbox = lightboxes[nextIndex];
            window.location.hash = `#${nextLightbox.id}`;
        }

        document.addEventListener('keydown', function(e) {
            const lightbox = document.querySelector('.lightbox:target');
            if (lightbox) {
                if (e.key === 'ArrowLeft') {
                    changeSlide(-1, lightbox.id.startsWith('lightbox8') ? 'restaurant' : 'food');
                } else if (e.key === 'ArrowRight') {
                    changeSlide(1, lightbox.id.startsWith('lightbox8') ? 'restaurant' : 'food');
                }
            }
        });
    </script>
</body>
</html>
