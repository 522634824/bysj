<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网咯设备信息管理</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<table id="dg"></table>
	<div id="tb">
		<div>
			<a href="javascript:openAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteSupplier()" class="easyui-linkbutton"
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
					<td>网络设备类型:</td>
					<td><input id="EquipmentRootList" name="equipmentrootid"
						class="easyui-combobox" panelHeight="auto"
						data-options=" url:'${pageContext.request.contextPath}/equipment/EquipmentRootList.action',
                            valueField:'equipmentrootid',
                            textField:'name',
                            onSelect:function(data){
                            $('#EquipmentClassList').combobox('clear');
                            $('#EquipmentClassList').combobox('reload','${pageContext.request.contextPath}/equipment/EquipmentClassList.action?equipmentrootid='+data.equipmentrootid)}" />
					</td>
				</tr>
				<tr>
					<td>种类:：</td>
					<td><input id="EquipmentClassList" name="equipmentclassid"
						class="easyui-combobox" panelHeight="auto"
						data-options=" valueField:'equipmentclassid', textField:'name'" />
				</tr>

				<tr>
					<td>供应商：</td>
					<td><input id="supplierList" name="supplierid"
						class="easyui-combobox" panelHeight="auto"
						data-options="url:'${pageContext.request.contextPath}/supplier/allSupplier.action',
						valueField:'supplierid', textField:'name',
						onSelect:function(data){
						 $('#SupplierBrandList').combobox('clear');
                            $('#SupplierBrandList').combobox('reload','${pageContext.request.contextPath}/supplier/SupplierBrandList.action?supplierid='+data.supplierid)}
						" />
				</tr>
				<tr>
					<td>品牌：</td>
					<td><input id="SupplierBrandList" name="supplierbrandid"
						class="easyui-combobox" panelHeight="auto"
						data-options="valueField:'supplierbrandid', textField:'name'" />
				</tr>
				<tr>
					<td>型号:</td>
					<td><input type="text" id="model" name="model" required="true" />
				</tr>
				<tr>
					<td>名称:</td>
					<td><input type="text" id="name" name="name" required="true" />
				</tr>
				<tr>
					<td>备注:</td>
					<td><input type="text" id="remark" name="remark"
						required="true" />
				</tr>
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:saveEquipment()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
	</div>


	<script type="text/javascript">
		var url;

		$(function() {
			$('#dg')
					.datagrid({
						loadFilter : pagerFilter
					})
					.datagrid(
							{
								title : '设备信息管理',
								pagination : true,
								pageSize : 10,
								pageList : [ 10, 20, 30 ],
								rownumbers : true,
								fit : true,
								fitColumns : false,
								toolbar : '#tb',
								url : '${pageContext.request.contextPath}/equipment/allEquipment.action',
								columns : [ [ {
									field : 'cb',
									checkbox : true
								}, //选择 
								{
									title : '名称',
									field : 'name',
									width : '50%',
									align : 'center'
								}, {
									title : '备注',
									field : 'remark',
									width : '50%',
									align : 'center'
								}, ] ],
							});

		});

		function openAddDialog() {
			$("#dlg").dialog("open").dialog("setTitle", "添加网络设备信息");
			url = "${pageContext.request.contextPath}/equipment/saveEquipment.action";
		}

		function saveEquipment() {
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

		function openModifyDialog() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一条要编辑的数据！");
				return;
			}
			var row = selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle", "编辑网络设备信息");
			$('#fm').form('load', row);
			url = "${pageContext.request.contextPath}/equipment/saveEquipment.action?equipmentid="
					+ row.equipmentid;
		}
		
		function deleteSupplier() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length == 0) {
				$.messager.alert("系统提示", "请选择要删除的数据！");
				return;
			}
			var strIds = [];
			for (var i = 0; i < selectedRows.length; i++) {
				strIds.push(selectedRows[i].equipmentid);
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
													"${pageContext.request.contextPath}/equipment/deleteEquipment.action",
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
			$("#equipmentrootid").val("");
			$("#equipmentclassid").val("");
			$("#supplierid").val("");
			$("#supplierbrandid").val("");
			$("#model").val("");
			$("#name").val("");
			$("#remark").val("");
		}
	</script>
</body>
</html>