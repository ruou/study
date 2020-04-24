<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>java网上商城项目系列</title>
</head>
<body>
    <h3 align="center">管理员</h3>
    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
    <tr class="CTitle" >
            <td height="22" colspan="8" align="center" style="font-size:16px">管理员</td>
        </tr>
        <tr bgcolor="#EEEEEE">
            <td width="40%" align="center" height="30">用户名</td>
            <td width="60%" align="center" >操作</td>
        </tr>
        <%
        List list=(List)request.getAttribute("listadmin");
		if(list!=null&&list.size()>0){
		Iterator it = list.iterator();
	   	while (it.hasNext()) {
			Admin admin = (Admin) it.next();
		%>
        <tr bgcolor="#FFFFFF">
            <td height="22" align="center" ><%=admin.getUsername()%></td>
            <td height="22" align="center" >
            <form action="AdminServlet?method=deleteAdmin&username=<%=admin.getUsername()%>" method="post">
            	<input type="submit" value="删除"> 
            </form>
			</td>
        </tr>
        <%}
	   	}else{
	   	%>
	   	<tr>
            <td height="22" colspan="7" align="center" >对不起，暂时没有成员信息！！！</td>
        </tr>
        <%
        }
		%>
    </table>
</html>