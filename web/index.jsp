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
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
    <script src="res/layui/layui.js"></script>
  </head>
  <body style="height: 100%">
  <a href="javascript:;" id="isa">dsad</a>



  <!-- <script src="../res/layui/layui.js" charset="utf-8"></script> -->
  <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
  <script>
      layui.use(['element', 'layer'], function(){
          var $ = layui.jquery;
          var element = layui.element;
          var layer = layui.layer;
          layer.msg('sdas')
          $('#isa').on('click',function(){
              layer.msg(123)
          })

      });
  </script>
  </body>
</html>
