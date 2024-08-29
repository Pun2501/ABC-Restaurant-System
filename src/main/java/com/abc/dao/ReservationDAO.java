package com.abc.dao;

import com.abc.model.Reservation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    // Method to add a reservation
    public void addReservation(Reservation reservation) throws SQLException {
        String sql = "INSERT INTO reservations (name, email, phone, reservation_date, number_of_people) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, reservation.getName());
            statement.setString(2, reservation.getEmail());
            statement.setString(3, reservation.getPhone());
            statement.setString(4, reservation.getReservationDate());
            statement.setInt(5, reservation.getNumberOfPeople());
            statement.executeUpdate();
        }
    }

    // Method to update a reservation
    public void updateReservation(Reservation reservation) throws SQLException {
        String sql = "UPDATE reservations SET name = ?, email = ?, phone = ?, reservation_date = ?, number_of_people = ? WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, reservation.getName());
            statement.setString(2, reservation.getEmail());
            statement.setString(3, reservation.getPhone());
            statement.setString(4, reservation.getReservationDate());
            statement.setInt(5, reservation.getNumberOfPeople());
            statement.setInt(6, reservation.getId());
            statement.executeUpdate();
        }
    }

    // Method to delete a reservation
    public void deleteReservation(int id) throws SQLException {
        String sql = "DELETE FROM reservations WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    // Method to get all reservations
    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT * FROM reservations";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(resultSet.getInt("id"));
                reservation.setName(resultSet.getString("name"));
                reservation.setEmail(resultSet.getString("email"));
                reservation.setPhone(resultSet.getString("phone"));
                reservation.setReservationDate(resultSet.getString("reservation_date"));
                reservation.setNumberOfPeople(resultSet.getInt("number_of_people"));
                reservations.add(reservation);
            }
        }
        return reservations;
    }
}
