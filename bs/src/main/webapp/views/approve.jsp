<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请中项目</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
		$(function() {
			$('#dg')
					.datagrid({
						loadFilter : pagerFilter
					})
					.datagrid(
							{
								title : '申请中项目',
								pagination : true,
								pageSize : 10,
								pageList : [ 10, 20, 30 ],
								rownumbers : true,
								fit : true,
								fitColumns : false,
								toolbar : '#tb',
								url : '${pageContext.request.contextPath}/apply/applyList.action?state=0'

							});
		});

		function formatterState(value, row, index) {
			if (row.state == 0) {
				return '审批中';
			} else if (row.state == 1) {
				return '已通过审批';
			} else if (row.state == 2) {
				return '未通过审批';
			}
		}

		function searchApply() {
			$("#dg").datagrid('load', {
				"name" : $("#nameSearch").val(),

			});

		}
		
		function approveOk() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length == 0) {
				$.messager.alert("系统提示", "请选择要审批的项目！");
				return;
			}
			var strIds = [];
			for (var i = 0; i < selectedRows.length; i++) {
				strIds.push(selectedRows[i].projectreplyid);
			}
			var ids = strIds.join(",");
			$.messager
					.confirm(
							"系统提示",
							"您确认要通过这<font color=red>" + selectedRows.length
									+ "</font>个项目吗？",
							function(r) {
								if (r) {
									$
											.post(
													"${pageContext.request.contextPath}/apply/approveOk.action",
													{
														ids : ids
													},
													function(result) {
														if (result.success) {
															$.messager.alert(
																	"系统提示",
																	"审批完成，项目已通过审批！");
															$("#dg").datagrid(
																	"reload");
														} else {
															$.messager.alert(
																	"系统提示",
																	"操作失败！");
														}
													}, "json");
								}
							});

		}
		
		function approveFail() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length == 0) {
				$.messager.alert("系统提示", "请选择要审批的项目！");
				return;
			}
			var strIds = [];
			for (var i = 0; i < selectedRows.length; i++) {
				strIds.push(selectedRows[i].projectreplyid);
			}
			var ids = strIds.join(",");
			$.messager
					.confirm(
							"系统提示",
							"您确认要通过这<font color=red>" + selectedRows.length
									+ "</font>个项目吗？",
							function(r) {
								if (r) {
									$
											.post(
													"${pageContext.request.contextPath}/apply/approveFail.action",
													{
														ids : ids
													},
													function(result) {
														if (result.success) {
															$.messager.alert(
																	"系统提示",
																	"审批完成，项目未通过审批！");
															$("#dg").datagrid(
																	"reload");
														} else {
															$.messager.alert(
																	"系统提示",
																	"操作失败！");
														}
													}, "json");
								}
							});

		}
	</script>
	<table id="dg">
		<thead data-options="frozen:true">
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="projectreplyid" align="center" hidden="true"></th>
				<th field="userid" align="center" hidden="true"></th>
				<th field="name" width="20%" align="center">项目名称</th>
				<th field="overview" width="15%" align="center">项目内容</th>
				<th field="performer" width="10%" align="center">项目负责人</th>
				<th field="howmuch" width="10%" align="center">申请资金</th>
				<th field="remark" width="20%" align="center">备注</th>
				<th field="state" width="15%" align="center"
					formatter="formatterState">是否审批</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
		&nbsp;<a href="javascript:approveOk()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">通过</a>
			&nbsp;<a href="javascript:approveFail()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">不通过</a>
		</div>
	</div>
</body>
</html>