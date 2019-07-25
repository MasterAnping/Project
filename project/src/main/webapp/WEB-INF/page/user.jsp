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
			<h1>欢迎，这是你的主页！！！</h1>
			<ul class="nav nav-pills">
				<li role="presentation" class="active"><a href="">用户信息</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="details">
					<div class="panel panel-default ">
						<div class="panel-heading">
							<h2 class="panel-title">
								标题 <small> 副标题</small> <a href="#"><span
									class="glyphicon glyphicon-remove pull-right"></span></a> <span
									class="pull-right">&nbsp;&nbsp;</span> <a href="#"><span
									class="glyphicon glyphicon-edit pull-right" data-toggle="modal"
									id="update_btn" data-target="#update_div"></span></a>
							</h2>
						</div>

						<div class="panel-body">
							<a class="thumbnail col-md-2"> <img
								src="${ctx}/image/鲁路修.jpg" alt="...">
							</a>
							<div class="col-md-10  table-responsive">
								<table class="table table-hover table-bordered">
									<thead>
										<tr>
											<th>用户名</th>
											<th>昵称</th>
											<th>余额</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="username">${user.username}</td>
											<td id="nickname">${user.nickname}</td>
											<td id="balance">${user.balance}</td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<th>邮性别</th>
											<th>地址</th>
											<th>电话</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="gender">${user.gender}</td>
											<td id="addr">${user.addr}</td>
											<td id="tel">${user.tel}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<button class="btn btn-default">修改基本信息</button>
					</div>
					<div class="tab-pane" id="learningExperience"></div>
					<div class="tab-pane" id="workExperience"></div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>