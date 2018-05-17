<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目采购信息一览</title>
<jsp:include page="base.jsp"></jsp:include>
<jsp:include page="projectCheck.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
	 
	var url;
	
		$(function() {
			url='${pageContext.request.contextPath}/purchase/purchaseList.action?purchasenumber='+'${activeProject.purchasenumber}';
			
			$('#dg')
			.datagrid({
				loadFilter : pagerFilter
			})
			.datagrid(
					{
						fit : true,
						fitColumns : true,
						title : '采购清单',
						pagination : true,
						pageSize : 10,
						pageList : [ 10, 20, 30 ],
						rownumbers : true,
						fit:true,
						fitColumns:true,
						toolbar : '#tb',
						url : url,
						columns : [ [ {
							field : 'cb',
							checkbox : true
						}, //选择 
						{
							title : '编号',
							field : 'PurchaseId',
							width : 150,
							align : 'center',
							hidden : 'true'
						}, {
							title : '设备名称',
							field : 'equipmentname',
							width : 150,
							align : 'center',
							formatter: function (value, row, index) {
			                    return row.equipment.name  
			           }
						}, {
							title : '数量',
							field : 'num',
							width : 150,
							align : 'center'
						}, {
							title : '单价',
							field : 'price',
							width : 150,
							align : 'center'
						} , {
							title : '供应商名称',
							field : 'suppliername',
							width : 150,
							align : 'center',
							formatter: function (value, row, index) {
			                    return row.supplier.name  
			           }
						} ] ],
					});
			
		});


		function openUpdateDialog() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一条要编辑的数据！");
				return;
			}
			if('${currentUser.power}'!=1){
				$.messager.alert("系统提示", "只有项目负责人才能更新项目采购信息！");
			}
			
			
			var row = selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle", "信息更新");
			$('#fm').form('load', row);
			url = "${pageContext.request.contextPath}/project/saveProject.action";
		}
		
		
		function closeUpdateDialog() {
			$("#dlg").dialog("close");
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
					
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");

				}
			});
		}


		
		
	</script>
	<table id="dg">
	</table>
	<div id="tb">
		<div>
	     <a
				href="javascript:openUpdateDialog()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	
</body>
</html>