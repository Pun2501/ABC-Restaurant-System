package com.abc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.abc.dao.DBConnection;
import com.abc.model.Query;

@WebServlet("/contactUsServlet")
public class ContactUsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int queryId = 0;

        try {
            // Get connection from DBConnection class
            conn = DBConnection.getConnection();

            // SQL query to insert the query into the database
            String sql = "INSERT INTO Queries (name, email, message) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);

            // Execute the query
            pstmt.executeUpdate();

            // Get the generated query_id
            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                queryId = rs.getInt(1);
            }

            // Redirect to a thank you page with query_id
            response.sendRedirect("thankYou.jsp?queryId=" + queryId);

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle errors
            response.sendRedirect("error.jsp"); 
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}

