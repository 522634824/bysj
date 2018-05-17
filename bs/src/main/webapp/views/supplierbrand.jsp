<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>供应商品牌信息管理</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">

	<table id="dg"></table>

	<div id="tb">
		<div>
			<a href="javascript:openBrandDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a>  <a
				href="javascript:deleteSupplierBrand()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;供应商名称：&nbsp;<input id="nameSearch" class="easyui-textbox"
				size="20"  onkeydown="if(event.keyCode==13) search()" />&nbsp;
			&nbsp;<a href="javascript:search()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
<div id="dlg" class="easyui-dialog"
		style="width: 250px; height: 250px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
		<table>
		<tr>
					<td>供应商：</td>
					<td><input id="supplierList" name="supplierid"
						class="easyui-combobox" panelHeight="auto"
						data-options="url:'${pageContext.request.contextPath}/supplier/allSupplier.action',
						valueField:'supplierid', textField:'name'" />
				</tr>
		
				<tr>
					<td>品牌：</td>
					<td><input type="text" id="name"
						name="name" required="true" /></td>
				</tr>
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:saveBrand()" class="easyui-linkbutton"
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
						fit : true,
						fitColumns : true,
						title : '供应商品牌信息',
						pagination : true,
						pageSize : 10,
						pageList : [ 10, 20, 30 ],
						rownumbers : true,
						toolbar : '#tb',
						url : '${pageContext.request.contextPath}/supplier/SupplierBrand.action',
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
					});
			
		});

		
		
		
		function openBrandDialog() {
			$("#dlg").dialog("open").dialog("setTitle", "添加品牌");
			url = "${pageContext.request.contextPath}/supplier/saveSupplierBrand.action";
		}


		function saveBrand() {
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

		function deleteSupplierBrand() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length == 0) {
				$.messager.alert("系统提示", "请选择要删除的数据！");
				return;
			}
			var strIds = [];
			for (var i = 0; i < selectedRows.length; i++) {
				strIds.push(selectedRows[i].supplierbrandid);
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
													"${pageContext.request.contextPath}/supplier/deleteSupplierBrand.action",
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
			
			$("#supplierid").val("");
			$("#name").val("");
			
		}
		
		function closeDialog() {
			$("#dlg").dialog("close");
			resetValue();
		}
		</script>
</body>
</html>