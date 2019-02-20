<%@ page import="com.sexteam.util.RegionValue" %>
<%@ page import="com.sexteam.vo.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/16
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>王者商城</title>
    <link rel="stylesheet" type="text/css" href="res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
    <script type="text/javascript" src="res/layui/layui.js"></script>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <style>
        ul.pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
        }

        ul.pagination li {
            display: inline;
        }

        ul.pagination li a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
        }

        .pagination li:first-child a {
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }

        .pagination li:last-child a {
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        ul.pagination li a.active {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
        }

        ul.pagination li a:hover:not(.active) {
            background-color: #ddd;
        }
    </style>
</head>
<body style="height: 100%">

<div class="site-nav-bg" style="position: fixed;z-index: 1030;width: 100%">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="">首页</a>
        </p>
        <div class="sn-quick-menu">
            <%
                User attribute = (User) request.getSession().getAttribute(RegionValue.USER_MSG);
                if (attribute != null) {
            %>
            <div class="sp-cart">欢迎您:&nbsp;<span><a href="#" style="color: #ff5500"><%=attribute.getU_name()%>&nbsp;&nbsp;&nbsp;&nbsp;<a/></span><span><a href="${pageContext.request.contextPath}/logoutservlet">[注销]</a></span>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="sp-cart"><a href="shopcart.jsp">购物车</a><span>[2]</span></div>
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


<div class="content content-nav-base commodity-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="${pageContext.request.contextPath}/initservlet" class="active">所有商品</a>
                    <a href="buytoday.jsp">今日团购</a>

                    <a href="about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="commod-cont-wrap">
        <div class="commod-cont w1200 layui-clear">
            <div class="left-nav">
                <div class="title">所有分类</div>
                <div class="list-box">
                    <c:set var="commditytype" value="<%=request.getAttribute(RegionValue.HERO_TYPE)%>"></c:set>

                    <c:forEach var="type"
                               items="<%=request.getServletContext().getAttribute(RegionValue.HERO_COMMODITY_TYPE)%>"
                               varStatus="vars">
                        <dl>

                            <c:set var="listcomm" value="${type.commodityList}"></c:set>
                            <c:if test="${commditytype.type_id==type.type_id}">
                                <dt class="" off="">${type.type_name}</dt>
                            <dd class="layui-bg-cyan"><a
                                    href="${pageContext.request.contextPath}/commtitytypeservlet?type_id=${type.type_id}&type_name=${type.type_name}">右侧展示</a>
                            </dd>
                                <c:forEach var="comm" items="${listcomm}">
                                    <dd><a href="${pageContext.request.contextPath}/detailsservlet?c_id=${comm.c_id}">${comm.c_name}</a></dd>
                                </c:forEach>
                            </c:if>
                            <c:if test="${commditytype.type_id!=type.type_id}">
                                <dt class="active" off="true">${type.type_name}</dt>
                                <dd style="display: none;" class="layui-bg-cyan"><a
                                        href="${pageContext.request.contextPath}/commtitytypeservlet?type_id=${type.type_id}&type_name=${type.type_name}">右侧展示</a>
                                </dd>
                                <c:forEach var="comm" items="${listcomm}">
                                    <dd style="display: none;"><a style="" href="${pageContext.request.contextPath}/detailsservlet?c_id=${comm.c_id}">${comm.c_name}</a></dd>
                                </c:forEach>
                            </c:if>

                        </dl>
                    </c:forEach>
                </div>
            </div>
            <div class="right-cont-wrap">
                <div class="right-cont">
                    <div class="sort layui-clear">
                        <a class="active" href="javascript:;" event='volume'>销量</a>
                        <a href="javascript:;" event='price'>价格</a>
                        <a href="javascript:;" event='newprod'>新品</a>
                        <a href="javascript:;" event='collection'>收藏</a>
                    </div>
                    <%--商品展示--%>
                    <c:set var="pagebean"
                           value="<%=request.getAttribute(RegionValue.HERO_COMMODITY_INITPAGE)%>"></c:set>
                    <c:set var="listcomm" value="${pagebean.list}"></c:set>
                    <div class="prod-number">
                        <c:if test="${commditytype.type_name!=null}">
                            <span>${commditytype.type_name}: 此页共[${fn:length(pagebean.list)}]个英雄</span>
                        </c:if>
                        <c:if test="${commditytype.type_name==null}">
                            <span>此页共[${fn:length(pagebean.list)}]个英雄</span>
                        </c:if>

                    </div>
                    <%--<%=request.getServletContext().getAttribute(RegionValue.HERO_COMMODITY_INITPAGE)%>--%>
                    <%--${applicationScope.HERO_COMMODITY_INITPAGE}--%>
                    <div class="cont-list layui-clear" id="list-cont">

                        <c:forEach var="comm" items="${listcomm}">
                            <div class="item">
                                <div class="img">
                                    <a href="${pageContext.request.contextPath}/detailsservlet?c_id=${comm.c_id}"><img
                                            src="${pageContext.request.contextPath}/res/static/img2/${comm.c_imag}"
                                            width="280px" height="280px"></a>
                                </div>
                                <div class="text">
                                    <p class="title">${comm.c_name} / ${comm.c_describe}</p>
                                    <p class="price">
                                        <span class="pri">${comm.c_proce}</span>
                                        <span class="nub">${comm.c_sales}付款</span>
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div style="text-align: center;">
                        <%--分页--%>
                        <ul class="pagination">
                            <c:if test="${pagebean.pageNumber!=1}">
                                <li><a class="active"
                                       href="${pageContext.request.contextPath}/<%=request.getAttribute(RegionValue.SUB_COMMTITYSERVLE_NAME)%>?pageNumber=1&type_id=${listcomm[0].type_id}">首页</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/<%=request.getAttribute(RegionValue.SUB_COMMTITYSERVLE_NAME)%>?pageNumber=${pagebean.pageNumber-1}&type_id=${listcomm[0].type_id}">上一页</a>
                                </li>

                            </c:if>
                            <c:if test="${pagebean.pageNumber==1}">
                                <li><a class="layui-laypage-prev layui-disabled">首页</a></li>
                                <li><a class="layui-laypage-prev layui-disabled">上一页</a></li>

                            </c:if>

                            <c:forEach begin="${pagebean.start}" end="${pagebean.end}" step="1" var="i">
                                <c:if test="${pagebean.pageNumber==i}">
                                    <li><a class="active">${i}</a></li>
                                </c:if>
                                <c:if test="${pagebean.pageNumber!=i}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/<%=request.getAttribute(RegionValue.SUB_COMMTITYSERVLE_NAME)%>?pageNumber=${i}&type_id=${listcomm[0].type_id}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${pagebean.pageNumber!=pagebean.totalPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/<%=request.getAttribute(RegionValue.SUB_COMMTITYSERVLE_NAME)%>?pageNumber=${pagebean.pageNumber+1}&type_id=${listcomm[0].type_id}">下一页</a>
                                </li>
                                <li><a class="active"
                                       href="${pageContext.request.contextPath}/<%=request.getAttribute(RegionValue.SUB_COMMTITYSERVLE_NAME)%>?pageNumber=${pagebean.totalPage}&type_id=${listcomm[0].type_id}">尾页</a>
                                </li>
                            </c:if>
                            <c:if test="${pagebean.pageNumber==pagebean.totalPage}">
                                <li><a class="layui-laypage-prev layui-disabled">下一页</a></li>
                                <li><a class="layui-laypage-prev layui-disabled">尾页</a></li>
                            </c:if>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    layui.config({
        base: 'res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'laypage', 'jquery'], function () {
        var laypage = layui.laypage, $ = layui.$,
            mm = layui.mm;
        laypage.render({
            elem: 'demo0'
            , count: 100 //数据总数
        });


        // 模版引擎导入
        //  var html = demo.innerHTML;
        //  var listCont = document.getElementById('list-cont');
        //  // console.log(layui.router("#/about.jsp"))
        // mm.request({
        //     url: '../json/commodity.json',
        //     success : function(res){
        //       console.log(res)
        //       listCont.innerHTML = mm.renderHtml(html,res)
        //     },
        //     error: function(res){
        //       console.log(res);
        //     }
        //   })

        $('.sort a').on('click', function () {
            $(this).addClass('active').siblings().removeClass('active');
        })
        $('.list-box dt').on('click', function () {
            if ($(this).attr('off')) {
                $(this).removeClass('active').siblings('dd').show()
                $(this).attr('off', '')
            } else {
                $(this).addClass('active').siblings('dd').hide()
                $(this).attr('off', true)
            }
        })

    });
</script>


</body>
</html>
