<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加用户</title>
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>
<body class="ContentBody">
<form name="userForm" method="post" action="AdminServlet?method=addUser" onSubmit="return userValidate();">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >用户录入</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="width:80%" align="center">
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>用户录入</legend>
				<table width="100%" border="0" cellpadding="2" cellspacing="1" style="width:100%">
					<tr>
						<td nowrap align="right" width="45%">用户名：</td>
						<td width="60%">
						<input name="username" type="text" class="input" id="username" required autofocus/>
						<span class="red">*</span></td>
					</tr>
					<tr>
						<td nowrap align="right" width="45%">登陆密码：</td>
				   		<td width="80%">
				   		<input name="password" type="text" class="input" id="password" required/>
				      	<span class="red">*</span>
				     </tr>
				     <tr>
				   		<td nowrap align="right" width="45%">邮箱：</td>
				   		<td width="80%">
				   		<input name="mail" type="text" class="input" id="username" required/>
				      	<span class="red">*</span>
				     </tr>
				</table>
			 		 <br />
				</fieldset>
				</TD>		
		</TR>
		</TABLE>
	 </td>
  </tr>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input name="提交" type="submit" class="button" value="保存"/>　
			<input name="重置" type="reset" class="button" value="重置"/></TD>
		</TR>
		</TABLE>
</div>
</form>
</body>
</html>