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
					<strong class="col-md-5 text-center">商品</strong> <strong
						class="col-md-2">单价</strong> <strong class="col-md-2">数量</strong>
					<strong class="col-md-2">总价</strong> <strong class="col-md-1">操作</strong>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					已选择商品：<strong id="buyNum">0</strong>件，总价：<strong id="payMoney">0</strong>元
					<a class="btn btn-danger" id="order">结算</a>
				</div>
			</div>
			<c:forEach var="shopCart" items="${shopCarts}">
				<div class="panel panel-default" id="${shopCart.book.bookId}"
					data-book="${shopCart.book.bookId}">
					<div class="panel-body">
						<div class="col-md-2">
							<input class="col-md-2 buy_chk" type="checkbox" name="isBuy"
								value=""> <a href="#" class="col-md-10 thumbnail"> <img
								src="${ctx}/bookPic/${shopCart.book.bookPic}" alt="..." /> <input
								id="${shopCart.book.bookId}_bookPic" type="hidden"
								value="${shopCart.book.bookPic}" />
							</a>
						</div>
						<div class="col-md-3">
							<a href="${ctx}/book/bookId/${shopCart.book.bookId}"
								id="${shopCart.book.bookId}_bookName">${shopCart.book.bookName}</a>
						</div>
						<div class="col-md-2">
							<p id="${shopCart.book.bookId}_price">${shopCart.book.price}</p>
						</div>
						<div class="col-md-2">
							<div class="input-group">
								<input type="text" class="form-control num_input" value="1"
									id="${shopCart.book.bookId}_num"> <span
									class="input-group-btn">
									<button class="btn btn-default plus_btn" type="button">
										<span class="glyphicon glyphicon-plus"></span>
									</button>
								</span>
							</div>
						</div>
						<div class="col-md-2">
							<p id="${shopCart.book.bookId}_tolPrice">${shopCart.book.price}</p>
						</div>
						<div class="col-md-1">
							<a href="#" class="delete_btn">删除</a>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script type="text/javascript">
	var r = /^[0-9]*[1-9][0-9]*$/;
	$(".num_input").change(function() {
		var bookId = $(this).parents(".panel").data("book");
		if (!r.test($(this).val())) {
			$(this).val(1);
		}
		var price = $("#" + bookId + "_price").text();
		$("#" + bookId + "_tolPrice").text(($(this).val() * price).toFixed(2));
		compute();
	})
	$(".plus_btn").click(
			function() {
				var bookId = $(this).parents(".panel").data("book");
				$("#" + bookId + "_num").val(
						parseInt($("#" + bookId + "_num").val()) + 1);
				$("#" + bookId + "_num").change();
			})

	$(".buy_chk").click(function() {
		compute();
	})

	function compute() {
		var buyNum = 0
		var payMoney = 0;
		$.each($("input:checkbox[name='isBuy']:checked"), function(key, value) {
			var bookId = $(this).parents(".panel").data("book");
			buyNum++;
			payMoney += parseFloat($("#" + bookId + "_tolPrice").text());
		})
		$("#buyNum").text(buyNum);
		$("#payMoney").text(payMoney);
	}

	$("#order").click(function() {
		var array = new Array();
		var checkbox = $("input:checkbox[name='isBuy']:checked");
		if (checkbox.length == 0) {
			$('#stantard-dialogBox').dialogBox({
						title : '提示',
						hasClose : true,
						content : "没有选中任何商品"
					});
			return;
		}

		$.each(checkbox, function(key, value) {
			var object = new Object();
			var book = new Object();
			var bookId = $(this).parents(".panel").data("book");
			book.bookId = bookId;
			book.bookName = $("#" + bookId + "_bookName").text();
			book.bookPic = $("#" + bookId + "_bookPic").val();
			object.book = book;
			object.orderNum = $("#" + bookId + "_num").val();
			object.orderPrice = $("#" + bookId + "_price").text();
			array.push(object);
		})
		post("${ctx}/order/confirm", {
			json : JSON.stringify(array)
		});
	})

	$(".delete_btn").click(function() {
		if (confirm("确定要删除么吗？")) {
			var bookId = $(this).parents(".panel").data("book");
			$.ajax({
				type : "POST",
				url : "${ctx}/shopCart/delete",
				data : {
					bookId : bookId
				},
				dataType : "text",
				success : function() {
					$("#" + bookId).remove();
					compute();
					$('#stantard-dialogBox').dialogBox({
						title : '提示',
						hasClose : true,
						content : "商品已从购物车删除"
					});
				}
			})
		}
	})
</script>


</html>