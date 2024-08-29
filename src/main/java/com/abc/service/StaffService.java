package com.abc.service;

import com.abc.model.Staff;
import com.abc.dao.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffService {

    public boolean addStaff(Staff staff) {
        String query = "INSERT INTO staff (name, email, role, username, password) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, staff.getName());
            pstmt.setString(2, staff.getEmail());
            pstmt.setString(3, staff.getRole());
            pstmt.setString(4, staff.getUsername());
            pstmt.setString(5, staff.getPassword());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Staff> getAllStaffMembers() {
        List<Staff> staffList = new ArrayList<>();
        String query = "SELECT * FROM staff";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Staff staff = new Staff(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("role"),
                        rs.getString("username"),
                        rs.getString("password")
                );
                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staffList;
    }

    public boolean updateStaff(Staff staff) {
        String query = "UPDATE staff SET name = ?, email = ?, role = ?, username = ?, password = ? WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, staff.getName());
            pstmt.setString(2, staff.getEmail());
            pstmt.setString(3, staff.getRole());
            pstmt.setString(4, staff.getUsername());
            pstmt.setString(5, staff.getPassword());
            pstmt.setInt(6, staff.getId());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteStaff(int staffId) {
        String query = "DELETE FROM staff WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setInt(1, staffId);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Staff getStaffById(int staffId) {
        Staff staff = null;
        String query = "SELECT * FROM staff WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setInt(1, staffId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    staff = new Staff(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("role"),
                            rs.getString("username"),
                            rs.getString("password")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staff;
    }

    public Staff authenticateStaff(String email, String password) {
        Staff staff = null;
        String query = "SELECT * FROM staff WHERE email = ? AND password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    staff = new Staff(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("role"),
                            rs.getString("username"),
                            rs.getString("password")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staff;
    }

}
