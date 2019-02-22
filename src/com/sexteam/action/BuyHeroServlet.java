package com.sexteam.action;

import com.sexteam.service.Hero_ordersService;
import com.sexteam.service.imp.Hero_ordersServiceImp;
import com.sexteam.util.RegionValue;
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

@WebServlet(name = "BuyHeroServlet",urlPatterns = "/buyheroservlet")
public class BuyHeroServlet extends HttpServlet {
    private Hero_ordersService hero_ordersService;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        hero_ordersService = new Hero_ordersServiceImp();
        Hero_orders hero_orders = new Hero_orders();
        Map<String, String[]> parameterMap = request.getParameterMap();
        try {
            BeanUtils.populate(hero_orders,parameterMap);
//            System.out.println(hero_orders);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        String o_shippingaddress = hero_orders.getO_shippingaddress();
        User user = (User) request.getSession().getAttribute(RegionValue.USER_MSG);
        boolean b=false;
        if(user!=null){
            hero_orders.setU_id(user.getU_id());
            if(o_shippingaddress!=null){
                //已经有收货地址了，进行了订单的确认，可以在数据库中插入订单了，但是订单状态初始为待支付
                 b= hero_ordersService.addOrder(hero_orders);

            }else {
                request.setAttribute(RegionValue.HERO_ORDERS_JUDGE, hero_orders);
                request.getRequestDispatcher("detailsservlet").forward(request, response);
                return;
            }
        }
        if(b){
            response.sendRedirect("noworderservlet");
            return;
        }else {
            request.setAttribute(RegionValue.JUDGEADDORDER, b);
            request.getRequestDispatcher("detailsservlet").forward(request, response);
            return;
        }


    }
}
