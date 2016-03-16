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
	<title>AuctionDetail</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/auctionDetail.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
</head>
<body>

<a href="javascript:;" class="lanrenzhijia_top"></a>
<script src="<%=basePath%>js/lanrenzhijia.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.1.min.js"></script>
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
$(document).ready(function(){
	
  $("#menu").click(function(){
  $("#menu-xs").toggle(300);
  });
});
</script>

<script type="text/javascript">
//通过id获取商品详情 
function getProductById(id){
	$.ajax({
		type:'post',
		asycn:false,
		url:'<%=basePath%>/product.do?method=GetProductById',
		data:{productid:id},
		success:function(json){
			var product = json.product;
			var id = product.id;
			var money = "￥"+product.initmoney;
			var name= product.name;
			var imgurl = product.imgurl;
			var authorname = product.authorname;
			var content = product.content;
			var imgone = product.imgone;
			var imgtwo = product.imgtwo;
			var imgthree = product.imgthree;
			var situation = product.situation;
			var methodid = product.methodid;
			var typename = product.typename;
			var timestart = myformatter(product.timestart);
			var timeout = myformatter(product.timeout);
			var addmoney = product.addmoney;
			var authorid = product.authorid;
			$('.back_btn').click(function(){
				location.href="<%=basePath%>font/artistHome.jsp?id="+authorid;
			});
			if(methodid!=2)
				location.href="<%=basePath%>font/404.jsp";
			$('#productid').val(id);
			$('#imgurl').attr("src",imgurl);
			$('#imgone').attr("src",imgone);
			$('#imgtwo').attr("src",imgtwo);
			$('#imgthree').attr("src",imgthree);
			$('#timestart').html(timestart);
			$('#timeout').html(timeout);
			$('#name').html(name);
			$('#money').html(money);
			$('#typename').html(typename);
			$('#authorname').html(authorname);
			$('#content').html(content);
			/* $('#addmoney').html("￥"+addmoney); */
			if(situation==1){
				var tempcontent = "<div class='row buy'><a target='_blank' href='payfor.jsp?productid="+id+"' class='col-xs-12 readmore'>现在购买</a></div>";
				$('#gooddetail').append(tempcontent);
			}
			if(situation==0){
				$('#situation').html("未上架");
			}else if(situation==1){
				$('#situation').html("上架中");
			}else if(situation==2){
				$('#situation').html("已下架");
			}else if(situation==3){
				$('#situation').html("已出售");
			}
		},error:function(){
			
		}
	});
}


function addNewOne(){
	$(".add_hidden_bg").show();
	$(".add_hidden").show();
}

function submitNewOne(){
	$(".add_hidden_bg").hide();
	$(".add_hidden").hide();
}
//检验数字
function validatenumber(number){ 
	var reg = /^\d+$/;
    if (!number.match(reg)){
        return false;
    }else{    
    	return true;
    }    
} ;
$(document).ready(function(){

	var productid = getUrlParam("productid");
	if(null==productid){
		location.href="<%=basePath%>font/404.jsp";
	}
	getProductById(productid);
	
	$('#addmoneysubmit').click(function(){
		var addmoney = $('#addmoney').val();
		if(validatenumber(addmoney)){
			//var money = $('#money').html();
			//money = money.substring(1,money.length);
			//money = Number(money) + Number(addmoney);
			$('#addform').submit();
		}
	});
	$(".pic1").click(function() {
  		var src1 = $(this).attr("src");
  		$(".pic").attr("src",src1);
  	});
  	$(".pic2").click(function() {
  		var src2 = $(this).attr("src");
  		$(".pic").attr("src",src2);
  	});
  	$(".pic3").click(function() {
  		var src3 = $(this).attr("src");
  		$(".pic").attr("src",src3);
  	});
  	
  	
  	var width = $(".good_item img").width();
	var height = width;
  	$(".good_item img").height(height);

  	var width_s = $(".good_pic img").width();
  	var height_s = width_s;
  	$(".good_pic img").height(height_s);

  	var add_hidden_w = $(".buy").width();
	$(".add_hidden").width(add_hidden_w);

	$(window).resize(function() {
  		var width = $(".good_item img").width();
		var height = width;
  		$(".good_item img").height(height);

  		var width_s = $(".good_pic img").width();
  		var height_s = width_s;
  		$(".good_pic img").height(height_s);

  		var add_hidden_w = $(".buy").width();
		$(".add_hidden").width(add_hidden_w);
  	});
  
});
</script>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-tower" aria-hidden="true"></span>&nbsp;&nbsp;商品详情</p>
	</div>
