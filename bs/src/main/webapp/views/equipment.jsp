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

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 400px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>用户名：</td>
					<td><input type="text" id="username" name="username"
						class="easyui-validatebox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>网络设备类型:</td>
					<td><input id="EquipmentRootList" class="easyui-combobox" panelHeight="auto"
		data-options=" url:'${pageContext.request.contextPath}/EquipmentRootList.action',
                            valueField:'equipmentrootid',
                            textField:'name',
                            onSelect:function(data){
                            $('#EquipmentClassList').combobox('clear');
                            $('#EquipmentList').combobox('clear');
                            $('#EquipmentClassList').combobox('reload','${pageContext.request.contextPath}/EquipmentClassList.action?equipmentrootid='+data.equipmentrootid)}" />
	种类:</td>
				</tr>
				<tr>
					<td>种类:：</td>
					<td><<input id="EquipmentClassList" class="easyui-combobox" panelHeight="auto"
		data-options=" valueField:'equipmentclassid', textField:'name', 
		onSelect:function(data){
		$('#EquipmentList').combobox('reload','${pageContext.request.contextPath}/EquipmentList.action?equipmentclassid='+data.equipmentclassid)}" />
	名称:
				</tr>
				<tr>
					<td>名称:</td>
						<td><input id="EquipmentList" class="easyui-combobox " panelHeight="auto"
		data-options="valueField:'equipmentid' ,
                                textField:'name'" />
				</tr>
				<tr>
					<td>品牌：</td>
					<td><input type="text" id="brand" name="brand" required="true" />
				</tr>
				<tr>
					<td>型号：</td>
					<td><input type="text" id="name" name="name" required="true" />
				</tr>
				<tr>
					<td>供应商：</td>
					<td><input type="text" id="name" name="name" required="true" />
				</tr>
			</table>
		</form>
	</div>

</body>
</html>