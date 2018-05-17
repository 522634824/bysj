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
			url='${pageContext.request.contextPath}/schedule/scheduleList.action?projectid='+${activeProject.projectid};
			$('#dg')
			.datagrid({
				loadFilter : pagerFilter
			})
			.datagrid(
					{
						fit : true,
						fitColumns : true,
						title : '项目日程',
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
							field : 'scheduleid',
							width : 150,
							align : 'center',
							hidden : 'true'
						}, {
							title : '工作内容',
							field : 'overview',
							width : 150,
							align : 'center',
							
						}, {
							title : '计划时间',
							field : 'plandate',
							width : 150,
							align : 'center'
						}, {
							title : '实际时间',
							field : 'realdate',
							width : 150,
							align : 'center'
						} , {
							title : '工作情况',
							field : 'state',
							width : 150,
							align : 'center',
							formatter: function (value, row, index) {
			                    if(row.state==0){
			                    	return "按时完成";
			                    }
			                    if(row.state==1){
			                    	return "逾期完成";
			                    }
			                    
			           }
						} ] ],
					});
			
		});

		
		function deleteSchedule() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length == 0) {
				$.messager.alert("系统提示", "请选择要删除的数据！");
				return;
			}
			var strIds = [];
			for (var i = 0; i < selectedRows.length; i++) {
				strIds.push(selectedRows[i].scheduleid);
			}
			var ids = strIds.join(",");
			$.messager
					.confirm(
							"系统提示",
							"您确认要删除这<font color=red>" + selectedRows.length
									+ "</font>条记录吗？",
							function(r) {
								if (r) {
									$
											.post(
													"${pageContext.request.contextPath}/schedule/deleteSchedule.action",
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
		
		

		function openAddDialog(){
			$("#dlg").dialog("open").dialog("setTitle", "添加日程信息");
			url = "${pageContext.request.contextPath}/schedule/addSchedule.action";
		}
		
		
		function openUpdateDialog(){
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一条要编辑的数据！");
				return;
			}
			var row = selectedRows[0];
			$("#dlg2").dialog("open").dialog("setTitle", "完成情况");
			$('#fm2').form('load', row);
			url = "${pageContext.request.contextPath}/schedule/updateSchedule.action?scheduleid=" + row.scheduleid;
			
		}
		
		function save2() {
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
					 closeDialog();
					$("#dg").datagrid("reload");

				}
			});
		}

		function save() {
			$("#fm2").form("submit", {
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
					 closeDialog();
					$("#dg").datagrid("reload");

				}
			});
		}
		

		function closeDialog() {
			$("#dlg").dialog("close");
			$("#dlg2").dialog("close");
			resetValue();
		}
		
		function resetValue() {
			$("#overview").val("");
			$('#plandate').combo('setText',''); 
			$('#realdate').combo('setText',''); 
			$("#state").val("");
		}
		
		
	</script>
	<table id="dg">
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> 
				<a
				href="javascript:openUpdateDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a>
				<a
				href="javascript:deleteSchedule()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog"
		style="width: 300px; height: 300px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>工作内容：</td>
					<td>
					<input type="text" id="overview" name="overview"
						class="easyui-validatebox" required="true""/>
					<input type="hidden" id="projectid" name="projectid"
						class="easyui-validatebox" value="${activeProject.projectid} " required="true" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>计划时间：</td>
					<td><input id="plandate" name="plandate" type="text" class="easyui-datebox" required="required"></td>
				</tr>
	
				
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:save()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
		
	</div>
	
	
	<div id="dlg2" class="easyui-dialog"
		style="width: 300px; height: 300px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm2" method="post">
			<table cellspacing="8px">
			
			<tr>
					<td>计划时间：</td>
					<td><input id="plandate" name="plandate" type="text" class="easyui-datebox" required="required" readonly="readonly"></td>
				</tr>
				<tr>
					<td>实际时间：</td>
					<td><input id="realdate" name="realdate" type="text" class="easyui-datebox" required="required"></td>
				</tr>
				<tr>
				<td>工作情况：</td>
				<td>
				<select id="state"name="state" class="easyui-combobox" panelHeight="auto" style = "width:120px;"
						required="required">
						<option value="-1" selected="selected">请选择</option>
							<option value="0">按时完成</option>
							<option value="1">逾期完成</option>
					
					</select>
				</td>
				</tr>
				
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:save2()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
		
	</div>
	
	
	
	
	
</body>
</html>