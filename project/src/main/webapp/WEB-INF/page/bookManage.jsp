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
			<a href="../add" class="btn btn-info">新增图书</a>
			<div class="table-responsive">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>图书ID</th>
							<th>图书名称</th>
							<th>图书类别</th>
							<th>出版社</th>
							<th>作者</th>
							<th>售价</th>
							<th>剩余数量</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${bookPage.list}">
							<tr <c:if test="${book.isDisplay==false}">class='danger'</c:if>>	
								<td>${book.bookId}</td>
								<td><a href="../../bookId/${book.bookId}">${book.bookName}</a></td>
								<td>${book.category.cateName}</td>
								<td>${book.press}</td>
								<td>${book.writer}</td>
								<td>${book.price}</td>
								<td>${book.num}</td>
								<td><a href="../update?bookId=${book.bookId}">修改</a> <a href="#">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<nav style="text-align: center">
					<ul id="pagination" class="pagination pagination-md">						
					</ul>
				</nav>



			</div>



		</div>
	</div>
</body>
<script type="text/javascript">
$('#pagination').twbsPagination({
        totalPages: ${bookPage.totalPages},
        first: '首页',
        prev: '上一页',
        next: '下一页',
        last: '末页',
        visiblePages: 7,
        href: '${ctx}/book/manage/page/{{number}}',
        /* onPageClick: function (event, page) {
            alert(page);
        } */
    });
</script>

</html>