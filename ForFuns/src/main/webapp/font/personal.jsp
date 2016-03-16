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
	<title>Personal</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/personal.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
	<style type="text/css">
		*{font-style: normal;}
	</style>
</head>
<body>

<a href="javascript:;" class="lanrenzhijia_top hidden-xs hidden-sm"></a>
<script src="<%=basePath%>js/lanrenzhijia.js"></script>
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

<script>
//获取cookie
function getCookie(objName){//获取指定名称的cookie的值 
	var arrStr = document.cookie.split("; "); 
	for(var i = 0;i < arrStr.length;i ++){ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName) return unescape(temp[1]); 
	} 
};

//获取用户信息
function GetUser()
{
	$('.back_btn').click(function(){
		location.href="<%=basePath%>font/home.jsp";
	});
	var useridtoken = getCookie("useridtoken");
	if(null==useridtoken || "" == useridtoken){
		return ;
	}
	var index = useridtoken.indexOf("&");
	var id =  useridtoken.substring(0,index);
	
	$.ajax({
		type:'post',
		url:'<%=basePath%>customer.do?method=getCustomerByUserid',
		data:{customerid:id},
		success:function(json){
			var customer = json.customer;
			var id = customer.id;
			var userid = customer.userid;
			var username = customer.name;
			var personnumber = customer.personnumber;
			var telphone = customer.telephone;
			var realname = customer.realname;
			var avator = customer.avator;
			var isartist = customer.isartist;
			if (isartist == "1")
			{
				$('.beartist').html("查看我的主页");
				$('.beartist').attr("href","<%=basePath%>font/artistHome.jsp?id="+id);
				//$('#showme_div').hide();
				//$('#advantage_div').hide();
			}
			$('#avator').attr('src',avator);
			$('#nickname').html(username);
			$('#userid').html(userid);
			$('#personnumber').html(personnumber);
			$('#telphone').html(telphone);
			$('#realname').html(realname);
		},error:function(){
			
		}
	});
}
</script>

<script type="text/javascript">
$(document).ready(function(){
  $("#menu").click(function(){
  $("#menu-xs").toggle(300);
  });
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	GetUser();
	$('#usernameaction').hide();
	$('#loginoutaction').hide();
	CheckUser();
	var width = $(".userpic").width();
	var height = width;
	$(".userpic").height(height);
	var title_w = $(window).width();
	$(".title_bar").width(title_w);

	$(window).resize(function() {
		var width = $(".userpic").width();
		var height = width;
		$(".userpic").height(height);
		var title_w = $(window).width();
		$(".title_bar").width(title_w);
	});
});
</script>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;个人中心</p>
	</div>
