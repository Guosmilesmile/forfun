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
	<title>Success</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/404.css">
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var successid = getUrlParam('successid');
			if(null==successid){
			}else if(successid==1){
				$('.label_wrong').html('操作成功，返回订单页面');
				$('.readmore').attr('href',"<%=basePath%>order.do?method=EnterMyOrder");
			}else if(successid==2){
				$('.label_wrong').html('操作成功，返回个人信息页面 ');
				$('.readmore').attr('href',"<%=basePath%>font/personal.jsp");
			}else if(successid==3){
				$('.label_wrong').html('操作成功，返回商品列表页面');
				$('.readmore').attr('href',"<%=basePath%>font/goodslist.jsp");
			}
			
		});
	</script>
</head>
<body>

	<div class="content">
		<div class="container">
			<div class="main_404">
				<img src="<%=basePath%>image/success.png">
				<p class="label_wrong">恭喜您！操作成功！</p>
				<a href="home.jsp" class="readmore">返回</a>
			</div>
		</div>
	</div>

</body>
</html>