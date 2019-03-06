package com.sexteam.service.imp;

import com.sexteam.dao.Commodity_TypeDao;
import com.sexteam.dao.imp.Commodity_TypeDaoImp;
import com.sexteam.dao.imp.Hero_CommodityDaoImp;
import com.sexteam.service.Hero_CommodityService;
import com.sexteam.vo.Commodity_Type;
import com.sexteam.vo.Hero_Commodity;
import com.sexteam.vo.PageBean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Hero_CommodityServiceImp implements Hero_CommodityService {
    private Commodity_TypeDao ctd = new Commodity_TypeDaoImp();
    private Hero_CommodityDaoImp hcd = new Hero_CommodityDaoImp();


    @Override
    public List<Commodity_Type> getGroupType() throws SQLException {
        List<Commodity_Type> allCommodity_typeValue = new ArrayList<>();
        //当前返回的数据还没有商品，即商品列表为空
        List<Commodity_Type> allCommodity_type = ctd.getAllCommodity_Type();
        List<Hero_Commodity> allCommodity = hcd.getAllCommodity();
        for (Commodity_Type type : allCommodity_type) {
            int typeid = type.getType_id();
            List<Hero_Commodity> commodityList = new ArrayList<>();
            for (Hero_Commodity commodity : allCommodity) {
                if (commodity.getType_id() == typeid) {
                    commodityList.add(commodity);
                }
            }
            type.setCommodityList(commodityList);
            allCommodity_typeValue.add(type);
        }
//        for (Commodity_Type commodity_type : allCommodity_typeValue) {
//            System.out.println(commodity_type);
//        }


        return allCommodity_typeValue;
    }

    @Override
    public PageBean<Hero_Commodity> getSybase(int pageNumer, int pageSize) throws SQLException {
        int count = hcd.getHero_CommodityCount();
        PageBean<Hero_Commodity> pageBean = new PageBean<>(pageNumer, pageSize, count);
        int startIndex = pageBean.getStartIndex();
        pageBean.setList(hcd.getSybaseCommodity(startIndex, pageSize));
        return pageBean;
    }

    @Override
    public PageBean<Hero_Commodity> getHero_CommdityByTpye_id(int tpye_id,int pageNumber,int pageSize) throws SQLException {
        int hero_commodityTypeCount = hcd.getHero_CommodityTypeCount(tpye_id);
        PageBean<Hero_Commodity> pageBean = new PageBean<>(pageNumber, pageSize, hero_commodityTypeCount);
        int startIndex = pageBean.getStartIndex();
        pageBean.setList(hcd.getHero_CommdityByTpye_id(tpye_id,startIndex,pageSize));
        return pageBean;
    }

    @Override
    public Commodity_Type getTypeBytypeid(int type_id) {
        Commodity_Type typeBytype_id = ctd.getTypeBytype_id(type_id);

        return typeBytype_id;
    }

    @Override
    public Hero_Commodity getHero_CommdityByC_id(String c_id) {
        return hcd.getHero_CommdityByC_id(c_id);
    }

    @Override
    public List<Commodity_Type> fuzzyQueryForHeroType(String q) {
        List<Commodity_Type> list = ctd.fuzzyQueryForHeroType(q);
        return list;
    }

    @Override
    public List<Hero_Commodity> fuzzyQueryForHeroName(String q) {
        List<Hero_Commodity> list = hcd.fuzzyQueryForHeroName(q);
        return list;
    }
}
