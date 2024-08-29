<style>
/* Add this CSS in your styles.css file or in a <style> tag */

.navbar {
    background-color: #343a40; /* Dark grey background */
    border-bottom: 1px solid #495057; /* Slightly lighter grey for border */
}

.navbar-brand {
    color: #f8f9fa; /* Light grey color for the brand name */
}

.navbar-brand img {
    margin-right: 10px;
}

.navbar-nav .nav-link {
    color: #f8f9fa; /* Light grey color for nav links */
    padding: 15px 20px;
    font-size: 16px;
    font-weight: normal; /* Default font weight */
}

.navbar-nav .nav-link:hover {
    color: #ffffff; /* White color for hover effect */
    background-color: #495057; /* Slightly lighter grey background on hover */
    border-radius: 5px;
    font-weight: bold; /* Bold on hover */
}

.navbar-nav .nav-item.active .nav-link {
    color: #ffffff; /* White color for the active link */
    font-weight: bold; /* Bold for the active link */
}
</style>



<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
        <img src="${pageContext.request.contextPath}/images/logo1.png" alt="ABC Restaurant Logo" style="height: 40px;">
        ABC Restaurant
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/menu">Menu</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/reservation.jsp">Reservations</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a>
            </li>
        </ul>
    </div>
</nav>

