package com.abc.dao;

import com.abc.model.Order;
import com.abc.model.OrderItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    // Retrieve all orders from the database
    public List<Order> getAllOrders() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setFullName(rs.getString("full_name"));
                order.setAddress(rs.getString("address"));
                order.setEmail(rs.getString("email"));
                order.setPhone(rs.getString("phone"));
                order.setTotalAmount(rs.getString("total_amount"));
                orders.add(order);
            }
        }
        return orders;
    }

    // Save order details into the database
    public void saveOrder(Order order) throws SQLException {
        String orderQuery = "INSERT INTO Orders (order_id, full_name, address, email, phone, total_amount) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement orderStmt = conn.prepareStatement(orderQuery)) {
            orderStmt.setInt(1, order.getOrderId());
            orderStmt.setString(2, order.getFullName());
            orderStmt.setString(3, order.getAddress());
            orderStmt.setString(4, order.getEmail());
            orderStmt.setString(5, order.getPhone());
            orderStmt.setString(6, order.getTotalAmount());
            orderStmt.executeUpdate();
        }
    }

    // Save order items into the database
    public void saveOrderItems(int orderId, List<OrderItem> orderItems) throws SQLException {
        String itemQuery = "INSERT INTO OrderItems (order_id, food_id, quantity) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement itemStmt = conn.prepareStatement(itemQuery)) {
            for (OrderItem item : orderItems) {
                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, item.getFoodId());
                itemStmt.setInt(3, item.getQuantity());
                itemStmt.addBatch(); // Use batch processing for efficiency
            }
            itemStmt.executeBatch();
        }
    }
}
