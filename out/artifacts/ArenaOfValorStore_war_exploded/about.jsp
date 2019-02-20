<%@ page import="com.sexteam.util.RegionValue" %>
<%@ page import="com.sexteam.vo.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/16
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
    <script type="text/javascript" src="res/layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body style="height: 100%">

<div class="site-nav-bg" style="position: fixed;z-index: 1030;width: 100%">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="${pageContext.request.contextPath}/initservlet">首页</a>
        </p>
        <div class="sn-quick-menu">
            <%
                User attribute = (User) request.getSession().getAttribute(RegionValue.USER_MSG);
                if(attribute!=null){
            %>
            <div class="sp-cart">欢迎您:&nbsp;<span><a href="#" style="color: #ff5500"><%=attribute.getU_name()%>&nbsp;&nbsp;&nbsp;&nbsp;<a/></span><span><a href="${pageContext.request.contextPath}/logoutservlet">[注销]</a></span>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="sp-cart"><a href="shopcart.jsp">购物车</a><span>2</span></div>
            <%
            }else {
            %>
            <div class="login"><a href="login.jsp">登录</a></div>
            <%
                }
            %>
        </div>
    </div>
</div>



<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo">
                <a href="${pageContext.request.contextPath}/initservlet" title="王者商城">
                    <img src="res/static/img/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="" class="layui-form" novalidate>
                    <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base about-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="${pageContext.request.contextPath}/initservlet">所有商品</a>
                    <a href="buytoday.jsp">今日团购</a>

                    <a href="about.jsp"  class="active">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-box">
        <div class="banner"></div>
    </div>
    <div class="brief-content layui-clear w1200">
        <div class="img-box">
            <img src="res/static/img/us_img1.jpg">
            <img class="top" src="res/static/img/us_img2.jpg">
        </div>
        <div class="text">
            <p>无限时空中，时光的洪流汇聚于同一片大陆。机关术与魔道肆虐，让世界面目全非。英雄，那些熟知的名字，不可思议的聚集在一起。抛却了过往荣光，遵循野心与欲望，随心所欲寻求力量，乃至彼此追逐杀戮。
                而在一个又一个传奇的背后，召唤师的身影时隐时现，没错，他们，才是历史真正的创造者，生存或者毁灭，战争，似乎永无止境。</p>
        </div>
    </div>
    <div class="banner-text">
        <div class="w1200">
            <p>无限时空中，时光的洪流汇聚于同一片大陆。机关术与魔道肆虐，让世界面目全非。英雄，那些熟知的名字，不可思议的聚集在一起。抛却了过往荣光，遵循野心与欲望，随心所欲寻求力量，乃至彼此追逐杀戮。
                而在一个又一个传奇的背后，召唤师的身影时隐时现，没错，他们，才是历史真正的创造者，生存或者毁灭，战争，似乎永无止境。</p>
        </div>
    </div>
    <div class="after-sale w1200">
        <h4>配送售后</h4>
        <div class="item-box">
            <div class="item item1">
                <div class="img-box">
                    <img src="res/static/img/us_icon1.png">
                </div>
                <p>7天无理由退换货</p>
            </div>
            <div class="item item2">
                <div class="img-box">
                    <img src="res/static/img/us_icon2.png">
                </div>
                <p>全场满99元顺丰包邮</p>
            </div>
            <div class="item item3">
                <div class="img-box">
                    <img src="res/static/img/us_icon3.png">
                </div>
                <p>优质客服服务</p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    layui.config({
        base: 'res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm'],function(){
        var
            mm = layui.mm;



    });
</script>
</body>
</html>
