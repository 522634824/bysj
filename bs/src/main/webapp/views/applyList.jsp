<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目申请记录</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
	var url;
	var tool;
		$(function() {
			if('${currentUser.power}'==0){ 
				url="${pageContext.request.contextPath}/apply/applyList.action";
				tool='#ttb';
			}
			if('${currentUser.power}'==1){
				url='${pageContext.request.contextPath}/apply/applyList.action?userid=${currentUser.userid }';
				tool='#tb';
			}
			if('${currentUser.power}'==2){
				url='${pageContext.request.contextPath}/apply/applyList.action?approver1=${currentUser.name}';
				tool='#ttb';
			}
			if('${currentUser.power}'==3){
				url='${pageContext.request.contextPath}/apply/applyList.action?approver2=${currentUser.name}';
				tool='#ttb';
			}
			
			$('#dg')
					.datagrid({
						loadFilter : pagerFilter
					})
					.datagrid(
							{
								title : '项目申报记录',
								pagination : true,
								pageSize : 10,
								pageList : [ 10, 20, 30 ],
								rownumbers : true,
								fit : true,
								fitColumns : true,
								toolbar : tool,
								url : url

							});
		});

		function formatterState(value, row, index) {
			if (row.state == 0) {
				return '审批中';
			} else if (row.state == 1) {
				return '已通过部门审批';
			} else if (row.state == 2) {
				return '未通过部门审批';
			}else if (row.state == 3) {
				return '已通过领导审批';
			}else if (row.state == 4) {
				return '未通过领导审批';
			}
		}

		
		
		function searchApply() {
			var findname=$("#nameSearch").val();
			if (isEmpty(findname)) {
				$("#dg").datagrid('load', {
					"state" : $("#stateSearch").val(),
				});
				return;
			}
			$("#dg").datagrid('load', {
				"name" : findname,
				"state" : $("#stateSearch").val(),
			});
			

		}
		
		function newProject(){
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一个已通过审批的项目！！");
				return;
			}
			var row = selectedRows[0];
			if(row.state==0){
				$.messager.alert("系统提示", "本项目未进行审批！");
				return;
			}
			if(row.state==1||row.state==2||row.state==4){
				$.messager.alert("系统提示", "本项目未通过审批！");
				return;
			}
			if('${currentUser.power}'==0||'${currentUser.power}'==2||'${currentUser.power}'==3){
				$.messager.alert("系统提示", "只有项目负责人才能新建项目！");
			}
			
				$.post(
						"${pageContext.request.contextPath}/project/addProject.action",
								{
									data : JSON.stringify(row)
								},
								function(result) {
										if(result.success){
											$.messager.alert("系统提示","项目新建成功！");
										}else{
											$.messager.alert("系统提示","项目新建失败！");
										}
										$("#dg").datagrid(
												"reload");
								}, "json");
			
		}
		
		function openPDF(){
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一个已通过审批的项目！！");
				return;
			}
			var row = selectedRows[0];
			window.open("${pageContext.request.contextPath}/pdf/showPDF.action?projectreplyid="+row.projectreplyid);
		
			
		}
		
		
		function formatmore(val,row){
			if (val){
				return '<span title="' + val + '">' + val + '</span>';
			    } else 
			{
			    return val;
			    }
			}
		
	</script>
	<table id="dg">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="userid" align="center" width="100" hidden="true"></th>
				<th field="projectreplyid" width="130" align="center"formatter="formatmore">项目编号</th>
				<th field="name" width="150" align="center"formatter="formatmore">项目名称</th>
				<th field="overview" width="250" align="center" formatter="formatmore">项目内容</th>
				<th field="performer" width="120" align="center">项目负责人</th>
				<th field="howmuch" width="100" align="center">申请资金</th>
				<th field="remark" width="150" align="center"formatter="formatmore">备注</th>
				<th field="submitdate" width="150" align="center"formatter="formatmore">提交时间</th>
				<th field="state" width="150" align="center"
					formatter="formatterState">是否审批</th>
				<th field="approver1" width="100" align="center">部门审批人</th>
				<th field="approver2" width="100" align="center">领导审批人</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<a href="javascript:newProject()" class="easyui-linkbutton"
			iconCls="icon-search" plain="true">新建项目</a> <a
			href="javascript:openPDF()" class="easyui-linkbutton"
			iconCls="icon-search" plain="true">打开项目计划书</a>
		<div>
			&nbsp;项目名：&nbsp;<input id="nameSearch" class="easyui-textbox"
				size="20" value="" onkeydown="if(event.keyCode==13) searchApply()" />&nbsp;
			&nbsp;是否审核：&nbsp;<select id="stateSearch" class="easyui-combobox"
				panelHeight="auto" style="width: 100px;"
				onkeydown="if(event.keyCode==13) searchApply()">
				<option value="" style="display: none">请选择</option>
				<option value="0">未审批</option>
				<option value="1">已通过部门审批</option>
				<option value="2">未通过部门审批</option>
				<option value="3">已通过领导审批</option>
				<option value="4">未通过领导审批</option>
			</select> &nbsp;<a href="javascript:searchApply()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>


	<div id="ttb">
		<div>
			&nbsp;项目名：&nbsp;<input id="nameSearch" class="easyui-textbox"
				size="20" value="" onkeydown="if(event.keyCode==13) searchApply()" />&nbsp;
			&nbsp;是否审核：&nbsp;<select id="stateSearch" class="easyui-combobox"
				panelHeight="auto" style="width: 100px;"
				onkeydown="if(event.keyCode==13) searchApply()">
				<option value="" style="display: none">请选择</option>
				<option value="0">未审批</option>
				<option value="1">已通过部门审批</option>
				<option value="2">未通过部门审批</option>
				<option value="3">已通过领导审批</option>
				<option value="4">未通过领导审批</option>
			</select> &nbsp;<a href="javascript:searchApply()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>


</body>
</html>