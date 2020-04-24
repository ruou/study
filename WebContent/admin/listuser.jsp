<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="pojo.User"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
</head>
<body>
    <h3 align="center">用户</h3>
    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
    <tr class="CTitle" >
            <td height="22" colspan="8" align="center" style="font-size:16px">用户</td>
        </tr>
        <tr bgcolor="#EEEEEE">
            <td width="25%" align="center" height="30">用户名</td>
             <td width="25%" align="center" height="30">密码</td>
              <td width="25%" align="center" height="30">邮箱</td>
            	<td width="25%" align="center" height="30">操作</td>
        </tr>
        <%
        List list=(List)request.getAttribute("listuser");
		if(list!=null&&list.size()>0){
		Iterator it = list.iterator();
	   	while (it.hasNext()) {
			User user = (User) it.next();
		%>
        <tr bgcolor="#FFFFFF">
            <td height="22" align="center" ><%=user.getUsername()%></td>
            <td height="22" align="center" ><%=user.getPassword()%></td>
            <td height="22" align="center" ><%=user.getMail()%></td>
            <td height="22" align="center" >
            <form action="AdminServlet?method=deleteUser&username=<%=user.getUsername()%>" method="post">
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
                
</body>
</html>

