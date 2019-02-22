<%@ page import="com.sexteam.util.RegionValue" %>
<%@ page import="com.sexteam.vo.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
    <script type="text/javascript" src="res/layui/layui.js"></script>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
        <div class="headerCon">
            <h1 class="mallLogo">
                <a href="${pageContext.request.contextPath}/initservlet" title="王者商城">
                    <img src="res/static/img/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="" class="layui-form" novalidate>
                    <input type="text" name="title" required lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
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
                    <a href="information.jsp">王者资讯</a>
                    <a href="about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-bg w1200">
        <h3>夏季清仓</h3>
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
                    操作
                </div>
            </div>
        </div>
        <div class="OrderList">
            <div class="order-content" id="list-cont">
                <c:forEach var="heroorders"
                           items="<%=request.getAttribute(RegionValue.HERO_ORDERSALL)%>"
                           varStatus="vars">
                <c:set var="item" value="${heroorders.hero_commodity}"></c:set>
                <ul class="item-content layui-clear">
                    <li class="th th-chk">
                    </li>
                    <li class="th th-item">
                        <div class="item-cont">
                            <a href="${pageContext.request.contextPath}/hrefcarservlet?car_id=${heroorders.car_id}"><img src="${pageContext.request.contextPath}/res/static/img2/${item.c_imag}" alt=""></a>
                            <div class="text">
                                <div class="title">${item.c_name}</div>
                                <p><span>${heroorders.hero_skin}</span>
                                    <span>${item.c_describe}</span><br><br>
                                    <span>${heroorders.createtime}</span>
                                </p>
                            </div>
                        </div>
                    </li>
                    <li class="th th-price">
                        <span class="th-su">${item.c_proce}0</span>
                    </li>
                    <li class="th th-amount">
                        <div class="box-btn layui-clear">
                            <div class="less layui-btn">-</div>
                            <input class="input-hidden" type="hidden" name="" value="${heroorders.car_id}">
                            <input class="Quantity-input" type="" name="" value="${heroorders.buycount}" disabled="disabled">
                            <div class="add layui-btn">+</div>
                        </div>
                    </li>
                    <li class="th th-sum">
                        <span class="sum">${item.c_proce*heroorders.buycount}0</span>
                    </li>
                    <li class="th th-op">
                        <span class="dele-btn">删除</span>
                    </li>
                </ul>
                </c:forEach>
            </div>
        </div>


        <!-- 模版导入数据 -->
        <!-- <script type="text/html" id="demo">
          {{# layui.each(d.infoList,function(index,item){}}
            <ul class="item-content layui-clear">
              <li class="th th-chk">
                <div class="select-all">
                  <div class="cart-checkbox">
                    <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                  </div>
                </div>
              </li>
              <li class="th th-item">
                <div class="item-cont">
                  <a href="javascript:;"><img src="res/static/img/paging_img1.jpg" alt=""></a>
                  <div class="text">
                    <div class="title">宝宝T恤棉质小衫</div>
                    <p><span>粉色</span>  <span>130</span>cm</p>
                  </div>
                </div>
              </li>
              <li class="th th-price">
                <span class="th-su">189.00</span>
              </li>
              <li class="th th-amount">
                <div class="box-btn layui-clear">
                  <div class="less layui-btn">-</div>
                  <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                  <div class="add layui-btn">+</div>
                </div>
              </li>
              <li class="th th-sum">
                <span class="sum">189.00</span>
              </li>
              <li class="th th-op">
                <span class="dele-btn">删除</span>
              </li>
            </ul>
          {{# });}}
        </script> -->


        <div class="FloatBarHolder layui-clear">
            <div class="th Settlement">
                <button class="layui-btn" id="nowcheck">主页</button>
            </div>
            <div class="th total">
                <p><span class="pieces-total"> </span></p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    layui.config({
        base: 'res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'jquery', 'element', 'car'], function () {
        var mm = layui.mm, $ = layui.$, element = layui.element, car = layui.car;

        // 模版导入数据
        // var html = demo.innerHTML,
        // listCont = document.getElementById('list-cont');
        // mm.request({
        //   url: '../json/shopcart.json',
        //   success : function(res){
        //     listCont.innerHTML = mm.renderHtml(html,res)
        //     element.render();
        //     car.init()
        //   },
        //   error: function(res){
        //     console.log(res);
        //   }
        // })
        //
        $('#nowcheck').on('click', function () {
            // layer.msg('修改失败', {time:500,icon: 1});
            $(location).attr('href', "${pageContext.request.contextPath}/initservlet");

        });
        function fun1(){

        }
        car.init();


    });
</script>
</body>
</html>