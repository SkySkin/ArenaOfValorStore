package com.sexteam.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Jdbc {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Connection conn =null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=UTC","root","root");
        if(conn!=null){
            System.out.println("成功");
        }
    }
}
