package com.sexteam.action;

import com.sexteam.service.CarService;
import com.sexteam.service.Hero_CommodityService;
import com.sexteam.service.imp.CarServiceImp;
import com.sexteam.service.imp.Hero_CommodityServiceImp;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.Car;
import com.sexteam.vo.Hero_Commodity;
import com.sexteam.vo.Hero_orders;
import com.sexteam.vo.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet(name = "InsertCarServlet", urlPatterns = "/insertcarservlet")
public class InsertCarServlet extends HttpServlet {
    private CarService carService;
    private Hero_CommodityService hero_commodityService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        boolean flag = true;
        Car hero_orders = new Car();
        carService = new CarServiceImp();
        hero_commodityService = new Hero_CommodityServiceImp();
        Map<String, String[]> parameterMap = request.getParameterMap();
        try {
            BeanUtils.populate(hero_orders, parameterMap);
//            System.out.println(hero_orders);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        User user = (User) request.getSession().getAttribute(RegionValue.USER_MSG);
        if (user != null) {
            hero_orders.setU_id(user.getU_id());

        } else {
            flag = false;
        }
        String c_id = request.getParameter("c_id");
        if (c_id != null) {
            Hero_Commodity hero_commdityByC_id = hero_commodityService.getHero_CommdityByC_id(c_id);
            if (hero_commdityByC_id != null) {
                hero_orders.setHero_commodity(hero_commdityByC_id);
            } else {
                flag = false;
            }
        } else {
            flag = false;
        }
        if (hero_orders.getBuycount() == 0) {
            flag = false;
        }
        if (hero_orders.getHero_skin() == null) {
            flag = false;
        }
        if (flag) {
            boolean b = carService.addToCar(hero_orders);
            if (b) {
                User attribute = (User) request.getSession().getAttribute(RegionValue.USER_MSG);
                if (attribute != null) {
                    attribute.setCarcount(attribute.getCarcount() + 1);
                }
                request.getSession().setAttribute(RegionValue.USER_MSG, attribute);
                response.getWriter().println(RegionValue.success);
                return;
            }
            response.getWriter().println(RegionValue.error);
            return;
        } else {
            response.getWriter().println(RegionValue.error);
            return;
        }


    }
}
