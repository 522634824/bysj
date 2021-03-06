<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>项目申报</title>
<jsp:include page="base.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript">
	function save() {
		var url;
		var projectreplyid = $("#projectreplyid").val();
		var name = $("#name").val();
		var overview = $("#overview").val();
		var howmuch = $("#howmuch").val();
		var file=$("#file").val();
		if (projectreplyid == null || projectreplyid == "") {
			$.messager.alert("系统提示", "项目编号不能为空！");
			return false;
		}
		if (name == null || name == "") {
			$.messager.alert("系统提示", "项目名不能为空！");
			return false;
		}
		if (overview == null || overview == "") {
			$.messager.alert("系统提示", "项目内容不能为空！");
			return false;
		}
		if (howmuch == null || howmuch == "") {
			$.messager.alert("系统提示", "申请资金不能为空！");
			return false;
		}
		if (file == null || file == "") {
			$.messager.alert("系统提示", "请上传项目计划申请书！");
			return false;
		}
		
		$("#applyform").form("submit", {
			url : '${pageContext.request.contextPath}/apply/saveApply.action',
			dataType:"json",
			success : function(data) {
				var json = eval("("+data+")");
				if(json.result){
					$.messager.alert("系统提示", "提交申请成功！");
				}else{
					$.messager.alert("系统提示", "提交申请失败！");	
				}
				
			}
			
			
		});

	}
</script>


</head>

<body>
	<div class="formbody">
		<div class="formtitle">
			<span>项目计划书</span>
		</div>
		<form id="applyform" name="applyform" method="post" enctype="multipart/form-data">
			<ul class="forminfo">
				<li><label>项目编号：</label><input id="projectreplyid"
					name="projectreplyid" type="text" class="dfinput" />
				<li><label>项目名称：</label><input id="name" name="name"
					type="text" class="dfinput" /><i>项目名称不能超过30个字符</i></li>
				<li><label>项目内容：</label><input id="overview" name="overview"
					type="text" class="dfinput" /><i>简述项目内容</i></li>
				<li><input id="userid" name="userid" type="hidden"
					class="dfinput" value="${currentUser.userid } " readonly="readonly" />
				<li><label>项目负责人：</label><input id="performer" name="performer"
					type="text" class="dfinput" value="${currentUser.name } "
					readonly="readonly" />
				<li><label>申请资金：</label><input id="howmuch" name="howmuch"
					type="text" class="dfinput" /></li>
				<li><label>选择文件:</label><input type="file" id="file" name="file"
					width="120px"></li>
				<li><label>备注：</label> <textarea id="remark" name="remark"
						class="textinput"></textarea></li>
				<li><label>&nbsp;</label><input name="btn" type="button"
					class="btn" value="确认申报" onclick="javascript:save();" /></li>
			</ul>
		</form>
	</div>

</body>
</html>
