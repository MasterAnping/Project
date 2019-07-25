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
<link rel="stylesheet" href="${ctx}/plugin/zyComment/css/semantic.css"
	type="text/css" />
<link rel="stylesheet" href="${ctx}/plugin/zyComment/css/zyComment.css"
	type="text/css" />
<script type="text/javascript"
	src="${ctx}/plugin/zyComment/js/zyComment.js"></script>
<style type="text/css" media="print, screen">
label {
	font-weight: bold;
}

a {
	font-family: Microsoft YaHei;
}

#articleComment {
	width: 100%;
	overflow: auto;
}
</style>
</head>

<body>
	<%@ include file="common/head.jsp"%>

	<div class="container">
		<div class="row">
			<h1>${book.bookName}</h1>
			<div class="panel panel-default ">
				<div class="panel-heading">
					<h2 class="panel-title">
						${book.bookName} <small> ${book.writer}</small>
					</h2>
				</div>

				<div class="panel-body">
					<div class="col-md-2">
						<a class="thumbnail"> <img
							class="carousel-inner img-responsive img-rounded"
							src="${ctx}/bookPic/${book.bookPic}" alt="...">
						</a>
					</div>
					<div class="col-md-10  table-responsive">
						<p>${book.bookDesc}</p>
						<strong><em>售价：${book.price} 库存：${book.num}</em></strong> <a
							class="btn btn-danger pull-right <c:if test="${book.num <=0}">disabled</c:if>"
							onclick="add(${book.bookId})">加入购物车</a>
					</div>
				</div>
			</div>
			<div class="panel panel-default ">
				<div class="panel-body">
					<div id="articleComment"></div>
					<nav style="text-align: center">
						<ul id="pagination" class="pagination pagination-sm">
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

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

	$('#pagination').twbsPagination({
		totalPages : ${totalPages},
		first : '首页',
		prev : '上一页',
		next : '下一页',
		last : '末页',
		visiblePages : 7,
		onPageClick : function(event, page) {
			comment(page);
		}
	});

	function comment(currentPage) {
		$.ajax({
			type : "GET",
			url : "${ctx}/comment/commentPage",
			data : {
				bookId : ${book.bookId},
				currentPage : Number(currentPage)
			},
			cache : false,
			dataType : "json",
			success : function(data) {
				$("#articleComment").empty();
				$("#articleComment").zyComment({
					"width" : "355",
					"height" : "33",
					"agoComment" : data.list,
					"callback" : function(comment) {
						console.info("填写内容返回值：");
						console.info(comment);
						// 添加新的评论
						$("#articleComment").zyComment("setCommentAfter", {
							"id" : 123,
							"name" : "name",
							"content" : "content",
							"time" : "2014-04-14"
						});
					}
				});
			}
		})
	}
</script>

</html>