</div>

	<div class="header-top">
			<div class="container">
				<div class="statu_bar">
					<ul class="support">
						<li ><span ><i class="item_message"> </i>471979617@qq.com</span></li>
						<li ><span ><i class="item_tel"> </i>156-9000-8000</span></li>			
					</ul>
					<ul class="support-right">
						<li ><a href="Login.html" ><i class="item_login"> </i>登陆</a></li>
						<li ><a href="Register.html" ><i class="item_register"> </i>注册账号</a></li>			
					</ul>
				</div>
			</div>
			<div class="header-bottom">
				<div class="container">
					<div class="logo">
						<h1><a href="home.html">ArtCustomize</a></h1>
					</div>
					<div class="top-nav-xs hidden-lg">
						<div id="menu" onmouseover="fun1();" onmouseout="fun2();">
							<p>菜  单</p>
						</div>
						<div id="menu-xs">
							<ul>
								<li><a href="home.html">首页</a></li>
								<li><a href="home.html">成品</a></li>
								<li><a href="home.html">DIY</a></li>
								<li><a href="home.html">艺术家</a></li>
								<li><a href="newslist.html">资讯中心</a></li>
							</ul>
						</div>
					</div>
					<div class="top-nav visible-lg">
						<ul class="megamenu skyblue">
							<li><a href="home.html">首页</a></li>
							<li><a href="home.html">成品</a></li>
							<li><a href="home.html">DIY</a></li>
							<li><a href="home.html">艺术家</a></li>
							<li><a href="newslist.html">资讯中心</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	<div class="container">
		<h6 class="location"><a href="home.html">首页</a> <i> </i> <a href="goodslist.html">艺术品列表</a> <i> </i> 艺术品详情 </h6>
	</div>


	<div class="bar_news">
		<h2>艺术品详情</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="col-xs-12">
				<div class="col-md-6 good_show">
					<div class="col-xs-12 good_item">
						<img src="<%=basePath%>image/good.jpg" class="pic" id="imgurl">
					</div>
					<div class="col-xs-4 good_pic">
						<img src="<%=basePath%>image/good.jpg" class="pic1" id="imgone">
					</div>
					<div class="col-xs-4 good_pic">
						<img src="<%=basePath%>image/bl.jpg" class="pic2" id="imgtwo">
					</div>
					<div class="col-xs-4 good_pic">
						<img src="<%=basePath%>image/bl2.jpg" class="pic3" id="imgthree">
					</div>
				</div>
				<div class="col-md-6 good_detail">
					<p class="good_name" id="name">商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称</p>
					<div class="row price">
						<p class="col-xs-3 good_price1 price1">当前价</p>
						<p class="col-xs-9 good_price price2" id="money">￥98.00</p>
						<!-- <p class="col-xs-3 good_price1 price3">当前价</p>
						<p class="col-xs-9 good_price price4" id="addmoney">￥230.00</p> -->
					</div>
					<div class="row trans">
						<p class="col-xs-3 good_other">配送</p>
						<p class="col-xs-9 good_other good_other1">卖家城市 快递公司</p>
					</div>
					<div class="row other">
						<p class="col-xs-3 good_other">所属分类</p>
						<p class="col-xs-9 good_other good_other1" id="typename">分类6</p>
					</div>
					<div class="row">
						<p class="col-xs-3 good_other">上架时间</p>
						<p class="col-xs-9 good_other good_other1" id="timestart">2015-12-7 8:00</p>
					</div>
					<div class="row">
						<p class="col-xs-3 good_other">下架时间</p>
						<p class="col-xs-9 good_other good_other1" id="timeout">2015-12-31 23:59</p>
					</div>
					<div class="row artist">
						<p class="col-xs-3 good_other">艺术家</p>
						<p class="col-xs-5 good_artist" id="authorname">艺术家名称</p>
						<a href="artist.html" class="col-xs-4 readmore enter" target="_blank">进入主页</a>
					</div>
					<div class="row buy">
						<a class="col-xs-12 readmore" onclick="addNewOne()">加入竞拍</a>
					</div>
				</div>
			</div>

			<div class="col-xs-12 description">
				<div class="des_title">
					<p>图文详情</p>
					<label class="line"></label>
				</div>
				<p class="des_p" id="content">这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述</p>
			</div>
		</div>
	</div>

	<div class="row add_hidden_bg"></div>
	<div class="row add_hidden">
	<form action="<%=basePath%>product.do?method=AddOrder" method="post" id="addform">
		<input type="hidden" value="" id="productid" name = "productid">
		<div class="row add_name1">
			<button class="col-xs-offset-11 col-xs-1 new_submit1" onclick="submitNewOne()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
		<div class="row add_name">
			<p>请输入您的价位：</p>
			<input type="text" class="col-xs-12" id="addmoney" name ="addmoney" />
		</div>
		<div class="row add_name">
			<button class="col-xs-12 new_submit" id="addmoneysubmit"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;提交</button>
		</div>
	</form>
	</div>


	<div class="bottom-grid1">
		<div class="fit1">
			<h3>HAPPY SHOPPING</h3>
			<p>Lorem Ipsum sit amet consectuer adipiscing elitsed diam nonummy nibh euismod</p>
		</div>
	</div>



	<div class="footer">
		<div class="container footer-div">
			<div class="col-md-12 footer-middle">
				<p>公司简介：这里是公司简介公司简介公司简介公司简介公司简介公司简介</p>
				<p>地址：福建省厦门市思明区422号厦门大学</p>
			</div>
			<div class="col-md-12 company">
				<p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>