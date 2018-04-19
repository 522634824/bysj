<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目申请历史</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
		$(function() {
			$('#dg')
					.datagrid({
						loadFilter : pagerFilter
					})
					.datagrid(
							{
								title : '项目申请',
								pagination : true,
								pageSize : 10,
								pageList : [ 10, 20, 30 ],
								rownumbers : true,
								fit : true,
								fitColumns : false,
								toolbar : '#tb',
								url : '${pageContext.request.contextPath}/apply/applyList.action'

							});
		});

		function formatterState(value, row, index) {
			if (row.state == 0) {
				return '审批中';
			} else if (row.state == 1) {
				return '已通过审批';
			} else if (row.state == 2) {
				return '未通过审批';
			}
		}

		function searchApply() {
			$("#dg").datagrid('load', {
				"name" : $("#nameSearch").val(),
				"performer" : $("#performerSearch").val(),
				"state" : $("#stateSearch").val(),
			});

		}
	</script>
	<table id="dg">
		<thead data-options="frozen:true">
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="projectreplyid" align="center" hidden="true"></th>
				<th field="userid" align="center" hidden="true"></th>
				<th field="name" width="20%" align="center">项目名称</th>
				<th field="overview" width="10%" align="center">项目内容</th>
				<th field="performer" width="10%" align="center">项目负责人</th>
				<th field="howmuch" width="10%" align="center">申请资金</th>
				<th field="remark" width="10%" align="center">备注</th>
				<th field="state" width="10%" align="center"
					formatter="formatterState">是否审批</th>
				<th field="approver" width="10%" align="center">审批人</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			&nbsp;项目名：&nbsp;<input id="nameSearch" class="easyui-textbox"
				size="20" value="" onkeydown="if(event.keyCode==13) searchApply()" />&nbsp;
			&nbsp;是否审核：&nbsp;<select id="stateSearch" class="easyui-combobox"
				panelHeight="auto" style="width: 100px;"
				onkeydown="if(event.keyCode==13) searchApply()">
				<option value="" style="display: none">请选择</option>
				<option value="0">未审批</option>
				<option value="1">已通过审批</option>
				<option value="2">未通过审批</option>
			</select> &nbsp;<a href="javascript:searchApply()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
</body>
</html>