package com.abc.controller;

import com.abc.model.Food;
import com.abc.service.FoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;

@WebServlet("/food")
@MultipartConfig
public class FoodController extends HttpServlet {

    private FoodService foodService;

    public void init() throws ServletException {
        foodService = FoodService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the action parameter and default to "list" if it's not present
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    showAddForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteFood(request, response);
                    break;
                default:
                    listFoods(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addFood(request, response);
                    break;
                case "edit":
                    updateFood(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listFoods(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        request.setAttribute("foods", foodService.getAllFoods());
        request.getRequestDispatcher("WEB-INF/views/foodList.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/views/foodForm.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Food food = foodService.getFoodById(id);
        request.setAttribute("food", food);
        request.getRequestDispatcher("WEB-INF/views/foodForm.jsp").forward(request, response);
    }

    private void addFood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String category = request.getParameter("category");

        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);

        String imagePath = "uploads" + File.separator + fileName;

        Food food = new Food();
        food.setName(name);
        food.setDescription(description);
        food.setPrice(price);
        food.setImagePath(imagePath);
        food.setCategory(category);

        foodService.addFood(food);
        response.sendRedirect("food?action=list");
    }

    private void updateFood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String category = request.getParameter("category");

        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);

        String imagePath = "uploads" + File.separator + fileName;

        Food food = new Food(id, name, description, price, imagePath, category);
        foodService.updateFood(food);
        response.sendRedirect("food?action=list");
    }

    private void deleteFood(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        foodService.deleteFood(id);
        response.sendRedirect("food?action=list");
    }
}
