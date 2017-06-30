package com.lab.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
    private static final String url = "jdbc:mysql://localhost:3306/openlab?characterEncoding=UTF-8";
    private static final String user = "root";
    private static final String password = "root";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to database...");

            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
