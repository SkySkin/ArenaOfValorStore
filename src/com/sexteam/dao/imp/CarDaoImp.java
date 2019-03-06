package com.sexteam.dao.imp;

import com.sexteam.dao.CarDao;
import com.sexteam.dao.Hero_CommodityDao;
import com.sexteam.util.DBHelper;
import com.sexteam.vo.Car;
import com.sexteam.vo.Hero_Commodity;
import com.sexteam.vo.Hero_OrdersAll;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CarDaoImp implements CarDao {
    private Hero_CommodityDao hero_commodityDao;
    @Override
    public boolean addToCar(Car hero_orders) {
        Connection conn= DBHelper.getConn();
        DateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

        try {
            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO Car(c_id,u_id,buycount,hero_skin,createtime) VALUES(?,?,?,?,?)");
            preparedStatement.setString(1,hero_orders.getHero_commodity().getC_id());
            preparedStatement.setInt(2,hero_orders.getU_id());
            preparedStatement.setInt(3,hero_orders.getBuycount());
            preparedStatement.setString(4,hero_orders.getHero_skin());
            preparedStatement.setString(5,dateFormat.format(new Date()));
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
    public List<Car> getAllCars(int c_id) {
        List<Car> list=new ArrayList<>();
        Connection conn = DBHelper.getConn();
        hero_commodityDao =new Hero_CommodityDaoImp();
        Car hero_ordersAll =null;
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM `car` where u_id=? ORDER BY car_id DESC");
            preparedStatement.setInt(1,c_id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                hero_ordersAll=new Car();
                hero_ordersAll.setCar_id(resultSet.getInt("car_id"));
                hero_ordersAll.setBuycount(resultSet.getInt("buycount"));
                hero_ordersAll.setHero_skin(resultSet.getString("hero_skin"));
                hero_ordersAll.setU_id(c_id);
                hero_ordersAll.setHero_commodity(hero_commodityDao.getHero_CommdityByC_id(resultSet.getString("c_id")));
                hero_ordersAll.setCreatetime(resultSet.getString("createtime"));
                list.add(hero_ordersAll);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean updateCarForCountByCid(int i, int i1) {
        Connection conn = DBHelper.getConn();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("UPDATE car SET buycount="+i1+" where  car_id="+i+"");
            int i2 = preparedStatement.executeUpdate();
            if(i2==1){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Car getCarByCid(int i) {
        Connection conn = DBHelper.getConn();
        hero_commodityDao = new Hero_CommodityDaoImp();
        Car car=null;
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * from car where car_id=?");
            preparedStatement.setInt(1,i);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                car=new Car();
                car.setCar_id(resultSet.getInt("car_id"));
//                System.out.println("resultSet.getString(\"c_id\"):"+resultSet.getString("c_id"));
                car.setHero_commodity(hero_commodityDao.getHero_CommdityByC_id(resultSet.getString("c_id")));
                car.setHero_skin(resultSet.getString("hero_skin"));
                car.setBuycount(resultSet.getInt("buycount"));
                car.setU_id(resultSet.getInt("u_id"));
            }
            return car;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return car;
    }

    @Override
    public int getCarCountByU_id(int u_id) {
        Connection conn= DBHelper.getConn();
        int conunt=0;
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("select count(*) as count from car where u_id=?");
            preparedStatement.setInt(1,u_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                 conunt =resultSet.getInt("count");
                return conunt;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return conunt;
    }

    @Override
    public boolean delCarByCarid(int i) {
        Connection conn = DBHelper.getConn();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("DELETE FROM car WHERE car_id=" + i + "");
            int i1 = preparedStatement.executeUpdate();
            if(i1==1){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
