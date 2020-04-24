<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>视频观看</title>
    <style>
        div{
           margin-left: 200px;
           margin-top: 20px;
        }
    </style>
</head>
<body>
	<div>   
    <video width="800" height="400" webkit-playsinline="" playsinline="" x5-playsinline="" x-webkit-airplay="allow" controls>
       <source src="/vedio/<%=request.getAttribute("mp4")%>"> 
      		您的浏览器不支持Video标签。
      </video>
      
    </div>
</body>
</html>