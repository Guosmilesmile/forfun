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
	<title>PayFor</title>
	<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/payfor.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script src="../js/lanrenzhijia.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
	<script type="text/javascript">
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
		
		function checkTelephone(telephone)
		{
			var strRegex = /[1-9]\d{6,}$/;
			var re = new RegExp(strRegex);
			
			if(!re.test(telephone))
			{
				$("#telephone").focus();
				return false;
			}
			
			return true;
		}
		
		function validate()
		{
			var telephone = $("#telephone").val();
			var address = $("#address").val();
			
			if(telephone == "" || telephone == null || address == "" || address == null)
			{
				alert("信息不完整!");
				return false;
			}
			
			if(!checkTelephone(telephone))
			{
				alert("电话号码格式错误");
				return false;
			}
			
			return true;
		}
		
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
						//window.open("Login.jsp");
						//var newTab=window.open('about:blank');
						//newTab.location.href="Login.jsp";
						location.href="<%=basePath%>font/Login.jsp";
					}else if(json==3){
						location.href="<%=basePath%>font/error.jsp";
						//跳转到错误页面
					}else if(json==2){
						//相符则为修改页面
						$('#subnav').html("修改订单");
						$('#subtitle').html("修改订单");
					}
				},error:function(){
					
				}
			});
		}
		//通过id获取商品详情 
		function getProductById(id){
			$.ajax({
				type:'post',
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
					var authorid = product.authorid;
					$('#productid').val(id);
					$('#productname').html(name);
					$('#goodsdetail').attr('href','<%=basePath%>font/goodsdetail.jsp?productid='+id);
					$('#money').html(money);
					$('#authorname').html(authorname);
					$('#productimg').attr('src',imgurl);
					$('#artistlink').attr('href','<%=basePath%>font/artistHome.jsp?id='+authorid);
					var width = $(".good_item").width();
					var height = width/4*3;
				  	$(".good_item").height(height);
				  	
				  	
				  	var pic_w = $(".order_pic").width();
					var pic_h = pic_w;
					$(".order_pic").height(pic_h);

					var btn_remove_h = $(".add_div").height();
					$(".add_remove").height(btn_remove_h);

					var add_hidden_w = $(".add_new").width();
					$(".add_hidden").width(add_hidden_w);
				},error:function(){
					
				}
			});
		}
		
		//获取地址列表
		function getAddress(customerUserId){
			$.ajax({
				type:'post',
				url:'<%=basePath%>address.do?method=getAddressByCustomerid',
				data:{customerUserid:customerUserId},
				success:function(json){
					var body = "";
					body += "<div class='row order_artist order_add'>"
						+"<p class='col-xs-12 artist_name'><span class='glyphicon glyphicon-link' aria-hidden='true'></span>&nbsp;&nbsp;收货信息&nbsp;&nbsp;<span class='glyphicon glyphicon-menu-right partten1' aria-hidden='true'></span></p>"
						+"</div>";
					if(json.length>0){
						for(var i=0;i<json.length;i++){
							var receiver = json[i].receiver;
							var address = json[i].address;
							var telephone = json[i].telephone;
							var id = json[i].id;
							body += "<div class='row order_add_1'>"
								+"<div class='radio add_radio'>"
						  			+"<label>";
						  			if(i==0)
						  				body +="<input type='radio' name='addressid' id='blankRadio1' value='"+id+"' checked>";
						  			else
						  				body +="<input type='radio' name='addressid' id='blankRadio1' value='"+id+"'>";
						  			body+="</label>"
						  		+"</div>"
						  			+"<div class='add_info'>"
						  			+"<p>收货人："+receiver+"</p>"
						  			+"<p>地址："+address+"</p>"
						  			+"<p>电话："+telephone+"</p>"
						  		+"</div>"
						  	+"</div>";
						}
						
					}
					body+="<div class='row add_new'>"
					+"<button class='new_btn' onclick='addNewOne()' type='button'><span class='glyphicon glyphicon-plus-sign' aria-hidden='true'></span>&nbsp;&nbsp;新增地址</button>"
					+"</div>";
					$('#addresslist').html(body);
				},error:function(){
					
				}
			});
		};
		function addNewOne(){
			$(".add_hidden_bg").show();
			$(".add_hidden").show();
		}

		function submitNewOne(){
			$(".add_hidden_bg").hide();
			$(".add_hidden").hide();
		}
		function validate(obj){  
		     var reg = new RegExp("^[0-9]*$");  
			 if(!reg.test(obj)){  
			     alert("请输入数字!");  
			     return false;
			 }  
			 return true;
		}
		function addAddress(address,telephone,receiver){
			$.ajax({
				type:'post',
				asycn:false,
				url:'<%=basePath%>address.do?mehtod=addCustomerAddress',
				data:{address:address,telephone:telephone,receiver:receiver},
				success:function(json){
					if(json==-1){
						location.href="<%=basePath%>font/Login.jsp";
					}else if(json==0){
						alert("添加失败");
					}else if(json==1){
						alert("添加成功");
						$(".add_hidden_bg").hide();
						$(".add_hidden").hide();
						$('#AddReceiver').val("");
						$('#AddAddress').val("");
						$('#AddTelephone').val("");
						var customerUserid = getCookieUserid();
						if(null==customerUserid)
							location.href="<%=basePath%>font/Login.jsp";
						getAddress(customerUserid);
					} 
				},error:function(){
					alert("fail");
				}
			});
		};
		$(document).ready(function(){
			$('#usernameaction').hide();
			$('#loginoutaction').hide();
			var productid = getUrlParam("productid");
			if(productid==null){
				location.href="404.jsp";
			}
			checkOrder(productid);
			getProductById(productid);
			CheckUser();

			var customerUserid = getCookieUserid();
			if(null==customerUserid)
				location.href="<%=basePath%>font/Login.jsp";
			getAddress(customerUserid);
			
			$("#menu").click(function(){
			 $("#menu-xs").toggle(300);
			});
			var width = $(".good_item").width();
			var height = width/4*3;
			$(".good_item").height(height);
			
			
			var pic_w = $(".order_pic").width();
			var pic_h = pic_w;
			$(".order_pic").height(pic_h);

			var btn_remove_h = $(".add_div").height();
			$(".add_remove").height(btn_remove_h);

			var add_hidden_w = $(".add_new").width();
			$(".add_hidden").width(add_hidden_w);
			

			$(window).resize(function() {
			  	var width = $(".good_item").width();
				var height = width/4*3;
			  	$(".good_item").height(height);
			  	
			  	
			  	var pic_w = $(".order_pic").width();
				var pic_h = pic_w;
				$(".order_pic").height(pic_h);

				var btn_remove_h = $(".add_div").height();
				$(".add_remove").height(btn_remove_h);

				var add_hidden_w = $(".add_new").width();
				$(".add_hidden").width(add_hidden_w);
			});
			$(".sub").show();
			$(".box_active a").click(function(){
				$(".sub").slideToggle("slow");
			});
			$('#payfor').click(function(){
				$('#orderform').submit();	
			});
			$('#addsubmit').click(function(){
				var receiver = $('#AddReceiver').val();
				var address = $('#AddAddress').val();
				var telephone = $('#AddTelephone').val();
				if(""==receiver || undefined == receiver || null ==receiver){
					alert("收货人不得为空");
					return;
				}
				if(""==address || undefined == address|| null==address){
					alert("地址不得为空");
					return;
				}
				if(""==telephone || undefined == telephone|| null==telephone){
					alert("联系电话不得为空");
					return;
				}
				if(validate(telephone)){
					addAddress(address,telephone,receiver);
				}
			});
		});
	</script>
	<style type="text/css">
		*{font-style: normal;}
	</style>
