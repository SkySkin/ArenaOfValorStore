package com.sexteam.action;

import com.sexteam.service.UserService;
import com.sexteam.service.imp.UserServeiceImp;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet(name = "LoginServlet",urlPatterns = "/loginservlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //请求页面的编码
        request.setCharacterEncoding("utf-8");
        //判断验证码
        String pnum = request.getParameter("pnum");
        String reg = (String) request.getSession().getAttribute("login");

        if (!pnum.equalsIgnoreCase(reg)) {
            request.setAttribute("msg", "验证码错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        User user = new User();
        Map<String, String[]> parameterMap = request.getParameterMap();
        try {
            BeanUtils.populate(user,parameterMap);
            UserService us = new UserServeiceImp();
//            System.out.println(user);
            User user1 = us.userLogin(user);
//            System.out.println(user1);
            if(user1!=null){
                //表示登录成功
                request.getSession().setAttribute(RegionValue.USER_MSG,user1);
                response.sendRedirect("initservlet");
                return;

            }else {//登录失败
                request.setAttribute("msg", "账号或密码错误");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            request.setAttribute("msg", "登录失败");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

    }
}
