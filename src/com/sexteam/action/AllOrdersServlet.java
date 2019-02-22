package com.sexteam.action;

import com.sexteam.service.Hero_ordersService;
import com.sexteam.service.imp.Hero_ordersServiceImp;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.Hero_OrdersAll;
import com.sexteam.vo.Hero_orders;
import com.sexteam.vo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllOrdersServlet",urlPatterns = "/allordersservlet")
public class AllOrdersServlet extends HttpServlet {
    private Hero_ordersService hero_ordersService;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        User attribute = (User) request.getSession().getAttribute(RegionValue.USER_MSG);
        if(attribute!=null){
            hero_ordersService= new Hero_ordersServiceImp();
            List<Hero_OrdersAll> list=hero_ordersService.getAllOrders(attribute.getU_id());
            request.setAttribute(RegionValue.HERO_ORDERSALL,list);
            request.getRequestDispatcher("allorders.jsp").forward(request,response);
            return;
        }else {
            response.sendRedirect("initservlet");
            return;
        }

    }
}
