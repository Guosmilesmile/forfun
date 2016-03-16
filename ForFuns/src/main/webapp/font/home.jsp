<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">
	<!--[if It IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

	<title>Home</title>
	<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/home.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<style type="text/css">
		.item_pic{width:100%;}
		*{font-style: normal;}
	</style>
</head>
<body>
<a href="javascript:;" class="lanrenzhijia_top hidden-xs hidden-sm"></a>
<script src="../js/lanrenzhijia.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
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
			$('#loginoutaction').css("display","inline-block");
			$('#loginoutaction').show();
			$('#username').html("<span class='glyphicon glyphicon-user' aria-hidden='true'></span>&nbsp;&nbsp;"+json);
		},error:function(){
			
		}
	});
}
//获取热点新闻
function GetHotNews(){
	$.ajax({
		type:'post',
		async:false,
		url:'<%=basePath%>news.do?method=GetHotNew',
		data:{},
		success:function(json){
			if(json.length>0){
				var body = "";
				var point = "";
				for(var i=0;i<json.length;i++){
					var id = json[i].id;
					var imgurl = json[i].imgurl;
					var summary = json[i].summary;
					var title = json[i].title;
					if(i==0){
						point +="<li data-target='#carousel-example-generic' data-slide-to="+i+" class='active'></li>";
						body += "<div class='item active'><a href='<%=basePath%>font/news.jsp?newsid="+id+"'><img class='item_pic' src='"+imgurl+"' alt='...' "+"onerror=\"javascript:this.src=\'<%=basePath%>image/bg_scroll1.jpg\';\""+"><div class='carousel-caption'><h3>"+title+"</h3><p>"+summary+"</p></div></a></div>";
					}else{
						point +="<li data-target='#carousel-example-generic' data-slide-to="+i+"></li>";
						body += "<div class='item'><a href='<%=basePath%>font/news.jsp?newsid="+id+"'><img class='item_pic' src='"+imgurl+"' alt='...' "+"onerror=\"javascript:this.src=\'<%=basePath%>image/bg_scroll1.jpg\';\""+"><div class='carousel-caption'><h3>"+title+"</h3><p>"+summary+"</p></div></a></div>";
					}
					
				}
				$('#banner').html(body);
				$('#bannerpoint').html(point);
			}
		},error:function(){
				
		}
	});
}

//获取第1栏广告
function GetFirstAdvert(){
	$.ajax({
		type:'post',
		async:false,
		url:'<%=basePath%>advert.do?method=GetFirstAdvert',
		data:{},
		success:function(json){
			if(json.length>0){
				var body = "";
				for(var i=0;i<json.length;i++){
					var id = json[i].id;
					var name = json[i].title;
					var imgurl = json[i].imgurl;
					var link = "<%=basePath%>font/advertdetail.jsp?id="+id;
					body+="<div class='col-md-4 Recommend'><a href='"+link+"' target='_blank'><img class='good_pic' src='"+imgurl+"'></a><div class='tab_desc'><p>"+name+"</p></div></div>";
				}
				$('#advertfirst').html(body);
				var goods_pic_w = $(".good_pic").width();
		  		$(".good_pic").height(goods_pic_w)*1.7;
			}
		},error:function(){
				
		}
	});
}

//获取第2栏广告
function GetSecondAdvert(){
	$.ajax({
		type:'post',
		async:false,
		url:'<%=basePath%>advert.do?method=GetSecondAdvert',
		data:{},
		success:function(json){
			if(json.length>0){
				var body = "";
				for(var i=0;i<json.length;i++){
					var id = json[i].id;
					var name = json[i].title;
					var imgurl = json[i].imgurl;
					var link = "<%=basePath%>font/advertdetail.jsp?id="+id;
					body+="<div class='col-md-4 Recommend'><a href='"+link+"' target='_blank'><img class='good_pic' src='"+imgurl+"'></a><div class='tab_desc'><p>"+name+"</p></div></div>";
				}
				$('#advertsecond').html(body);
				var goods_pic_w = $(".good_pic").width();
		  		$(".good_pic").height(goods_pic_w)*1.7;
			}
		},error:function(){
				
		}
	});
}

