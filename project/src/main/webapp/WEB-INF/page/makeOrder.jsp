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
<script class="resources library" src="${ctx}/js/area.js"
	type="text/javascript"></script>

</head>

<body>
	<%@ include file="common/head.jsp"%>

	<div class="container">
		<div class="row">
			<h1>欢迎，这是主页！！！</h1>
			<div class="panel panel-primary">
				<div class="panel-body">
					请填写收货地址：
					<div class="form-group">
						<label for="add_province">省份</label> <select class="form-control"
							id="add_province" name="province"></select> 

					</div>
					<div class="form-group">
						<label for="add_city">城市</label> <select class="form-control"
							id="add_city" name="city"></select> 

					</div>
					<div class="form-group">
						<label for="add_county">县</label> <select class="form-control"
							id="add_county" name="county"></select>
					</div>
					<div class="form-group">
						<label for="add_addr">地址</label> <input class="form-control"
							id="add_addr" name="addr">
					</div>
					<div class="form-group">
						<label for="add_tel">联系电话</label> <input class="form-control"
							id="add_tel" name="tel">
					</div>
				</div>
			</div>
			<div class="panel panel-primary">
				<div class="panel-body">
					已选择商品：<strong id="buyNum">${count}</strong>件，总价：<strong
						id="payMoney">${totalPrice}</strong>元 <a class="btn btn-danger"
						id="submit">提交订单</a>
				</div>
			</div>
			<div class="panel panel-danger">
				<div class="panel-body">	
					<div>
						<strong class="col-md-6">商品</strong> <strong class="col-md-2">单价</strong>
						<strong class="col-md-2">数量</strong> <strong class="col-md-2">总价</strong>
					</div>
				</div>
			</div>
			<c:forEach var="orderDetail" items="${orderDetails}">
				<div class="panel panel-default order-panel"
					data-book="${orderDetail.book.bookId}">

					<div class="panel-body">
						<div class="col-md-2">
							<a href="#" class="thumbnail"> <img
								src="${ctx}/bookPic/${orderDetail.book.bookPic}" alt="...">
							</a>
						</div>
						<div class="col-md-4">
							<p>${orderDetail.book.bookName}</p>
						</div>
						<div class="col-md-2">
							<p id="${orderDetail.book.bookId}_price">${orderDetail.orderPrice}</p>
						</div>
						<div class="col-md-2">
							<p id="${orderDetail.book.bookId}_num">${orderDetail.orderNum}</p>
						</div>
						<div class="col-md-2">
							<p id="${orderDetail.book.bookId}_tolPrice">${orderDetail.orderNum*orderDetail.orderPrice}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script type="text/javascript">
$(".panel").data("book")
$("#submit").click(function(){
var orderArray = new Array();
var detailArray = new Array();
	$.each($(".order-panel"), function(key, value) {
		var orderDetail = new Object();
		var book = new Object();
		orderDetail.book=book;
		var bookId = $(this).data("book");
		book.bookId=bookId;
		orderDetail.orderNum=$("#"+bookId+"_num").text();
		orderDetail.orderPrice=$("#"+bookId+"_price").text();
		detailArray.push(orderDetail);
	})
	var order = new Object();
	order.orderAddr=$("#add_province").val()+$("#add_city").val()+$("#add_county").val()+$("#add_addr").val();
	order.orderTel=$("#add_tel").val();
	order.totalPrice=$("#payMoney").text();
	orderArray.push(order);
	$.ajax({
			type : "POST",
			url : "${ctx}/order/submit",			
			data : {
				orderJson : JSON.stringify(order),
				detailJson : JSON.stringify(detailArray)
			},
			dataType : "json",
			success : function(data) {
				var message;
				 if(data.isSuccess==true){
				 	message = data.message + '，5秒后跳转到订单页面';
				 	setTimeout(function(){
				 		location.href = "../order/myOrder/all/page/1";
				 	},5000)
				}else{
					message = data.message + '，请重新选购';
				} 
				$('#stantard-dialogBox').dialogBox({
						title: '提示',
						hasClose: true,
						content: message
					});
			}
	})
})

_init_area("add");
</script>

</html>