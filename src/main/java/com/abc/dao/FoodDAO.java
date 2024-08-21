package com.abc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.abc.model.Food;
import com.abc.dao.DBConnection;

public class FoodDAO {

    // Method to add a food item
    public void addFood(Food food) {
        String query = "INSERT INTO food (name, description, price, image, category) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, food.getName());
            stmt.setString(2, food.getDescription());
            stmt.setDouble(3, food.getPrice());
            stmt.setString(4, food.getImage());
            stmt.setString(5, food.getCategory());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to update a food item
    public void updateFood(Food food) {
        String query = "UPDATE food SET name = ?, description = ?, price = ?, image = ?, category = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, food.getName());
            stmt.setString(2, food.getDescription());
            stmt.setDouble(3, food.getPrice());
            stmt.setString(4, food.getImage());
            stmt.setString(5, food.getCategory());
            stmt.setInt(6, food.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to delete a food item
    public void deleteFood(int id) {
        String query = "DELETE FROM food WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to get all food items
    public List<Food> getAllFoodItems() {
        List<Food> foodList = new ArrayList<>();
        String query = "SELECT * FROM food";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Food food = new Food(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getString("category")
                );
                foodList.add(food);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodList;
    }

    // Method to get a food item by ID
    public Food getFoodById(int id) {
        Food food = null;
        String query = "SELECT * FROM food WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    food = new Food(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("description"),
                            rs.getDouble("price"),
                            rs.getString("image"),
                            rs.getString("category")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return food;
    }
}
