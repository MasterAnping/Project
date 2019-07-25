<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My JSP 'MyJsp.jsp' starting page</title>
<%@ include file="common/label.jsp"%>
</head>
<body>
	<%@ include file="common/head.jsp"%>

	<div class="container">
		<div class="row">
			<h1>欢迎，这是缓存管理页面！！！</h1>

			<div class="col-md-6">
				<h2>spring缓存</h2>
				<a type="button" class="btn btn-primary" href="cache/clearSpring">清空spring缓存</a>
				<c:forEach var="key" items="${cacheMap.springMap}">
					${key}<hr />
				</c:forEach>
			</div>

			<div class="col-md-6">
				<h2>shiro缓存</h2>
				<a type="button" class="btn btn-primary" href="cache/clearShiro">清空shiro缓存</a>
				<c:forEach var="key" items="${cacheMap.shiroMap}">
					${key}<hr />
				</c:forEach>
			</div>

		</div>
	</div>
</body>


</html>