package com.sexteam.action;

import com.sexteam.service.CarService;
import com.sexteam.service.imp.CarServiceImp;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DelCarServlete", urlPatterns = "/delcarservlete")
public class DelCarServlete extends HttpServlet {
    private CarService carService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String car_id = request.getParameter("car_id");
        int cid= Integer.parseInt(car_id);
        carService = new CarServiceImp();
//        System.out.println("cid:"+cid);
        boolean b = carService.delCarByCarid(cid);
        if (b) {
            User user=(User)request.getSession().getAttribute(RegionValue.USER_MSG);
            user.setCarcount(carService.getCarCountByU_id(user.getU_id()));
            request.getSession().setAttribute(RegionValue.USER_MSG,user);
            response.getWriter().println(RegionValue.success);
            return;
        }
        response.getWriter().println(RegionValue.error);
        return;
    }
}
