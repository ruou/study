<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>管理员登录界面</title>
  <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
  <meta name="author" content="Vincent Garreau" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link rel="stylesheet" media="screen" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/reset.css"/>
</head>
<body>
<div id="particles-js">
		<div class="login">
			<form method="POST" action="AdminServlet?method=adminLogin">
			<div class="login-top">
				管理员登录
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="images/name.png"/></div>
				<div class="login-center-input">
					<input type="text" name="username" value="" placeholder="请输入您的用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
					<div class="login-center-input-text">用户名</div>
				</div>
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="images//password.png"/></div>
				<div class="login-center-input" id="btn"> 
					<input type="password" name="password" value="" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
					<div class="login-center-input-text">密码</div>
				</div>
			</div>
			<div class="login-button">
				<input type="submit" value="登录" style="background-color: dodgerblue;border: 0px;width: 250px;height: 40px;">
			</div>			
			</form>
		</div>
		<div class="sk-rotating-plane"></div>
</div>
<!-- scripts -->
<script src="js/particles.min.js"></script>
<script src="js/app.js"></script>
<div style="text-align:center;">
</div>
</body>
</html>