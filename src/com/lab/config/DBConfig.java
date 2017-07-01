package com.lab.config;

import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class DBConfig {
    private static Properties config=new Properties();

    static {

        try {
            config.load(DBConfig.class.getClassLoader().getResourceAsStream("db.properties"));
            Class.forName(config.getProperty("driver"));
        } catch (Exception e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(config.getProperty("url"),config.getProperty("user"),config.getProperty("password"));
    }
    public static void release(Connection conn, Statement st, ResultSet rs){

        if(rs!=null){
            try{
                rs.close();   //throw new
            }catch (Exception e) {
                e.printStackTrace();
            }
            rs = null;
        }
        if(st!=null){
            try{
                st.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
            st = null;
        }
        if(conn!=null){
            try{
                conn.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }


    }
}
