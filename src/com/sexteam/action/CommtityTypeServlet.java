package com.sexteam.action;

import com.sexteam.service.Hero_CommodityService;
import com.sexteam.service.imp.Hero_CommodityServiceImp;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.Commodity_Type;
import com.sexteam.vo.Hero_Commodity;
import com.sexteam.vo.PageBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CommtityTypeServlet", urlPatterns = "/commtitytypeservlet")
public class CommtityTypeServlet extends HttpServlet {
    private Hero_CommodityService hero_commodityService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String type_id = request.getParameter("type_id");
        String getpageNumber = request.getParameter("pageNumber");
        int pageNumber = 1;
        if (getpageNumber != null) {
            pageNumber = Integer.parseInt(getpageNumber);
        }
        hero_commodityService = new Hero_CommodityServiceImp();
        try {
            Commodity_Type typeBytypeid = hero_commodityService.getTypeBytypeid(Integer.parseInt(type_id));
            PageBean<Hero_Commodity> hero_commdityByTpye_id = hero_commodityService.getHero_CommdityByTpye_id(Integer.parseInt(type_id), pageNumber, RegionValue.HERO_COMMODITY_PAGESIZE);
//            System.out.println("size:"+hero_commdityByTpye_id.getList().size());
//            System.out.println("getStart:"+hero_commdityByTpye_id.getStart());
//            System.out.println("getEnd:"+hero_commdityByTpye_id.getEnd());
            request.setAttribute(RegionValue.HERO_COMMDITYBYTPYE_ID, hero_commdityByTpye_id);
            request.setAttribute(RegionValue.HERO_TYPE,typeBytypeid);
            request.getRequestDispatcher("commodityservlet").forward(request, response);
            return;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
