package com.sexteam.action;

import com.sexteam.service.Hero_ordersService;
import com.sexteam.service.imp.Hero_ordersServiceImp;
import com.sexteam.util.RegionValue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "OrderCheckOutServlet",urlPatterns = "/ordercheckoutservlet")
public class OrderCheckOutServlet extends HttpServlet {
    private Hero_ordersService hero_ordersService;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        Integer o_id = Integer.parseInt(request.getParameter("o_id"));
        hero_ordersService = new Hero_ordersServiceImp();
        boolean b=hero_ordersService.updateOrderIsPay(o_id);
        if(b){
            request.getSession().setAttribute("checkoutjudge","1");
            request.getSession().setAttribute(RegionValue.ORDERCHECKOUT,"success");
            response.sendRedirect("initservlet");
        }else {
            request.getSession().setAttribute("checkoutjudge","1");
            request.getSession().setAttribute(RegionValue.ORDERCHECKOUT,"error");
            response.sendRedirect("initservlet");
        }



    }
}
