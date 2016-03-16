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
	<title>ArtistHome</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/artistHome.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script src="../js/lanrenzhijia.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
	<script type="text/javascript">
		function GetArtistInfo(id){
			$.ajax({
				type:'post',
				asycn:false,
				url:'<%=basePath%>customer.do?method=getCustomervoByid',
				data:{customerid:id},
				success:function(json){
					var customer = json.customer;
					var name = customer.name;
					var avator = customer.avator;
					var artistid = customer.id;
					var artistuserid = customer.userid;
					var cookieuserid = getCookieUserid();					
					if(null == cookieuserid){
					}else if(cookieuserid==artistuserid){
						$('.modify').show();
						$('.beartist').show();
						$('.beartist').attr('href','<%=basePath%>product.do?method=EnterPublish');
					}else{
						
						$('.beartist1').show();
						$('.beartist1').attr('href','<%=basePath%>customer.do?method=EnterChat&toid='+artistid);
					}
					$('#avator').attr('src',avator);
					$('#artistname').html(name);
				},error:function(){
					
				}
			});
		}
		
		
		
		
		function GetArtistProduct(page,pageSize,artistid){
			$.ajax({
				type:'post',
				asycn:false,
				url:'<%=basePath%>/product.do?method=GetArtistProduct',
				data:{artistid:artistid,page:page,pageSize:pageSize},
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
							var situation = products[i].situation;
							var methodid= products[i].methodid;
							var methodname = products[i].methodname;
							if(i%2==0){
								tempbody +="<div class='col-md-6 goods_two'>";
							}
							if(methodid==1){
								tempbody +="<div class='col-xs-6 goods'><a href='goodsdetail.jsp?productid="+id+"'><img src='"+imgurl+"' class='good_item'></a>"
								 +"<div class='good_name'><p>"+name+"</p><p>";
							}else if(methodid==2){
								tempbody +="<div class='col-xs-6 goods'><a href='auctionDetail.jsp?productid="+id+"'><img src='"+imgurl+"' class='good_item'></a>"
								 +"<div class='good_name'><p>"+name+"</p><p>";
							}
							
							tempbody+=methodname;
							if(situation==0)tempbody+="|未上架";
							if(situation==1)tempbody+="|上架中";
							if(situation==2)tempbody+="|已下架";
							if(situation==3)tempbody+="|已出售";
		
							tempbody += "</p><p class='price'>￥"+money+"</p><a href='goodsdetail.jsp?productid="+id+"' class='readmore'>详情</a></div></div>";
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
			$('.back_btn').click(function(){
				location.href="<%=basePath%>font/artistlist.jsp";
			});
			$('.modify').hide();
			$('.beartist').hide();
			$('.beartist1').hide();
			$('#usernameaction').hide();
			$('#loginoutaction').hide();
			var id = getUrlParam("id");
			var page = 1 ;
			var pageSize = 8;
			GetArtistInfo(id);
			GetArtistProduct(page,pageSize,id);
			CheckUser();
			//查看更多点击事件
			$('.learn_more').live('click',function(){
				 page = page +1 ;
				 GetArtistProduct(page,pageSize,id);
				 $(this).hide();
		  	});
			$(window).scroll(function(){
				var _top = $(window).scrollTop();
				if(_top>300){
					$('.lanrenzhijia_top').fadeIn(600);
				}else{
					$('.lanrenzhijia_top').fadeOut(600);
				};
			});
			$(".lanrenzhijia_top").click(function(){
				$("html,body").animate({scrollTop:0},500);
			});
			$("#menu").click(function(){
			  $("#menu-xs").toggle(300);
			});
			
			var width = $(".userpic").width();
			var height = width;
			$(".userpic").height(height);
			$(window).resize(function() {
				var width = $(".userpic").width();
				var height = width;
				$(".userpic").height(height);
			});
		  	
		  	var width = $(".good_item").width();
			var height = width/2.5*3;
		  	$(".good_item").height(height);

		  	var title_w = $(window).width();	  	
			$(".title_bar").width(title_w);
			

		  	$(window).resize(function() {
		  		
		  		var width = $(".good_item").width();
		  		var height = width/2.5*3;
		  	  	$(".good_item").height(height);

		  	  	var title_w = $(window).width();
		  		$(".title_bar").width(title_w);
		  	});
		  
		});
	</script>
	<style type="text/css">
		*{font-style: normal;}
	</style>
</head>
<body>

<a href="javascript:;" class="lanrenzhijia_top hidden-xs hidden-sm"></a>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;&nbsp;艺术家主页</p>
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
		<h6 class="location"><a href="home.html">首页</a> <i> </i> 艺术家主页 </h6>
	</div>


	<div class="bar_news">
		<h2>艺术家主页</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="user_info">
				<img class="userpic" id="avator" src="../image/bl.jpg" onerror="javascript:this.src='../image/bl.jpg'";>
				<p class="username" id="artistname">艺术家用户名</p>
			</div>
			<div class="row person_btn">
				<div class="col-xs-offset-4 col-xs-4 visible-lg">
					<a href="release.html" class="col-xs-5 beartist">发布艺术品<!--我的个人主页--></a>
					<a href="<%=basePath%>font/artistManage.jsp" class="col-xs-5 modify">管理艺术品</a>
					<a href="artistManage.html"  class="col-xs-offset-3 col-xs-6 chat beartist1">联系艺术家</a>
				</div>
				<div class="col-xs-offset-3 col-xs-6 visible-md">
					<a href="release.html" class="col-xs-5 beartist">发布艺术品<!--我的个人主页--></a>
					<a href="<%=basePath%>font/artistManage.jsp" class="col-xs-5 modify">管理艺术品</a>
					<a href="artistManage.html"   class="col-xs-offset-3 col-xs-6 chat beartist1">联系艺术家</a>
				</div>
				<div class="col-xs-offset-2 col-xs-8 visible-sm">
					<a href="release.html" class="col-xs-5 beartist">发布艺术品<!--我的个人主页--></a>
					<a href="<%=basePath%>font/artistManage.jsp" class="col-xs-5 modify">管理艺术品</a>
					<a href="artistManage.html"   class="col-xs-offset-3 col-xs-6 chat beartist1">联系艺术家</a>
				</div>
				<div class="col-xs-12 btn-artisthome visible-xs">
					<a href="release.html" class="col-xs-6 beartist">发布艺术品<!--我的个人主页--></a>
					<a href="<%=basePath%>font/artistManage.jsp" class="col-xs-6 modify">管理艺术品</a>
					<a href="artistManage.html"   class="col-xs-offset-3 col-xs-6 chat beartist1">联系艺术家</a>
				</div>
			</div>

			<div class="row artwork" id="goodlist">
			<!--  
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/bg_login1.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="goodsdetail.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>商品名称</p>
							<p>已上架</p>
							<p class="price">￥99.0</p>
							<a href="goodsdetail.html" class="readmore" target="_blank">详情</a>
						</div>
					</div>
				</div>
				

				<div class="col-xs-12 learn_more">
					<p>查看更多</p>
				</div>
				-->
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