package com.sexteam.action;

import com.sexteam.service.Hero_CommodityService;
import com.sexteam.service.Hero_ordersService;
import com.sexteam.service.imp.Hero_CommodityServiceImp;
import com.sexteam.service.imp.Hero_ordersServiceImp;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.Hero_Commodity;
import com.sexteam.vo.Hero_OrdersAll;
import com.sexteam.vo.Hero_orders;
import com.sexteam.vo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "NowOrderServlet",urlPatterns = "/noworderservlet")
public class NowOrderServlet extends HttpServlet {
    private Hero_ordersService hero_ordersService;
    private Hero_CommodityService hero_commodityService;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        User attribute = (User) request.getSession().getAttribute(RegionValue.USER_MSG);
        hero_ordersService= new Hero_ordersServiceImp();
        hero_commodityService= new Hero_CommodityServiceImp();
        String o_id = request.getParameter("o_id");
        if(o_id!=null){
            int id=Integer.parseInt(o_id);
            Hero_OrdersAll hero_ordersAll=hero_ordersService.selectOrderByoid(id);
            if(hero_ordersAll!=null){
                request.setAttribute(RegionValue.HERO_ORDERS_JUDGE, hero_ordersAll);
                request.setAttribute(RegionValue.HERO_DETAILES, hero_ordersAll.getHero_commodity());
                request.setAttribute(RegionValue.JUDGEADDORDER,"ok");
                request.getRequestDispatcher("payprice.jsp").forward(request, response);
                return;
            }
        }
        else {
            Hero_orders hero_orders = hero_ordersService.selectNewOrderByUid(attribute.getU_id());
            if (hero_orders != null) {
                Hero_Commodity hero_commodity = hero_commodityService.getHero_CommdityByC_id(hero_orders.getC_id());
                if (hero_commodity != null) {
                    request.setAttribute(RegionValue.HERO_ORDERS_JUDGE, hero_orders);
                    request.setAttribute(RegionValue.HERO_DETAILES, hero_commodity);
                    request.getRequestDispatcher("payprice.jsp").forward(request, response);
                    return;
                }
            }
        }
        response.sendRedirect("initservlet");


    }
}
