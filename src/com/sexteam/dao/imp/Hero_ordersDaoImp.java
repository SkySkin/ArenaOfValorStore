package com.sexteam.dao.imp;

import com.sexteam.dao.Hero_CommodityDao;
import com.sexteam.dao.Hero_ordersDao;
import com.sexteam.dao.UserDao;
import com.sexteam.util.DBHelper;
import com.sexteam.vo.Hero_OrdersAll;
import com.sexteam.vo.Hero_orders;
import com.sexteam.vo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Hero_ordersDaoImp implements Hero_ordersDao {
    private Hero_CommodityDao hero_commodityDao;
    private UserDao userDao;

    @Override
    public boolean addOrder(Hero_orders hero_orders) {
        boolean b = false;
        Connection conn = DBHelper.getConn();
        DateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO hero_orders(c_id,o_shippingaddress,u_id,buycount,hero_skin,createtime) VALUES(?,?,?,?,?,?)");
            System.out.println("===:"+hero_orders);
            preparedStatement.setString(1,hero_orders.getC_id());
            preparedStatement.setString(2,hero_orders.getO_shippingaddress());
            preparedStatement.setInt(3,hero_orders.getU_id());
            preparedStatement.setInt(4,hero_orders.getBuycount());
            preparedStatement.setString(5,hero_orders.getHero_skin());
            preparedStatement.setString(6,dateFormat.format(new Date()));
            int i = preparedStatement.executeUpdate();
            if(i==1){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return b;
    }

    @Override
    public Hero_orders selectNewOrderByUid(Integer attribute) {
        Connection conn = DBHelper.getConn();
        Hero_orders hero_orders=null;
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("select *  FROM hero_orders where u_id=? ORDER BY  o_id DESC LIMIT 1");
            preparedStatement.setInt(1,attribute);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                hero_orders = new Hero_orders();
                hero_orders.setO_id(resultSet.getInt("o_id"));
                hero_orders.setC_id(resultSet.getString("c_id"));
                hero_orders.setO_shippingaddress(resultSet.getString("o_shippingaddress"));
                hero_orders.setU_id(resultSet.getInt("u_id"));
                hero_orders.setBuycount(resultSet.getInt("buycount"));
                hero_orders.setHero_skin(resultSet.getString("hero_skin"));
                hero_orders.setOrderstate(resultSet.getString("orderstate"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return hero_orders;
    }

    @Override
    public boolean updateOrderIsPay(Integer o_id) {
        Connection conn = DBHelper.getConn();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("UPDATE hero_orders SET orderstate='支付完成' where  o_id=" + o_id + "");
            int i = preparedStatement.executeUpdate();
            if(i==1){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Hero_OrdersAll> getAllOrders(int c_id) {
        List<Hero_OrdersAll> list=new ArrayList<>();
        Connection conn = DBHelper.getConn();
        hero_commodityDao =new Hero_CommodityDaoImp();
        DateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM `hero_orders` where u_id=? ORDER BY o_id DESC");
            preparedStatement.setInt(1,c_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            Hero_OrdersAll hero_ordersAll =null;
            while (resultSet.next()){
                hero_ordersAll=new Hero_OrdersAll();
                hero_ordersAll.setO_id(resultSet.getInt("o_id"));
                hero_ordersAll.setBuycount(resultSet.getInt("buycount"));
                hero_ordersAll.setHero_skin(resultSet.getString("hero_skin"));
                hero_ordersAll.setO_shippingaddress(resultSet.getString("o_shippingaddress"));
                hero_ordersAll.setOrderstate(resultSet.getString("orderstate"));
                hero_ordersAll.setCreatetime(resultSet.getString("createtime"));
                hero_ordersAll.setU_id(c_id);
                hero_ordersAll.setHero_commodity(hero_commodityDao.getHero_CommdityByC_id(resultSet.getString("c_id")));
                list.add(hero_ordersAll);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Hero_OrdersAll selectOrderByoid(int id) {
        Connection conn = DBHelper.getConn();
        hero_commodityDao =new Hero_CommodityDaoImp();
        Hero_OrdersAll hero_ordersAll =null;
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("select * from hero_orders WHERE o_id=?");
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                hero_ordersAll=new Hero_OrdersAll();
                hero_ordersAll.setO_id(resultSet.getInt("o_id"));
                hero_ordersAll.setBuycount(resultSet.getInt("buycount"));
                hero_ordersAll.setHero_skin(resultSet.getString("hero_skin"));
                hero_ordersAll.setO_shippingaddress(resultSet.getString("o_shippingaddress"));
                hero_ordersAll.setOrderstate(resultSet.getString("orderstate"));
                hero_ordersAll.setU_id(resultSet.getInt("u_id"));
                hero_ordersAll.setHero_commodity(hero_commodityDao.getHero_CommdityByC_id(resultSet.getString("c_id")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hero_ordersAll;
    }
}
