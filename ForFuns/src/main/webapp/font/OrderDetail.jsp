<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">
	<title>OrderDetail</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/OrderDetail.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
<script>
$(function(){
	$(window).scroll(function(){
		var _top = $(window).scrollTop();
		if(_top>300){
			$('.lanrenzhijia_top').fadeIn(600);
		}else{
			$('.lanrenzhijia_top').fadeOut(600);
		}
	});
	$(".lanrenzhijia_top").click(function(){
		$("html,body").animate({scrollTop:0},500);
	});
});
</script>


<script type="text/javascript">
//查询是否存在该订单，不存在则继续操作，存在的话核对用户名，如果不是该用户的订单则跳转 0为未登陆 1为为存在这个订单 2为订单与用户相符 3 为订单和用户不相符
function checkOrder(productid){
	$.ajax({
		type:'post',
		asycn:false,
		url:'<%=basePath%>/product.do?method=checkOrder',
		data:{productid:productid},
		success:function(json){
			//alert(json);
			if(json==0){
				location.href="<%=basePath%>font/Login.jsp";
			}else if(json==3){
				location.href="<%=basePath%>font/error.jsp";
				//跳转到错误页面
			}else if(json==2){
				//相符则为修改页面
				
			}
		},error:function(){
			
		}
	});
}
function getOderDetail(id){
	$.ajax({
		type:'post',
		url:'<%=basePath%>order.do?method=GetOrderByid',
		data:{id:id},
		success:function(json){
			var order = json.order;
			var id =order.id;
			var telephone = order.telephone;
			var address = order.address;
			var current = order.current;
			var ispay = order.ispay;
			var productname = order.productname;
			var address = order.address;
			var telephone = order.telephone;
			var money = order.money;
			var receiver = order.receiver;
			var artistname = order.artistname;
			var current = myformatter(order.current);
			var productid = order.productid;
			var artistid = order.artistid;
			var productimg = order.productimg;
			var linkartist = "<%=basePath%>font/artistHome.jsp?id="+artistid;
			var linkproduct = "<%=basePath%>font/goodsdetail.jsp?productid="+productid; 
			$('#money').html("订单金额：￥"+money);
			$('#receiver').html(receiver);
			$('#address').html("收货地址："+address);
			$('#telephone').html("联系电话："+telephone);
			$('#artistname').html(artistname);
			$('#productname').html(productname);
			$('#undermoney').html("￥"+money);
			$('#orderid').html("订单号："+id);
			$('#current').html("下单时间："+current);
			$('#artisthome').attr('href',linkartist);
			$('#productimg').attr('src',productimg);
			$('#productdetail').attr('href',linkproduct);
			if(ispay==0){
				var temp = "<button class='col-xs-5 btn btn-default' type='button' id='btnpay' name='"+productid+"'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span>&nbsp;&nbsp;支付订单</button>";
				$('#opert').append(temp);
			}else{
				var temp = "<button class='col-xs-5 btn btn-default' type='button' id='btndelete'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span>&nbsp;&nbsp;删除订单</button>";
				$('#opert').append(temp);
			}
		},error:function(){
			
		}
	});
}
$(document).ready(function()
{
	var productid = getUrlParam("id");
	if(productid==null){
		location.href="404.jsp";
	}
	checkOrder(productid);
	getOderDetail(productid);
	var pic_w = $(".order_pic").width();
	var pic_h = pic_w;
	$(".order_pic").height(pic_h);

	$(window).resize(function() {
  		var pic_w = $(".order_pic").width();
		var pic_h = pic_w;
		$(".order_pic").height(pic_h);
  	});
	$('#btndelete').live('click',function(){
		location.href="<%=basePath%>order.do?method=DeleteOrderByid&id="+productid;
	});
	$('#btnpay').live('click',function(){
		var id = $(this).attr('name');
		location.href="<%=basePath%>font/payfor.jsp?productid="+id;		
	});
});
</script>

</head>

<body>


<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><a href="<%=basePath%>font/OrderList.jsp"><span class="glyphicon glyphicon-menu-left partten" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;订单详情</p>
	</div>
</div>

<div class="container-fluid mainer">
	<div class="row statue_detail">
		<p class="col-xs-12 statue_label"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;订单状态</p>
		<p class="statue_price" id="money">订单金额：￥99.00</p>
		<!-- <p class="statue_price">运费：￥10.00</p> -->
	</div>
	<div class="row receiver">
		<p class="col-xs-12 receiver_name"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&nbsp;&nbsp;收货人：<span id="receiver">孔日天</span></p>
		<p class="receiver_add" id="address">收货地址：福建省厦门市思明区厦大学生公寓</p>
		<p class="receiver_add" id="telephone">联系电话：15699990000</p>
	</div>
	<div class="row order_div">
		<a href="artistHome.html" id="artisthome">
			<div class="row order_artist">
				<p class="col-xs-12 artist_name"><span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;<spand id="artistname">艺术家名称</spand>&nbsp;&nbsp;<span class="glyphicon glyphicon-menu-right partten1" aria-hidden="true"></span></p>
			</div>
		</a>
		<a href="OrderDetail.html" id="productdetail">
			<div class="row order_info">
				<img class="col-xs-3 order_pic" src="<%=basePath%>image/good.jpg" id="productimg">
				<div class="col-xs-9 row order_label">
					<div class="row label1">
						<p class="col-xs-8 order_name" id="productname">订单商品名称订单商品名称</p>
						<p class="col-xs-4 order_price" id="undermoney">￥99.00</p>
					</div>
				</div>
			</div>
		</a>
		<div class="row order_sth">
			<p class="col-xs-12 order_id" id="orderid">订单号：1234567890</p>
			<p class="col-xs-12 order_time" id="current">下单时间：2015-12-21 14:20:53</p>
		</div>
		<div class="row order_btn" id="opert">
			<!-- <button class="col-xs-4 btn btn-default" type="button"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;&nbsp;删除订单</button> -->
			<!-- <button class="col-xs-4 btn btn-default" type="button"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;&nbsp;删除订单</button> -->
		</div>
	</div>
</div>

</body>
</html>