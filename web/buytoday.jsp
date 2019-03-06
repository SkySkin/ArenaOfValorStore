<%@ page import="com.sexteam.util.RegionValue" %>
<%@ page import="com.sexteam.vo.User" %>
<%@ page import="com.sexteam.service.CarService" %>
<%@ page import="com.sexteam.service.imp.CarServiceImp" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/16
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="res/static/img/favicon.ico">
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
    <script type="text/javascript" src="res/layui/layui.js"></script>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<style>
    div.suggest {
        width: 437px;
        background-color: #fff;
        border: 1px solid #999;
        font-size: 18px;
        overflow: hidden;
        display: none;
    }

    .suggest ul li {
        width: 522px;
        color: #000;
        font: 14px arial;
        line-height: 25px;
        height: 25px;
        padding: 0 8px;
        position: relative;
        cursor: default;
        display: list-item;
    }

    .suggest ul li:hover {
        background: #f0f0f0;
        cursor: pointer;
    }

</style>
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

                if (attribute != null) {

            %>
            <div class="sp-cart">欢迎您:&nbsp;<span><a href="#" style="color: #ff5500"><%=attribute.getU_name()%>&nbsp;&nbsp;&nbsp;&nbsp;<a/></span><span><a
                    href="${pageContext.request.contextPath}/logoutservlet">[注销]</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="sp-cart"><a
                    href="${pageContext.request.contextPath}/allcarservlet">购物车</a><span>[<%=attribute.getCarcount()%>]</span>
            </div>
            <div class="sp-cart"><a href="${pageContext.request.contextPath}/allordersservlet"><span>我的订单</span></a>
            </div>
            <%
            } else {
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
                <form  id="from-search" novalidate onsubmit="return check();">
                    <input type="text" id="search-input"  required lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="请输入 名称 / 分类">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                    <div id="search-from-db" type="0" class="suggest" style="position: absolute;top: 40px;left: -2px">
                        <ul id="search-result">
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base buytoday-content">
    <div id="list-cont">
        <div class="main-nav">
            <div class="inner-cont0">
                <div class="inner-cont1 w1200">
                    <div class="inner-cont2">
                        <a href="${pageContext.request.contextPath}/initservlet">所有商品</a>
                        <a href="buytoday.jsp" class="active">今日团购</a>

                        <a href="about.jsp">关于我们</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="banner-box">
            <div class="banner"></div>
        </div>
        <div class="product-list-box">
            <div class="product-list w1200">
                <div class="tab-title">
                    <a href="javascript:;" class="active tuang" data-content="tuangou">今日团购</a>
                    <a href="javascript:;" data-content="yukao">明日预告</a>
                </div>
                <div class="list-cont" cont='tuangou'>
                    <div class="item-box layui-clear">
                        <div class="item">
                            <img src="res/static/img/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div id="demo0" style="text-align: center;"></div>
                </div>
                <div class="list-cont layui-hide" cont='yukao'>
                    <div class="item-box layui-clear">
                        <div class="item">
                            <img src="res/static/img/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img1.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img2.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img3.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="res/static/img/tuan_img4.jpg" alt="">
                            <div class="text-box">
                                <p class="title">宝宝专用硅胶环保饭碗四套+调羹+筷子自助学吃饭套装</p>
                                <p class="plic">
                                    <span class="ciur-pic">￥100.00</span>
                                    <span class="Ori-pic">￥208.00</span>
                                    <span class="discount">5折</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <%--<div id="demo0" style="text-align: center;"></div>--%>
                </div>
            </div>
        </div>
        <div class="footer-wrap">
            <div class="footer w1200">
                <div class="title">
                    <h3>团购销量榜</h3>
                </div>
                <div class="list-box layui-clear" id="footerList">
                    <div class="item">
                        <img src="res/static/img/25.jpg" alt="">
                        <div class="text">
                            <div class="right-title-number">1</div>
                            <div class="commod">
                                <p>宝宝打底衣棉麻透气不起球白色多色可选</p>
                                <span>￥100.00</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="res/static/img/23.jpg" alt="">
                        <div class="text">
                            <div class="right-title-number">1</div>
                            <div class="commod">
                                <p>宝宝打底衣棉麻透气不起球白色多色可选</p>
                                <span>￥100.00</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="res/static/img/28.jpg" alt="">
                        <div class="text">
                            <div class="right-title-number">1</div>
                            <div class="commod">
                                <p>宝宝打底衣棉麻透气不起球白色多色可选</p>
                                <span>￥100.00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 模版引擎导入 -->
<!--  <script type="text/html" id="demo">
   <div class="main-nav">
     <div class="inner-cont0">
       <div class="inner-cont1 w1200">
         <div class="inner-cont2">
           <a href="${pageContext.request.contextPath}/initservlet">所有商品</a>
           <a href="buytoday.jsp" class="active">今日团购</a>

           <a href="about.jsp">关于我们</a>
         </div>
       </div>
     </div>
   </div>
   <div class="banner-box">
     <div class="banner"></div>
   </div>
   <div class="product-list-box">
     <div class="product-list w1200">
       <div class="tab-title">
         <a href="javascript:;" class="active tuang">今日团购</a>
         <a href="javascript:;">明日预告</a>
       </div>
       <div class="list-cont">
         <div class="item-box layui-clear">
             {{# layui.each(d.productList,function(index,item){}}
             <div class="item">
               <img src="{{item.img}}" alt="">
               <div class="text-box">
                 <p class="title">{{item.title}}</p>
                 <p class="plic">
                   <span class="ciur-pic">{{item.ciurPic}}</span>
                   <span class="Ori-pic">{{item.OriPic}}</span>
                   <span class="discount">{{item.discount}}</span>
                 </p>
               </div>
             </div>
             {{#})}}
         </div>
        <div id="demo0" style="text-align: center;"></div>
       </div>
     </div>
   </div>
   <div class="footer-wrap">
     <div class="footer w1200">
       <div class="title">
         <h3>团购销量榜</h3>
       </div>
       <div class="list-box layui-clear" id="footerList">
            {{# layui.each(d.footerList,function(index,item){}}
             <div class="item">
               <img src="{{item.img}}" alt="">
               <div class="text">
                 <div class="right-title-number">1</div>
                 <div class="commod">
                   <p>{{item.title}}</p>
                   <span>{{item.price}}</span>
                 </div>
               </div>
             </div>
             {{# });}}
       </div>
     </div>
   </div>
 </script> -->
<script>

    layui.config({
        base: 'res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'laypage', 'jquery'], function () {
        var laypage = layui.laypage, $ = layui.$;
        mm = layui.mm;
        var msg;
        $('#search-input').focus(function (ev) {
            if ($($('#search-result li')[0]).text() != "") {
                $('#search-from-db').attr("type", "1");
                $('#search-from-db').show();
            }
        });
        $('#from-search').on('click', function (ev) {
            if ($($('#search-result li')[0]).text() != "") {
                $('#search-from-db').attr("type", "1");
                $('#search-from-db').show();
            }
        });
        $('#search-input').bind('keyup', function (a) {
            var length;
            var searchText = $(this).val();
            var html = "";
            var s;
            if (searchText.trim() == "") {
                $('#search-from-db').hide();
                return;
            }
            $.get("${pageContext.request.contextPath}/searchservlet?q=" + searchText + "", function (a) {
                s = a.s;
                msg = a.msg;
                length = s.length;
                var index=0;
                if (length > 0) {
                    for (var i = 0; i < s.length; i++) {
                        html += "<li id=M" + i + ">" + s[i] + "</li>";
                        $('#search-result').html(html);

                    }
                    $('#search-from-db').show();
                }
            }, 'json');

        });
        window.check=function (){
            if (msg[0].type == "c_id") {
                var cid = msg[0].sign;
                var href1 = "${pageContext.request.contextPath}/detailsservlet?c_id=" + cid + "";
                $(location).attr('href', href1);
                return false;
            }
            if (msg[0].type == "type_id") {
                var type_id = msg[0].sign;
                var name = msg[0].name;
                var href2 = "${pageContext.request.contextPath}/commtitytypeservlet?type_id=" + type_id + "&type_name=" + name + "";
                $(location).attr('href', href2);
                return false;
            }

            return false;
        }

        $("#search-result").on('click', 'li', function () {
            var attr = $(this).attr("id");
            var replace = attr.replace('M', "");
            var number = parseInt(replace);
            var actionpath = "";
            if (msg[number].type == "c_id") {
                var cid = msg[number].sign;
                var href = "${pageContext.request.contextPath}/detailsservlet?c_id=" + cid + "";
                $(location).attr('href', href);
                return;
            }
            if (msg[number].type == "type_id") {
                var type_id = msg[number].sign;
                var name = msg[number].name;
                var href = "${pageContext.request.contextPath}/commtitytypeservlet?type_id=" + type_id + "&type_name=" + name + "";
                $(location).attr('href', href);
                return;
            }

        });
        $(document).on('click', function (ev) {
            var attr = $('#search-from-db').attr("type");
            if (attr == "1") {
                $('#search-from-db').attr("type", "0")
                return
            } else {
                $('#search-from-db').attr("type", "0")
                $('#search-from-db').hide();
            }

        });
    });
</script>


</body>
</html>