<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目</title>
<jsp:include page="base.jsp"></jsp:include>
<jsp:include page="projectCheck.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
	var url;
	
		$(function() {
			url='${pageContext.request.contextPath}/team/teamList.action?projectid='+${activeProject.projectid};
			$('#dg')
			.datagrid({
				loadFilter : pagerFilter
			})
			.datagrid(
					{
						fit : true,
						fitColumns : true,
						title : '成员管理',
						pagination : true,
						pageSize : 10,
						pageList : [ 10, 20, 30 ],
						rownumbers : true,
						fit : true,
						fitColumns : true,
						toolbar : '#tb',
						url : url,
						columns : [ [ {
							field : 'cb',
							checkbox : true
						}, //选择 
						{
							title : '编号',
							field : 'teamid',
							width : 150,
							align : 'center',
							hidden : 'true'
						}, {
							title : '项目编号',
							field : 'projectid',
							width : 150,
							align : 'center',
							hidden : 'true',
						}, {
							title : '姓名',
							field : 'name',
							width : 150,
							align : 'center'
						}, {
							title : '联系方式',
							field : 'tel',
							width : 150,
							align : 'center'
						}, {
							title : '工作内容',
							field : 'remark',
							width : 150,
							align : 'center'
						} ] ],
					});
		});

		function openAddTeam(){
			$("#dlg").dialog("open").dialog("setTitle", "添加成员信息");
			url = "${pageContext.request.contextPath}/team/saveTeam.action";
		}
		
		function saveTeam() {
			$("#fm").form("submit", {
				url : url,
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(data) {
					var result = eval('(' + data + ')');
					if(result.success){
						$.messager.alert("系统提示", "保存成功！");
					}else{
						$.messager.alert("系统提示", "保存失败！");
					}
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");

				}
			});
		}
		
		function deleteTeam() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length == 0) {
				$.messager.alert("系统提示", "请选择要删除的数据！");
				return;
			}
			var strIds = [];
			for (var i = 0; i < selectedRows.length; i++) {
				strIds.push(selectedRows[i].teamid);
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
													"${pageContext.request.contextPath}/team/deleteTeam.action",
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
		

		function closeDialog() {
			$("#dlg").dialog("close");
			resetValue();
		}
		
		function resetValue() {
			$("#name").val("");
			$("#tel").val("");
			$("#remark").val("");
			
		}
		
	</script>
	<table id="dg">
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openAddTeam()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:deleteTeam()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	
	
	<div id="dlg" class="easyui-dialog"
		style="width: 300px; height: 300px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>项目编号：</td>
					<td><input type="text" id="projectid" name="projectid"
						class="easyui-validatebox" value="${activeProject.projectid} " required="true" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>成员名：</td>
					<td><input type="text" id="name" name="name"
						class="easyui-validatebox" required="true""/></td>
				</tr>
				<tr>
					<td>联系方式：</td>
					<td><input type="text" id="tel" name="tel" required="true" />
				</tr>
				<tr>
					<td>工作内容：</td>
					<td><textarea id="remark" name="remark" required="true" >
					</textarea></td>
				</tr>
	
				
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:saveTeam()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
		
	</div>
</body>
</html>