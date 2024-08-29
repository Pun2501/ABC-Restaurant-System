package com.abc.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.abc.dao.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String fullName = request.getParameter("full_name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String totalAmount = request.getParameter("total_amount");

        // Validate request parameters
        if (fullName == null || address == null || email == null || phone == null || totalAmount == null) {
            response.sendRedirect("error.jsp?message=Invalid request parameters");
            return;
        }

        // Generate a random order ID
        int orderId = new Random().nextInt(1000000);

        // Use DBConnection to get a database connection
        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);

            // Insert order details into the Orders table
            String orderQuery = "INSERT INTO Orders (order_id, full_name, address, email, phone, total_amount) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement orderStmt = conn.prepareStatement(orderQuery)) {
                orderStmt.setInt(1, orderId);
                orderStmt.setString(2, fullName);
                orderStmt.setString(3, address);
                orderStmt.setString(4, email);
                orderStmt.setString(5, phone);
                orderStmt.setString(6, totalAmount);
                orderStmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp?message=Error inserting order details");
                return;
            }

            // Insert order items into the OrderItems table
            String itemQuery = "INSERT INTO OrderItems (order_id, food_id, quantity) VALUES (?, ?, ?)";
            try (PreparedStatement itemStmt = conn.prepareStatement(itemQuery)) {
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp?message=Error inserting order items");
                return;
            }

            conn.commit();

            // Set order details as request attributes
            request.setAttribute("orderId", orderId);
            request.setAttribute("fullName", fullName);
            request.setAttribute("address", address);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("totalAmount", totalAmount);

            // Forward to the confirmation page
            request.getRequestDispatcher("confirmation.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Error processing checkout");
        }
    }
}