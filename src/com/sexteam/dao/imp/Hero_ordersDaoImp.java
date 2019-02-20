package com.sexteam.dao.imp;

import com.sexteam.dao.Hero_ordersDao;
import com.sexteam.util.DBHelper;
import com.sexteam.vo.Hero_orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Hero_ordersDaoImp implements Hero_ordersDao {

    @Override
    public boolean addOrder(Hero_orders hero_orders) {
        boolean b = false;
        Connection conn = DBHelper.getConn();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO hero_orders(c_id,o_shippingaddress,u_id,buycount,hero_skin) VALUES(?,?,?,?,?)");
            System.out.println("===:"+hero_orders);
            preparedStatement.setString(1,hero_orders.getC_id());
            preparedStatement.setString(2,hero_orders.getO_shippingaddress());
            preparedStatement.setInt(3,hero_orders.getU_id());
            preparedStatement.setInt(4,hero_orders.getBuycount());
            preparedStatement.setString(5,hero_orders.getHero_skin());
            int i = preparedStatement.executeUpdate();
            if(i==1){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return b;
    }
}
