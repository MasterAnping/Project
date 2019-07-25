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
			<h1>欢迎，这是角色管理！！！</h1>
			
			<div class="table-responsive">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>角色ID</th>
							<th>角色名称</th>
							<th>角色描述</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="role" items="${roles}">
							<tr>
								<td>${role.roleId}</td>
								<td>${role.roleName}</td>
								<td>${role.roleDesc}</td>
								<td><a href="#" class="update_btn" data-pk="${role.roleId}"
									data-toggle="modal" data-target="#update">修改</a> <a href="#"
									class="delete_btn" data-pk="${role.roleId}">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#add">新增角色</button>
			<!-- 新增角色 -->
			<div class="modal fade" id="add" tabindex="-1" role="dialog"
				aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<form role="form" action="${ctx}/role/addCheck" id="add_form"
							method="POST">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">新增角色</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label for="add_roleName">角色名称</label> <input type="text"
										class="form-control" id="add_roleName" name="roleName"
										placeholder="请输入角色名称">
								</div>
								<div class="form-group">
									<label for="add_description">描述</label> <input type="text"
										class="form-control" id="add_roleDesc" name="roleDesc"
										placeholder="请输入描述">
								</div>
								<div class="form-group">
									<ul id="add_permissionTree" class="ztree"></ul>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button id="add_submit" type="button" class="btn btn-primary">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 修改角色 -->
			<div class="modal fade" id="update" tabindex="-1" role="dialog"
				aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<form role="form" action="${ctx}/role/updateCheck"
							id="update_form" method="POST">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">修改角色</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<input type="hidden" class="form-control" id="update_roleId"
										name="roleId">
								</div>
								<div class="form-group">
									<label for="update_roleName">角色名称</label> <input type="text"
										class="form-control" id="update_roleName" name="roleName"
										placeholder="请输入角色名称">
								</div>
								<div class="form-group">
									<label for="update_description">描述</label> <input type="text"
										class="form-control" id="update_roleDesc" name="roleDesc"
										placeholder="请输入描述">
								</div>
								<div class="form-group">
									<ul id="update_permissionTree" class="ztree"></ul>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button id="update_submit" type="button" class="btn btn-primary">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	var zTreeUpdate;
	var zTreeAdd;
	var setting = {
		view : {
			showLine : false
		},
		check : {
			enable : true
		},
		data : {
			key : {
				name : "permissionName",
			},
			simpleData : {
				enable : false,
				idKey : "permissionId"
			}
		},
	};
	
	$().ready(function() {
		zTreeAdd = $.fn.zTree.init($("#add_permissionTree"), setting, ${permissions});
		zTreeAdd.expandAll(true);
		zTreeUpdate = $.fn.zTree.init($("#update_permissionTree"), setting, ${permissions});
		zTreeUpdate.expandAll(true);
	})

	$(".update_btn").click(function() {
		$("#update_form")[0].reset();
		zTreeUpdate.checkAllNodes(false);
		$.ajax({
			type : "GET",
			url : "${ctx}/role/manage/queryRole",
			data : {
				roleId : $(this).data("pk")
			},
			cache : false,
			dataType : "json",
			success : function(data) {
				$("#update_roleId").val(data.roleId);
				$("#update_roleName").val(data.roleName);
				$("#update_roleDesc").val(data.roleDesc);
				zTreeUpdate.checkAllNodes(false);
				$.each(data.permissions, function(index, value) {
					var node = zTreeUpdate.getNodeByParam("permissionId",
						value.permissionId);
					zTreeUpdate.checkNode(node, true, false);
				})		
			}
		});
	})

	$("#add_submit").click(function() {
		var checkedNodes = zTreeAdd.getCheckedNodes();
		var role = new Object();
		role.roleId = $("#add_roleId").val();
		role.roleName = $("#add_roleName").val();
		role.roleDesc = $("#add_roleDesc").val();
		var permissions = new Array();
		$.each(checkedNodes, function(index, value) {
			permissions.push(value.permissionId);
		})
		role.permissions = permissions;
		console.log(JSON.stringify(role));
		$.ajax({
			type : "POST",
			url : "${ctx}/role/manage/addCheck",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(role),		
			dataType : "json",		
			success : function(data) {
				if(data.isSuccess==true){
					location.reload();
				}else{
					$('#stantard-dialogBox').dialogBox({
						title : '提示',
						hasClose : true,
						content : data.message
					});
				}
			}
		})
	});

	$("#update_submit").click(function() {
		var checkedNodes = zTreeUpdate.getCheckedNodes();
		var role = new Object();
		role.roleId = $("#update_roleId").val();
		role.roleName = $("#update_roleName").val();
		role.roleDesc = $("#update_roleDesc").val();
		var permissions = new Array();
		$.each(checkedNodes, function(index, value) {
			permissions.push(value.permissionId);
		})
		role.permissions = permissions;
		console.log(JSON.stringify(role));
		$.ajax({
			type : "POST",
			url : "${ctx}/role/manage/updateCheck",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(role),		
			dataType : "json",		
			success : function(data) {
				if(data.isSuccess==true){
					location.reload();
				}else{
					$('#stantard-dialogBox').dialogBox({
						title : '提示',
						hasClose : true,
						content : data.message
					});
				}
			}
		})
	});

	$().ready($(".delete_btn").click(function() {
		if (confirm("是否删除该角色？")) {
			post("${ctx}/role/manage/deleteCheck", {
				roleId : $(this).data("pk")
			});
		};
	}));
</script>

</html>