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
<script src="${ctx}/js/jquery.countdown.js"></script>
</head>

<body>
	<%@ include file="common/head.jsp"%>

	<div class="container">
		<div class="row">
			<form role="form" action="${ctx}/order/delivery/page/1" method="GET">
				<div class="form-group col-md-6">
					<label for="orderId">订单ID</label> <input type="text"
						class="form-control" id="orderId" name="orderId"
						placeholder="请输入订单ID">
				</div>
				<div class="form-group col-md-6">
					<label for="userId">用户ID</label> <input type="text"
						class="form-control" id="userId" name="userId"
						placeholder="请输入用户ID">
				</div>

				<button type="submit" class="btn btn-default">提交</button>
			</form>
			<div class="panel panel-default">
				<div class="panel-body">
					<div>
						<strong class="col-md-6">商品</strong> <strong class="col-md-2">单价</strong>
						<strong class="col-md-2">数量</strong> <strong class="col-md-2">总价</strong>
					</div>
				</div>
			</div>
			<c:forEach var="orderInfo" items="${orderPage.list}">
				<div class="panel panel-default" id="panel-${orderInfo.orderId}"
					data-pk="${orderInfo.orderId}">
					<div class="panel-heading">
						<h2 class="panel-title">
						<strong><fmt:formatDate value="${orderInfo.createTime}" pattern="yyyy-MM-dd"/> </strong>
						<span> 订单号：${orderInfo.orderId}</span> <strong class="pull-right">
								${orderInfo.statusInfo}</strong>
						</h2>
					</div>
					<div class="panel-body">
						<c:forEach var="orderDetail" items="${orderInfo.orderDetails}">
							<div class="panel panel-default"
								data-book="${orderDetail.book.bookId}">
								<div class="panel-body">
									<div class="col-md-2">
										<a href="#" class="thumbnail"> <img
											src="${ctx}/bookPic/${orderDetail.book.bookPic}" alt="...">
										</a>
									</div>
									<div class="col-md-4">
										<a href="${ctx}/book/bookId/${orderDetail.book.bookId}">${orderDetail.book.bookName}</a>
									</div>
									<div class="col-md-2">
										<p>${orderDetail.book.price}</p>
									</div>
									<div class="col-md-2">
										<p>${orderDetail.orderNum}</p>
									</div>
									<div class="col-md-2">
										<p>${orderDetail.orderNum*orderDetail.orderPrice}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="panel-footer">
						<button class="btn btn-danger delivery_btn">发货</button>
					</div>
				</div>
			</c:forEach>

			<nav>
				<ul id="pagination" class="pagination pagination-lg">
				</ul>
			</nav>
		</div>
	</div>

	<!-- 登录触发模态弹出窗元素 -->
	<div class="modal fade" id="delivery_modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form role="form" action="${ctx}/order/delivery" method="POST"
					id="delivery-form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							物流表单——订单编号(<span class="text-danger" id="delivery_msg"></span>)
						</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input type="hidden" id="orderId_1" name="orderId">
						</div>
						<div class="form-group">
							<label for="logistics">物流公司：</label> <input type="text"
								class="form-control" id="logistics" name="logistics"
								placeholder="请输入物流公司">
						</div>
						<div class="form-group">
							<label for="trackingNo">运单号：</label> <input type="text"
								class="form-control" id="trackingNo" name="trackingNo"
								placeholder="请输入运单号">
						</div>

					</div>
					<div class="modal-footer">
						<strong class="text-danger" id="message"></strong>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" id="deliveryChk_btn" class="btn btn-primary">提交</button>

					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$().ready(function() {
		$("#delivery-form").bootstrapValidator({
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				logistics : {
					validators : {
						notEmpty : true
					}
				},
				trackingNo : {
					validators : {
						notEmpty : true
					}
				}			
			}
		});
	});
	
	$('#pagination').twbsPagination({
		totalPages : ${orderPage.totalPages},
		first : '首页',
		prev : '上一页',
		next : '下一页',
		last : '末页',
		visiblePages : 7,
		href : "${ctx}/order/delivery/page/{{number}}${queryString}"
	});

	$(".delivery_btn").click(function() {
		$("#delivery-form")[0].reset();
		$("#delivery_modal").modal('show');
		$("#orderId_1").val($(this).parents(".panel").data("pk"));
		$("#delivery_msg").text($(this).parents(".panel").data("pk"));
	});

	$("#deliveryChk_btn").click(function() {
		$.ajax({
			type : "POST",
			url : "${ctx}/order/delivery",
			data : $("#delivery-form").serialize(),
			dataType : "json",
			success : function(data) {
				if (data.isSuccess == true) {
					$("#delivery_modal").modal('hide');
					$("#panel-" + $("#orderId_1").val()).remove();
				} else {
					$('#stantard-dialogBox').dialogBox({
						title : '提示',
						hasClose : true,
						content : data.message
					});
				}
			}
		})
	});
	
	
</script>

</html>