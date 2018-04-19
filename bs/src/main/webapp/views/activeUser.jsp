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
		function openUserDialog() {
			$("#dlg").dialog("open").dialog("setTitle", "修改基本信息");
			url = "${pageContext.request.contextPath}/updateUser.action";

		}

		function closeUserDialog() {
			$("#dlg").dialog("close");
		}

		function saveUser() {
			$("#fm").form("submit", {
				url : url,
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(result) {
					$.messager.alert("系统提示", "修改成功");
					closeUserDialog();
					location.reload();

				}
			});
		}

		function openPwdDialog() {
			$("#pwddlg").dialog("open").dialog("setTitle", "修改密码");
			url = "${pageContext.request.contextPath}/updatePwd.action";

		}

		function closePwdDialog() {
			$("#pwddlg").dialog("close");
		}

		function savePwd() {
			$("#pwdfm").form("submit", {
				url : url,
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(result) {
					var data = eval('(' + result + ')');

					if (data.flag) {
						$.messager.alert("系统提示", "密码修改成功!");
						closeUserDialog();
					} else {
						$.messager.alert("系统提示", "密码修改失败!");
						closeUserDialog();
					}
				}
			}, "json");
		}
	</script>
	<div class="formbody">
		<div class="formtitle">
			<span>基本信息</span>
		</div>
		<ul class="forminfo">
			<li><input id="userid" name="userid" type="hidden"
				class="dfinput" value="${currentUser.userid }" />
			<li><label>用户名：</label><input id="username" name="username"
				type="text" class="dfinput" value="${currentUser.username }" />
			<li><label>年龄：</label><input id="age" name="age" type="text"
				class="dfinput" value="${currentUser.age}" />
			<li><label>性别：</label><input type="radio" id="sex" name="sex"
				required="true" value="1" ${currentUser.sex == "1"?'checked':''} />男
				<input type="radio" id="sex" name="sex" required="true" value="0"
				${currentUser.sex == "0"?'checked':''} />女
			<li><label>真实姓名：</label><input id="name" name="name" type="text"
				class="dfinput" value="${currentUser.name } " readonly="readonly" />
			<li><label>联系电话：</label><input id="tel" name="tel" type="text"
				class="dfinput" value="${currentUser.tel }" />
			<li><input name="btn" type="button"
				class="btn" value="信息修改" onclick="javascript:openUserDialog();" />
				 <label>&nbsp;</label>
				 <input
				name="btn" type="button" class="btn" value="修改密码"
				onclick="javascript:openPwdDialog();" /></li>
		</ul>

	</div>
	
	
	
		<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 400px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>用户名：</td>
					<td>${currentUser.username }</td>
					<td>
					<input type="hidden" id="userid" name="userid" value="${currentUser.userid }">
					<input type="hidden" id="username" name="username"value="${currentUser.username }">
					<input type="hidden" id="passowrd" name="password" value="${currentUser.password }">
					<input type="hidden" id="power" name="power" value="${currentUser.power }">
					</td>
				</tr>
				<tr>
					<td>真实姓名：：</td>
					<td><input type="text" id="name" name="name" required="true" value="${currentUser.name } " />
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="radio" id="sex" name="sex" required="true"
						value="1" ${currentUser.sex == "1"?'checked':''}/>男 
						<input type="radio" id="sex" name="sex"
						required="true" value="0" ${currentUser.sex == "0"?'checked':''}/>女
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type="text" id="age" name="age" required="true" value="${currentUser.age} " />
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input type="text" id="tel" name="tel" required="true"  value="${currentUser.tel }"/>
				</tr>
			</table>
		</form>
			<div id="dlg-buttons">
		<a href="javascript:saveUser()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeUserDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
			</div>
	</div>

	<div id="pwddlg" class="easyui-dialog"
		style="width: 400px; height: 400px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="pwdfm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>输入原密码：</td>
					<td><input type="text" id="oldpwd" name="oldpwd"
						required="true" /> <input type="hidden" id="userid" name="userid"
						value="${currentUser.userid }" />
				</tr>
				<tr>
					<td>输入新密码：</td>
					<td><input type="text" id="password" name="password"
						required="true" />
				</tr>
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:savePwd()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closePwdDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
	</div>
</body>
</html>