package com.sexteam.action.util;

import com.sexteam.service.CarService;
import com.sexteam.service.imp.CarServiceImp;
import com.sexteam.vo.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "HrefCarServlet",urlPatterns = "/hrefcarservlet")
public class HrefCarServlet extends HttpServlet {
    private CarService carService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
//        ${pageContext.request.contextPath}/buyheroservlet?c_id=${item.c_id}&buycount=${heroorders.buycount}&hero_skin=${heroorders.hero_skin}&JUDGEBUY=no
        String car_id = request.getParameter("car_id");
        carService= new CarServiceImp();
        Car car = carService.getCarByCid(Integer.parseInt(car_id));
        if(car!=null){
            System.out.println(car);
            String hero_skin =URLEncoder.encode(car.getHero_skin(),"UTF-8");
            response.sendRedirect("buyheroservlet?c_id="+car.getHero_commodity().getC_id()+"&buycount="+car.getBuycount()+"&hero_skin="+hero_skin+"&JUDGEBUY=no");
            return;
        }
        response.sendRedirect("allcarservlet");
        return;

    }
}
