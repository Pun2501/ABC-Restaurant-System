package com.abc.dao;

import com.abc.model.Food;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FoodDAO {

    // Add new food item
    public void addFood(Food food) {
        String query = "INSERT INTO food (name, description, price, image_path, category) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, food.getName());
            statement.setString(2, food.getDescription());
            statement.setString(3, food.getPrice()); 
            statement.setString(4, food.getImagePath());
            statement.setString(5, food.getCategory());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update an existing food item
    public void updateFood(Food food) {
        String query = "UPDATE food SET name = ?, description = ?, price = ?, image_path = ?, category = ? WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, food.getName());
            statement.setString(2, food.getDescription());
            statement.setString(3, food.getPrice());
            statement.setString(4, food.getImagePath());
            statement.setString(5, food.getCategory());
            statement.setInt(6, food.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete a food item
    public void deleteFood(int id) {
        String query = "DELETE FROM food WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Retrieve all food items
    public List<Food> getAllFoods() throws SQLException {
        List<Food> foods = new ArrayList<>();
        String query = "SELECT * FROM food";

        try (Connection connection = DBConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                Food food = new Food(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("description"),
                    resultSet.getString("price"),
                    resultSet.getString("image_path"),
                    resultSet.getString("category")
                );
                foods.add(food);
            }
        }
        return foods;
    }

    // Retrieve a food item by ID
    public Food getFoodById(int id) throws SQLException {
        Food food = null;
        String query = "SELECT * FROM food WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                food = new Food(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("description"),
                    resultSet.getString("price"),
                    resultSet.getString("image_path"),
                    resultSet.getString("category")
                );
            }
        }
        return food;
    }

    // Search for food items by name or category
    public List<Food> searchFoodItems(String query) throws SQLException {
        List<Food> foods = new ArrayList<>();
        String sql = "SELECT * FROM food WHERE name LIKE ? OR category LIKE ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            String searchQuery = "%" + query + "%"; // Use wildcard for partial matching
            statement.setString(1, searchQuery);
            statement.setString(2, searchQuery);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Food food = new Food(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getString("price"),
                        resultSet.getString("image_path"),
                        resultSet.getString("category")
                    );
                    foods.add(food);
                }
            }
        }
        return foods;
    }
    
    public List<Food> getOrderItems(int orderId) throws SQLException {
        List<Food> foodItems = new ArrayList<>();
        String query = "SELECT f.id, f.name, f.description, f.price, f.image_path, f.category, oi.quantity " +
                       "FROM food f " +
                       "JOIN order_items oi ON f.id = oi.food_id " +
                       "WHERE oi.order_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, orderId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Food food = new Food(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getString("price"),
                        resultSet.getString("image_path"),
                        resultSet.getString("category")
                    );
                    
                    food.setQuantity(resultSet.getInt("quantity"));
                    foodItems.add(food);
                }
            }
        }
        return foodItems;
    }

    
    
}
