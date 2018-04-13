<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息管理</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff" >
	<script type="text/javascript">
		$(function() {
			$('#dg').datagrid({
				loadFilter : pagerFilter
			}).datagrid({
				title : '用户信息管理',
				pagination : true,
				pageSize : 10,
				pageList : [ 10, 20, 30 ],
				rownumbers : true,
				fit:true,
				fitColumns:true,
				toolbar : '#tb',
				url : '${pageContext.request.contextPath}/userlist.action'
				 
			});
		});
		
		function formatterSex(value , row , index){  
	        if(row.sex == 1){  
	            return '男' ;  
	        } else if( row.sex == 0){  
	            return '女' ;   
	        }  
	} 
		function formatterPower(value , row , index){  
	        if(row.power == 1){  
	            return '管理员' ;  
	        } else if( row.power == 0){  
	            return '用户' ;   
	        }  
	} 
	</script>
	<table id="dg" >
		<thead data-options="frozen:true">
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" align="center" hidden="true">编号</th>
				<th field="userid" align="center" >工号</th>
				<th field="username"  align="center">用户名</th>
				<th field="name" align="center">真实姓名</th>
				<th field="sex" align="center" formatter="formatterSex">性别</th>
				<th field="age"  align="center">年龄</th>
				<th field="tel"  align="center">联系电话</th>
				<th field="power" width="100" align="center"formatter="formatterPower">权限</th>
				
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openUserAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openUserModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteUser()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;用户名：&nbsp;<input id="userSearch" class="easyui-textbox" size="20"
				onkeydown="if(event.keyCode==13) searchUser()" />&nbsp; <a
				href="javascript:searchUser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 400px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>用户名：</td>
					<td><input type="text" id="username" name="username"
						class="easyui-validatebox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="text" id="password" name="password"
						class="easyui-validatebox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>真实姓名：：</td>
					<td><input type="text" id="name" name="name" required="true" />
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="radio" id="sex" name="sex" required="true"
						value="1" />男 <input type="radio" id="sex" name="sex"
						required="true" value="0" />女
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type="text" id="age" name="age" required="true" />
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input type="text" id="tel" name="tel" required="true" />
				</tr>
				<tr>
					<td>权限：</td>
					<td><select id="power" name="power" class="easyui-combobox" panelHeight="auto"
						required="true" da>
							<option value="1">管理员</option>
							<option value="0">用户</option>
					</select>&nbsp;<font color="red">*</font></td>
				</tr>
			</table>
		</form>
	</div>

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