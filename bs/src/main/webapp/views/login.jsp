<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
<head>
<title>登录管理</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<style>
	body,p,div,ul,li,h1,h2,h3,h4,h5,h6{
		margin:0;
		padding: 0;
	}
	body{
		background: #E9E9E9; 
	}
	#login{
		width: 400px;
		height: 250px;
		background: #FFF;
		margin:200px auto;
		position: relative;
	}
	#login h1{
		text-align:center;
		position:absolute;
		left:120px;
		top:-40px;
		font-size:21px;
	}
	#login form p{
		text-align: center;
	}
	#user{
		background:url(${pageContext.request.contextPath}/images/user.png) rgba(0,0,0,.1) no-repeat;
		width: 200px;
		height: 30px;
		border:solid #ccc 1px;
		border-radius: 3px;
		padding-left: 32px;
		margin-top: 50px;
		margin-bottom: 30px;
	}
	#pwd{
		background: url(${pageContext.request.contextPath}/images/pwd.png) rgba(0,0,0,.1) no-repeat;
		width: 200px;
		height: 30px;
		border:solid #ccc 1px;
		border-radius: 3px;
		padding-left: 32px;
		margin-bottom: 30px;
	}
	#btnLogin{
		width: 200px;
		height: 30px;
		background: rgba(0,0,0,.1);
		border:solid #ccc 1px;
		border-radius: 3px;
	}
	#btnLogin:hover{
		cursor: pointer;
		background:#D8D8D8;
	}
</style>

 <script type="text/javascript">
        function dologin() {
            var username = $("#user").val();
            var password = $("#pwd").val();
            if (username == null || username == "") {
                alert("用户名不能为空！");
                return false;
            }
            if (password == null || password == "") {
                alert("密码不能为空！");
                return false;
            }
            $("#loginform").submit();

        }
    </script>
    
    <script type=text/javascript>
    if ('${errorMsg}' != '') {
        alert('${errorMsg}');
    }
</script>
</head>
<body>
<div id="login">

	<form id="loginform" class="loginform" action="${pageContext.request.contextPath}/login.action" method="post">
		<p><input type="text" name="username" id="user" placeholder="用户名"></p>
		<p><input type="password" name="password" id="pwd" placeholder="密码"></p>
		<p><input type="button" id="btnLogin" value="登录" onclick="javascript:dologin();"></p>
	</form>
</div>
</body>
</html>