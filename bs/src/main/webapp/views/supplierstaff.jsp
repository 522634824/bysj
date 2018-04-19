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

	<table id="dg"></table>
	
	<div id="tb">
		<div>
			<a href="javascript:openAddStaffDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openModifyStaffDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteSupplierStaff()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 400px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>姓名：</td>
					<td><input type="text" id="name" name="name"
						 required="true" />
						 </td>
				</tr>
				<tr>
					<td>工号：</td>
					<td><input type="text" id="num" name="num"
						 required="true" />
				</tr>
				
				<tr>
					<td>单位：</td>
					<td><input id="supplierid" name="supplierid" class="easyui-combobox" panelHeight="auto"
						data-options=" url:'${pageContext.request.contextPath}/supplier/allSupplier.action',
                            valueField:'supplierid',
                            textField:'name'" /></td>
                            
				</tr>
				
				<tr>
					<td>邮箱：</td>
					<td><input type="text" id="email" name="email"
						 required="true" /></td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input type="text" id="tel" name="tel"
						 required="true" /></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td><input type="text" id="remark" name="remark"
						 required="true" /></td>
				</tr>
			</table>
		</form>
	<div id="dlg-buttons">
		<a href="javascript:staffSave()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeStaffDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</div>

	<script type="text/javascript">
	var url;
	$(function() {
		$('#dg').datagrid({
			loadFilter : pagerFilter
		}).datagrid({
		    fit:true,
		    fitColumns:true,
			title : '供应商人员信息',
			pagination : true,
			pageSize : 10,
			pageList : [ 10, 20, 30 ],
			rownumbers : true,
			toolbar : '#tb',
			url : '${pageContext.request.contextPath}/supplier/supplierstaffList.action?supplierid='+0,
			 columns: [[  
		            { field: 'cb', checkbox: true },   //选择 
		            { title: '编号', field: 'supplierstaffid', width: 150,align:'center',hidden:'true'}, 
		            { title: '单位编号', field: 'supplierid', width: 150,align:'center',hidden:'true'},
		             { title: '姓名', field: 'name', width: 150,align:'center'},  
		             { title: '工号', field: 'num', width: 150,align:'center' },
		             { title: '联系电话', field: 'tel', width: 150,align:'center' },  
		             { title: '邮箱', field: 'email', width: 150,align:'center' },
		             { title: '备注', field: 'remark', width: 150,align:'center' }
		        ]],
		});
	});
	
	function deleteSupplierStaff(){
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].supplierstaffid);
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
												"${pageContext.request.contextPath}/supplier/deleteSupplierstaff.action",
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
	
	

	function openAddStaffDialog(){
		$("#dlg").dialog("open").dialog("setTitle", "添加人员信息");
		url = "${pageContext.request.contextPath}/supplier/saveSupplierstaff.action";

	}
	
	function openModifyStaffDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "编辑供应商信息");
		$('#fm').form('load', row);
		url = "${pageContext.request.contextPath}/supplier/saveSupplierstaff.action?supplierstaffid=" + row.supplierstaffid;
	}
	
	
	function closeStaffDialog() {
		$("#dlg").dialog("close");
		resetstaffValue();
	}

	
	
	function staffSave() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				$.messager.alert("系统提示", "保存成功");
				resetstaffValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
				
			}
		});
	}
	
	function resetstaffValue(){
		$("#name").val("");
		$("#email").val("");
		$("#num").val("");
		$("#supplierid").val("");
		$("#tel").val("");
		$("#remark").val("");
	}


		
	</script>
</body>
</html>