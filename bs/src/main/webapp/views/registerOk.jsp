<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册成功</title>
<jsp:include page="base.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <meta http-equiv="refresh" content="5;URL=${pageContext.request.contextPath}/views/login.jsp">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="${pageContext.request.contextPath}/css/snow.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
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
<h1>网络设备设备项目信息管理系统
</h1>
<div class="main-agileits">
<!--form-stars-here-->
		<div class="form-w3-agile">
			
			<h2 class="sub-agileits-w3layouts">注册成功,请等待管理员审核！</h2>
			<p style="color: white;">5秒后将跳转到登录页面，若未跳转,请点击<a style="color: red;"href="${pageContext.request.contextPath}/views/login.jsp">这里</a>!</p>
		</div>
		</div>

</body>
</html>