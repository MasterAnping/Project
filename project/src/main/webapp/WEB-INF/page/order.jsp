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
			<ul class="nav nav-pills">
				<c:forEach var="orderStatus" items="${orderStatuses}">
					<li role="presentation" class="active"><a
						href="${ctx}/order/myOrder/${orderStatus.name}/page/1">${orderStatus.stateInfo}</a></li>
				</c:forEach>
			</ul>
			<div class="panel panel-default">
				<div class="panel-body">
					<strong class="col-md-1"></strong>
					<div class="col-md-11">
						<strong class="col-md-6">商品</strong> <strong class="col-md-2">单价</strong>
						<strong class="col-md-2">数量</strong> <strong class="col-md-2">总价</strong>
					</div>
				</div>
			</div>
			<c:forEach var="orderInfo" items="${orderPage.list}">
				<div class="panel panel-default" data-pk="${orderInfo.orderId}">
					<div class="panel-heading">
						<h2 class="panel-title">
							订单编号：${orderInfo.orderId}
							<c:if test="${orderInfo.status >=2}"> 物流公司：${orderInfo.logistics} 单号：${orderInfo.trackingNo}</c:if>
							<small class="pull-right"> ${orderInfo.statusInfo}</small>
						</h2>
					</div>
					<div class="panel-body">
						<c:forEach var="orderDetail" items="${orderInfo.orderDetails}">
							<div class="panel panel-default"
								data-book="${orderDetail.book.bookId}">
								<div class="panel-body">
									<a href="#" class="thumbnail col-md-1"> <img width="100%"
										src="${ctx}/bookPic/${orderDetail.book.bookPic}" alt="...">
									</a>

									<div class="col-md-11">
										<div class="col-md-4">
											<a href="${ctx}/book/bookId/${orderDetail.book.bookId}">${orderDetail.book.bookName}</a>
										</div>
										<div class="col-md-2">
											<p id="${orderDetail.book.bookId}_price">${orderDetail.book.price}</p>
										</div>
										<div class="col-md-2">
											<p id="${orderDetail.book.bookId}_num">${orderDetail.orderNum}</p>
										</div>
										<div class="col-md-2">
											<p id="${orderDetail.book.bookId}_tolPrice">${orderDetail.orderNum*orderDetail.orderPrice}</p>
										</div>
										<div class="col-md-2">
											<c:if test="${orderInfo.status >=3}">
												<c:if test="${orderDetail.commentNum==0}">
													<a
														href="${ctx}/comment/privacy?orderDetailId=${orderDetail.orderDetailId}">前往评价</a>
												</c:if>
												<c:if test="${orderDetail.commentNum>0}">
													<a
														href="${ctx}/comment/privacy?orderDetailId=${orderDetail.orderDetailId}">查看评价</a>
												</c:if>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="panel-footer">


						<div id="${orderInfo.orderId}_state">
							<c:choose>
								<c:when test="${orderInfo.status == 0}">
							剩余付款时间：
        					<strong
										data-countdown='<fmt:formatDate value="${orderInfo.deadline}" pattern="yyyy/MM/dd HH:mm:ss" />'></strong>
									<a class="btn btn-primary pay_btn">付款</a>
								</c:when>
								<c:otherwise>
									<strong>${orderInfo.statusInfo}</strong>
								</c:otherwise>
							</c:choose>
							<c:if test="${orderInfo.status == 2}">
								<button class="btn btn-danger signed_btn">确认收货</button>
							</c:if>

						</div>

					</div>
				</div>
			</c:forEach>

			<nav>
				<ul id="pagination" class="pagination pagination-lg">
				</ul>
			</nav>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('#pagination').twbsPagination({
		totalPages : ${orderPage.totalPages},
		first : '首页',
		prev : '上一页',
		next : '下一页',
		last : '末页',
		visiblePages : 7,
		href : "${ctx}/order/myOrder/${name}/page/{{number}}"
	});

	$('[data-countdown]').each(function() {
		var $this = $(this), finalDate = $(this).data('countdown');
		$this.countdown(finalDate, function(event) {
			$this.html(event.strftime('%D 天 %H:%M:%S'));
		}).on('finish.countdown', function() {
			//时间完成后回调事件
			//获取秒杀地址,控制现实逻辑,执行秒杀 
			// $this.remove();
			var orderId = $(this).parents(".panel").data("pk");
			$("#" + orderId + "_state").html("<strong>订单已经关闭</strong>");
			//$(this).remove();			
		});
	});

	$(".pay_btn").click(function() {
		if (!confirm("是否确认付款？")) {
			return;
		}
		$.ajax({
			type : "POST",
			url : "${ctx}/order/pay",
			data : {
				orderId : $(this).parents(".panel").data("pk")
			},
			dataType : "json",
			success : function(data) {
				if (data.isSuccess == true) {
					location.reload();
				} else {
					$('#stantard-dialogBox').dialogBox({
						title : '提示',
						hasClose : true,
						content : data.message
					});
				}
			}
		})
	})

	$(".signed_btn").click(function() {
		if (!confirm("是否确认收货？")) {
			return;
		}
		$.ajax({
			type : "POST",
			url : "${ctx}/order/signed",
			data : {
				orderId : $(this).parents(".panel").data("pk")
			},
			dataType : "json",
			success : function(data) {
				if (data.isSuccess == true) {
					location.reload();
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