package com.abc.controller;

import com.abc.model.Order;
import com.abc.model.OrderItem;
import com.abc.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/staffDashboard")
public class OrderController extends HttpServlet {

    private OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	List<Order> orders = orderService.getAllOrders();
        	System.out.println("Orders list size: " + orders.size());
        	request.setAttribute("orders", orders);

            // Forward to JSP for displaying orders
            request.getRequestDispatcher("viewOrders.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Error fetching orders");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle form submission for creating orders
        String fullName = request.getParameter("full_name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String totalAmount = request.getParameter("total_amount");

        if (fullName == null || address == null || email == null || phone == null || totalAmount == null) {
            response.sendRedirect("error.jsp?message=Invalid request parameters");
            return;
        }

        // Generate a random order ID
        int orderId = new Random().nextInt(1000000);

        // Create an Order object
        Order order = new Order();
        order.setOrderId(orderId);
        order.setFullName(fullName);
        order.setAddress(address);
        order.setEmail(email);
        order.setPhone(phone);
        order.setTotalAmount(totalAmount);

        try {
            // Process the order
            orderService.processOrder(order, getOrderItems(request));

            // Redirect to a confirmation page
            response.sendRedirect("confirmation.jsp?orderId=" + orderId);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Error processing order");
        }
    }

    private List<OrderItem> getOrderItems(HttpServletRequest request) {
        List<OrderItem> items = new ArrayList<>();
      
        OrderItem item1 = new OrderItem();
        item1.setFoodId(1); 
        item1.setQuantity(2); 
        items.add(item1);
        return items;
    }
}
