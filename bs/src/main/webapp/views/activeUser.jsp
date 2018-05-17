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

<style>
body {
	width: 90%;
	margin: 40px auto;
	font-family: 'trebuchet MS', 'Lucida sans', Arial;
	font-size: 14px;
	color: #444;
}

table {
	*border-collapse: collapse; /* IE7 and lower */
	border-spacing: 0;
	width: 100%;
}

.bordered {
	border: solid #ccc 1px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 1px 1px #ccc;
	-moz-box-shadow: 0 1px 1px #ccc;
	box-shadow: 0 1px 1px #ccc;
}

.bordered tr:hover {
	background: #fbf8e9;
	-o-transition: all 0.1s ease-in-out;
	-webkit-transition: all 0.1s ease-in-out;
	-moz-transition: all 0.1s ease-in-out;
	-ms-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

.bordered td, .bordered th {
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

.bordered th {
	background-color: #dce9f9;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc),
		to(#dce9f9));
	background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: linear-gradient(top, #ebf3fc, #dce9f9);
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	border-top: none;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
}

.bordered td:first-child, .bordered th:first-child {
	border-left: none;
}

.bordered th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}

.bordered th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}

.bordered th:only-child {
	-moz-border-radius: 6px 6px 0 0;
	-webkit-border-radius: 6px 6px 0 0;
	border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}

/*----------------------*/
.zebra td, .zebra th {
	padding: 10px;
	border-bottom: 1px solid #f2f2f2;
}

.zebra tbody tr:nth-child(even) {
	background: #f5f5f5;
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
}

.zebra th {
	text-align: left;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
	border-bottom: 1px solid #ccc;
	background-color: #eee;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5),
		to(#eee));
	background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);
	background-image: -moz-linear-gradient(top, #f5f5f5, #eee);
	background-image: -ms-linear-gradient(top, #f5f5f5, #eee);
	background-image: -o-linear-gradient(top, #f5f5f5, #eee);
	background-image: linear-gradient(top, #f5f5f5, #eee);
}

.zebra th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}

.zebra th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}

.zebra th:only-child {
	-moz-border-radius: 6px 6px 0 0;
	-webkit-border-radius: 6px 6px 0 0;
	border-radius: 6px 6px 0 0;
}

.zebra tfoot td {
	border-bottom: 0;
	border-top: 1px solid #fff;
	background-color: #f1f1f1;
}

.zebra tfoot td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}

.zebra tfoot td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}

.zebra tfoot td:only-child {
	-moz-border-radius: 0 0 6px 6px;
	-webkit-border-radius: 0 0 6px 6px border-radius: 0 0 6px 6px
}
</style>



</head>
<body>
	<div class="formbody">
		<div class="formtitle">
			<span>个人基本信息</span>
		</div>
	<table class="zebra">
		<thead>
			<tr>
				<th>&nbsp;&nbsp;</th>
				<th></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td>&nbsp;</td>
				<td></td>
			</tr>
		</tfoot>
		<tr>

			<td>用户名：</td>
			<td>${currentUser.username }</td>
			
		</tr>
		<tr>
			<td>年龄：</td>
			<td>${currentUser.age}</td>
			

		</tr>
		<tr>
			<td>性别：</td>
			<td>${currentUser.sex == "1"?'男':'女'}</td>
		</tr>
		<tr>
			<td>真实姓名：</td>
			<td>${currentUser.name }</td>

		</tr>
		<tr>
			<td>联系电话：</td>
			<td>${currentUser.tel }</td>
		</tr>
	</table>

<br>
<input name="btn" type="button" class="btn" value="信息修改"
				onclick="javascript:openUserDialog();" /> <label>&nbsp;</label> <input
				name="btn" type="button" class="btn" value="修改密码"
				onclick="javascript:openPwdDialog();" />

</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 300px; height: 300px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px" align="center">
				<tr>
					<td>用户名：</td>
					<td>${currentUser.username }</td>
					<td><input type="hidden" id="userid" name="userid"
						value="${currentUser.userid }"> <input type="hidden"
						id="username" name="username" value="${currentUser.username }">
						<input type="hidden" id="passowrd" name="password"
						value="${currentUser.password }"> <input type="hidden"
						id="power" name="power" value="${currentUser.power }"></td>
				</tr>
				<tr>
					<td><label>&nbsp;</label></td>
				</tr>
				<tr>
					<td>真实姓名：：</td>
					<td><input class="easyui-textbox" id="name" name="name"
						required="true" value="${currentUser.name } " />
				</tr>
				<tr>
					<td><label>&nbsp;</label></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="radio" id="sex" name="sex" required="true"
						value="1" ${currentUser.sex == "1"?'checked':''} />男
						&nbsp;&nbsp;&nbsp; <input type="radio" id="sex" name="sex"
						required="true" value="0" ${currentUser.sex == "0"?'checked':''} />女

					
				</tr>
				<tr>
					<td><label>&nbsp;</label></td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input class="easyui-textbox" id="age" name="age"
						required="true" value="${currentUser.age} " />
				</tr>
				<tr>
					<td><label>&nbsp;</label></td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input class="easyui-textbox" id="tel" name="tel"
						required="true" value="${currentUser.tel }" />
				</tr>
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:savePwd()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closePwdDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
	</div>


	<div id="pwddlg" class="easyui-dialog"
		style="width: 300px; height: 200px; padding: 10px 20px; position: relative; z-index: 1000;"
		closed="true" buttons="#dlg-buttons">
		<form id="pwdfm" method="post">
			<table cellspacing="8px" align="center">
				<tr>
					<td>输入原密码：</td>
					<td><input class="easyui-textbox" id="oldpwd" name="oldpwd"
						required="true" /> <input type="hidden" id="userid" name="userid"
						value="${currentUser.userid }" />
				</tr>
				<tr>
					<td><label>&nbsp;</label></td>
				</tr>

				<tr>
					<td>输入新密码：</td>
					<td><input class="easyui-textbox" id="password"
						name="password" required="true" />
				</tr>
			</table>
		</form>
		<div id="dlg-buttons">
			<a href="javascript:saveUser()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeUserDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
	</div>

<script type="text/javascript">
		var url;

		function openUserDialog() {
			$("#dlg").dialog("open").dialog("setTitle", "修改基本信息");
			url = "${pageContext.request.contextPath}/user/updateUser.action";

		}

		function openPwdDialog() {
			$("#pwddlg").dialog("open").dialog("setTitle", "修改密码");
			url = "${pageContext.request.contextPath}/user/updatePwd.action";

		}


		function saveUser() {
					$("#fm").form("submit", {
						url : url,
						onSubmit : function() {
							return $(this).form("validate");
						},
						success : function(data) {
								$.messager.alert("系统提示", "修改成功!");
								closeUserDialog();
								location.reload();	
						}
					});
				}

				function savePwd() {
					$("#pwdfm").form("submit", {
						url : url,
						onSubmit : function() {
							return $(this).form("validate");
						},
						success : function(data) {
							var result = eval('(' + data + ')');
							if (result.flag) {
								$.messager.alert("系统提示", "密码修改成功!");
								closePwdDialog();
							} else {
								$.messager.alert("系统提示", "密码修改失败!");
								closePwdDialog();
							}
						}
					}, "json");
				}

			function closeUserDialog() {
					$("#dlg").dialog("close");
				}

			function closePwdDialog() {
				$("#pwddlg").dialog("close");
			}

		
		
	</script>


</body>
</html>