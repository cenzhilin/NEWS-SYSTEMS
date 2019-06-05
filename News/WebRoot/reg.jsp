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
		<form name="f1" id="f1"
			action="<%=path%>/servlet/UserServlet?action=reg" method="post">
			<table style="margin:0px auto">
				<tr>
					<td>用户名:</td>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td>密码:</td>
					<td>
						<input type="password" name="password">
					</td>
				</tr>
				<tr>
					<td>是否管理员:</td>
					<td>
						<input type="checkbox" name="isManager">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="提交注册">
					</td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>