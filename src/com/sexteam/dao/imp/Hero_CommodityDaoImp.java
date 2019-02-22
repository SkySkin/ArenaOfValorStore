package com.sexteam.dao.imp;

import com.sexteam.dao.Hero_CommodityDao;
import com.sexteam.util.DBHelper;
import com.sexteam.vo.Hero_Commodity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Hero_CommodityDaoImp implements Hero_CommodityDao {


    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    @Override
    public List<Hero_Commodity> getAllCommodity() throws SQLException {
        List<Hero_Commodity> list = new ArrayList<>();
        Connection conn = DBHelper.getConn();
        try {
            preparedStatement = conn.prepareStatement("SELECT * FROM hero_commodity ORDER BY  type_id ASC");
            resultSet = preparedStatement.executeQuery();
            baseTobean(list, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBHelper.close(resultSet);
            DBHelper.close(preparedStatement);
        }
        return list;
    }

    private void baseTobean(List<Hero_Commodity> list, ResultSet resultSet) throws SQLException {
        Hero_Commodity commodity;
        while (resultSet.next()) {
            commodity = new Hero_Commodity();
            commodity.setC_id(resultSet.getString("c_id"));
            commodity.setC_count(resultSet.getInt("c_count"));
            commodity.setC_describe(resultSet.getString("c_describe"));
            commodity.setC_imag(resultSet.getString("c_imag"));
            commodity.setC_name(resultSet.getString("c_name"));
            commodity.setC_place(resultSet.getString("c_place"));
            commodity.setC_sales(resultSet.getInt("c_sales"));
            commodity.setType_id(resultSet.getInt("type_id"));
            commodity.setC_proce(resultSet.getFloat("c_proce"));
            list.add(commodity);
        }
    }

    @Override
    public int getHero_CommodityCount() throws SQLException {
        Connection conn = DBHelper.getConn();
        int count = 0;
        try {
            preparedStatement = conn.prepareStatement("select count(*) as count from hero_commodity");
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt("count");
//                System.out.println(count);
                return count;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBHelper.close(resultSet);
            DBHelper.close(preparedStatement);
        }


        return count;
    }
    @Override
    public int getHero_CommodityTypeCount(int type_id) throws SQLException {
        Connection conn = DBHelper.getConn();
        int count = 0;
        try {
            preparedStatement = conn.prepareStatement("SELECT count(*) as count from hero_commodity where type_id=? ");
            preparedStatement.setInt(1,type_id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt("count");
//                System.out.println(count);
                return count;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBHelper.close(resultSet);
            DBHelper.close(preparedStatement);
        }


        return count;
    }

    @Override
    public List<Hero_Commodity> getSybaseCommodity(int starindex, int pagesize) throws SQLException {
        List<Hero_Commodity> list = new ArrayList<>();
        Connection conn = DBHelper.getConn();
        String sql = "select * from hero_commodity LIMIT ?,?";
        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, starindex);
            preparedStatement.setInt(2, pagesize);
            resultSet = preparedStatement.executeQuery();
            Hero_Commodity commodity = null;
            baseTobean(list, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBHelper.close(resultSet);
            DBHelper.close(preparedStatement);
        }
        return list.size() > 0 ? list : null;
    }

    @Override
    public List<Hero_Commodity> getHero_CommdityByTpye_id(int tpye_id, int starindex, int pagesize) throws SQLException {
        List<Hero_Commodity> list = new ArrayList<>();
        Connection connection = DBHelper.getConn();
        try {
            preparedStatement = connection.prepareStatement("SELECT * from hero_commodity where type_id=? LIMIT ?,?");
            preparedStatement.setInt(1, tpye_id);
            preparedStatement.setInt(2,starindex);
            preparedStatement.setInt(3,pagesize);
            resultSet = preparedStatement.executeQuery();
            baseTobean(list, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBHelper.close(resultSet);
            DBHelper.close(preparedStatement);
        }
        return list;
    }

    @Override
    public Hero_Commodity getHero_CommdityByC_id(String c_id) {
        Connection conn = DBHelper.getConn();
        Hero_Commodity commodity=null;
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * from hero_commodity where c_id=?");
            preparedStatement.setString(1,c_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                commodity = new Hero_Commodity();
                commodity.setC_id(resultSet.getString("c_id"));
                commodity.setC_count(resultSet.getInt("c_count"));
                commodity.setC_describe(resultSet.getString("c_describe"));
                commodity.setC_imag(resultSet.getString("c_imag"));
                commodity.setC_name(resultSet.getString("c_name"));
                commodity.setC_place(resultSet.getString("c_place"));
                commodity.setC_sales(resultSet.getInt("c_sales"));
                commodity.setType_id(resultSet.getInt("type_id"));
                commodity.setC_proce(resultSet.getFloat("c_proce"));
            }
            return commodity;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
