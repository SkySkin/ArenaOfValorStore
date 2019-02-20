package com.sexteam.util;

import com.sexteam.service.Hero_CommodityService;
import com.sexteam.service.imp.Hero_CommodityServiceImp;
import com.sexteam.vo.Commodity_Type;
import com.sexteam.vo.Hero_Commodity;
import com.sexteam.vo.PageBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.peer.ListPeer;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommtityUtil {
    //商品分类的数据更新
    public static void updateCommtity(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Hero_CommodityService hero_commodityService = new Hero_CommodityServiceImp();
        Object attribute = request.getServletContext().getAttribute(RegionValue.HERO_COMMODITY_TYPE);
        if(attribute==null){
            List<Commodity_Type> groupType = hero_commodityService.getGroupType();
            request.getServletContext().setAttribute(RegionValue.HERO_COMMODITY_TYPE, groupType);
        }
//        List<PageBean<Hero_Commodity>> listpage=new ArrayList<>();
//        listpage.add(sybase);
        PageBean<Hero_Commodity> sybase = hero_commodityService.getSybase(1, RegionValue.HERO_COMMODITY_PAGESIZE);
        request.setAttribute(RegionValue.HERO_COMMODITY_INITPAGE,sybase);
    }
}
