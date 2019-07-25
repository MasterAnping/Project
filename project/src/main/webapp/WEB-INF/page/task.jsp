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
			<h1>欢迎，这是任务管理！！！</h1>
			<div class="table-responsive">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>jobName</th>
							<th>jobGroup</th>
							<th>描述</th>
							<th>triggerName</th>
							<th>triggerGroup</th>
							<th>表达式</th>
							<th>状态</th>
							<th>NEXT</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="scheduleJob" items="${scheduleJobs}">
							<tr>
								<td>${scheduleJob.jobName}</td>
								<td>${scheduleJob.jobGroup}</td>
								<td>${scheduleJob.desc}</td>
								<td>${scheduleJob.triggerName}</td>
								<td>${scheduleJob.triggerGroup}</td>
								<td>${scheduleJob.cronExpression}</td>
								<td>${scheduleJob.status}</td>
								<td><c:if test="${scheduleJob.status=='NORMAL'}">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
											value="${scheduleJob.nextFireTime}" />
									</c:if></td>
								<td><c:if test="${!empty scheduleJob.cronExpression}">
										<button class="btn btn-primary btn-xs update_btn"
											data-toggle="modal" data-target="#update_modal">修改</button>
										<c:if test="${scheduleJob.status=='NORMAL'}">
											<button class="btn btn-primary btn-xs pause_btn">暂停</button>
										</c:if>
										<c:if test="${scheduleJob.status=='PAUSED'}">
											<button class="btn btn-primary btn-xs resume_btn">恢复</button>
										</c:if>
										<button class="btn btn-primary btn-xs delete_btn">删除</button>
									</c:if></td>

							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
			<button class="btn btn-primary" data-toggle="modal" data-target="#add_modal">增加触发器</button>
			<div class="modal fade" id="add_modal" tabindex="-1" role="dialog"
				aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<form role="form" id="add_form" action="${ctx}/task/cron/add" method="POST">
							<div class="modal-header">
								<button type="button" class="close"
									data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">增加cron表达式</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>JobName：</label> <input type="text" class="form-control"
										name="jobName" placeholder="请输入jobName">
								</div>
								<div class="form-group">
									<label>JobGroup：</label> <input type="text"
										class="form-control" name="jobGroup" placeholder="请输入jobGroup">
								</div>
								<div class="form-group">
									<label>TriggerName：</label> <input type="text"
										class="form-control" name="triggerName"
										placeholder="请输入triggerName">
								</div>
								<div class="form-group">
									<label>TriggerGroup：</label> <input type="text"
										class="form-control" name="triggerGroup"
										placeholder="请输入triggerGroup">
								</div>
								<div class="form-group">
									<label>cron表达式：</label> <input type="text" class="form-control"
										name="cronExpression" placeholder="请输入cron表达式">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<input type="button" id="add_btn_submit" class="btn btn-primary"
									value="确认修改">
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal fade" id="update_modal" tabindex="-1" role="dialog"
				aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<form role="form" id="update_form" action="${ctx}/task/cron/update" method="POST">
							<div class="modal-header">
								<button type="button" class="close"
									data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">修改cron表达式</h4>
							</div>
							<div class="modal-body">
								<input type="text" id="update_triggerName" name="triggerName">
								<input type="text" id="update_triggerGroup" name="triggerGroup">
								<div class="form-group">
									<label for="update_cronExpression">cron表达式：</label> <input
										type="text" class="form-control" id="update_cronExpression"
										name="cronExpression" placeholder="请输入表达式">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<input type="button" id="update_btn_submit" class="btn btn-primary"
									value="确认修改">
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
<script type="text/javascript">
	$(".update_btn").click(function() {
		var $tds = $(this).parents("tr").children("td");
		$("#update_triggerName").val($tds.eq(3).text());
		$("#update_triggerGroup").val($tds.eq(4).text());
		$("#update_cronExpression").val($tds.eq(5).text());
	})
	$("#update_btn_submit").click(function(){
		$.ajax({
			type : "POST",
			url : "${ctx}/task/cron/update",
			data : $("#update_form").serialize(),
			dataType : "json",
			success : function(data) {
				if (data.isSuccess == true) {
					location.reload();
				} else {
					alert(data.message);
				}
			}
		})
	});
	$("#add_btn_submit").click(function(){
		$.ajax({
			type : "POST",
			url : "${ctx}/task/cron/add",
			data : $("#add_form").serialize(),
			dataType : "json",
			success : function(data) {
				if (data.isSuccess == true) {
					location.reload();
				} else {
					alert(data.message);
				}
			}
		})
	});
	$(".pause_btn").click(function() {
		var $tds = $(this).parents("tr").children("td");
		$.ajax({
			type : "POST",
			url : "${ctx}/task/cron/pause",
			data : {
				triggerName : $tds.eq(3).text(),
				triggerGroup : $tds.eq(4).text()
			},
			dataType : "json",
			success : function(data) {
				if (data.isSuccess == true) {
					location.reload();
				} else {
					alert(data.message);
				}
			}
		})
	})
	$(".resume_btn").click(function() {
		var $tds = $(this).parents("tr").children("td");
		$.ajax({
			type : "POST",
			url : "${ctx}/task/cron/resume",
			data : {
				triggerName : $tds.eq(3).text(),
				triggerGroup : $tds.eq(4).text()
			},
			dataType : "json",
			success : function(data) {
				if (data.isSuccess == true) {
					location.reload();
				} else {
					alert(data.message);
				}
			}
		})
	})
	$(".delete_btn").click(function() {
		var $tds = $(this).parents("tr").children("td");
		$.ajax({
			type : "POST",
			url : "${ctx}/task/cron/delete",
			data : {
				triggerName : $tds.eq(3).text(),
				triggerGroup : $tds.eq(4).text()
			},
			dataType : "json",
			success : function(data) {
				if (data.isSuccess == true) {
					location.reload();
				} else {
					alert(data.message);
				}
			}
		})
	})
</script>

</html>