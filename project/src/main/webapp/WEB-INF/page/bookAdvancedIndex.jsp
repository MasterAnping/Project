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
			<h1>高级搜索</h1>

			<div class="panel panel-default col-md-8">
				<div class="panel-body">
					<form role="form" class="form-horizontal"
						action="${ctx}/book/advancedCheck/page/1" method="GET">
						<div class="form-group">
							<label for="bookName">图书名称</label> <input type="text"
								class="form-control" id="bookName" name="bookName"
								placeholder="请输入图书名称">
						</div>
						<div class="form-group">
							<label for="writer">作者</label> <input type="text"
								class="form-control" id="writer" name="writer"
								placeholder="请输入作者">
						</div>
						<div class="form-group">
							<label for="press">出版社</label> <input type="text"
								class="form-control" id="press" name="press"
								placeholder="请输入出版社">
						</div>
						<div class="form-group">
							<label for="category">图书分类</label> <select class="form-control"
								id="category" name="cateId">
								<option value="">不限</option>
								<c:forEach var="category" items="${categorys}">
									<option value="${category.cateId}">${category.cateName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<p>
								<label>价格区间</label>
							</p>
							<div class="col-md-6">
								<input type="text" class="form-control" id="minPrice"
									name="minPrice" placeholder="请输入价格下限">
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" id="maxPrice"
									name="maxPrice" placeholder="请输入价格上限">
							</div>
						</div>

						<button type="submit" class="btn btn-default">提交</button>

					</form>
				</div>
			</div>

			<div class="panel panel-danger col-md-4">
				<div class="panel-body">
					<h4>表单各项均为选填</h4>
				</div>
			</div>




		</div>
	</div>
</body>


</html>