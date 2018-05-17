<%@ page language="java" contentType="text/html;UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>main</title>

<jsp:include page="base.jsp"></jsp:include>
<jsp:include page="loginCheck.jsp"></jsp:include>

</head>
<body class="easyui-layout">
	<div class="wu-header"
		data-options="region:'north',border:false,split:true">
		<div class="wu-header-left" style="margin-top: 10px;">
			<h1>网络设备项目信息管理系统</h1>
		</div>
		<div class="wu-header-right" style="margin-top: 20px;">
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
			<div title="项目申报管理" data-options="iconCls:'icon-application-cascade'"
				style="padding: 10px">
				<a href="javascript:openTab(' 项目申报','apply.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">项目申报</a> <a
					href="javascript:openTab(' 申报记录','applyList.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">申报记录</a>
			</div>
			<div title="项目信息管理" data-options="iconCls:'icon-application-form-edit'"
				style="padding: 10px">
				<a href="javascript:openTab(' 项目信息','project.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">项目信息</a> <a
					href="javascript:openTab(' 项目日程','schedule.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">项目日程</a> <a
					href="javascript:openTab(' 项目资金来源','fundsource_list.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">项目资金来源</a>
					<a
					href="javascript:openTab(' 项目关系人','team_list.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">项目成员</a> 
			</div>
			<div title="项目采购管理" data-options="iconCls:'icon-chart-curve'"
				style="padding: 10px">
				<a href="javascript:openTab(' 添加采购信息','purchase.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">添加采购信息</a> <a
					href="javascript:openTab(' 采购列表','purchase_list.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">采购列表</a>
			</div>
			<div title="统计报表" data-options="iconCls:'icon-book'"
				style="padding: 10px;">
				<a href="javascript:openTab(' 项目申报报表','applystat.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">项目申报报表</a> 
				<a href="javascript:openTab(' 项目实施报表','projectstat.jsp','icon-bricks')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bricks'">项目实施报表</a>
			</div>
			<div title="用户管理" data-options="iconCls:'icon-chart-organisation'"
				style="padding: 10px">
				<a href="javascript:openTab('基本信息维护','activeUser.jsp','icon-users')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-users'"> 基本信息维护</a> <a
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

