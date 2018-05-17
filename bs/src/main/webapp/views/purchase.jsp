<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目采购</title>
<jsp:include page="base.jsp"></jsp:include>
<jsp:include page="projectCheck.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<table id="dg"></table>
	<div id="tb">
		<div>
			<a href="javascript:openDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">采购</a>
		</div>
	<!-- <div>
			&nbsp;供应商名：&nbsp;<input id="Search" class="easyui-textbox" size="20"
				onkeydown="if(event.keyCode==13) searchUser()" />&nbsp; <a
				href="javascript:searchUser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div> -->
	</div>


	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 400px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>采购单号:</td>
					<td><input type="text" id="purchasenumber" name="purchasenumber" value="${activeProject.purchasenumber} " readonly="readonly" required="true" />
				</tr>
				<tr>
					<td>网络设备名称:</td>
					<td><input type="text" id="name" name="name" required="true" />
					<td><input type="hidden" id="equipmentid" name="equipmentid" required="true" readonly="readonly" />
				<input type="hidden" id="supplierid" name="supplierid"
						required="true" readonly="readonly" />
				</tr>
				<tr>
					<td>数量:</td>
					<td><input type="text" id="num" name="num"
						required="true" />
				</tr>
				<tr>
					<td>价格:</td>
					<td><input type="text" id="price" name="price"
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
								title : '可选网络设备一览',
								pagination : true,
								pageSize : 10,
								pageList : [ 10, 20, 30 ],
								rownumbers : true,
								fit : true,
								fitColumns : true,
								toolbar : '#tb',
								url : '${pageContext.request.contextPath}/equipment/allEquipment.action',
								columns : [ [ {
									field : 'cb',
									checkbox : true
								}, //选择 
								{
									title : '设备名称',
									field : 'name',
									width : '150',
									align : 'center'
								}, {
									title : '品牌',
									field : 'supplierbrandname',
									width : '150',
									align : 'center',
									formatter: function (value, row, index) {
						                    return row.supplierbrand.name  
						           }
								}, {
									title : '型号',
									field : 'model',
									width : '150',
									align : 'center'
								}, {
									title : '供应商id',
									field : 'supplierid',
									width : '150',
									align : 'center',
									hidden: true,
									formatter: function (value, row, index) {
						                    return row.supplier.supplierid  
									}
								}
								, {
									title : '供应商',
									field : 'suppliername',
									width : '100',
									align : 'center',
									formatter: function (value, row, index) {
						                    return row.supplier.name  
									}
						        }, {
									title : '备注',
									field : 'remark',
									width : '100',
									align : 'center'
								}, ] ],
							});

		});

		function openDialog() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一个网络设备！");
				return;
			}
			var row = selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle", "填写采购单");
			$('#fm').form('load', row.supplier);
			$('#fm').form('load', row);
			url = "${pageContext.request.contextPath}/purchase/savePurchase.action";
		}

		function saveEquipment() {
			$("#fm").form("submit", {
				url : url,
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(data) {
					var result = eval('(' + data + ')');
					if(result.success){
						$.messager.alert("系统提示", "加入采购清单成功！ ");
					}else{
						$.messager.alert("系统提示", "加入采购清单失败！");
					}	
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");

				}
			});
		}

		function closeDialog() {
			$("#dlg").dialog("close");
			resetValue();
		}

		function resetValue() {
			$("#purchasenumber").val("");
			$("#num").val("");
			$("#price").val("");
		}
	</script>
</body>
</html>