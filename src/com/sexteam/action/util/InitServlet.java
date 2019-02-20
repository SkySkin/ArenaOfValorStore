package com.sexteam.action.util;

import com.sexteam.service.Hero_CommodityService;
import com.sexteam.service.imp.Hero_CommodityServiceImp;
import com.sexteam.util.CommtityUtil;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.Commodity_Type;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "InitServlet", urlPatterns = "/initservlet")
public class InitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Object attribute = request.getServletContext().getAttribute(RegionValue.HERO_COMMODITY_TYPE);
//        if(attribute==null){
        try {
            CommtityUtil.updateCommtity(request, response);
            request.setAttribute(RegionValue.SUB_COMMTITYSERVLE_NAME,"commodityservlet");
            request.getRequestDispatcher("commodity.jsp").forward(request,response);
//            System.out.println("执行了");
            return;
        } catch (SQLException e) {
            e.printStackTrace();
//            }
        }
//        response.sendRedirect("login.jsp");
    }

}
