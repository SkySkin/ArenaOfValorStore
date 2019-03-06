package com.sexteam.action;

import com.google.gson.Gson;
import com.sexteam.service.Hero_CommodityService;
import com.sexteam.service.imp.Hero_CommodityServiceImp;
import com.sexteam.vo.Commodity_Type;
import com.sexteam.vo.Hero_Commodity;
import com.sexteam.vo.MsgGson;
import com.sexteam.vo.SearchGson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchServlet",urlPatterns = "/searchservlet")
public class SearchServlet extends HttpServlet {
    private Hero_CommodityService hero_commodityService;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String q = request.getParameter("q");
        Gson gson = new Gson();
//        System.out.println("q："+q);
        if(!q.equals("")&&q!=null){
            //先进行商品类型匹配，将要搜索的到数据库中进行类别对比
            MsgGson<SearchGson> msgGson=new MsgGson<>();
            msgGson.setMsg(new ArrayList<>());
            msgGson.setS(new ArrayList<>());
            SearchGson searchGson =null;
            hero_commodityService = new Hero_CommodityServiceImp();
            List<Commodity_Type> list=hero_commodityService.fuzzyQueryForHeroType(q);
            //再匹配商品名称
            List<Hero_Commodity> listhero =hero_commodityService.fuzzyQueryForHeroName(q);
            if(list.size()>0) {
                //通过类别模糊查询到有类别
//                System.out.println("通过类别模糊查询到有类别");
                for (Commodity_Type commodity_type : list) {
//                    System.out.println("list:"+list.toString());
                    searchGson = new SearchGson();
                    searchGson.setName(commodity_type.getType_name());
                    searchGson.setType(commodity_type.getClass().getDeclaredFields()[0].getName());
                    searchGson.setSign(Integer.toString(commodity_type.getType_id()));
                    msgGson.getMsg().add(searchGson);
                    if (msgGson.getMsg().size() > 8) {
                        break;
                    }
                }
//                System.out.println("msgGson.getMsg():"+msgGson.getMsg().toString());
            }
            if(listhero.size()>0){
                //通过类别模糊查询到有商品
//                System.out.println("通过类别模糊查询到有商品");
                for (Hero_Commodity hero_commodity : listhero) {
                    searchGson=new SearchGson();
                    searchGson.setName(hero_commodity.getC_name());
                    searchGson.setType(hero_commodity.getClass().getDeclaredFields()[0].getName());
                    searchGson.setSign(hero_commodity.getC_id());
                    msgGson.getMsg().add(searchGson);
                    if(msgGson.getMsg().size()>8){
                        break;
                    }
                }
            }
            if(msgGson.getMsg().size()>0){
                for (SearchGson searchGson1 : msgGson.getMsg()) {
                    msgGson.getS().add(searchGson1.getName());
                }
                response.getWriter().println(gson.toJson(msgGson));
            }
            return;

        }else {
            return;
        }
    }
}
