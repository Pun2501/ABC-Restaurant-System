package com.abc.service;

import com.abc.dao.OrderDAO;
import com.abc.model.Order;
import com.abc.model.OrderItem;

import java.sql.SQLException;
import java.util.List;

public class OrderService {

    private OrderDAO orderDAO = new OrderDAO();

    /**
     * Retrieves all orders from the database.
     * 
     * @return List of all orders
     * @throws SQLException if a database access error occurs
     */
    public List<Order> getAllOrders() throws SQLException {
        return orderDAO.getAllOrders();
    }

    /**
     * Processes an order by saving the order details and order items.
     * 
     * @param order the order to be processed
     * @param orderItems the items associated with the order
     * @throws SQLException if a database access error occurs
     */
    public void processOrder(Order order, List<OrderItem> orderItems) throws SQLException {
        orderDAO.saveOrder(order);
        orderDAO.saveOrderItems(order.getOrderId(), orderItems);
    }
}
