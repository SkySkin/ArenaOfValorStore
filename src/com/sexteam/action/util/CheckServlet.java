package com.sexteam.action.util;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "CheckServlet", urlPatterns = "/checkcode")
public class CheckServlet  extends HttpServlet {
    public static final String CODE_REG = "reg";
    public static final String CODE_LOGIN = "login";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String type = request.getParameter("type");
        if (type == null) {
            type = CODE_LOGIN;
        } else if (type.equalsIgnoreCase(CODE_REG)) {
            type = CODE_REG;
        } else {
            type = CODE_LOGIN;
        }


        // 设置图片的缓存
        BufferedImage bi = new BufferedImage(120, 36, BufferedImage.TYPE_INT_RGB);

        // 绘图对象
        Graphics graphics = bi.getGraphics();
        Font font=new Font("宋体",Font.BOLD,18);
        Color color = new Color(255, 255, 255,240);
        // 设置图片的背景颜色
        graphics.setColor(color);
        graphics.fillRect(0, 0, 120, 36);

        // 生成随机码
        String codeArr = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

        Random random = new Random();

        StringBuffer sbuf = new StringBuffer();

        for (int i = 0; i < 4; i++) {
            int index = random.nextInt(codeArr.length());
            char c = codeArr.charAt(index);
            sbuf.append(c);
            Color charColor = new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
            graphics.setColor(charColor);
            graphics.setFont(font);
            graphics.drawString(c + "", i * 28 + 3, 23);
        }
        // 输出图片
        ImageIO.write(bi, "png", response.getOutputStream());

        HttpSession session = request.getSession();
        session.setAttribute(type, sbuf.toString());
//        System.out.println("type=" + type + "|code=" + sbuf.toString());
    }


}
