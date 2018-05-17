<%@ page language="java" contentType="text/html;UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<jsp:include page="base.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="${pageContext.request.contextPath}/css/snow.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
 <script type="text/javascript">
        function dologin() {
            var username = $("#username").val();
            var password = $("#password").val();
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
<div class="snow-container">
			  <div class="snow foreground"></div>
			  <div class="snow foreground layered"></div>
			  <div class="snow middleground"></div>
			  <div class="snow middleground layered"></div>
			  <div class="snow background"></div>
			  <div class="snow background layered"></div>
			</div>

<div class="top-buttons-agileinfo">
<a href="${pageContext.request.contextPath}/views/login.jsp" class="active">登录</a><a href="${pageContext.request.contextPath}/views/register.jsp">注册</a>
</div>
<h1>网络设备设备项目信息管理系统
</h1>
<div class="main-agileits">
<!--form-stars-here-->
		<div class="form-w3-agile">
			<h2 class="sub-agileits-w3layouts">登录</h2>
			<form id="loginform" name="loginform" action="${pageContext.request.contextPath}/user/login.action" method="post">
					<input type="text" id="username"name=username placeholder="用户名" required="" />
					<input type="password"id="password" name="password" placeholder="密码" required="" />
				<div class="submit-w3l">
					<input type="submit" value="登录" onclick="javascript:dologin();">
				</div>
			</form>
		</div>
		</div>
</body>
</html>