//获取第3栏广告
function GetThirdAdvert(){
	$.ajax({
		type:'post',
		async:false,
		url:'<%=basePath%>advert.do?method=GetThirdAdvert',
		data:{},
		success:function(json){
			if(json.length>0){
				var body = "";
				for(var i=0;i<json.length;i++){
					var id = json[i].id;
					var name = json[i].title;
					var imgurl = json[i].imgurl;
					var link = "<%=basePath%>font/advertdetail.jsp?id="+id;
					body+="<div class='col-md-4 Recommend'><a href='"+link+"' target='_blank'><img class='good_pic' src='"+imgurl+"'></a><div class='tab_desc'><p>"+name+"</p></div></div>";
				}
				$('#advertthree').html(body);
				var goods_pic_w = $(".good_pic").width();
		  		$(".good_pic").height(goods_pic_w)*1.7;
			}
		},error:function(){
				
		}
	});
}

$(document).ready(function(){
	$('#usernameaction').hide();
	$('#loginoutaction').hide();
	CheckUser();
	GetHotNews();
	GetFirstAdvert();
	GetSecondAdvert();
	GetThirdAdvert();
	var width = $(".carousel-inner").width();
		var height = $(".carousel-inner").width()/5*2.4;
  		$(".item_pic").width(width);
		$(".item_pic").height(height);
		$(".item").height(height);	
  		$(".carousel-inner").height(height);
  		$(".carousel-control").height(height);

  		var artist_h = $(".class75").height();
  		$(".class25").height(artist_h);

  		var artist_h1 = $(".col9").height();
  		$(".col3").height(artist_h1);

  		var tag3_h = $(".tag01").height();
  		$(".tag3").height(tag3_h);
  		

  	$(window).resize(function() {
  		var width = $(".carousel-inner").width();
		var height = $(".carousel-inner").width()/5*2.4;
  		$(".item_pic").width(width);
		$(".item_pic").height(height);
		$(".item").height(height);	
  		$(".carousel-inner").height(height);
  		$(".carousel-control").height(height);
  		
  		var artist_h = $(".class75").height();
  		$(".class25").height(artist_h);

  		var artist_h1 = $(".col9").height();
  		$(".col3").height(artist_h1);

  		var tag3_h = $(".tag01").height();
  		$(".tag3").height(tag3_h);
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

	<div class="header1">
		<div class="col-xs-12 header-top">
			<div class="container head1">
				<div class="statu_bar">
					<ul class="support">
						<li ><span ><i class="item_message"> </i>471979617@qq.com</span></li>
						<li ><span ><i class="item_tel"> </i>156-9000-8000</span></li>			
					</ul>
					<ul class="support-right">
						<li class="li1" id="loginaction" ><a href="<%=basePath%>font/Login.jsp" ><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;登陆</a></li>
						<li class="li2" id="registeraction"><a href="<%=basePath%>font/Register.jsp" ><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;&nbsp;注册账号</a></li>
						<li class="li1" id="usernameaction"><a href="#" id="username"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;</a></li>
						<li class="li2" id="loginoutaction"><a href="<%=basePath%>customer.do?method=loginout" ><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;&nbsp;退出</a></li>			
					</ul>
				</div>
			</div>
			<div class="header-bottom">
				<div class="container">
					<div class="logo">
						<h1><a href="<%=basePath%>font/home.jsp">ArtCustomize</a></h1>
					</div>
					<div class="top-nav-xs visible-md">
						<div id="menu">
							<p>菜  单</p>
						</div>
						<div id="menu-xs">
							<ul>
								<li><a href="<%=basePath%>font/home.jsp">首页</a></li>
								<li><a href="<%=basePath%>font/goodslist.jsp">成品</a></li>
								<li><a href="<%=basePath%>font/auctionList.jsp">拍卖</a></li>
								<li><a href="<%=basePath%>font/artistlist.jsp">艺术家</a></li>
								<li><a href="<%=basePath%>font/newslist.jsp">资讯中心</a></li>
							</ul>
						</div>
					</div>
					<div class="top-nav visible-lg">
						<ul class="megamenu skyblue">
							<li><a href="<%=basePath%>font/home.jsp">首页</a></li>
							<li><a href="<%=basePath%>font/goodslist.jsp">成品</a></li>
							<li><a href="<%=basePath%>font/auctionList.jsp">拍卖</a></li>
							<li><a href="<%=basePath%>font/artistlist.jsp">艺术家</a></li>
							<li><a href="<%=basePath%>font/newslist.jsp">资讯中心</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="scroll_bar">
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators" id="bannerpoint">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" id="banner">
    <div class="item active">
      <a href="http://www.baidu.com">
	      <img class="item_pic" src="<%=basePath%>image/bg_login.jpg" alt="...">
	      <div class="carousel-caption">
	      	<h3>这里是标题一</h3>
	    	<p>这里是资讯描述资讯描述资讯描述资讯描述</p>
	      </div>
      </a>
    </div>
    <div class="item">
    	<a href="http://www.baidu.com">
	      <img class="item_pic" src="<%=basePath%>image/bg_login.jpg" alt="...">
	      <div class="carousel-caption">
	      	<h3>这里是标题二</h3>
	    	<p>这里是资讯描述资讯描述资讯描述资讯描述</p>
	      </div>
	    </a>
    </div>
    <div class="item">
      <img class="item_pic" src="<%=basePath%>image/bg_login.jpg" alt="...">
      <div class="carousel-caption">
      	<h3>这里是标题三</h3>
    	<p>这里是资讯描述资讯描述资讯描述资讯描述</p>
      </div>
    </div>
  </div>


  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>



	</div>
	<div class="content">
		<div class="container">
			<div class="content-top visible-lg visible-md">
				<div class="col-md-9 col9">
					<div class="col-top">
						<div class="col-md-6 black">
							<a href="goodslist.jsp">
								<div class="arts">
									<h3>艺术品成品</br>专区 >></h3>
								</div>
								<img src="<%=basePath%>image/arts_pic.png" alt="" style="display: none;"></a>
							</a>
						</div>
						<div class="col-md-6 black-in">
							<a href="DIY.html">
								<div class="arts diy">
									<h3 class="visible-md visible-lg">艺术品定制</br>专区 >></h3>
								</div>
								<img src="<%=basePath%>image/diy_pic.png" alt="" style="display: none;"></a>
							</a>
						</div>						
					</div>
					<div>
					<div class="col-top-bottom">
						<h3 class="news visible-lg">ArtCostomize艺术品资讯专区</h3>
						<h3 class="news visible-md">艺术品资讯专区</h3>
						<a href="newslist.jsp" class="now-in">进 入</a>
					</div>
					</div>
				</div>
				<div class="col-md-3 per col3">
					<a href="artistlist.jsp">
						<img class="img-responsive" src="<%=basePath%>image/artist.png" >
						<div class="six">
							<h4>平台艺术家</br>专区 >></h4>
						</div>
					</a>
				</div>
			</div>


			<div class="content-top content-top1 visible-xs visible-sm">
				<div class="row tag_up">
					<div class="col-xs-3 tag0 tag01">
						<div class="row col-xs-12 tag tag1">
							<a href="<%=basePath%>font/goodslist.jsp"><span class="glyphicon glyphicon-tower pattern1" aria-hidden="true"></span></br>艺术品</a>
						</div>			
					</div>
					<div class="col-xs-3 tag0">
						<div class="row col-xs-12 tag tag2">
							<a href="<%=basePath%>font/auctionList.jsp"><span class="glyphicon glyphicon-tags pattern1" aria-hidden="true"></span></br>拍卖</a>
						</div>
					</div>
					<div class="col-xs-3 tag0">
						<div class="row col-xs-12 tag tag3">
							<a href="<%=basePath%>font/artistlist.jsp"><span class="glyphicon glyphicon-camera pattern1" aria-hidden="true"></span></br>艺术家</a>
						</div>
					</div>
					<div class="col-xs-3 tag0">
						<div class="row col-xs-12 tag tag4">
							<a href="<%=basePath%>font/newslist.jsp"><span class="glyphicon glyphicon-comment pattern1" aria-hidden="true"></span></br>资讯中心</a>
						</div>	
					</div>
				</div>
			</div>

			<div class="sap_tabs sap_tabs1">
				<label class="line"></label>
				<h2>艺术成品推荐</h2>
				<div class="recommend_arts" id="advertfirst">
					<%-- <div class="col-md-4 Recommend">
						<a href="news.jsp" target="_blank"><img class="good_pic" src="<%=basePath%>image/a11.jpg"></a>
						<div class="tab_desc">
							<p>艺术品名称及描述艺术品名称及描述艺术品名称及描述</p>
						</div>
					</div>

					<div class="col-md-4 Recommend">
						<a href="news.jsp" target="_blank"><img class="good_pic" src="<%=basePath%>image/a22.jpg"></a>
						<div class="tab_desc">
							<p>艺术品名称及描述艺术品名称及描述艺术品名称及描述</p>
						</div>
					</div>

					<div class="col-md-4 Recommend">
						<a href="news.jsp" target="_blank"><img class="good_pic" src="<%=basePath%>image/a33.jpg"></a>
						<div class="tab_desc">
							<p>艺术品名称及描述艺术品名称及描述艺术品名称及描述</p>
						</div>
					</div> --%>
				</div>
			</div>

			<div class="sap_tabs">
				<label class="line"></label>
				<h2>艺术定制推荐</h2>
				<div class="recommend_arts" id="advertsecond">
					<%-- <div class="col-md-4 Recommend">
						<a href="news.jsp" target="_blank"><img class="good_pic" src="<%=basePath%>image/b11.jpg"></a>
						<div class="tab_desc">
							<p>艺术品名称及描述艺术品名称及描述艺术品名称及描述</p>
						</div>
					</div>

					<div class="col-md-4 Recommend" >
						<a href="news.jsp" target="_blank"><img class="good_pic" src="<%=basePath%>image/b22.jpg"></a>
						<div class="tab_desc">
							<p>艺术品名称及描述艺术品名称及描述艺术品名称及描述</p>
						</div>
					</div>

					<div class="col-md-4 Recommend" >
						<a href="news.jsp" target="_blank"><img class="good_pic" src="<%=basePath%>image/b33.jpg"></a>
						<div class="tab_desc">
							<p>艺术品名称及描述艺术品名称及描述艺术品名称及描述</p>
						</div>
					</div> --%>
				</div>
			</div>

			<div class="sap_tabs">
				<label class="line"></label>
				<h2>艺术家推荐</h2>
				<div class="recommend_arts" id="advertthree">
					<%-- <div class="col-md-4 Recommend" >
						<a href="news.jsp" target="_blank"><img class="good_pic" src="<%=basePath%>image/c11.jpg"></a>
						<div class="tab_desc">
							<p>艺术品名称及描述艺术品名称及描述艺术品名称及描述</p>
						</div>
					</div>

					<div class="col-md-4 Recommend" >
						<a href="news.html" target="_blank"><img class="good_pic" src="<%=basePath%>image/c22.jpg"></a>
						<div class="tab_desc">
							<p>艺术品名称及描述艺术品名称及描述艺术品名称及描述</p>
						</div>
					</div>

					<div class="col-md-4 Recommend" >
						<a href="news.html" target="_blank"><img class="good_pic" src="<%=basePath%>image/c33.jpg"></a>
						<div class="tab_desc">
							<p>艺术品名称及描述艺术品名称及描述艺术品名称及描述</p>
						</div>
					</div> --%>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="bottom-grid">
				<img class="img-responsive" src="<%=basePath%>image/back1.jpg">
				<div class="fit">
					<h6>ART IS A FUNNY WORD</h6>
					<p>Enjoy yourself in ArtCustomize</p>
				</div>
			</div>
			<div class="litter_footer">
				<label class="line1"></label>
				<p>Copyright &copy; 2015. All rights reserved.</p>
			</div>
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