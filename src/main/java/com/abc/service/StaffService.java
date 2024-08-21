package com.abc.service;

import com.abc.model.Staff;
import com.abc.dao.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StaffService {

    // Method to add a new staff member
    public boolean addStaff(Staff staff) {
        String query = "INSERT INTO staff (name, email, role) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, staff.getName());
            pstmt.setString(2, staff.getEmail());
            pstmt.setString(3, staff.getRole());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to retrieve all staff members
    public List<Staff> getAllStaffMembers() {
        List<Staff> staffList = new ArrayList<>();
        String query = "SELECT * FROM staff";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Staff staff = new Staff(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("role"));
                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staffList;
    }

    // Method to update an existing staff member
    public boolean updateStaff(Staff staff) {
        String query = "UPDATE staff SET name = ?, email = ?, role = ? WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, staff.getName());
            pstmt.setString(2, staff.getEmail());
            pstmt.setString(3, staff.getRole());
            pstmt.setInt(4, staff.getId());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a staff member
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

    // Method to get a staff member by ID (useful for editing)
    public Staff getStaffById(int staffId) {
        Staff staff = null;
        String query = "SELECT * FROM staff WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setInt(1, staffId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    staff = new Staff(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staff;
    }
}
