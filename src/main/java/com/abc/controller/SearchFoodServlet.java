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

@WebServlet("/search")
public class SearchFoodServlet extends HttpServlet {
    private FoodService foodService = FoodService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        try {
            List<Food> foods = foodService.searchFoodItems(query);
            request.setAttribute("foods", foods);
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
