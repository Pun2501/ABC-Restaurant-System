package com.abc.controller;

import com.abc.model.Food;
import com.abc.service.FoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/menu")
public class MenuController extends HttpServlet {

    private FoodService foodService;

    public void init() throws ServletException {
        foodService = FoodService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Food> foods = foodService.getAllFoods();
            request.setAttribute("foods", foods);
            request.getRequestDispatcher("WEB-INF/views/menu.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
