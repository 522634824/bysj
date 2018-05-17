<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目日程</title>
<jsp:include page="base.jsp"></jsp:include>
<jsp:include page="projectCheck.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
		var url;

		$(function() {
			url = '${pageContext.request.contextPath}/fundsource/fundsourceList.action?projectid='
					+ ${activeProject.projectid};
			$('#dg').datagrid({
				loadFilter : pagerFilter
			}).datagrid({
				fit : true,
				fitColumns : true,
				title : '资金来源',
				pagination : true,
				pageSize : 10,
				pageList : [ 10, 20, 30 ],
				rownumbers : true,
				toolbar : '#tb',
				url : url,
				columns : [ [ {
					field : 'cb',
					checkbox : true
				}, //选择 
				{
					title : '编号',
					field : 'projectfundSourceid',
					width : 150,
					align : 'center',
					hidden : 'true'
				}, {
					title : '来源名称',
					field : 'name',
					width : 150,
					align : 'center',

				}, {
					title : '资金金额',
					field : 'howmuch',
					width : 150,
					align : 'center'
				}, {
					title : '备注',
					field : 'remark',
					width : 150,
					align : 'center'
				} ] ],
			});

		});
		
		
		function openAddDialog() {
			$("#dlg").dialog("open").dialog("setTitle", "项目资金来源");
			url = "${pageContext.request.contextPath}/fundsource/saveFundsource.action";

		}
		function updateFundsource(){
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一条要编辑的数据！");
				return;
			}
			var row = selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle", "项目资金来源");
			$('#fm').form('load', row);
			url = "${pageContext.request.contextPath}/fundsource/saveFundsource.action?projectfundsourceid=" + row.projectfundsourceid;
			
		}
		
		
		
		function closeDialog() {
			$("#dlg").dialog("close");
			resetValue();
		}

		function save() {
			$("#fm").form("submit", {
				url : url,
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(data) {
					var result = eval('(' + data + ')');
					if(result.success){
						$.messager.alert("系统提示", "保存成功");
					}else{
						$.messager.alert("系统提示", "保存失败");
					}
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");

				}
			});
		}

		function deleteFundsource() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length == 0) {
				$.messager.alert("系统提示", "请选择要删除的数据！");
				return;
			}
			var strIds = [];
			for (var i = 0; i < selectedRows.length; i++) {
				strIds.push(selectedRows[i].projectfundsourceid);
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
													"${pageContext.request.contextPath}/fundsource/deleteFundsource.action",
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
		
		function resetValue() {
			$("#name").val("");
			$("#howmuch").val("");
			$("#remark").val("");
			
		}
	</script>
	
	<table id="dg"></table>
	
	<div id="tb">
		<div>
			<a href="javascript:openAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> 
			<a
				href="javascript:updateFundsource()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a>
			<a
				href="javascript:deleteFundsource()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	
	
	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 400px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>来源名称：</td>
					<td><input type="text" id="name" name="name"
						class="easyui-validatebox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>资金金额：</td>
					<td><input type="text" id="howmuch" name="howmuch"
						class="easyui-validatebox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td><textarea type="text" id="remark" name="remark" required="true" ></textarea>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:save()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	
</body>
</html>