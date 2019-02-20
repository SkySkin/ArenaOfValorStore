<%@ page import="com.sexteam.util.RegionValue" %>
<%@ page import="com.sexteam.vo.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/16
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品详情</title>
    <link rel="stylesheet" type="text/css" href="res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
    <script src="res/layui/layui.js"></script>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <style type="text/css">
        body {
            font: 14px/150% microsoft yahei, tahoma;
        }

        .clear {
            clear: both
        }

        .RadioStyle input {
            display: none
        }

        .RadioStyle label {
            border: 1px solid #00a4ff;
            padding: 2px 10px 2px 5px;
            line-height: 28px;
            min-width: 80px;
            text-align: center;
            float: left;
            margin-right: 20px;
            border-radius: 4px
        }

        .RadioStyle input:checked + label {
            background: url(${pageContext.request.contextPath}/res/static/img2/ico_checkon.svg) no-repeat right bottom;
            background-size: 21px 21px;
            color: #00a4ff
        }
    </style>
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
            %>
            <c:set var="islogin" value="<%=(attribute!=null)%>"/>
            <%
                if (attribute != null) {
            %>
            <div class="sp-cart">欢迎您:&nbsp;<span><a href="#" style="color: #ff5500"><%=attribute.getU_name()%>&nbsp;&nbsp;&nbsp;&nbsp;<a/></span><span><a
                    href="${pageContext.request.contextPath}/logoutservlet">[注销]</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="sp-cart"><a href="shopcart.jsp">购物车</a><span>2</span></div>
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


<div class="content content-nav-base datails-content">
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
    <div class="data-cont-wrap w1200">
        <div class="crumb">
            <a href="${pageContext.request.contextPath}/initservlet">首页</a>
            <span>></span>
            <a href="${pageContext.request.contextPath}/initservlet">所有商品</a>
            <span>></span>
            <a href="javascript:;">产品详情</a>
        </div>
        <div class="product-intro layui-clear">
            <div class="preview-wrap">
                <c:set var="item" value="<%=request.getAttribute(RegionValue.HERO_DETAILES)%>"></c:set>
                <a href="javascript:;"><img style="width: 402px;height: 402px"
                                            src="${pageContext.request.contextPath}/res/static/img2/${item.c_imag}"></a>
            </div>
            <div class="itemInfo-wrap">
                <div class="itemInfo">
                    <div class="title">
                        <h4>${item.c_name} / ${item.c_place} / ${item.c_describe} </h4>
                        <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
                    </div>
                    <div class="summary">
                        <p class="reference"><span>参考价</span>
                            <del>￥${item.c_proce+666}0</del>
                        </p>
                        <p class="activity"><span>活动价</span><strong class="price"><i>￥</i>${item.c_proce}0</strong>
                        </p>
                        <p class="address-box"><span>库&nbsp;&nbsp;&nbsp;&nbsp;存</span><strong class="address">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.c_count}&nbsp;&nbsp;[件]</strong>
                        </p>
                    </div>
                    <div class="choose-attrs">
                        <%--<div class="color layui-clear"><span class="title">皮&nbsp;&nbsp;&nbsp;&nbsp;肤</span> <div class="color-cont"><span class="btn" ><input type="radio" name="pifu" value="原始" class="btn"/>原始</span> <span class="btn"><input type="radio" name="pifu" value="随机"/>随机</span></div></div>--%>
                        <div class="color layui-clear">
                            <span class="title">皮&nbsp;&nbsp;&nbsp;&nbsp;肤</span>
                            <div class="RadioStyle">
                                <div class="Block PaddingL">
                                    <input type="radio" name="heroskin" id="model1"  value="经典" checked="checked">
                                    <label for="model1">经典</label>
                                    <input type="radio" name="heroskin" id="model2" value="随机">
                                    <label for="model2">随机</label>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span>
                            <div class="number-cont">
                                <span class="cut btn">-</span>
                                <input
                                    onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}if(this.value>${item.c_count}){this.value=${item.c_count}}if(this.value==0&&${item.c_count}>0){this.value=1}"
                                    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                    maxlength="4" type="" name="" value="1" id="shopcount">
                                <span class="add btn">+</span>
                            </div>
                        </div>
                    </div>
                    <div class="choose-btns">

                        <a id="nowbuy" href="javascript:;">
                            <button class="layui-btn layui-btn-primary purchase-btn">
                                <span style="color: #333">立刻购买</span>
                            </button>
                        </a>
                        <a id="joincat" href="javascript:;">
                        <button class="layui-btn  layui-btn-danger car-btn">
                            <i class="layui-icon layui-icon-cart-simple"></i>
                            <span style="color: #333">加入购物车</span>
                        </button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-clear">
            <div class="aside">
                <h4>热销推荐</h4>
                <div class="item-list">
                    <div class="item">
                        <img src="res/static/img2/1.jpg " height="280px" width="280px">
                        <p><span>李信</span><span class="pric">￥500.00</span></p>
                    </div>
                    <div class="item">
                        <img src="res/static/img2/2.jpg" height="280px" width="280px">
                        <p><span>沈梦溪</span><span class="pric">￥1000.00</span></p>
                    </div>
                    <div class="item">
                        <img src="res/static/img2/3.jpg" height="280px" width="280px">
                        <p><span>伽罗</span><span class="pric">￥1100.00</span></p>
                    </div>
                    <div class="item">
                        <img src="res/static/img2/4.jpg" height="280px" width="280px">
                        <p><span>盾山</span><span class="pric">￥1200.00</span></p>
                    </div>
                    <div class="item">
                        <img src="res/static/img2/5.jpg" height="280px" width="280px">
                        <p><span>司马懿</span><span class="pric">￥1300.00</span></p>
                    </div>
                    <div class="item">
                        <img src="res/static/img2/6.jpg" height="280px" width="280px">
                        <p><span>孙策</span><span class="pric">￥1400.00</span></p>
                    </div>
                </div>
            </div>
            <div class="detail">
                <h4>评论</h4>
                <div class="item">
                    <img src="res/static/img2/haibao.jpg" height="1244px" width="800px">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    // layui.config({
    //     base: 'res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    // }).
    layui.use(['element', 'layer'], function () {
        var $ = layui.jquery;
        var element = layui.element;
        var layer = layui.layer;
        var cur = $('.number-cont input').val();
        $('.number-cont .btn').on('click', function () {
            if ($(this).hasClass('add')) {
                cur++;

            } else {
                if (cur > 1) {
                    cur--;
                }
            }
            $('.number-cont input').val(cur)
        })
        $('#nowbuy').on('click', function () {
            judgeislogin('nowbuy');

        });
        $('#joincat').on('click', function () {
            judgeislogin('joincat');
        });

        function judgeislogin(a) {
            if (${islogin}) {
                if (a == 'nowbuy') {
                    var count = $('#shopcount').val();
                    var heroskin = $('input[name="heroskin"]:checked').val();
                    $(location).attr('href', "${pageContext.request.contextPath}/buyheroservlet?c_id=${item.c_id}&buycount="+count+"&hero_skin="+heroskin+"&JUDGEBUY=no");
                } else {
                    $(location).attr('href', '#');
                }
            } else {
                layer.msg('亲，请先登录哦!');
            }
        }
    });

</script>


</body>
</html>
</html>

