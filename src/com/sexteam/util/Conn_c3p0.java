package com.sexteam.util;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class Conn_c3p0 {
    private static Connection connection=null;
    static {
        ComboPooledDataSource cpds = new ComboPooledDataSource();
        try {
            connection =cpds.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConn(){
        return connection;
    }
}
