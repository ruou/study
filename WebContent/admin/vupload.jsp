<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>实用学生管理系统</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="css/font.css">
        <link rel="stylesheet" href="css/xadmin.css">
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            // 是否开启刷新记忆tab功能
            // var is_remember = false;
        </script>
        <style>
            .form{
              margin-left: 300px;
              margin-top: 150px;
              }
        </style>
    </head>
    <body>
    	<div class="form">
      <button type="button" class="layui-btn" id="test5"><i class="layui-icon"></i>上传mp4格式视频</button>
       </div>
       <div>如要转换格式,请点击<a href="#">这里</a></div>
    </body>
  <script>
  layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  upload.render({
    elem: '#test5'
    ,url: 'VedioServlet?method=addVedio' //改成您自己的上传接口
    ,accept: 'file' //视频
    ,done: function(res){
      //如果上传失败
      if(res.code == 0){
    	  layer.msg('成功');
    	  window.location.href="VedioServlet?method=toaddVedio2";
       }
        //上传成功
        if(res.code > 0){
        	layer.msg('失败');
        }
    }
  });
});

 </script>
</html>