package com.abc.controller;

import com.abc.dao.ReservationDAO;
import com.abc.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/reservations")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO = new ReservationDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String reservationDate = request.getParameter("reservationDate");
        int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));

        Reservation reservation = new Reservation();
        reservation.setName(name);
        reservation.setEmail(email);
        reservation.setPhone(phone);
        reservation.setReservationDate(reservationDate);
        reservation.setNumberOfPeople(numberOfPeople);

        try {
            reservationDAO.addReservation(reservation);
            
            // Set the individual attributes for the confirmation page
            request.setAttribute("reservationName", reservation.getName());
            request.setAttribute("reservationEmail", reservation.getEmail());
            request.setAttribute("reservationPhone", reservation.getPhone());
            request.setAttribute("reservationDate", reservation.getReservationDate());
            request.setAttribute("reservationPeople", reservation.getNumberOfPeople());
            
            // Forward to the confirmation page
            request.getRequestDispatcher("reservationConfirmation.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error saving reservation.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Reservation> reservations = reservationDAO.getAllReservations();
            if (reservations != null && !reservations.isEmpty()) {
                request.setAttribute("reservations", reservations);
                request.getRequestDispatcher("viewReservations.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "No reservations found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving reservations.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    private void updateReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String reservationDate = request.getParameter("reservationDate");
        int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));

        Reservation reservation = new Reservation();
        reservation.setId(id);
        reservation.setName(name);
        reservation.setEmail(email);
        reservation.setPhone(phone);
        reservation.setReservationDate(reservationDate);
        reservation.setNumberOfPeople(numberOfPeople);

        try {
            reservationDAO.updateReservation(reservation);
            request.setAttribute("successMessage", "Reservation updated successfully.");
            request.getRequestDispatcher("viewReservations.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating reservation.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void deleteReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            reservationDAO.deleteReservation(id);
            request.setAttribute("successMessage", "Reservation deleted successfully.");
            request.getRequestDispatcher("viewReservations.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error deleting reservation.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }


}