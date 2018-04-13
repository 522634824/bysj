<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>供应商信息管理</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<table id="dg">
		<thead data-options="frozen:true">
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="supplierid" width="10%" align="center" hidden="true">编号</th>
				<th field="name" width="150" align="center" >供应商名</th>
				<th field="address" width="200" align="center">地址</th>
				<th field="content" width="150" align="center">主营业务</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:delete()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;供应商名：&nbsp;<input id="Search" class="easyui-textbox" size="20"
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
					<td>供应商名：</td>
					<td><input type="text" id="name" name="name"
						 required="true" /></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><input type="text" id="address" name="address"
						 required="true" /></td>
				</tr>
				<tr>
					<td>主营业务：</td>
					<td><input type="text" id="content" name="content"
						 required="true" /></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:save()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeAddDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

	<script type="text/javascript">
		$(function() {
			$('#dg').datagrid({
				loadFilter : pagerFilter
			}).datagrid({
			    height:400,
				title : '供应商信息管理',
				pagination : true,
				pageSize : 10,
				pageList : [ 10, 20, 30 ],
				rownumbers : true,
				toolbar : '#tb',
				url : '${pageContext.request.contextPath}/supplierList.action'
				 
			});
		});
		var url;
		function openAddDialog() {
			$("#dlg").dialog("open").dialog("setTitle", "添加供应商");
			url = "${pageContext.request.contextPath}/addSupplier.action";

		}

		function closeAddDialog() {
			$("#dlg").dialog("close");
			resetValue();
		}

		function save() {
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

		function deletesupplier() {
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

		function openModifyDialog() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一条要编辑的数据！");
				return;
			}
			var row = selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle", "编辑供应商信息");
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