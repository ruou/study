<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="pojo.Vedio"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>实用学生管理系统</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
    </head>
    <body>
        <h5 align="center">视频观看</h5>
       
        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="grey" class="newfont03">
            <tr class="CTitle" >
                <td height="22" colspan="8" align="center" style="font-size:16px">视频列表</td>
            </tr>
            <tr bgcolor="#EEEEEE">
                <td width="50%" align="center" height="30">视频名字</td>
                <td width="7%" align="center" >标签</td>
                <td width="43%" align="center" >操作</td>
            </tr>
             <%
	        List list=(List)request.getAttribute("listvedio");
			if(list!=null&&list.size()>0){
			Iterator it = list.iterator();
		   	while (it.hasNext()) {
		   		Vedio v=(Vedio)it.next();
			%>
            <tr bgcolor="#FFFFFF">
                <td height="22" align="center" ><%=v.getVname()%></td>
                <td height="22" align="center" ><%=v.getTag()%></td>
                <td height="22" align="center" >
                	<form action="VedioServlet?method=vedio&path=<%=v.getPath()%>" method="post">
                		<input type="submit" value="观看">	
                	</form>
                	<br>
                	<form action="VedioServlet?method=deleteVedio&vname=<%=v.getVname()%>" method="post">
                		<input type="submit" value="删除">	
                	</form>
                </td>
            </tr>
             <%}
	   	}else{
	   	%>
	   	<tr>
            <td height="22" colspan="7" align="center" >对不起，暂时没有视频！！！</td>
        </tr>
        <%
        }
		%>
        </table>
    </body>
</html>
