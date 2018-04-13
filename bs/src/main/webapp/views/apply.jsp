<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请中的项目</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
		$(function() {
			$('#dg').datagrid({
				loadFilter : pagerFilter
			}).datagrid({
			    height:400,
				title : '申请中的项目',
				pagination : true,
				pageSize : 10,
				pageList : [ 10, 20, 30 ],
				rownumbers : true,
				toolbar : '#tb',
				url : '${pageContext.request.contextPath}/isapply.action'
				 
			});
		});
		
		
		
	</script>
	<table id="dg">
		<thead data-options="frozen:true">
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="10%" align="center" hidden="true">编号</th>
				<th field="userid" width="150" align="center" >工号</th>
				<th field="username" width="200" align="center">用户名</th>
				<th field="name" width="150" align="center">真实姓名</th>
				<th field="sex" width="150" align="center" formatter="formatterSex">性别</th>
				<th field="age" width="150" align="center">年龄</th>
				<th field="tel" width="150" align="center">联系电话</th>
				<th field="power" width="150" align="center"formatter="formatterPower">权限</th>
				
			</tr>
		</thead>
	</table>

	<div id="dlg-buttons">
		<a href="javascript:saveUser()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeUserAddDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

	<script type="text/javascript">
		var url;

		function openUserAddDialog() {
			$("#dlg").dialog("open").dialog("setTitle", "添加用户信息");
			url = "${pageContext.request.contextPath}/saveUser.action";

		}

		function closeUserAddDialog() {
			$("#dlg").dialog("close");
			resetValue();
		}

		function saveUser() {
			$("#fm").form("submit", {
				url : url,
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(result) {
					$.messager.alert("系统提示", "保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");

				}
			});
		}

		function deleteUser() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length == 0) {
				$.messager.alert("系统提示", "请选择要删除的数据！");
				return;
			}
			var strIds = [];
			for (var i = 0; i < selectedRows.length; i++) {
				strIds.push(selectedRows[i].userid);
			}
			var ids = strIds.join(",");
			$.messager
					.confirm(
							"系统提示",
							"您确认要删除这<font color=red>" + selectedRows.length
									+ "</font>条数据吗？",
							function(r) {
								if (r) {
									$
											.post(
													"${pageContext.request.contextPath}/deleteUser.action",
													{
														ids : ids
													},
													function(result) {
														if (result.success) {
															$.messager.alert(
																	"系统提示",
																	"数据已成功删除！");
															$("#dg").datagrid(
																	"reload");
														} else {
															$.messager.alert(
																	"系统提示",
																	"数据删除失败！");
														}
													}, "json");
								}
							});

		}

		function openUserModifyDialog() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一条要编辑的数据！");
				return;
			}
			var row = selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle", "编辑用户信息");
			$('#fm').form('load', row);
			$("#password").val("******");
			url = "${pageContext.request.contextPath}/saveUser.action?userid=" + row.userid;
		}
		
		
		function searchUser(){
			 $("#dg").datagrid('load', {
	                "username": $("#userSearch").val()
	            });
}

		function resetValue() {
			$("#username").val("");
			$("#password").val("");
		}
	</script>
</body>
</html>