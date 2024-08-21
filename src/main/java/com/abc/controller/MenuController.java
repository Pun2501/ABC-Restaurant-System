// MenuController.java
package com.abc.controller;

import com.abc.model.Food;
import com.abc.service.FoodService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuController extends HttpServlet {

    private FoodService foodService;
    private ObjectMapper objectMapper;

    @Override
    public void init() throws ServletException {
        foodService = new FoodService();
        objectMapper = new ObjectMapper();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Food> foodList = foodService.getAllFoodItems();
        request.setAttribute("foodList", foodList);
        request.getRequestDispatcher("/menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            List<Food> foodList = foodService.getAllFoodItems();
            String json = objectMapper.writeValueAsString(foodList);
            response.getWriter().write(json);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"An error occurred while retrieving food items.\"}");
            e.printStackTrace();
        }
    }
}