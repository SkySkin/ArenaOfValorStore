package com.sexteam.action;

import com.sexteam.service.CarService;
import com.sexteam.service.imp.CarServiceImp;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.Car;
import com.sexteam.vo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllCarServlet", urlPatterns = "/allcarservlet")
public class AllCarServlet extends HttpServlet {
    private CarService carService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        carService = new CarServiceImp();
        User attribute = (User) request.getSession().getAttribute(RegionValue.USER_MSG);
        if (attribute != null) {
            List<Car> list = carService.getAllCars(attribute.getU_id());
            request.setAttribute(RegionValue.HERO_ORDERSALL, list);
//            System.out.println(list);
            request.getRequestDispatcher("shopcart.jsp").forward(request, response);
        } else {
            response.sendRedirect("initservlet");
            return;
        }

    }
}
