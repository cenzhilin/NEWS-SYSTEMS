<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<script type="text/javascript">
	function del() {
		 
		if (confirm("你真的要删除这些新闻吗？")) {
			var f = document.forms[0];
			f.action ="<%=path%>/servlet/NewsServlet?action=delete";
			f.submit();
		} else {
			return;
		}
	}
</script>
</head>
<body background="<%=basePath%>images/bg.jpg">

	<div class="">
		<div class="title" style=" text-align:center; font-size:60px">
			蓝天新闻网</div>
	</div>
	<hr>
	<div class="">
		<h1>最近新闻:</h1>
		<form action="" method="post">
			<c:forEach var="n" items="${NL }">
		${n.id }
		<a href="<%=path%>/servlet/NewsServlet?action=show&id=${n.id }">${n.title }
				</a>
				<c:if test="${isManager}">&nbsp&nbsp&nbsp&nbsp <a
						href="<%=path%>/servlet/NewsServlet?action=toEdit&id=${n.id }">修改</a>
					<input type="checkbox" name="ids" value="${n.id }"></input>
				</c:if>
				<br />

			</c:forEach>
			<c:if test="${isManager}">
				<input type="button" value="删除" onclick="del();"></input>
			</c:if>
		</form>
	</div>
	<hr>
	<c:if test="${isManager}">
		<div>
			<h1>发布新闻:</h1>
			<form class="" action="<%=path%>/servlet/NewsServlet?action=add"
				method="post">
				标题： <input type="text" name="title" value="限中文12，英文25"> </input> <br />
				正文：
				<textarea name="text" rows="5" cols="100">限500英文字符，1中文等于2英文
</textarea>
				<br /> <input type="submit" value="发布">
			</form>
		</div>
	</c:if>
</body>
</html>
