<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
	<title>Home</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/news.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
<body>

<a href="javascript:;" class="lanrenzhijia_top hidden-xs hidden-sm"></a>
<script src="<%=basePath%>js/lanrenzhijia.js"></script>
<script type="text/javascript" src="<%=path%>/js/easyUI/jquery-1.4.4.min.js"></script>
<style type="text/css">
	*{font-style: normal;}
	embed{width: 100%;}
</style>
<script>
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}; 
//获取cookie
function getCookie(objName){//获取指定名称的cookie的值 
	var arrStr = document.cookie.split("; "); 
	for(var i = 0;i < arrStr.length;i ++){ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName) return unescape(temp[1]); 
	} 
};
//检测用户是否已登录
function CheckUser(){
	var useridtoken = getCookie("useridtoken");
	if(null==useridtoken || "" == useridtoken){
		return ;
	}
	var index = useridtoken.indexOf("&");
	var id =  useridtoken.substring(0,index);
	$.ajax({
		type:'post',
		url:'<%=basePath%>customer.do?method=GetCustomerName',
		data:{customerid:id},
		success:function(json){
			$('#registeraction').hide();
			$('#loginaction').hide();
			$('#usernameaction').show();
			$('#usernameaction').css("display","inline-block");
			$('#loginoutaction').show();
			$('#username').html("<span class='glyphicon glyphicon-user' aria-hidden='true'></span>&nbsp;&nbsp;"+json);
		},error:function(){
			
		}
	});
}
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

//更改datebox的日期格式
function myformatter(value) {
	//return new Date(parseInt(value)).toLocaleString().replace(/年|月/g, "-")
	//		.replace(/日/g, " ");
	var myDate = new Date(parseInt(value));
	var year = myDate.getFullYear();
	var month = myDate.getMonth() + 1;
	var day = myDate.getDate();
	return year + '-' + month + '-' + day;
}
function GetNewsDetail(newsid){
	$.ajax({
		type:'post',
		async:false,
		url:'<%=basePath%>/news.do?method=getnewsbyid',
		data:{newsid:newsid},
		success:function(json){
			var news = json.news;
			var content = news.content;
			var title = news.title;
			var time = news.timestart;
			time = myformatter(time);
			var author = news.author;
			$('#news_content').html(content);
			$('#news_title').html(title);
			$('#news_time').html("发布时间："+time);
			$('#news_author').html("发布人："+author);
		},error:function(){
			
		}
	});
}
$(document).ready(function(){
	$('#usernameaction').hide();
	$('#loginoutaction').hide();
	CheckUser();
	var newsid = getUrlParam("newsid");
	GetNewsDetail(newsid);
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	$('.back_btn').click(function(){
		location.href="<%=basePath%>font/newslist.jsp";
	});
  $("#menu").click(function(){
  $("#menu-xs").toggle(300);
  });
});
</script>

<div class="col-xs-12 container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left partten" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;资讯详情</p>
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
		<h6 class="location"><a href="home.jsp">首页</a> <i> </i> <a href="newslist.jsp">资讯中心</a> <i> </i> 资讯详情</h6>
	</div>
	
	<div class="bar_news">
		<h2>资讯详情</h2>
	</div>

	<div class="content">
		<div class="container">
			<div class="news_title" >
				<p id="news_title">资讯标题</p>
			</div>
			<div class="news_author">
				<p id="news_time">发布时间：2015/11/25 &nbsp;&nbsp; 8：30</p><p id="news_author">发布人：孔日天</p>
			</div>
			<div class="news_content" id="news_content">
				<p>资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容。</p>
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