package com.sexteam.action;

import com.sexteam.service.CarService;
import com.sexteam.service.imp.CarServiceImp;
import com.sexteam.util.RegionValue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateCarServlet",urlPatterns = "/updatecarservlet")
public class UpdateCarServlet extends HttpServlet {
    private CarService carService;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String car_id = request.getParameter("car_id");
        String buycount = request.getParameter("buycount");
        carService=new CarServiceImp();
        int cid= Integer.parseInt(car_id);
        int count= Integer.parseInt(buycount);
//        System.out.println("cid:"+cid+"--count:"+count);
        boolean b = carService.updateCarForCountByCid(cid,count);
        if(b){
//            System.out.println(true);
            response.getWriter().println(RegionValue.success);
            return;
        }
        System.out.println(false);
        response.getWriter().println(RegionValue.error);
        return;
    }
}
