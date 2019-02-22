package com.sexteam.action;

import com.sexteam.service.Hero_CommodityService;
import com.sexteam.service.imp.Hero_CommodityServiceImp;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.Hero_Commodity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DetailsServlet",urlPatterns = "/detailsservlet")
public class DetailsServlet extends HttpServlet {
    private Hero_CommodityService hero_commodityService;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        Object attribute = request.getAttribute(RegionValue.HERO_ORDERS_JUDGE);
        String c_id = request.getParameter("c_id");
        String judge =  request.getParameter(RegionValue.JUDGEBUY);
        if(c_id!=null){
            hero_commodityService= new Hero_CommodityServiceImp();
            Hero_Commodity hero_commdityByC_id = hero_commodityService.getHero_CommdityByC_id(c_id);
            request.setAttribute(RegionValue.HERO_DETAILES,hero_commdityByC_id);
            if(attribute!=null){
                if(judge!=null&&judge.equals("ok")){
//                    System.out.println("judge:"+judge);
                        boolean b = (boolean) request.getAttribute(RegionValue.JUDGEADDORDER);
                        request.setAttribute(RegionValue.JUDGEADDORDER,b);
                        if(!b){
//                            request.getRequestDispatcher("payprice.jsp").forward(request,response);
//                            response.sendRedirect("payprice.jsp");
//                        }else {
                            request.getRequestDispatcher("detailsjudge.jsp").forward(request,response);
                        }
                        return;
                }else {
                    request.getRequestDispatcher("detailsjudge.jsp").forward(request,response);
                    return;
                }
            }else {
                request.getRequestDispatcher("details.jsp").forward(request, response);
                return;
            }
        }else {
            response.sendRedirect("initservlet");
            return;
        }

    }
}
