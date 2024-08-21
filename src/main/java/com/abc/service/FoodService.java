package com.abc.service;

import com.abc.model.Food;
import com.abc.dao.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FoodService {

    // Method to get food items by category
    public List<Food> getFoodItemsByCategory(String category) {
        List<Food> foodList = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT * FROM food WHERE category=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, category);
            ResultSet rs = pstmt.executeQuery();
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
    
    

    // Method to get all food items
    public List<Food> getAllFoodItems() {
        List<Food> foodList = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT * FROM food";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
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

    // Method to get a food item by its ID
    public Food getFoodItemById(int id) {
        Food food = null;
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT * FROM food WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return food;
    }

    // Method to add a new food item
    public boolean addFood(Food food) {
        try (Connection con = DBConnection.getConnection()) {
            String query = "INSERT INTO food (name, description, price, image, category) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, food.getName());
            pstmt.setString(2, food.getDescription());
            pstmt.setDouble(3, food.getPrice());
            pstmt.setString(4, food.getImage());
            pstmt.setString(5, food.getCategory());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to update an existing food item
    public boolean updateFood(Food food) {
        try (Connection con = DBConnection.getConnection()) {
            String query = "UPDATE food SET name=?, description=?, price=?, image=?, category=? WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, food.getName());
            pstmt.setString(2, food.getDescription());
            pstmt.setDouble(3, food.getPrice());
            pstmt.setString(4, food.getImage());
            pstmt.setString(5, food.getCategory());
            pstmt.setInt(6, food.getId());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a food item
    public boolean deleteFood(int foodId) {
        try (Connection con = DBConnection.getConnection()) {
            String query = "DELETE FROM food WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, foodId);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
