package com.abc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.abc.model.Query;
import com.abc.dao.DBConnection;

public class QueryDAO {
    public List<Query> getAllQueries() throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Query> queryList = new ArrayList<>();

        try {
            // Get connection from DBConnection class
            conn = DBConnection.getConnection();

            // SQL query to fetch all queries from the database
            String sql = "SELECT * FROM Queries";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            // Process the result set and add each query to the list
            while (rs.next()) {
                Query query = new Query();
                query.setId(rs.getInt("id"));
                query.setName(rs.getString("name"));
                query.setEmail(rs.getString("email"));
                query.setMessage(rs.getString("message"));

                queryList.add(query);
            }

            return queryList;
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
