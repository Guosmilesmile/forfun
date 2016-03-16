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
	<title>Error</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/404.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var error = getUrlParam('errorid');
			if(null==error){
			}else if(error==1){
				$('.label_wrong').html("操作失败，不属于您的订单");
				$('.readmore').html('返回商品页面');
				$('.readmore').attr('href',"<%=basePath%>font/goodslist.jsp");
			}else if(error==2){
				$('.label_wrong').html("操作失败，不属于您的订单");
				$('.readmore').html('返回订单页面');
				$('.readmore').attr('href',"<%=basePath%>order.do?method=EnterMyOrder");
			}else if(error==3){//拍卖不在时间内
				$('.label_wrong').html("操作失败，该商品不在拍卖时间范围内");
				$('.readmore').html('返回商品页面');
				$('.readmore').attr('href',"<%=basePath%>font/auctionList.jsp");
			}else if(error==4){//拍卖金额小于当前金额
				$('.label_wrong').html("操作失败，金额小于当前最高价");
				$('.readmore').html('返回商品页面');
				$('.readmore').attr('href',"<%=basePath%>font/auctionList.jsp");
			}else if(error==5){//余额不足
				$('.label_wrong').html("操作失败，余额不足");
				$('.readmore').html('返回充值页面');
				$('.readmore').attr('href',"<%=basePath%>customer.do?method=EnterBalance");
			}
			
		});
	</script>
</head>
<body>

	<div class="content">
		<div class="container">
			<div class="main_404">
				<img src="../image/error404.png">
				<p class="label_wrong">很抱歉！操作失败！</p>
				<a href="<%=basePath%>font/home.jsp" class="readmore">返回首页</a>
			</div>
		</div>
	</div>

</body>
</html>