<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			action="<%=path%>/servlet/UserServlet?action=login" method="post">
			<table style="margin:0px auto">
				<tr>
					<td>用户名:</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td><input type="submit" value="登录"></td>
					<td><input type="button" value="注册"
						onclick="javascrtpt:window.location.href='reg.jsp'"></td>
				</tr>
			</table>
		</form>
	</div>

	<c:if test="${error}">
		<script type="text/javascript">
			alert("用户名或密码错误");
		</script>
	</c:if>

</body>
</html>