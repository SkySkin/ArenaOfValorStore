<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/16
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
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
  <form class="layui-form" action="">
  <div class="layui-inline">
      <label class="layui-form-label">搜索选择框</label>
      <div class="layui-input-inline">
          <select name="modules" lay-verify="required" lay-search="">
              <option value="">直接选择或搜索选择</option>
              <option value="1">layer</option>
              <option value="2">form</option>
              <option value="3">layim</option>
              <option value="4">element</option>
              <option value="5">laytpl</option>
              <option value="6">upload</option>
              <option value="7">laydate</option>
              <option value="8">laypage</option>
              <option value="9">flow</option>
              <option value="10">util</option>
              <option value="11">code</option>
              <option value="12">tree</option>
              <option value="13">layedit</option>
              <option value="14">nav</option>
              <option value="15">tab</option>
              <option value="16">table</option>
              <option value="17">select</option>
              <option value="18">checkbox</option>
              <option value="19">switch</option>
              <option value="20">radio</option>
          </select>
      </div>
  </div>
  </form>


  <script>
      layui.use(['form', 'layedit', 'laydate'], function() {
          var form = layui.form
              , layer = layui.layer
              , layedit = layui.layedit
              , laydate = layui.laydate;
      });
  </script>
  </body>
</html>
