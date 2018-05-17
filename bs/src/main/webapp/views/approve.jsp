<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目审批</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
	var url;
		$(function() {
			if('${currentUser.power}'==2){
				url='${pageContext.request.contextPath}/apply/applyList.action?state=0';
			}
			if('${currentUser.power}'==3){
				url='${pageContext.request.contextPath}/apply/applyList.action?state=1';
			}
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
								fitColumns : true,
								toolbar : '#tb',
								url : url

							});
		});

		function formatterState(value, row, index) {
			if (row.state == 0) {
				return '审批中';
			} else if (row.state == 1) {
				return '已通过部门审批';
			} else if (row.state == 2) {
				return '未通过部门审批';
			}else if (row.state == 3) {
				return '已通过领导审批';
			}else if (row.state == 4) {
				return '未通过领导审批';
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
		
		function openPDF(){
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一个已通过审批的项目！！");
				return;
			}
			var row = selectedRows[0];
			window.open("${pageContext.request.contextPath}/pdf/showPDF.action?projectreplyid="+row.projectreplyid);
		
			
		}
		
		function formatmore(val,row){
			if (val){
				return '<span title="' + val + '">' + val + '</span>';
			    } else 
			{
			    return val;
			    }
			}
	</script>
	<table id="dg">
		<thead data-options="frozen:true">
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="userid" align="center" hidden="true"></th>
				<th field="projectreplyid" width="100" align="center">项目编号</th>
				<th field="name" width="150" align="center" formatter="formatmore">项目名称</th>
				<th field="overview" width="150" align="center" formatter="formatmore">项目内容</th>
				<th field="performer" width="80" align="center">项目负责人</th>
				<th field="howmuch" width="80" align="center">申请资金</th>
				<th field="submitdate" width="80" align="center">提交时间</th>
				<th field="remark" width="180" align="center">备注</th>
				<th field="state" width="120" align="center"
					formatter="formatterState">是否审批</th>
			</tr>
		</thead>
	</table>
	<div id="tb">

		<div>
			&nbsp;<a href="javascript:openPDF()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">打开项目计划书</a> &nbsp;<a
				href="javascript:approveOk()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">通过</a> &nbsp;<a
				href="javascript:approveFail()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">不通过</a>
		</div>
	</div>
</body>
</html>