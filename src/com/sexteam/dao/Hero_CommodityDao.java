package com.sexteam.dao;


import com.sexteam.vo.Commodity_Type;
import com.sexteam.vo.Hero_Commodity;
import com.sexteam.vo.User;

import java.sql.SQLException;
import java.util.List;

public interface Hero_CommodityDao {
//    //查询所有商品
    List<Hero_Commodity> getAllCommodity() throws SQLException;
//    //根据商品全名查找商品
//    CommodityBeans getCommdityByName(String name);
//    //修改商品信息（当库存发生改变，用户购买后，进行库存修改）
    boolean UpdateCommdity(Hero_Commodity hero_Commodity);
//    //根据商品id查找商品
//    CommodityBeans getCommdityById(String id);
//    //商品的模糊查询，根据关键字
//    List<CommodityBeans> getCommodityByKeyword(String Keyword);
//    //增加商品（暂时不实现，属于管理员功能）
//    CommodityBeans addCommodity(CommodityBeans commodityBeans);
//    //根据ID删除商品（暂时不实现，属于管理员功能）
//    CommodityBeans deleteCommodity(String id);
    //查询商品总数
    int getHero_CommodityCount() throws SQLException;
    //得到某类的商品的个数
    int getHero_CommodityTypeCount(int type_id) throws SQLException;

    //分页查询商品
    List<Hero_Commodity> getSybaseCommodity(int starindex,int pagesize) throws SQLException;


    //按照分类查询
    List<Hero_Commodity> getHero_CommdityByTpye_id(int tpye_id, int starindex, int pagesize) throws SQLException;

    Hero_Commodity getHero_CommdityByC_id(String c_id);
}
