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
	<title>Goodslist</title>
	<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/goodslist.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
</head>
<body>

<a href="javascript:;" class="lanrenzhijia_top hidden-xs hidden-sm"></a>
<script src="<%=basePath%>js/lanrenzhijia.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
<style type="text/css">
		*{font-style: normal;}
</style>
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
$(document).ready(function(){
	$(".sub").show();
	$(".box_active a").click(function(){
		$(".sub").slideToggle("slow");
	});
});
</script>
<script type="text/javascript">
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


//获取商品类型
function GetAllType(){
	$.ajax({
		type:'post',
		url:'<%=basePath%>/productType.do?method=getAllProductType',
		data:{},
		success:function(json){
			json = json.productTypes;
			if(json.length>0){
				var body = "";
				for(var i=0;i<json.length;i++){
					body+= "<li id='typeid_"+json[i].id+"'>"+json[i].name+"</li>";
				}
				$('#typeul').html(body);
				//切换分类  
				$('#typeul').find('li').click(function(){
					$('#goodlist').html("");
					var id = $(this).attr('id');
					typeid = id.substring(7,id.length);
					GetAllOnlineProduct(typeid,page,pageSize);
				});
				
			}
		},error:function(){
		},
	});
};
function GetAllOnlineProduct(typeid,page,pageSize){
	$.ajax({
		type:'post',
		asycn:false,
		url:'<%=basePath%>/product.do?method=GetOnlineProduct',
		data:{typeid:typeid,page:page,pageSize:pageSize,methodid:1},
		success:function(json){
			var products = json.list;
			var total = json.total;
			globaltotal = total;
			if(products.length>0){
				var body = "";
				var tempbody ="";
				for(var i=0;i<products.length;i++){
					tempbody ="";
					var id = products[i].id;
					var imgurl = products[i].imgurl;
					var name = products[i].name;
					var money = products[i].initmoney;
					var authorname = products[i].authorname;
					if(i%2==0){
						tempbody +="<div class='col-md-6 goods_two'>";
					}
					tempbody +="<div class='col-xs-6 goods'><a href='goodsdetail.jsp?productid="+id+"'><img src='"+imgurl+"' class='good_item'></a>"
							 +"<div class='good_name'><p>"+name+"</p><p class='artistname1'>"+authorname+"</p><p class='price'>￥"+money+"</p><a href='goodsdetail.jsp?productid="+id+"' class='readmore read1' >详情</a></div></div>";
					if(i%2==1){
						tempbody +="</div>";
					}
					body+=tempbody;
				}
				if(page*pageSize <globaltotal){
					body +="<div class='col-xs-12 learn_more'><p>查看更多</p></div>";
				}
				$('#goodlist').append(body);
				var width = $(".good_item").width();
				var height = width/2.5*3;
			  	$(".good_item").height(height);

			}else{
				var none = "";
				none +="<div class='col-xs-12 none'><p>暂无此类商品</p></div>";
				$('#goodlist').html(none);
			}
		},error:function(){
		},
	});
};
$(document).ready(function(){
	$('#usernameaction').hide();
	$('#loginoutaction').hide();
	CheckUser();
	var globaltotal = 0;
	var typeid = 1;
	var page = 1 ;
	var pageSize = 12;
	GetAllOnlineProduct(typeid,page,pageSize);
	GetAllType();
	//查看更多点击事件
	$('.learn_more').live('click',function(){
		 page = page +1 ;
		 GetAllOnlineProduct(typeid,page,pageSize);
		 $(this).hide();
  	});
	//切换分类  
	$('#typeul').find('li').live('click',function(){
		$('#goodlist').html("");
		var id = $(this).attr('id');
		typeid = id.substring(7,id.length);
		GetAllOnlineProduct(typeid,page,pageSize);
	});
  	$(window).resize(function() {
  		var width = $(".good_item").width();
		var height = width/2.5*3;
  		$(".good_item").height(height);
  	});
  	
  	
  	$('#username').live('click',function(){
  		var useridtoken = getCookie("useridtoken");
  		var useridtoken = getCookie("useridtoken");
  		if(null==useridtoken || "" == useridtoken){
  			return ;
  		}
  		var index = useridtoken.indexOf("&");
  		var id =  useridtoken.substring(0,index);
  		var address = "<%=basePath%>font/personal.jsp?id=";
  		location.href=address+id;
  	});
});
</script>

	<div class="header-top">
			<div class="container head1">
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
						<h1><a href="home.jsp">ArtCustomize</a></h1>
					</div>
					<div class="top-nav-xs visible-md">
						<div id="menu">
							<p>菜  单</p>
						</div>
						<div id="menu-xs">
							<ul>
								<li><a href="home.jsp">首页</a></li>
								<li><a href="goodslist.jsp">成品</a></li>
								<li><a href="auctionList.jsp">拍卖</a></li>
								<li><a href="artistlist.jsp">艺术家</a></li>
								<li><a href="newslist.jsp">资讯中心</a></li>
							</ul>
						</div>
					</div>
					<div class="top-nav visible-lg">
						<ul class="megamenu skyblue">
							<li><a href="home.jsp">首页</a></li>
							<li><a href="goodslist.jsp">成品</a></li>
							<li><a href="auctionList.jsp">拍卖</a></li>
							<li><a href="artistlist.jsp">艺术家</a></li>
							<li><a href="newslist.jsp">资讯中心</a></li>
						</ul>
					</div>
					<div class="content-top content-top1 visible-xs visible-sm">
						<div class="row tag_up">
							<div class="col-xs-3 tag0 tag01">
								<div class="row col-xs-12 tag tag1">
									<a href="home.jsp"><span class="glyphicon glyphicon-home pattern1" aria-hidden="true"></span></br>首页</a>
								</div>			
							</div>
							<div class="col-xs-3 tag0">
								<div class="row col-xs-12 tag tag2" style="border-bottom: 3px solid #ff5d56; border-radius: 0px;">
									<a href="goodslist.jsp" style="color: #ff5d56;"><span class="glyphicon glyphicon-tower pattern1" aria-hidden="true"></span></br>艺术品</a>
								</div>
							</div>
							<div class="col-xs-3 tag0">
								<div class="row col-xs-12 tag tag3">
									<a href="artistlist.jsp"><span class="glyphicon glyphicon-camera pattern1" aria-hidden="true"></span></br>艺术家</a>
								</div>
							</div>
							<div class="col-xs-3 tag0">
								<div class="row col-xs-12 tag tag4">
									<a href="newslist.jsp"><span class="glyphicon glyphicon-comment pattern1" aria-hidden="true"></span></br>资讯中心</a>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<div class="container">
		<h6 class="location"><a href="home.jsp">首页</a> <i> </i> 艺术品列表 </h6>
	</div>


	<div class="bar_news">
		<h2>艺术品列表</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="col-lg-2 s_menu">
				<div class="menu_box box_active">
					<a class="thisCategory">艺术品分类&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-down partten2" aria-hidden="true"></span></a>
					<a href="auctionList.jsp" class="otherCategory">拍卖品</a>
					<ul class="sub" id="typeul">
						<!-- <li>分类11111111111111</li>
						<li>分类2</li>
						<li>分类3</li>
						<li>分类4</li>
						<li>分类5</li>
						<li>分类1</li>
						<li>分类2</li>
						<li>分类3</li>
						<li>分类4</li>
						<li>分类5</li>
						<li>分类1</li>
						<li>分类2</li>
						<li>分类3</li>
						<li>分类4</li>
						<li>分类5</li>
						<li>分类1</li>
						<li>分类2</li>
						<li>分类3</li>
						<li>分类4</li>
						<li>分类5</li> -->
					</ul>
				</div>
				<div class="menu_box">
					<a href="goodslist">艺术品定制</a><i> </i>
				</div>
				<div class="menu_box">
					<a href="goodslist">平台艺术家</a><i> </i>
				</div>
			</div>

			<div class="col-lg-10 good_four" id="goodlist">
			

				<!-- <div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/bg_login1.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.jsp"><img src="<%=basePath%>image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>艺术家</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.jsp" class="readmore">详情</a>
						</div>
					</div>
				</div> -->
				
				<!-- <div class="col-xs-12 learn_more">
					<p>查看更多</p>
				</div> -->
				
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