</div>

	<div class="col-xs-12 header-top">
			<div class="container">
				<div class="statu_bar">
					<ul class="support">
						<li ><span ><i class="item_message"> </i>471979617@qq.com</span></li>
						<li ><span ><i class="item_tel"> </i>156-9000-8000</span></li>			
					</ul>
					<ul class="support-right">
						<li class="li1" id="loginaction" ><a href="Login.jsp" ><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;登陆</a></li>
						<li class="li2" id="registeraction"><a href="Register.jsp" ><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;&nbsp;注册账号</a></li>
						<li class="li1" id="usernameaction"><a href="#" id="username"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;</a></li>
						<li class="li2" id="loginoutaction"><a href="<%=basePath%>customer.do?method=loginout" ><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;&nbsp;退出</a></li>			
					</ul>
				</div>
			</div>
			<div class="header-bottom">
				<div class="container">
					<div class="logo">
						<h1><a href="home.html">ArtCustomize</a></h1>
					</div>
					<div class="top-nav visible-xs visible-sm">
						<ul class="megamenu skyblue">
							<li><a href="home.jsp" class="menu_home"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></br>首页</a></li>
							<li><a href="goodslist.jsp"><span class="glyphicon glyphicon-tower" aria-hidden="true"></span></br>成品</a></li>
							<li><a href="home.html"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span></br>DIY</a></li>
							<li><a href="artistlist.jsp"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span></br>艺术家</a></li>
							<li><a href="newslist.jsp"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></br>资讯中心</a></li>
							<li><a href="home.html"><span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span></br>联系我们</a></li>
						</ul>
					</div>
					<div class="top-nav-xs visible-md">
						<div id="menu">
							<p>菜  单</p>
						</div>
						<div id="menu-xs">
							<ul>
								<li><a href="home.jsp">首页</a></li>
								<li><a href="goodslist.jsp">成品</a></li>
								<li><a href="home.html">DIY</a></li>
								<li><a href="artistlist.jsp">艺术家</a></li>
								<li><a href="newslist.jsp">资讯中心</a></li> 
							</ul>
						</div>
					</div>
					<div class="top-nav visible-lg">
						<ul class="megamenu skyblue">
							<li><a href="home.jsp">首页</a></li>
							<li><a href="goodslist.jsp">成品</a></li>
							<li><a href="home.html">DIY</a></li>
							<li><a href="artistlist.jsp">艺术家</a></li>
							<li><a href="newslist.jsp">资讯中心</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	<div class="container">
		<h6 class="location"><a href="home.jsp">首页</a> <i> </i> 个人中心 </h6>
	</div>


	<div class="bar_news">
		<h2>个人中心</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="main_up">
				<div class="user_info">
					<img class="userpic" src="<%=basePath%>image/bl.jpg" id = "avator">
					<p class="username" id = "userid">我的用户名</p>
				</div>
				<div class="row person_btn">
					<div class="col-xs-offset-3 col-xs-6 visible-lg">
						<a href="BeArtist.jsp" class="col-xs-5 readmore beartist">申请成为艺术家<!--我的个人主页--></a>
						<a  href="modify.jsp" class="col-xs-5 readmore modify">修改个人信息</a>
					</div>
					<div class="col-xs-offset-3 col-xs-6 visible-md">
						<a href="BeArtist.jsp" class="col-xs-5 readmore beartist">申请成为艺术家<!--我的个人主页--></a>
						<a href="modify.jsp" class="col-xs-5 readmore modify">修改个人信息</a>
					</div>
					<div class="col-xs-12 visible-sm btn-xs">
						<a href="BeArtist.jsp" class="col-xs-6 readmore beartist">申请成为艺术家<!--我的个人主页--></a>
						<a href="modify.jsp" class="col-xs-6 readmore modify">修改个人信息</a>
					</div>
					<div class="col-xs-12 visible-xs btn-xs">
						<a href="BeArtist.jsp" class="col-xs-6 readmore beartist">申请成为艺术家<!--我的个人主页--></a>
						<a href="modify.jsp" class="col-xs-6 readmore modify">修改个人信息</a>
					</div>
				</div>
			</div>


			<div class="main-mid">
				<div class="row person_info">
					<div class="col-xs-12 info_div">
						<div class="row info1">
							<p class="col-xs-12 title_person"><span class="glyphicon glyphicon-ok-circle"></span> &nbsp;账号信息</p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-user partten"></span>　昵称</p>
							<p class="col-xs-9" id="nickname">我的昵称</p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-lock partten"></span>　修改密码</p>
							<p class="col-xs-9"><a href="<%=basePath%>customer.do?method=EnterPassword"><span class="glyphicon glyphicon-edit"></span> 点击修改密码</a></p>
						</div>
						<!-- <div class="row info" id="advantage_div">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-heart"></span>　擅长领域</p>
							<p class="col-xs-9">我擅长的领域</p>
						</div> -->
						<!-- <div class="row info info2" id="showme_div">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-leaf"></span>　个人简介</p>
							<p class="col-xs-9">我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介</p>
						</div> -->
						
					</div>
								
				</div>

				<div class="row buy_info">
					<div class="col-xs-12 info_div">
						<div class="row info1">
							<p class="col-xs-12 title_person"><span class="glyphicon glyphicon-ok-circle"></span> &nbsp;身份信息</p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-tags partten"></span>　真实姓名</p>
							<p class="col-xs-9" id = "realname">我的真实姓名</p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-credit-card partten"></span>　身份证</p>
							<p class="col-xs-9" id = "personnumber">我的身份证号</p>
						</div>
						<div class="row info info2">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-phone partten"></span>　手机</p>
							<p class="col-xs-9" id = "telphone">我的手机</p>
						</div>
					</div>		
				</div>

				<div class="row buy_info">
					<div class="col-xs-12 info_div">
						<div class="row info1">
							<p class="col-xs-12 title_person"><span class="glyphicon glyphicon-ok-circle"></span> &nbsp;购物信息</p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-credit-card partten"></span>　我的订单</p>
							<p class="col-xs-9"><a href="<%=basePath%>order.do?method=EnterMyOrder">查看我的所有订单 >></a></p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-envelope partten"></span>　我的消息</p>
							<p class="col-xs-9"><a href="<%=basePath%>message.do?method=entermymessage">查看我的消息 >></a></p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-map-marker partten"></span>　我的地址</p>
							<p class="col-xs-9"><a href="<%=basePath%>address.do?method=EnterAddress">查看我的地址 >></a></p>
						</div>
						<div class="row info info2">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-usd partten"></span>　余额</p>
							<p class="col-xs-9"><a href="<%=basePath%>customer.do?method=EnterBalance">查看我的余额 >></a></p>
						</div>
						<!-- <div class="row info info2">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-floppy-disk partten"></span>　支付宝</p>
							<p class="col-xs-9" id = "telphone">我的支付宝号码</p>
						</div> -->
					</div>			
				</div>
			</div>
			
				
		</div>
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