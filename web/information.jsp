<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/16
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>     <link rel="shortcut icon" href="res/static/img/favicon.ico">     <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
    <script type="text/javascript" src="res/layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
            <div class="login"><a href="login.jsp">登录</a></div>
}0        </div>
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


<div class="content content-nav-base information-content">
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
    <div class="info-list-box">
        <div class="info-list w1200">
            <div class="item-box layui-clear" id="list-cont">
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new1.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new2.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new1.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new2.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new1.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new2.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new1.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new2.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new1.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new2.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new1.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new2.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new1.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new2.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new1.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
                <div class="item">
                    <div class="img">
                        <img src="res/static/img/new2.jpg" alt="">
                    </div>
                    <div class="text">
                        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
                        <p class="data">2016-12-24 16:33:26</p>
                        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
                    </div>
                </div>
            </div>
            <div id="demo0" style="text-align: center;"></div>
        </div>
    </div>
</div>
<!-- 模版引擎导入 -->
<!-- <script type="text/html" id="demo">
  {{# layui.each(d.listCont,function(index,item){}}
  <div class="item">
    <div class="img">
      <img src="../res/img/new1.jpg" alt="">
    </div>
    <div class="text">
      <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
      <p class="data">2016-12-24 16:33:26</p>
      <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
    </div>
  </div>
  {{# })}}
</script> -->
<script>
    layui.config({
        base: 'res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm','laypage'],function(){
        var mm = layui.mm,laypage = layui.laypage;
        laypage.render({
            elem: 'demo0'
            ,count: 100 //数据总数
        });
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
        // 模版引擎导入
        // var html = demo.innerHTML;
        // var listCont = document.getElementById('list-cont');
        //  mm.request({
        //    url: '../json/information.json',
        //    success : function(res){
        //      console.log(res)
        //      listCont.innerHTML = mm.renderHtml(html,res)
        //    },
        //    error: function(res){
        //      console.log(res);
        //    }
        //  })
    });

</script>


</body>
</html>
