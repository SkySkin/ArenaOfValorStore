<%@ page import="com.sexteam.util.RegionValue" %>
<%@ page import="com.sexteam.vo.User" %>
<%@ page import="com.sexteam.service.CarService" %>
<%@ page import="com.sexteam.service.imp.CarServiceImp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="res/static/img/favicon.ico">
    <meta charset="UTF-8">
    <title>购物车</title>
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
            <div class="sp-cart"><a href="${pageContext.request.contextPath}/allcarservlet">购物车</a><span>[<%=attribute.getCarcount()%>]</span>
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
        <c:set var="item" value="<%=request.getAttribute(RegionValue.HERO_DETAILES)%>"></c:set>
        <c:set var="heroorders" value="<%=request.getAttribute(RegionValue.HERO_ORDERS_JUDGE)%>"></c:set>
        <c:set var="judgeaddorder" value="<%=request.getAttribute(RegionValue.JUDGEADDORDER)%>"></c:set>
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


<div class="content content-nav-base shopcart-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="${pageContext.request.contextPath}/initservlet">所有商品</a>
                    <a href="buytoday.jsp">今日团购</a>
                    <a href="about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-bg w1200">
        <h3 style="color: red   ">订单结算</h3>
        <p>王者英雄、皮肤3折起</p>
    </div>
    <div class="cart w1200">
        <div class="cart-table-th">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="allCheckked" type="hidden" value="true">
                    </div>
                    <label>&nbsp;&nbsp;</label>
                </div>
            </div>
            <div class="th th-item">
                <div class="th-inner">
                    商品
                </div>
            </div>
            <div class="th th-price">
                <div class="th-inner">
                    单价
                </div>
            </div>
            <div class="th th-amount">
                <div class="th-inner">
                    数量
                </div>
            </div>
            <div class="th th-sum">
                <div class="th-inner">
                    小计
                </div>
            </div>
            <div class="th th-op">
                <div class="th-inner">
                    收货地址
                </div>
            </div>
        </div>
        <div class="OrderList">
            <div class="order-content" id="list-cont">
                <ul class="item-content layui-clear">
                    <li class="th th-chk">
                    </li>
                    <li class="th th-item">
                        <div class="item-cont">
                            <a href="javascript:;"><img
                                    src="${pageContext.request.contextPath}/res/static/img2/${item.c_imag}" alt=""></a>
                            <div class="text">
                                <div class="title">${item.c_name}</div>
                                <p><span>${heroorders.hero_skin}</span> <span>${item.c_describe}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="th th-price">
                        <span class="th-su">${item.c_proce}0</span>
                    </li>
                    <li class="th th-amount">
                        <div class="box-btn layui-clear">
                            <div class=" layui-btn"></div>
                            <input class="Quantity-input" disabled="disabled" type="" name=""
                                   value="${heroorders.buycount}" disabled="disabled">
                            <div class=" layui-btn"></div>
                        </div>
                    </li>
                    <li class="th th-sum">
                        <span class="sum">${item.c_proce*heroorders.buycount}0&nbsp;&nbsp;[${heroorders.orderstate}]</span>
                    </li>
                    <li class="th th-op">
                        <span>${heroorders.o_shippingaddress}</span>
                    </li>
                </ul>
            </div>
        </div>


        <div class="FloatBarHolder layui-clear">
            <c:if test="${heroorders.orderstate=='待支付'}">
                <div class="th Settlement">
                    <button class="layui-btn" id="nowcheck">结算</button>
                </div>
                <div class="th total">
                    <p>应付：<span class="pieces-total">${item.c_proce*heroorders.buycount}0</span></p>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script type="text/javascript">
    layui.config({
        base: 'res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'jquery', 'element', 'car'], function () {
        var mm = layui.mm, $ = layui.$, element = layui.element, car = layui.car;
        var layer = layui.layer;
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
        // car.init();
        $('#nowcheck').on('click', function () {
            $(location).attr('href', "${pageContext.request.contextPath}/ordercheckoutservlet?o_id=${heroorders.o_id}");

        });
        $(document).ready(function () {
            var a = ${judgeaddorder}+"";
            if (a == "ok") {

            } else {
                layer.msg('亲，订单生成啦');
            }

        });


    });
</script>
</body>
</html>