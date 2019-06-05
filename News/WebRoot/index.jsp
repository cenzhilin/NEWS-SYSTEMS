<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body background="<%=basePath%>images/bg.jpg">

	<div class="">
		<div class="title" style=" text-align:center; font-size:60px">
			蓝天新闻网</div>
	</div>
	<hr>
	
	<div class="">
		<div class="title" style=" text-align:center; font-size:50px; ">
			欢迎光临蓝天新闻网</div>
		<div class="" style=" text-align:center; font-size:50px; ">
			<a href="login.jsp">点击进入</a>
		</div>
	</div>

</body>
</html>
