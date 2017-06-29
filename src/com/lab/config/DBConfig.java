package com.lab.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
    static final String url = "jdbc:mysql://localhost:3306/openlab?useUnicode=true&characterEncoding=UTF-8";
    static final String user = "root";
    static final String password = "011235";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
