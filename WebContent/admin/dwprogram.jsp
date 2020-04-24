<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>软件下载</title>
</head>
<body>
    <h3 align="center">软件下载</h3>
    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
    <tr class="CTitle" >
            <td height="22" colspan="8" align="center" style="font-size:16px">软件下载</td>
        </tr>
        <tr bgcolor="#EEEEEE">
            <td width="40%" align="center" height="30">软件名</td>
            <td width="60%" align="center" >操作</td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="22" align="center" >免费视频转换器</td>
            <td height="22" align="center" >
            <form action="DownloadServlet?method=dowmloadmp4" method="post">
            	<input type="submit" value="下载"> 
            </form>
			</td>
        </tr>
    </table>
                
</body>
</html>