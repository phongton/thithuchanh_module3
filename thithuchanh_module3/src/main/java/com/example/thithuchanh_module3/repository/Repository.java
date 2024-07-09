package com.example.thithuchanh_module3.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Repository {
    private static String jdbURL = "jdbc:mysql://localhost:3306/USER?useSSL=false";
    private static String dbUser = "root";
    private static String dbPass = "phongpro12";
    private static Connection connection = null;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbURL, dbUser, dbPass);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        return connection;
    }
}
