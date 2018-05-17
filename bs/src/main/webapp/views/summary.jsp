<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基本信息维护</title>
<jsp:include page="base.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
		var url;
		function save() {
			$("#fm")
					.form(
							"submit",
							{
								url : '${pageContext.request.contextPath}/summary/saveSummary.action',
								onSubmit : function() {
									return $(this).form("validate");
								},
								success : function(result) {
								
										$.messager.alert("系统提示", "保存成功");
									
								}
							});
		}
	</script>
	<div class="formbody">
		<div class="formtitle">
			<span>资金来源</span>
		</div>
		<form id="fm" name="fm" action="post">
			<ul class="forminfo">
				<li><label>项目名称：</label><input id="projectList"
					name="projectid" class="easyui-combobox" panelHeight="auto"
					data-options="url:'${pageContext.request.contextPath}/project/goingProject.action?state='+0,
						valueField:'projectid', textField:'name'" />
				<li><label>项目总结：</label> <textarea id="summarycontent" name="summarycontent"
						class="textinput"></textarea></li>
				<li><input name="btn" type="button" class="btn" value="提交"
					onclick="javascript:save();" /></li>
			</ul>
		</form>
	</div>


</body>
</html>