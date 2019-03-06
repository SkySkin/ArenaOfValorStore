<%@ page import="com.sexteam.vo.User" %>
<%@ page import="com.sexteam.util.RegionValue" %>
<%@ page import="com.sexteam.service.CarService" %>
<%@ page import="com.sexteam.service.imp.CarServiceImp" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/16
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>     <link rel="shortcut icon" href="res/static/img/favicon.ico">     <meta charset="UTF-8">
    <title>注册</title>
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
            %>
            <c:set var="islogin" value="<%=(attribute!=null)%>"/>
            <%
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
                    <a href="buytoday.jsp">今日团购</a>

                    <a href="about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="login-bg">
        <div class="login-cont w1200">
            <div class="form-box" style="height: 650px">
                <form class="layui-form" action="registerservlet" method="post" enctype="multipart/form-data">
                    <legend>
                        <%
                            String url = request.getContextPath() + "/res/static/img2/1.jpg";
                            String imgpath = (String) request.getAttribute("imgpath");
                            if (request.getAttribute("imgpath") != null) {
                                int i = imgpath.lastIndexOf("\\");
                                url = request.getContextPath() + "/userimg/" + imgpath.substring(i + 1, imgpath.length());
                                System.out.println("url:" + url);
                            }
                        %>
                        <img src="<%=url%>" id="img1">
                        <input type="file" name="file2" id="file1">
                    </legend>
                    <div class="layui-form-item" style="margin-bottom: 0px">
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-username iphone-icon"></i>
                                <input type="tel" name="u_name" id="phone" lay-verify="required|username"
                                       placeholder="请输入账号" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-password iphone-icon"></i>
                                <input type="password" name="u_pwd" lay-verify="required|pass" placeholder="请输入密码"
                                       autocomplete="off" class="layui-input" id="pass">
                            </div>
                        </div>
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-password iphone-icon"></i>
                                <input type="password" lay-verify="required|repass" placeholder="请再次输入密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline" style="background-color: #fff;">
                                <i class="layui-icon layui-icon-male iphone-icon"></i>
                                <div class="layui-input-block" style="margin-left: 40px;">
                                    <input type="radio" name="u_sex" value="男" title="男" checked>
                                    <input type="radio" name="u_sex" value="女" title="女">
                                </div>
                            </div>
                        </div>
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-cellphone iphone-icon"></i>
                                <input type="text" name="u_phone" lay-verify="required|phone" placeholder="请输入电话"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-star iphone-icon"></i>
                                <input type="text" name="u_adds" lay-verify="required" placeholder="请输入地址"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-dialogue iphone-icon"></i>
                                <input type="text" name="u_emall" lay-verify="required|email" placeholder="请输入邮箱"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline veri-code">
                            <div class="layui-input-inline">
                                <input id="pnum" type="text" name="pnum" lay-verify="required" placeholder="请输入验证码"
                                       autocomplete="off" class="layui-input">
                                <img src="${pageContext.request.contextPath}/checkcode?type=reg" id="find"
                                     class="layui-btn" style="margin: 0px;padding: 0px">
                            </div>
                        </div>
                    </div>
                    <div align="center"
                         style="height: 30px;margin-top: 2px;color:darkred;font-size: 22px;margin-bottom: 3px">${requestScope.msg}</div>
                    <div class="layui-form-item login-btn">
                        <div class="layui-input-block" style="padding-top: 0px">
                            <button class="layui-btn" lay-submit="registerservlet" lay-filter="">注册</button>
                        </div>
                    </div>
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
        <p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
    </div>
</div>
<script type="text/javascript">
    layui.config({
        base: 'res/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['jquery', 'form',], function () {
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
            this.src = "${pageContext.request.contextPath}/checkcode?type=reg&" + new Date()
        })
        form.verify({
            repass: function (value) {
//获取密码
                var pass = $("#pass").val();
                if (!new RegExp(pass).test(value)) {
                    return '两次输入的密码不一致';
                }
            }
            ,
            username: function (value, item) { //value：表单的值、item：表单的DOM对象
                if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                    return '用户名不能有特殊字符';
                }
                if (/(^\_)|(\__)|(\_+$)/.test(value)) {
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if (/^\d+\d+\d$/.test(value)) {
                    return '用户名不能全为数字';
                }
            }
            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            ,
            pass: [
                /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格'
            ]
        });
        $(document).ready(function () {
            $("#img1").click(function () {
                $("#file1").click();
                $("#file1").change(function () {
                    var objUrl = getObjectURL(this.files[0]);
                    console.log("objUrl = " + objUrl);
                    if (objUrl) {
                        $("#img1").attr("src", objUrl);
                    }
                });

                function getObjectURL(file) {
                    var url = null;
                    if (window.createObjectURL != undefined) {
                        url = window.createObjectURL(file);
                    } else if (window.URL != undefined) {
                        url = window.URL.createObjectURL(file);
                    }
                    return url;
                }
            });
        });
    })
</script>

</body>
</html>

