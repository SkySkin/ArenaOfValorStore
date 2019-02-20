package com.sexteam.util;

import org.junit.Test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBHelper {
//    private static String DRIVER = ResourceBundle.getBundle("db_cfg").getString("DRIVER");
//    private static String URL = ResourceBundle.getBundle("db_cfg").getString("URL");
//    private static String USER = ResourceBundle.getBundle("db_cfg").getString("USER");
//    private static String PWD = ResourceBundle.getBundle("db_cfg").getString("PWD");

//    static {
//        try {
//            Class.forName(DRIVER);
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//    }
    public static Connection getConn(){
        return Conn_c3p0.getConn();
    }
    public static void close(Connection conn) throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }

    public static void close(Statement statement) throws SQLException {
        if (statement != null) {
            statement.close();
        }
    }

    public static void close(ResultSet resultSet) throws SQLException {
        if (resultSet != null) {
            resultSet.close();
        }
    }

    public static void closeAll(ResultSet resultSet, Statement statement, Connection conn) throws SQLException {
        close(resultSet);
        close(statement);
        close(conn);
    }
}