</head>
<body>
	<a href="javascript:;" class="lanrenzhijia_top"></a>
	
<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left partten" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-piggy-bank" aria-hidden="true"></span>&nbsp;&nbsp;现在购买</p>
	</div>
</div>

<div class="container-fluid mainer">
	<div class="row order_div">
		<a href="artistHome.html" id="artistlink">
			<div class="row order_artist">
				<p class="col-xs-12 artist_name"><span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;<span id="authorname">艺术家名称</span>&nbsp;&nbsp;<span class="glyphicon glyphicon-menu-right partten1" aria-hidden="true"></span></p>
			</div>
		</a>
		<a href="OrderDetail.html" id="goodsdetail">
			<div class="row order_info">
				<img class="col-xs-3 order_pic" src="../image/good.jpg" id="productimg">
				<div class="col-xs-9 row order_label">
					<div class="row label1">
						<p class="col-xs-8 order_name" id="productname">订单商品名称订单商品名称</p>
						<p class="col-xs-4 order_price" id="money">￥89.00</p>
					</div>
				</div>
			</div>
		</a>
	</div>
	
	
	<form action="<%=basePath%>product.do?method=AddOrder" method="post" id="orderform">
	<input type="hidden" name="productid" value="" id="productid">
	<div class="row order_div" id='addresslist'>
		<div class="row order_artist order_add">
			<p class="col-xs-12 artist_name"><span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;收货信息&nbsp;&nbsp;<span class="glyphicon glyphicon-menu-right partten1" aria-hidden="true"></span></p>
		</div>
		<div class="row order_add_1">
			<div class="radio add_radio">
	  			<label>
	    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
	  			</label>
			</div>
			<div class="add_info">
				<p>收货人：孔日天</p>
				<p>地址：福建省厦门市思明区厦门大学</p>
				<p>电话：15659992000</p>
			</div>
		</div>
		<div class="row order_add_1">
			<div class="radio add_radio">
	  			<label>
	    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
	  			</label>
			</div>
			<div class="add_info">
				<p>收货人：孔日天</p>
				<p>地址：福建省厦门市思明区厦门大学</p>
				<p>电话：15659992000</p>
			</div>
		</div>
		<div class="row order_add_1">
			<div class="radio add_radio">
	  			<label>
	    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
	  			</label>
			</div>
			<div class="add_info">
				<p>收货人：孔日天</p>
				<p>地址：福建省厦门市思明区厦门大学</p>
				<p>电话：15659992000</p>
			</div>
		</div>
		<div class="row add_new">
			<button type="button"  class="new_btn" onclick="addNewOne()"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>&nbsp;&nbsp;新增地址</button>
		</div>
	</div>
	
	<div class="row add_new">
		<button type="submit" class="new_btn1" id="payfor">确认购买</button>
	</div>
	
	</form>
</div>
	
				
					
				


	<div class="row add_hidden_bg"></div>
	<div class="row add_hidden">
		<div class="row add_name1">
			<button class="col-xs-offset-11 col-xs-1 new_submit1" onclick="submitNewOne()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
		<div class="row add_name">
			<p>收货人：</p>
			<input type="text" class="col-xs-12" id="AddReceiver"/>
		</div>
		<div class="row add_name">
			<p>地址：</p>
			<input type="text" class="col-xs-12" id="AddAddress"/>
		</div>
		<div class="row add_name">
			<p>电话：</p>
			<input type="text" class="col-xs-12" id="AddTelephone"/>
		</div>
		<div class="row add_name">
			<button class="col-xs-12 new_submit" id="addsubmit"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;提交</button>
		</div>
	</div>
</body>
</html>