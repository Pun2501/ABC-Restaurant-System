package com.abc.controller;

import com.abc.model.Food;
import com.abc.service.FoodService;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/getMenuItems")
public class GetMenuItemsController extends HttpServlet {

    private FoodService foodService;

    @Override
    public void init() throws ServletException {
        foodService = new FoodService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            List<Food> foodList = foodService.getAllFoodItems();
            Gson gson = new Gson();
            String json = gson.toJson(foodList);
            response.getWriter().write(json);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"An error occurred while retrieving food items.\"}");
            e.printStackTrace();
        }
    }
}

