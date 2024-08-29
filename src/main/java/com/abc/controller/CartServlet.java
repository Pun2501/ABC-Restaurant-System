package com.abc.controller;

import com.abc.model.Food;
import com.abc.service.FoodService;
import com.abc.model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String foodId = request.getParameter("foodId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            return;
        }

        FoodService foodService = FoodService.getInstance();
        Food food = null;
        try {
            food = foodService.getFoodById(Integer.parseInt(foodId));
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            return;
        }

        HttpSession session = request.getSession();
        Map<String, CartItem> cart = (Map<String, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        if ("add".equals(action)) {
            if (cart.containsKey(foodId)) {
                CartItem item = cart.get(foodId);
                item.setQuantity(item.getQuantity() + quantity);
            } else {
                cart.put(foodId, new CartItem(food, quantity));
            }
        } else if ("update".equals(action)) {
            if (cart.containsKey(foodId)) {
                CartItem item = cart.get(foodId);
                item.setQuantity(quantity);
            }
        } else if ("remove".equals(action)) {
            cart.remove(foodId);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}








