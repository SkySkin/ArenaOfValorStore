package com.sexteam.service;


import com.sexteam.vo.Commodity_Type;
import com.sexteam.vo.Hero_Commodity;
import com.sexteam.vo.PageBean;

import java.sql.SQLException;
import java.util.List;

public interface Hero_CommodityService {
    //得到分类的商品
    List<Commodity_Type> getGroupType() throws SQLException;
    //分页查询商品
    PageBean<Hero_Commodity>  getSybase(int pageNumer,int pageSize) throws SQLException;
    //按照分类查询商品
    PageBean<Hero_Commodity> getHero_CommdityByTpye_id(int tpye_id,int pageNumber,int pageSize) throws SQLException;

    Commodity_Type getTypeBytypeid(int type_id);

    Hero_Commodity getHero_CommdityByC_id(String c_id);
    //模糊查询类别
    List<Commodity_Type> fuzzyQueryForHeroType(String q);

    List<Hero_Commodity> fuzzyQueryForHeroName(String q);
}
