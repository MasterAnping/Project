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
<style type="text/css">
/*-- post --*/
.post {
	margin: 3em 0 0 0;
}

.post h3 {
	color: #444444;
	font-size: 16px;
	margin: 0;
	font-family: 'Georgia Italic';
	font-style: italic;
	position: relative;
}

.post h3:after {
	content: '';
	background: url(../images/strip3.png) repeat 0px 0px;
	position: absolute;
	display: block;
	height: 10px;
	width: 82%;
	top: 30%;
	left: 14%;
}

.post-grids {
	margin: 2em 0;
	padding-bottom: 2em;
	border-bottom: 1px solid #F2F2F2;
}

.post-left img {
	width: 100%;
	height: 200px;
	padding: .5em;
	border: 1px solid #CBCBCB;
	margin: 0;
}

.post-right h4 {
	margin: 0;
}

.post-right h4 a {
	color: #444444;
	font-size: 14px;
	font-family: 'Open Sans', sans-serif;
	font-style: normal;
	font-weight: 600;
	text-decoration: none;
}

.post-right h4 a:hover {
	color: #e47600;
}

.post-right p.comments {
	color: #d7d7d7;
	font-size: 12px;
	margin: 1em 0;
	font-family: 'Georgia Italic';
	font-style: italic;
}

.post-right p.comments a {
	color: #d7d7d7;
	text-decoration: none;
}

.post-rightp.comments a:hover {
	color: #555555;
}

.post-right p.text {
	color: #555555;
	margin: 0;
	font-size: 13px;
	padding-bottom: 1em;
}
</style>
</head>
<body>
	<%@ include file="common/head.jsp"%>
	<div class="container">
		
		<div class="col-md-8">
				<!-- post -->
				<div class="post">
					<h3>图书列表</h3>
					<c:forEach var="book" items="${bookPage.list}">
						<div class="post-grids">
							<div class="col-md-3 post-left">
								<a href="${ctx}/book/bookId/${book.bookId}"><img
									src="${ctx}/bookPic/${book.bookPic}" alt="" /></a>
							</div>
							<div class="col-md-9 post-right">
								<h4>
									<a href="${ctx}/book/bookId/${book.bookId}">${book.bookName}</a>
								</h4>
								<p class="comments">
									${book.writer}, <a href="#">${book.category.cateName}</a>
								</p>
								<div style="height:110px; overflow:hidden;">
									<p class="text bookDesc" style="height:70px; overflow:hidden;">${book.bookDesc}</p>
								</div>
								<strong><em>￥${book.price}</em></strong> <strong><em>库存：${book.num}</em></strong>
								<a
									class="btn btn-info pull-right <c:if test="${book.num <=0}">disabled</c:if>"
									onclick="add(${book.bookId})">加入购物车</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</c:forEach>
				</div>
				<!-- //post -->
				<nav>
					<ul id="pagination" class="pagination pagination-lg">
					</ul>
				</nav>			
		</div>
		<div class="col-md-4">
		
		</div>
	</div>
</body>
<script type="text/javascript">
	$(".bookDesc").each(function() {
		$(this).text($(this).text().substring(0, 100) + "......");
	});
	$('#pagination').twbsPagination({
		totalPages : ${bookPage.totalPages},
		first : '首页',
		prev : '上一页',
		next : '下一页',
		last : '末页',
		visiblePages : 7,
		href : '${ctx}/book/advancedCheck/page/{{number}}?${queryString}'
	});

	function add(bookId) {
		if (${user==null}) {
			$('#stantard-dialogBox').dialogBox({
				title : '提示',
				hasClose : true,
				content : "你还未登录，请登陆后操作"
			});
			return;
		}
		$.ajax({
			type : "POST",
			url : "${ctx}/shopCart/add",
			data : {
				bookId : Number(bookId)
			},
			cache : false,
			dataType : "json",
			success : function(data) {
				$('#stantard-dialogBox').dialogBox({
					title : '提示',
					hasClose : true,
					content : data.message
				});
			}
		})
	}

	
</script>

</html>