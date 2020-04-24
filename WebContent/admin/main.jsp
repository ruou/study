<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pojo.Admin" %>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>在线学习系统</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="css/font.css">
        <link rel="stylesheet" href="css/xadmin.css">
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="js/xadmin.js"></script>
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <%
        Admin admin=new Admin();
        admin=(Admin)request.getSession().getAttribute("admin");
        %>
        <div class="container">
            <div class="logo">
                <a href="#">在线学习系统-管理员</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;"><%=admin.getUsername()%></a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a href="AdminServlet?method=adminLogout">退出</a></dd>
                    </dl>
                </li>
               
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="视频">&#xe6b8;</i>
                            <cite>视频</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('上传视频','VedioServlet?method=tovupload')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>上传视频</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('用户视频','VedioServlet?method=listVedio')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>用户视频</cite></a>
                            </li>
                             <li>
                                <a onclick="xadmin.add_tab('查找视频','VedioServlet?method=tofindVedio')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>查找视频</cite></a>
                            </li>
                        </ul>
                    </li>
                     <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="文档">&#xe6b8;</i>
                            <cite>文档</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                         	<li>
                                <a onclick="xadmin.add_tab('java','DocumentServlet?method=tolistjava')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>java</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="下载">&#xe6b8;</i>
                            <cite>下载</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                         	<li>
                                <a onclick="xadmin.add_tab('软件','DownloadServlet?method=toprogram')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>软件</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="小组">&#xe6b8;</i>
                            <cite>小组</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('新增管理员','AdminServlet?method=toaddAdmin')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>新增管理员</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('管理员信息','AdminServlet?method=toAllAdmin')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员信息</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('新增用户','AdminServlet?method=toaddUser')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>新增用户</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('用户信息','AdminServlet?method=toAllUser')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>用户信息</cite></a>
                            </li>
                        </ul>
                    </li>
                   
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='admin/welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        <script>//百度统计可去掉
            var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>