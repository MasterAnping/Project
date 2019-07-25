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
		<div class="panel panel-default">
				<div class="panel-body">
					<strong class="col-md-1"></strong>
					<div class="col-md-11">
						<strong class="col-md-6">商品</strong> <strong class="col-md-2">单价</strong>
						<strong class="col-md-2">数量</strong> <strong class="col-md-2">总价</strong>
					</div>
				</div>
			</div>
			<div class="panel panel-default"
				data-book="${orderDetail.book.bookId}">
				<div class="panel-body">
					<a href="#" class="thumbnail col-md-1"> <img width="100%"
						src="${ctx}/bookPic/${orderDetail.book.bookPic}" alt="...">
					</a>

					<div class="col-md-11">
						<div class="col-md-6">
							<strong><a href="${ctx}/book/bookId/${orderDetail.book.bookId}">${orderDetail.book.bookName}</a></strong>
						</div>
						<div class="col-md-2">
							<strong>${orderDetail.book.price}</strong>
						</div>
						<div class="col-md-2">
							<strong>${orderDetail.orderNum}</strong>
						</div>
						<div class="col-md-2">
							<strong>${orderDetail.orderNum*orderDetail.orderPrice}</strong>
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default"
				data-book="${orderDetail.book.bookId}">
				<div class="panel-body">
					<c:forEach var="comment" items="${comments}" varStatus="status">
						<c:if test="${status['index']>0}">
							<label>[追加的评价]</label>
						</c:if>
						<p>${comment.content} [<fmt:formatDate value="${comment.time}" pattern="yyy-MM-dd HH:mm:ss"/>]</p>
					</c:forEach>
				</div>
			</div>

			<c:if test="${orderDetail.commentNum==0}">
				<h1>添加评论</h1>
				<form role="form"
					action="${ctx}/comment/privacy/addCheck?orderDetailId=${orderDetail.orderDetailId}"
					method="post">
					<div class="form-group col-md-12">
						<label for="bookDesc">评论内容</label>
						<textarea class="form-control" rows="10" id="content"
							name="content" placeholder="请输入图书简述"></textarea>
					</div>
					<button type="submit" class="btn btn-default">提交</button>
				</form>
			</c:if>

			<%-- <c:if test="${fn:length(comments)==1}"> --%>
			<c:if test="${orderDetail.commentNum==1}">
				<label>追加评论</label>
				<form role="form"
					action="${ctx}/comment/privacy/additionalCheck?orderDetailId=${orderDetail.orderDetailId}"
					method="post">
					<textarea class="form-control" rows="10" name="content"
						placeholder="请输入评价"></textarea>
					<button type="submit" class="btn btn-primary">追加评论</button>
				</form>
			</c:if>







		</div>
	</div>
</body>


</html>