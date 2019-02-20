package com.sexteam.action;

import com.sexteam.service.Hero_CommodityService;
import com.sexteam.service.imp.Hero_CommodityServiceImp;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.Commodity_Type;
import com.sexteam.vo.Hero_Commodity;
import com.sexteam.vo.PageBean;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CommodityServlet", urlPatterns = "/commodityservlet")
public class CommodityServlet extends HttpServlet {
    private Hero_CommodityService hero_commodityService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String pageNumber = request.getParameter("pageNumber");
        hero_commodityService = new Hero_CommodityServiceImp();
        List<Commodity_Type> groupType = null;
        try {
            groupType = hero_commodityService.getGroupType();
            PageBean<Hero_Commodity> sybase;
            Object attribute = request.getAttribute(RegionValue.HERO_COMMDITYBYTPYE_ID);
            Object attribute1 = request.getAttribute(RegionValue.HERO_TYPE);
            if (attribute != null&&attribute1!=null) {
                sybase = (PageBean<Hero_Commodity>) attribute;
                Commodity_Type commodity_type= (Commodity_Type) attribute1;
                request.setAttribute(RegionValue.SUB_COMMTITYSERVLE_NAME,"commtitytypeservlet");
                request.setAttribute(RegionValue.HERO_TYPE,commodity_type);
            } else {
                sybase = hero_commodityService.getSybase(Integer.parseInt(pageNumber), RegionValue.HERO_COMMODITY_PAGESIZE);
                request.setAttribute(RegionValue.SUB_COMMTITYSERVLE_NAME,"commodityservlet");
            }
            request.getServletContext().setAttribute(RegionValue.HERO_COMMODITY_TYPE, groupType);
            request.setAttribute(RegionValue.HERO_COMMODITY_INITPAGE, sybase);
            request.getRequestDispatcher("commodity.jsp").forward(request, response);
//            response.sendRedirect("commodity.jsp");
            return;
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
