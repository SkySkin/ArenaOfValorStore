package com.sexteam.dao.imp;

import com.sexteam.dao.Commodity_TypeDao;
import com.sexteam.util.DBHelper;
import com.sexteam.vo.Commodity_Type;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Commodity_TypeDaoImp implements Commodity_TypeDao {
    @Override
    public List<Commodity_Type> getAllCommodity_Type()  {
        List<Commodity_Type> list=new ArrayList<>();
        Connection conn = DBHelper.getConn();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement("SELECT * FROM commodity_type");
            ResultSet resultSet = preparedStatement.executeQuery();
            Commodity_Type commodity_type=null;
            while (resultSet.next()){
                commodity_type= new Commodity_Type();
                commodity_type.setType_id(resultSet.getInt("type_id"));
                commodity_type.setType_name(resultSet.getString("type_name"));
                list.add(commodity_type);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
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
}
