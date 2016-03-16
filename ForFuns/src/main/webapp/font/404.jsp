<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">
	<title>404</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/404.css">
</head>
<body>

	<div class="content">
		<div class="container">
			<div class="main_404">
				<img src="../image/error404.png">
				<p class="label_wrong">很抱歉，您的页面请求有误！</p>
				<a href="<%=basePath%>font/home.jsp" class="readmore">返回首页</a>
			</div>
		</div>
	</div>

</body>
</html>