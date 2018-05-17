<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册</title>
<jsp:include page="base.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="${pageContext.request.contextPath}/css/snow.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
        function doregister() {
            var username = $("#username").val();
            var password = $("#password").val();
            var password2 = $("#password2").val();
            if (username == null || username == "") {
            	alert("用户名不能为空！");
                return false;
            }
            if (password == null || password == "") {
            	alert("密码不能为空！");
                return false;
            }
            if (password2 == null || password2 == "") {
            	alert("重复密码不能为空！");
                return false;
            }
            $("#registerform").submit();
            
        }
    </script>
 <script type=text/javascript>
    if ('${errorMsg}' != '') {
        alert('${errorMsg}');
    }
</script>
</head>
<body>
<div class="snow-container">
			  <div class="snow foreground"></div>
			  <div class="snow foreground layered"></div>
			  <div class="snow middleground"></div>
			  <div class="snow middleground layered"></div>
			  <div class="snow background"></div>
			  <div class="snow background layered"></div>
			</div>

<div class="top-buttons-agileinfo">
<a href="${pageContext.request.contextPath}/views/login.jsp">登录</a><a href="${pageContext.request.contextPath}/views/register.jsp" class="active">注册</a>
</div>
<h1>网络设备设备项目信息管理系统
</h1>
<div class="main-agileits">
<!--form-stars-here-->
		<div class="form-w3-agile">
			<h2 class="sub-agileits-w3layouts">用户注册</h2>
			<form id="registerform" name="registerform" action="${pageContext.request.contextPath}/user/register.action" method="post">
					<input type="text" id="username" name="username" placeholder="用户名" required="" />
					<input type="password" id="password" name="password" placeholder="密码" required="" />
					<input type="password" id="password2" name="password2" placeholder="再次输入密码 " required="" />
				<div class="submit-w3l">
					<input type="submit" value="注册" onclick="javascript:doregister();">
				</div>
			</form>
		</div>
		</div>

</body>
</html>