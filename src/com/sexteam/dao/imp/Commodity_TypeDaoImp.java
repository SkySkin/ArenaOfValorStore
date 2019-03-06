package com.sexteam.dao.imp;

import com.sexteam.dao.Commodity_TypeDao;
import com.sexteam.dao.Hero_CommodityDao;
import com.sexteam.util.DBHelper;
import com.sexteam.vo.Commodity_Type;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Commodity_TypeDaoImp implements Commodity_TypeDao {
    private Hero_CommodityDao hero_commodityDao;
    @Override
    public List<Commodity_Type> getAllCommodity_Type()  {
        List<Commodity_Type> list=new ArrayList<>();
        Connection conn = DBHelper.getConn();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement("SELECT * FROM commodity_type");
            ResultSet resultSet = preparedStatement.executeQuery();
            getCommodity_typeResult(list, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    private void getCommodity_typeResult(List<Commodity_Type> list, ResultSet resultSet) throws SQLException {
        Commodity_Type commodity_type;
        while (resultSet.next()){
            commodity_type= new Commodity_Type();
            commodity_type.setType_id(resultSet.getInt("type_id"));
            commodity_type.setType_name(resultSet.getString("type_name"));
            list.add(commodity_type);
        }
    }

    @Override
    public Commodity_Type getTypeBytype_id(int type_id) {
        Connection connection = DBHelper.getConn();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from commodity_type where type_id=? ");
            preparedStatement.setInt(1,type_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            Commodity_Type commodity_type=null;
            if(resultSet.next()){
                commodity_type= new Commodity_Type();
                commodity_type.setType_id(resultSet.getInt("type_id"));
                commodity_type.setType_name(resultSet.getString("type_name"));
            }
            return commodity_type;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Commodity_Type> fuzzyQueryForHeroType(String q) {
        hero_commodityDao = new Hero_CommodityDaoImp();
        Connection conn = DBHelper.getConn();
        List<Commodity_Type> list=new ArrayList<>();
        try {
            ResultSet resultSet = conn.prepareStatement("select * from commodity_type  where type_name like '" + q + "%'").executeQuery();
            getCommodity_typeResult(list, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
