<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.abc.model.Reservation" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Reservations</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
    <style>
    </style>
</head>
<body>
    <h2>Reservations</h2>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Reservation Date</th>
                <th>Number of People</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
                if (reservations != null && !reservations.isEmpty()) {
                    for (Reservation reservation : reservations) {
                        int id = reservation.getId();
                        String name = reservation.getName();
                        String email = reservation.getEmail();
                        String phone = reservation.getPhone();
                        String reservationDate = reservation.getReservationDate();
                        int numberOfPeople = reservation.getNumberOfPeople();
            %>
            <tr>
                <td><%= name %></td>
                <td><%= email %></td>
                <td><%= phone %></td>
                <td><%= reservationDate %></td>
                <td><%= numberOfPeople %></td>
                <td class="action-buttons">
                    <form action="${pageContext.request.contextPath}/reservations" method="post">
                        <input type="hidden" name="action" value="complete">
                        <input type="hidden" name="id" value="<%= id %>">
                        <input type="submit" value="Complete" class="complete-button">
                    </form>
                    <form action="${pageContext.request.contextPath}/reservations" method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= id %>">
                        <input type="submit" value="Delete" class="delete-button">
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7" class="error">No reservations found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
