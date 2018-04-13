<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基本信息维护</title>
<jsp:include page="base.jsp"></jsp:include>
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
				var data=eval('('+result+')');
				
				if(data.flag){
				$.messager.alert("系统提示", "密码修改成功!");
				closeUserDialog();
				}else{
					$.messager.alert("系统提示", "密码修改失败!");
					closeUserDialog();
				}
			}
		},"json");
	}

	</script>
	<div id="userpanel"  class="easyui-panel" title="基本信息维护" style="padding:30px 60px;align-content: center;"data-options="fit:true">
		
		
		<table cellspacing="8px">
		<tr>
					<td>工号：</td>
					<td>${currentUser.userid }</td>
				</tr>
				<tr>
					<td>用户名：</td>
					<td>${currentUser.username }</td>
				</tr>
				<tr>
					<td>真实姓名：：</td>
					<td>${currentUser.name }</td>
				</tr>
				<tr>
					<td>性别：</td>
					<td> ${currentUser.sex == "1"?"男":"女"} </td>	
				</tr>
				<tr>
					<td>年龄：</td>
					<td>${currentUser.age}</td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td>${currentUser.tel }</td>
				</tr>
				<tr>
					<td>用户身份：</td>
					<td>${currentUser.power=="1"?'管理员':'用户' }</td>
				</tr>
				<tr>
					<td><a
				href="javascript:openUserDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改基本信息</a></td>
					<td><a
				href="javascript:openPwdDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改密码</a></td>
				</tr>
			</table>
			
			
					
					
		
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
					<td><input type="text" id="oldpwd" name="oldpwd" required="true" />
					<input type="hidden" id="userid" name="userid" value="${currentUser.userid }"/>
				</tr>
				<tr>
					<td>输入新密码：</td>
					<td><input type="text" id="password" name="password" required="true" />
				</tr>
			</table>
		</form>
			<div id="dlg-buttons">
		<a href="javascript:savePwd()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closePwdDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
			</div>
	</div>
	
		</div>
		
	


</body>
</html>