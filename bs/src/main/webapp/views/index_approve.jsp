<%@ page language="java" contentType="text/html;UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>main</title>
<script type="text/javascript">
	var url;
	function addTab(url, text, iconCls) {
		var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/views/"
				+ url + "'></iframe>";
		$("#tabs").tabs("add", {
			title : text,
			iconCls : iconCls,
			closable : true,
			content : content
		});
	}
	function openTab(text, url, iconCls) {
		if ($("#tabs").tabs("exists", text)) {
			$("#tabs").tabs("close", text);
			addTab(url, text, iconCls);
			$("#tabs").tabs("select", text);
		} else {
			addTab(url, text, iconCls);
		}
	}

	function logout() {
		$.messager
				.confirm(
						"系统提示",
						"您确定要退出系统吗",
						function(r) {
							if (r) {
								window.location.href = "${pageContext.request.contextPath}/user/logout.action";
							}
						});
	}
</script>
<jsp:include page="base.jsp"></jsp:include>
<jsp:include page="loginCheck.jsp"></jsp:include>

</head>
<body class="easyui-layout">
	<div class="wu-header"
		data-options="region:'north',border:false,split:true">
		<div class="wu-header-left" style="margin-top: 10px;">
			<h1>网络设备项目信息管理系统</h1>
		</div>
		<div class="wu-header-right"style="margin-top: 20px;">
			<p>${currentUser.username},欢迎您！</p>

		</div>
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-tip'">
				<div align="center" style="padding-top: 20px;">欢迎使用！</div>
			</div>
		</div>
	</div>
	<div class="wu-sidebar"
		data-options="region:'west',collapsible:false,split:true,border:true,title:'导航菜单'">
		<div class="easyui-accordion">
		<div title="审批管理" data-options="iconCls:'icon-application-form-edit'"
				style="padding: 10px">
				<a
					href="javascript:openTab(' 申请中项目','approve.jsp','icon-chart-curve')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-chart-curve'">申请中项目</a>
				<a
					href="javascript:openTab(' 审批记录','applyList.jsp','icon-chart-curve')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-chart-curve'">审批记录</a>
			</div>
			<div title="统计报表" data-options="iconCls:'icon-book'"
				style="padding: 10px">
				<a
					href="javascript:openTab(' 项目一览','project_list.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">项目一览</a> 
				<a href="javascript:openTab(' 项目申报报表','applystat.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">项目申报报表</a> 
				<a href="javascript:openTab(' 项目实施报表','projectstat.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">项目实施报表</a>
			</div>

			<div title="用户管理" data-options="iconCls:'icon-application-cascade'"
				style="padding: 10px; border: none;">
				<a
					href="javascript:openTab('基本信息维护','activeUser.jsp','icon-users')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-users'"> 基本信息维护</a>
			    <a
					href="javascript:logout()" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-cog'"> 安全退出</a>
			</div>
		</div>
	</div>
	<div class="wu-footer"
		data-options="region:'south',border:true,split:true">&copy; 2018
		 All Rights Reserved</div>
</body>

</html>

