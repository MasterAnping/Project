<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录界面</title>
<shiro:principal></shiro:principal>
<%@ include file="common/label.jsp"%>


<style type="text/css" media="print, screen">
</style>
</head>

<body>


	<div class="container">
		<div class="row">
			<h1>欢迎登陆</h1>
			<div class="col-sm-12">
				<div class="card">
					<form role="form" action="${ctx}/login/loginCheck" method="POST"
						id="login_form">
						<div class="card-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="card-title">登录系统</h4>
						</div>
						<div class="card-body">
							<div class="form-group">
								<label for="login_username">用户名：</label> <input type="text"
									class="form-control" id="login_username" name="username"
									placeholder="请输入您的用户名">
							</div>
							<div class="form-group">
								<label for="login_password">密码</label> <input type="password"
									class="form-control" id="login_password" name="password"
									placeholder="请输入您的密码">
							</div>
						</div>
						<div class="card-footer text-center">
							<strong class="text-danger" id="message"></strong>
							<button type="button" class="btn btn-default">取消</button>
							<button type="button" id="login_btn" class="btn btn-primary">登录</button>
							<strong class="text-primary" id="change">没有账号？立即注册</strong>
						</div>
					</form>

				</div>

				<div class="card">
					<form role="form" action="${ctx}/user/registerCheck" method="POST"
						id="register_form">
						<div class="card-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="card-title">注册系统</h4>
						</div>
						<div class="card-body">
							<div class="form-group">
								<label for="login_username">用户名：</label> <input type="text"
									class="form-control" id="register_username" name="username"
									placeholder="请输入您的用户名">
							</div>
							<div class="form-group">
								<label for="login_password">密码</label> <input type="password"
									class="form-control" id="register_password" name="password"
									placeholder="请输入您的密码">
							</div>
						</div>
						<div class="card-footer text-center">
							<button type="button" class="btn btn-default">取消</button>
							<button type="button" id="register_btn" class="btn btn-primary">注册</button>
							<strong class="text-primary" id="change">已有账号？立即登陆</strong>
						</div>
					</form>

				</div>

			</div>

		</div>
	</div>
</body>
<script type="text/javascript">
	$("#login_btn").click(function() {
		$.ajax({
			type : "POST",
			url : "${ctx}/login/loginCheck",
			data : $("#login_form").serialize(),
			dataType : "json",
			success : function(data) {
				if (data.isSuccess == true) {
					location.reload();
				} else {
					$("#message").text(data.message);
				}
			}
		})
	});
	
	$("#register_btn").click(function() {
		$.ajax({
			type : "POST",
			url : "${ctx}/user/registerCheck",
			data : $("#register_form").serialize(),
			dataType : "json",
			success : function(data) {
				if (data.isSuccess == true) {
					console.log("123")
					location.reload();
				} else {
					$("#message").text(data.message);
				}
			}
		})
	});

	
</script>

</html>