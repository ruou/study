<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>搜索视频</title>
  <link rel="stylesheet" href="lib/layui/css/layui.css">
</head>
<body>
  <form action="VedioServlet?method=findVedio" method="POST">
    <div class="layui-form-item" style="margin-top: 200px;margin-left:200px;width: 800px;">
        <label class="layui-form-label">查找</label>
        <div class="layui-input-block">
          <input type="text" name="vname" lay-verify="title" autocomplete="off" placeholder="请输入想看的视频名" class="layui-input" autofocus>
        </div>
        <input type="submit" value="查找" class="layui-btn" style="margin-left: 400px;margin-top: 40px;">
      </div>
    </form>
</body>
</html>