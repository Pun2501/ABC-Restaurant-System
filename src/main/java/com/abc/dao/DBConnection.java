package com.abc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/abc_restaurant";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";

    public static Connection getConnection() throws SQLException {
        try {
            // Load MySQL driver explicitly
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver not found.");
        }
        
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
    
    
}
