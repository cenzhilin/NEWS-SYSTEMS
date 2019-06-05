<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body  background="<%=basePath %>images/bg.jpg">
<div class="">
  <div class="title" style=" text-align:center; font-size:60px">
    蓝天新闻网</div>
</div>
<hr>
<div class="" style=" text-align:center;">
  <h2>${NewsBean.title}</h2>
<div style="  font-size:20px">${NewsBean.text}</div>
  </body>
</html>
