<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目信息</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
	var url;
		$(function(){
			projectList(); 
			
		}
				);

		function projectList() {
			if('${currentUser.power}'==0){
				url='${pageContext.request.contextPath}/project/projectList.action';
			}
			if('${currentUser.power}'==1){
				url='${pageContext.request.contextPath}/project/projectList.action?userid=${currentUser.userid }';
			}
			if('${currentUser.power}'==2){
				url='${pageContext.request.contextPath}/project/projectList.action';
			}
			if('${currentUser.power}'==3){
				url='${pageContext.request.contextPath}/project/projectList.action';
			}			
			$('#dg')
					.datagrid({
						loadFilter : pagerFilter
					})
					.datagrid(
							{
								title : '项目信息',
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
									field : 'projectid',
									width : 150,
									align : 'center',
								}, //选择 
								{
									title : '负责人编号',
									field : 'userid',
									width : 150,
									align : 'center',
									hidden : 'true'
								}, {
									title : '项目名称',
									field : 'name',
									width : 150,
									align : 'center'
								}, {
									title : '项目内容',
									field : 'overview',
									width : 150,
									align : 'center'
								}, {
									title : '项目负责人',
									field : 'performer',
									width : 150,
									align : 'center'
								}, {
									title : '采购编号',
									field : 'purchasenumber',
									width : 150,
									align : 'center'
								}, {
									title : '合同编号',
									field : 'contractcode',
									width : 150,
									align : 'center'
								}, {
									title : '项目开启时间',
									field : 'startdate',
									width : 150,
									align : 'center'
								}, {
									title : '项目完成时间',
									field : 'completedate',
									width : 150,
									align : 'center'
								}, {
									title : '进度',
									field : 'state',
									width : 150,
									align : 'center',
									formatter : function(value, row, index) {
										if (row.state == 0) {
											return '进行中';
										} else if (row.state == 1) {
											return '已完成';
										}
									}
								}

								] ],
								onLoadSuccess : function(data) {
									$('#tb').show();
									$('#ptb').hide();
									$('#ttb').hide();
									$('#ftb').hide();
								}
							});
		}
		
		function closeDialog() {
			$("#dlg").dialog("close");
			$("#fundsource").dialog("close");
			$("#purhase").dialog("close");
			$("#team").dialog("close");
		}
		
		
		function search() {
			var findid=$("#idSearch").val();
			var findname=$("#nameSearch").val();
			if (isEmpty(findid)) {
				$("#dg").datagrid('load', {
					"name" : $("#nameSearch").val(),
					
				});
				return;
			}
			if (isEmpty(findname)) {
				$("#dg").datagrid('load', {
					"projectid" : $("#idSearch").val(),
				});
				return;
			}
			$("#dg").datagrid('load', {
				"name" : findname,
				"projectid" : findid,
			});
			

		}
		
		
		
	</script>
	<table id="dg">
	</table>
	<div id="tb">
		<div>
			<a href="javascript:fundSource()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">资金来源</a> <a
				href="javascript:purchase()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">采购信息</a> <a href="javascript:team()"
				class="easyui-linkbutton" iconCls="icon-add" plain="true">项目成员</a>
		</div>
		<div>
			&nbsp;项目编号：&nbsp;<input id="idSearch" class="easyui-textbox"
				size="20"  onkeydown="if(event.keyCode==13) search()" />&nbsp;
			&nbsp;项目名称：&nbsp;<input id="nameSearch" class="easyui-textbox"
				size="20"  onkeydown="if(event.keyCode==13) search()" />&nbsp;
			&nbsp;<a href="javascript:search()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>

<!-- 采购清单 -->
<script type="text/javascript">
function purchase() {
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
				title : '采购清单',
				pagination : true,
				pageSize : 10,
				pageList : [ 10, 20, 30 ],
				rownumbers : true,
				fit : true,
				fitColumns : true,
				toolbar : '#ptb',
				url : '${pageContext.request.contextPath}/purchase/purchaseList.action?purchasenumber='+row.purchasenumber,
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
				onLoadSuccess : function(data) {
					$('#tb').hide();
					$('#ttb').hide();
					$('#ftb').hide();
					$('#ptb').show();
				}
			});
	
}

	function deletePurchase() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for (var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].purchaseid);
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
												"${pageContext.request.contextPath}/purchase/deletePurchase.action",
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
	
	</script>
	
	<div id="ptb">
		<a href="javascript:projectList()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">项目基本信息</a> <a
			href="javascript:deletePurchase()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">删除</a> 
	</div>
<!-- 成员管理 -->

<script type="text/javascript">
function team() {
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
						title : '成员管理',
						pagination : true,
						pageSize : 10,
						pageList : [ 10, 20, 30 ],
						rownumbers : true,
						fit : true,
						fitColumns : true,
						toolbar : '#ttb',
						url : '${pageContext.request.contextPath}/team/teamList.action?projectid='
								+ row.projectid,
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
						onLoadSuccess : function(data) {
							$('#tb').hide();
							$('#ptb').hide();
							$('#ftb').hide();
							$('#ttb').show();
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
	
	</script>
	
	<div id="ttb">
		<a href="javascript:projectList()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">项目基本信息</a> <a
			href="javascript:deleteTeam()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">删除</a> 
	</div>
<!-- 资金来源 -->
	<script type="text/javascript">
	function fundSource() {
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
							title : '资金来源',
							pagination : true,
							pageSize : 10,
							pageList : [ 10, 20, 30 ],
							rownumbers : true,
							fit : true,
							fitColumns : true,
							toolbar : '#ftb',
							url : '${pageContext.request.contextPath}/fundsource/fundsourceList.action?projectid='
									+ row.projectid,
							columns : [ [ {
								field : 'cb',
								checkbox : true
							}, //选择 
							{
								title : '编号',
								field : 'projectfundsourceid',
								width : 150,
								align : 'center',
								hidden : 'true'
							}, {
								title : '名称',
								field : 'name',
								width : 150,
								align : 'center'
							}, {
								title : '金额',
								field : 'howmuch',
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
								$('#ptb').hide();
								$('#ttb').hide();
								$('#ftb').show();
							}
						});
	}

	function deleteFundSource() {
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
	
	</script>
	
	<div id="ftb">
		<a href="javascript:projectList()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">项目基本信息</a><a
			href="javascript:deleteFundSource()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">删除资金来源</a>
	</div>


</body>
</html>