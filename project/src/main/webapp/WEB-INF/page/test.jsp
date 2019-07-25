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
<link rel="stylesheet" href="${ctx}/plugin/zyComment/css/semantic.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/plugin/zyComment/css/zyComment.css" type="text/css" />
<script src="${ctx}/js/jquery.countdown.js"></script>
</head>

<body>
	<%@ include file="common/head.jsp"%>

	<div class="container">
		<div class="row">
			<h1>欢迎，这是主页！！！</h1>
			<ul class="list-group">
  <li class="list-group-item">Cras justo odio</li>
  <li class="list-group-item">Dapibus ac facilisis in</li>
  <li class="list-group-item">Morbi leo risus</li>
  <li class="list-group-item">Porta ac consectetur ac</li>
  <li class="list-group-item">Vestibulum at eros</li>
</ul>
			<div id="articleComment">
				<div class="ui threaded comments" id="commentItems"
					style="margin-bottom:20px;">
					<div class="text"
						style="font-size:2rem;padding-bottom:10px;border-bottom: 1px solid #DFDFDF;">
						大家的脚印</div>
					<div class="comment" id="comment1">
						<a class="avatar"> <img src="${ctx}/image/foot.png">
						</a>
						<div class="content ">
							<a class="author"> 游客1 </a>
							<div class="metadata">
								<span class="date"> 2014-04-04 </span>
							</div>
							<div class="text">第一条评论</div>
							<div class="actions">
								<a class="reply" href="javascript:void(0)" selfid="1">回复</a>
							</div>
						</div>
						<div class="comments" id="comments1">
							<div class="comment" id="comment3">
								<a class="avatar"> <img src="${ctx}/image/foot.png">
								</a>
								<div class="content topStyle">
									<a class="author"> 站长 </a>
									<div class="metadata">
										<span class="date"> 2014-04-04 </span>
									</div>
									<div class="text">第一条评论的回复</div>
									<div class="actions">
										<a class="reply" href="javascript:void(0)" selfid="3">回复</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="comment" id="comment2">
						<a class="avatar"> <img src="${ctx}/image/foot.png">
						</a>
						<div class="content topStyle">
							<a class="author"> 游客2 </a>
							<div class="metadata">
								<span class="date"> 2014-04-04 </span>
							</div>
							<div class="text">第二条评论</div>
							<div class="actions">
								<a class="reply" href="javascript:void(0)" selfid="2">回复</a>
							</div>
						</div>
						<div class="comments" id="comments2">
							<div class="comment" id="comment4">
								<a class="avatar"> <img src="${ctx}/image/foot.png">
								</a>
								<div class="content topStyle">
									<a class="author"> 站长 </a>
									<div class="metadata">
										<span class="date"> 2014-04-04 </span>
									</div>
									<div class="text">第二条评论的回复</div>
									<div class="actions">
										<a class="reply" href="javascript:void(0)" selfid="4">回复</a>
									</div>
								</div>
								<div class="comments" id="comments4">
									<div class="comment" id="comment6">
										<a class="avatar"> <img src="${ctx}/image/foot.png">
										</a>
										<div class="content topStyle">
											<a class="author"> 游客2 </a>
											<div class="metadata">
												<span class="date"> 2014-04-04 </span>
											</div>
											<div class="text">第二条评论的回复的回复</div>
											<div class="actions">
												<a class="reply" href="javascript:void(0)" selfid="6">回复</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="comment" id="comment5">
						<a class="avatar"> <img src="images/foot.png">
						</a>
						<div class="content topStyle">
							<a class="author"> 游客3 </a>
							<div class="metadata">
								<span class="date"> 2014-04-04 </span>
							</div>
							<div class="text">第三条评论</div>
							<div class="actions">
								<a class="reply" href="javascript:void(0)" selfid="5">回复</a>
							</div>
						</div>
					</div>
					<div class="comment" id="comment1">
						<a class="avatar"> <img src="images/foot.png">
						</a>
						<div class="content topStyle">
							<a class="author"> admin </a>
							<div class="metadata">
								<span class="date"> 2016-09-27 </span>
							</div>
							<div class="text">qq</div>
							<div class="actions">
								<a class="reply" href="javascript:void(0)" selfid="1">回复</a>
							</div>
						</div>
					</div>
				</div>
				<div id="commentFrom">
					<form class="ui reply form" id="replyBoxAri">
						<div class="ui large form ">
							<div class="two fields">
								<div class="field">
									<input id="userName" type="text"> <label
										class="userNameLabel" for="userName">Your Name</label>
								</div>
								<div class="field">
									<input id="userEmail" type="text"> <label
										class="userEmailLabel" for="userName">E-mail</label>
								</div>
							</div>
							<div class="contentField field">
								<textarea id="commentContent"></textarea>
								<label class="commentContentLabel" for="commentContent">Content</label>
							</div>
							<div class="ui button teal submit labeled icon"
								id="submitComment">
								<i class="icon edit"></i> 提交评论
							</div>
						</div>
					</form>
				</div>
			</div>

<strong data-countdown='2017/01/01'></strong>
		</div>
	</div>
</body>
<script type="text/javascript">
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

</script>

</html>