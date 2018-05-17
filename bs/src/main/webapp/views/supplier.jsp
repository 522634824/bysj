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
			<a href="javascript:openAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteSupplier()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
				<div>
				<a
				href="javascript:Suppliersatff()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">人员信息</a><a
				href="javascript:SupplierBrand()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">品牌信息</a>
				</div>
		</div>
		<div>
			&nbsp;供应商名称：&nbsp;<input id="nameSearch" class="easyui-textbox"
				size="20"  onkeydown="if(event.keyCode==13) search()" />&nbsp;
			&nbsp;<a href="javascript:search()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>

	<div id="ptb">
		<div>
			<a href="javascript:Supplier()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">供应商信息</a>
		</div>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 400px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>供应商名：</td>
					<td><input type="text" id="name" name="name" required="true" /></td>
				</tr>
				<tr>
					<td>供应商类型：</td>
					<td><input id="suppliertypeid" name="suppliertypeid"
						class="easyui-combobox" panelHeight="auto"
						data-options=" url:'${pageContext.request.contextPath}/supplier/allSupplieType.action',
                            valueField:'suppliertypeid',
                            textField:'suppliertypename'" /></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><input type="text" id="address" name="address"
						required="true" /></td>
				</tr>
				<tr>
					<td>联系方式：</td>
					<td><input type="text" id="tel" name="tel" required="true" /></td>
				</tr>
				<tr>
					<td>经营内容：</td>
					<td><input type="text" id="managementcontent"
						name="managementcontent" required="true" /></td>
				</tr>
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:save()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
	</div>

	<script type="text/javascript">
		var url;

		function Suppliersatff() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一条数据！");
				return;
			}
			var row = selectedRows[0];
			$('#dg')
					.datagrid({
						loadFilter : pagerFilter
					})
					.datagrid(
							{
								fit : true,
								fitColumns : true,
								title : '供应商人员信息',
								pagination : true,
								pageSize : 10,
								pageList : [ 10, 20, 30 ],
								rownumbers : true,
								fit:true,
								fitColumns:true,
								toolbar : '#ptb',
								url : '${pageContext.request.contextPath}/supplier/supplierstaffList.action?supplierid='
										+ row.supplierid,
								columns : [ [ {
									field : 'cb',
									checkbox : true
								}, //选择 
								{
									title : '编号',
									field : 'supplierstaffid',
									width : 150,
									align : 'center',
									hidden : 'true'
								}, {
									title : '姓名',
									field : 'name',
									width : 150,
									align : 'center'
								}, {
									title : '工号',
									field : 'num',
									width : 150,
									align : 'center'
								}, {
									title : '联系电话',
									field : 'tel',
									width : 150,
									align : 'center'
								}, {
									title : '邮箱',
									field : 'email',
									width : 150,
									align : 'center'
								}, {
									title : '备注',
									field : 'remark',
									width : 150,
									align : 'center'
								} ] ],
								onLoadSuccess : function(data) {
									$('#tb').hide();

								}
							});
		}

		function Supplier() {
			$('#dg')
					.datagrid({
						loadFilter : pagerFilter
					})
					.datagrid(
							{
								fit : true,
								fitColumns : true,
								title : '供应商信息管理',
								pagination : true,
								pageSize : 10,
								pageList : [ 10, 20, 30 ],
								rownumbers : true,
								toolbar : '#ptb',
								url : '${pageContext.request.contextPath}/supplier/supplierList.action',
								columns : [ [ {
									field : 'cb',
									checkbox : true
								}, //选择  
								{
									title : '供应商名',
									field : 'name',
									width : 150,
									align : 'center'
								}, {
									title : '地址',
									field : 'address',
									width : 150,
									align : 'center'
								}, {
									title : '联系方式',
									field : 'tel',
									width : 150,
									align : 'center'
								}, {
									title : '经营内容',
									field : 'managementcontent',
									width : 150,
									align : 'center'
								} ] ],
								onLoadSuccess : function(data) {
									$('#ptb').hide();
									$('#tb').show();
								}
							});

		}

		$(function() {
			$('#dg')
					.datagrid({
						loadFilter : pagerFilter
					})
					.datagrid(
							{
								fit : true,
								fitColumns : true,
								title : '供应商信息管理',
								pagination : true,
								pageSize : 10,
								pageList : [ 10, 20, 30 ],
								rownumbers : true,
								toolbar : '#tb',
								url : '${pageContext.request.contextPath}/supplier/supplierList.action',
								columns : [ [ {
									field : 'cb',
									checkbox : true
								}, //选择 
								{
									title : '供应商名',
									field : 'name',
									width : 150,
									align : 'center'
								}, {
									title : '地址',
									field : 'address',
									width : 150,
									align : 'center'
								}, {
									title : '联系方式',
									field : 'tel',
									width : 150,
									align : 'center'
								}, {
									title : '经营内容',
									field : 'managementcontent',
									width : 150,
									align : 'center'
								} ] ]
							});
		});

		function openAddDialog() {
			$("#dlg").dialog("open").dialog("setTitle", "添加供应商");
			url = "${pageContext.request.contextPath}/supplier/saveSupplier.action";

		}

		function closeDialog() {
			$("#dlg").dialog("close");
			$("#branddlg").dialog("close");
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

		function deleteSupplier() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length == 0) {
				$.messager.alert("系统提示", "请选择要删除的数据！");
				return;
			}
			var strIds = [];
			for (var i = 0; i < selectedRows.length; i++) {
				strIds.push(selectedRows[i].supplierid);
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
													"${pageContext.request.contextPath}/supplier/deleteSupplier.action",
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
			url = "${pageContext.request.contextPath}/supplier/saveSupplier.action?supplierid="
					+ row.supplierid;
		}

		function resetValue() {
			$("#name").val("");
			$("#suppliertypeid").val("");
			$("#address").val("");
			$("#tel").val("");
			$("#managementcontent").val("");
			
		}
		
		
		function search() {
			$("#dg").datagrid('load', {
				"name" : $("#nameSearch").val(),
			});
			

		}
		
				
	</script>
	
	<!-- 供应商品牌 -->
	<script type="text/javascript">
	function SupplierBrand(){
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条数据！");
			return;
		}
		var row = selectedRows[0];
		$('#dg')
		.datagrid({
			loadFilter : pagerFilter
		})
		.datagrid(
				{
					fit : true,
					fitColumns : true,
					title : '供应商品牌信息',
					pagination : true,
					pageSize : 10,
					pageList : [ 10, 20, 30 ],
					rownumbers : true,
					toolbar : '#tb',
					url : '${pageContext.request.contextPath}/supplier/SupplierBrand.action?supplierid='+row.supplierid,
					columns : [ [ {
						field : 'cb',
						checkbox : true
					}, //选择 
					{
						title : '编号',
						field : 'supplierbrandid',
						width : 150,
						align : 'center',
						hidden : 'true'
					}, {
						title : '品牌名称',
						field : 'name',
						width : 150,
						align : 'center'
					},{
						title : '供应商名称',
						field : 'suppliername',
						width : 150,
						align : 'center',
							formatter : function(value, row, index) {
								return row.supplier.name;
							}
					}, ] ],
					onLoadSuccess : function(data) {
						$('#tb').hide();
						$('#ptb').show();
					}
				});
	}
	
	
	</script>
</body>
</html>