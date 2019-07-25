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
<link rel="stylesheet" href="${ctx}/css/metroStyle/metroStyle.css">
<script src="${ctx}/js/jquery.ztree.all.min.js"></script>
</head>
<body>
	<%@ include file="common/head.jsp"%>

	<div class="container">
		<div class="row">
			<h1>欢迎，这是用户管理！！！</h1>
			<div class="input-group">
				<input type="text" id="look_input" class="form-control"> <select
					id="look_select" class="form-control">
					<option value="username">用户名</option>
					<option value="logonName">登录名</option>
					<option value="userId">用户ID</option>
				</select>
				<button type="submit" class="btn btn-primary" id="look_btn">查找用户</button>
			</div>


			<div class="panel panel-default">
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
					<div class="media">
						<div class="media-left">
							<a href="#"> <img class="media-object " height="200"
								src="${ctx}/image/鲁路修.jpg" alt="...">
							</a>
						</div>
						<div class="media-body">
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<th>用户ID</th>
										<th>用户名</th>
										<th>昵称</th>
										<th>余额</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td id="userId" >&nbsp;</td>
										<td id="username">&nbsp;</td>
										<td id="nickname">&nbsp;</td>
										<td id="balance">&nbsp;</td>
									</tr>
								</tbody>
								<thead>
									<tr>
										<th>性别</th>
										<th>地址</th>
										<th>电话</th>
										<th>是否锁定</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td id="gender">&nbsp;</td>
										<td id="addr">&nbsp;</td>
										<td id="tel">&nbsp;</td>
										<td id="isLocked">&nbsp;</td>
									</tr>
								</tbody>
							</table>

							<div id="lock-div"></div>

							<div class="modal fade" id="update_div" tabindex="-1"
								role="dialog" aria-labelledby="mySmallModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<form role="form" action="${ctx}/departManage/updateCheck"
											method="POST">
											<div class="modal-header">
												<button type="button" id="close_btn" class="close"
													data-dismiss="modal">
													<span aria-hidden="true">×</span><span class="sr-only">Close</span>
												</button>
												<h4 class="modal-title">修改用户所属角色</h4>
											</div>
											<div class="modal-body">

												<div class="form-group">
													<h3>角色列表：</h3>
													<ul id="roleTree" class="ztree"></ul>
												</div>
												<div class="form-group" id="module_div">
													<h3>拥有权限：</h3>
													<ul id="permissionTree" class="ztree"></ul>
												</div>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">取消</button>
												<input type="button" id="submit_btn" class="btn btn-primary"
													value="确认修改">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var zTreeRole;
	var zTreePermission;
	var roleSetting = {
		view : {
			showLine : false
		},
		check : {
			enable : true
		},
		callback : {
			onCheck : queryPermsByRoles
		},
		data : {
			key : {
				name : "roleName",
			},
			simpleData : {
				enable : true,
				idKey : "roleId",
			}
		},
	};
	var permissionSetting = {
		view : {
			showLine : false
		},
		check : {
			enable : false
		},
		data : {
			key : {
				name : "permissionName",
			},
			simpleData : {
				enable : true,
				idKey : "permissionId",
				//pIdKey : "parentModuleId"
			}
		},
	};
	
	 $().ready(function() {	
		zTreeRole = $.fn.zTree.init($("#roleTree"), roleSetting, ${roles});
		zTreeRole.expandAll(true);	
		zTreePermission = $.fn.zTree.init($("#permissionTree"), permissionSetting, null);
		zTreePermission.expandAll(true);
		
	}) 

	$("#look_btn").click(function() {
		queryUser();
	});
	function queryUser(){
		zTreeRole.checkAllNodes(false);
		$.ajax({
			method : "GET",
			url : "${ctx}/user/manage/findUser",
			cache : false,
			data : {
				name : $("#look_input").val(),
				method : $("#look_select").val()
			},
			success : function(data) {		
				$("table td").html("&nbsp;");
				$("table tbody tr").each(function(i) {
					$(this).children("td").each(function(j) {
						var id = $(this).attr("id");
						$.each(data, function(key, value) {
							if (key == id) {
								$("#" + id).text(value);
							}
						})
					});
				});	
				if(data.isLocked){
					$("#lock-div").html("<button id='lock-btn' data-islock='false' class='btn btn-danger pull-right'>解锁用户</button>");
				}else{
					$("#lock-div").html("<button id='lock-btn' data-islock='true' class='btn btn-danger pull-right'>锁定用户</button>");
				}
				$("#lock-btn").on("click",function(){
					$.ajax({
						method : "POST",
						url : "${ctx}/user/manage/lock",
						data : {
							userId : $("#userId").text(),
							isLocked : $(this).data("islock")
						},
						dataType : "json",
						success : function(data) {
							if(data.isSuccess){
								$('#stantard-dialogBox').dialogBox({
									title : '提示',
									hasClose : true,
									content : $("#lock-btn").text() + "成功"
								});
								queryUser();					
							}else{
								$('#stantard-dialogBox').dialogBox({
									title : '提示',
									hasClose : true,
									content : data.message
								});
							}
						}
					});
				});
				$.each(data.roles, function(index, value) {
					var node = zTreeRole.getNodeByParam("roleId",
						value.roleId);
					zTreeRole.checkNode(node, true, false);
				});
					queryPermsByRoles();			
			}
		})
	}

	
	function queryPermsByRoles(){
		var temp = zTreeRole.getCheckedNodes();
		var array = new Array()
		$.each(temp, function(index, value) {
			var role = new Object();
			role.roleId = value.roleId;
			array.push(role);
		})
		console.log(JSON.stringify(array));
		$.ajax({
			method : "POST",
			url : "${ctx}/permission/findPermsByRoles",
			data : JSON.stringify(array),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data) {
				zTreePermission = $.fn.zTree.init($("#permissionTree"), permissionSetting,
						data);		
			}
		})
	}
	
	$("#submit_btn").click(function(){
		var temp = zTreeRole.getCheckedNodes();
		var array = new Array();
		$.each(temp, function(index, value) {
			array.push(value.roleId);
		})
		$.ajax({
			type : "POST",
			url : "${ctx}/user/manage/updateUserRoleCheck",
			cache : false,
			data : {
				userId :  Number($("#userId").text()),
				roleIds : array
			},
			traditional : true,
			dataType : "text",
			success : function(data) {
				$("#close_btn").trigger("click"); 
			}
		})
	})
	
	
</script>

</html>