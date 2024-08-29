package com.abc.service;

import com.abc.dao.FoodDAO;
import com.abc.model.Food;

import java.sql.SQLException;
import java.util.List;

public class FoodService {

    private static FoodService instance;
    private FoodDAO foodDAO;

    private FoodService() {
        this.foodDAO = new FoodDAO(); // Use FoodDAO directly
    }

    public static FoodService getInstance() {
        if (instance == null) {
            synchronized (FoodService.class) {
                if (instance == null) {
                    instance = new FoodService();
                }
            }
        }
        return instance;
    }

    public void setFoodDAO(FoodDAO foodDAO) {
        this.foodDAO = foodDAO;
    }

    public void addFood(Food food) {
        foodDAO.addFood(food);
    }

    public List<Food> getAllFoods() throws SQLException {
        return foodDAO.getAllFoods();
    }

    public Food getFoodById(int id) throws SQLException {
        return foodDAO.getFoodById(id);
    }

    public void updateFood(Food food) {
        foodDAO.updateFood(food);
    }

    public void deleteFood(int id) {
        foodDAO.deleteFood(id);
    }

    // New method to search for food items
    public List<Food> searchFoodItems(String query) throws SQLException {
        return foodDAO.searchFoodItems(query);
    }
    
    public List<Food> getOrderItems(int orderId) throws SQLException {
        return foodDAO.getOrderItems(orderId);
    }
    
}
