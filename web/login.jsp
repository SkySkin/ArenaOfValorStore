<%@ page import="com.sexteam.util.RegionValue" %>
<%@ page import="com.sexteam.vo.User" %>
<%@ page import="com.sexteam.service.CarService" %>
<%@ page import="com.sexteam.service.imp.CarServiceImp" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/16
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>     <link rel="shortcut icon" href="res/static/img/favicon.ico">     <meta charset="UTF-8">
    <title>登录</title>
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

<div class="site-nav-bg" style="position: fixed;z-index: 1030;width: 100%;">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="#">首页</a>
        </p>
        <div class="sn-quick-menu">
            <%
//                User setuser= new User();
//                setuser.setU_imag("F:\\Program Files\\实训\\Project Resources\\ArenaOfValorStore_ProjectResources\\userimg\\root.jpg");
//                setuser.setU_id(53);
//                setuser.setU_sex("男");
//                setuser.setU_pwd("123456");
//                setuser.setU_phone("15526404517");
//                setuser.setU_emall("1561@sad.dsa");
//                setuser.setU_adds("156das@ads.dsa");
//                setuser.setU_name("root");
//                CarService carService=new CarServiceImp();
//                int count= carService.getCarCountByU_id(setuser.getU_id());
//                setuser.setCarcount(count);
//                request.getSession().setAttribute(RegionValue.USER_MSG,setuser);
                User attribute = (User) request.getSession().getAttribute(RegionValue.USER_MSG);
                if (attribute != null) {
                    //软件结束调试，需要登录时吧上面的和下面注释一样的代码删了，解除下面代码的注释
                    CarService carService=new CarServiceImp();
                    int count= carService.getCarCountByU_id(attribute.getU_id());
                    attribute.setCarcount(count);
                    response.sendRedirect(request.getContextPath() + "/initservlet");
                    return;
                } else {
            %>
            <div class="login"><a href="register.jsp">注册</a></div>
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


<div class="content content-nav-base  login-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="${pageContext.request.contextPath}/initservlet">所有商品</a>
                    <%--target="_blank"--%>
                    <a href="buytoday.jsp">今日团购</a>
                    <a href="about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="login-bg">
        <div class="login-cont w1200">
            <div class="form-box">
                <form class="layui-form" action="loginservlet" method="post">
                    <%
                        String url = request.getContextPath() + "/res/static/img2/1.jpg";
                        String imgpath = (String) request.getAttribute("imgpath");
                        if (request.getAttribute("imgpath") != null) {
                            int i = imgpath.lastIndexOf("\\");
                            url = request.getContextPath() + "/userimg/" + imgpath.substring(i + 1, imgpath.length());
                            System.out.println("url:" + url);
                        }
                    %>
                    <legend>
                        <img src="<%=url%>" id="img1">
                    </legend>
                    <div class="layui-form-item">
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-username iphone-icon"></i>
                                <input type="text" name="u_name" id="phone" lay-verify="required" placeholder="请输入账号"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-password iphone-icon"></i>
                                <input type="password" name="u_pwd" lay-verify="required" placeholder="请输入账号"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline veri-code">
                            <div class="layui-input-inline">
                                <input id="pnum" type="text" name="pnum" lay-verify="required" placeholder="请输入验证码"
                                       autocomplete="off" class="layui-input">
                                <img src="${pageContext.request.contextPath}/checkcode?type=login" id="find"
                                     class="layui-btn" style="margin: 0px;padding: 0px">
                            </div>
                        </div>
                    </div>
                    <div align="center"
                         style="height: 15px;margin-top: 5px;color:darkred;font-size: 22px;margin-bottom: 10px">${requestScope.msg}</div>
                    <div class="layui-form-item login-btn">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="">登录</button>
                        </div>
                    </div>
                    <a href="register.jsp" class="layui-btn">注册</a>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="ng-promise-box">
        <div class="ng-promise w1200">
            <p class="text">
                <a class="icon1" href="javascript:;">7天无理由退换货</a>
                <a class="icon2" href="javascript:;">满99元全场免邮</a>
                <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
            </p>
        </div>
    </div>
    <div class="mod_help w1200">
        <p>
            <a href="javascript:;">关于我们</a>
            <span>|</span>
            <a href="javascript:;">帮助中心</a>
            <span>|</span>
            <a href="javascript:;">售后服务</a>
            <span>|</span>
            <a href="javascript:;">王者资讯</a>
            <span>|</span>
            <a href="javascript:;">关于货源</a>
        </p>
        <p class="coty">王者商城版权所有 &copy; 2012-2020</p>
    </div>
</div>
<script type="text/javascript">
    layui.config({
        base: 'res/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['jquery', 'form','layer'], function () {
        var $ = layui.$,
            form = layui.form,
            layer=layui.layer;
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


        $("#find").click(function () {
            this.src = "${pageContext.request.contextPath}/checkcode?type=login&" + new Date()
        })

    })
</script>

</body>
</html>

