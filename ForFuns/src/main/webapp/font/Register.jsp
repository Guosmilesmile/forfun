<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">
<title>Register</title>
<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet"type="text/css" />
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
<link href="../css/footer2.css" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/Register.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
</head>
<body>

	<a href="javascript:;" class="lanrenzhijia_top hidden-xs hidden-sm"></a>
	<script src="<%=basePath%>js/lanrenzhijia.js"></script>
	<script>
	function getUrlParam(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	    if (r != null) return unescape(r[2]); return null; //返回参数值
	};  
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
$(document).ready(function()
{
	$('.label_error1').hide();
	var errorid = getUrlParam("error");
	if(errorid=="2"){
		$('#errormessage2').show();
	}
  	$("#menu").click(function()
	{
  		$("#menu-xs").toggle(300);
  	});
  	
  	var error = getUrlParam("error");
  	if(error==3)
  	{
  		$('#errormessage12').show();
  		$("#userid1").focus();
  		$('#errormessage22').show();
  		$("#userid2").focus();
  		return false;
  	}
});

function checkUserid(userid)
{	  
	 if(userid.length > 18)
	 {
	  	alert("用户名长度不对,应为5到18个字符");
	 	return false;
	 }
	 else
	 {
		var strRegex = /^[a-zA-Z]{1}[0-9a-zA-Z_]{1,}$/;
		var re=new RegExp(strRegex);
	    if(!re.test(userid))
	    {
	    	alert("用户名应包括字母、数字和下划线，以字母开头");
			return false;
	    }
	 }
    return true;
}

function checkTelphone(telphone)
{
	var strRegex = /[1-9]\d{6,}$/;
	var re = new RegExp(strRegex);
	
	if(!re.test(telphone))
	{
		$("#telphone1").focus();
		$("#telphone2").focus();
		return false;
	}
	
	return true;
}

function checkPersonnumber(personnum)
{
	var strRegex = /\d{17}(\d|X)$/;
	var re = new RegExp(strRegex);
	
	if(!re.test(personnum))
	{
		$("#personnumber").focus();
		return false;
	}
	
	return true;
}

function validate()
{
	$('.label_error1').hide();
	var userid = $("#userid").val();
	var username = $("#nickname").val();
	var password = $("#password").val();
	var confirm_password = $("#confirm_password").val();
	var realname = $("#realname").val();
	var telphone = $("#telphone").val();
	var personnumber = $("#personnumber").val();
	
	if(userid == null || userid == "" )
	{
		$('#errormessage1').show();
		return false;
	}
	
	if(password == null || password == ""){
		$('#errormessage3').show();
		return false;
	}
	if( confirm_password == null || confirm_password == "" ){
		$('#errormessage4').show();
		return false;
	}
	if(password != confirm_password)
	{
		$('#errormessage4').show();
		return false;
	}
	
	if(username == null || username == "" ){
		$('#errormessage5').show();
		return false;
	}
	
	if(realname == null || realname == "" ){
		$('#errormessage6').show();
		return false;
	}
	
	if(personnumber == null || personnumber == ""){
		$('#errormessage7').show();
		return false;
	}
	
	if(telphone == null || telphone == ""){
		$('#errormessage8').show();
		return false;
	}
	
	
	
	if(!checkUserid(userid))
	{
		return false;
	}
	
	
	if(!checkTelphone(telphone))
	{
		alert("手机号格式错误！");
		return false;
	}
	
	if(!checkPersonnumber(personnumber))
	{
		alert("身份证格式错误！");
		return false;
	}
	
	//$('#success1').show();
	return true;
}



function submitNewOne(){
	$(".add_hidden_bg").show();
	$(".ok_remove").show();
}

function ok_remove1()
{
	$(".add_hidden_bg").hide();
	$(".ok_remove").hide();
	$(".add_hidden").hide();
}

$(document).ready(function(){
	var ok_remove_w = $(".inputSth").width();
	$(".ok_remove").width(ok_remove_w);

	$(window).resize(function() {
		var ok_remove_w = $(".inputSth").width();
		$(".ok_remove").width(ok_remove_w);
  	});

	$("#menu").click(function(){
		$("#menu-xs").toggle(300);
	});
});
</script>

<div class="container-fluid header">
	<div class="title_bar">
		<a href="<%=basePath%>font/home.jsp"><p class="back_btn"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></p></a>
		<p><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;注册用户</p>
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
		<h6 class="location">
			<a href="home.jsp">首页</a> <i> </i> 注册
		</h6>
	</div>


	<div class="bar_news">
		<h2>注册账号</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="col-md-12">
				<div class="form-group">
				<form action="<%=basePath%>customer.do?method=register" method="post">
					<label for="inputEmail3" class="col-sm-2 control-label label_login">&nbsp;用户名：</label>
					<div class="col-sm-10 input_div">
						<input type="text" class="form-control inputSth" placeholder="请输入用户名" name="userid" id="userid">
					</div>
					<p class="label_error1" id="errormessage1"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;用户名不能为空</p>
					<p class="label_error1" id="errormessage2"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;用户名已被注册</p>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">&nbsp;密码：</label>
					<div class="col-sm-10 input_div">
						<input type="password" class="form-control inputSth" placeholder="请输入密码" name="password" id="password">
					</div>
					<p class="label_error1" id="errormessage3"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;密码不能为空</p>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">&nbsp;确认密码：</label>
					<div class="col-sm-10 input_div">
						<input type="password" class="form-control inputSth" placeholder="请再次输入密码" id="confirm_password">
					</div>
					<p class="label_error1" id="errormessage4"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;两次密码输入不一致</p>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">&nbsp;昵称：</label>
					<div class="col-sm-10 input_div">
						<input type="text" class="form-control inputSth" placeholder="请输入昵称" name="username" id="nickname">
					</div>
					<p class="label_error1" id="errormessage5"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;昵称不能为空</p>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">&nbsp;真实姓名：</label>
					<div class="col-sm-10 input_div">
						<input type="text" class="form-control inputSth" placeholder="请输入真实姓名" name="realname" id="realname">
					</div>
					<p class="label_error1" id="errormessage6"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;真实姓名不能为空</p>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">&nbsp;身份证：</label>
					<div class="col-sm-10 input_div">
						<input type="text" class="form-control inputSth" placeholder="请输入二代身份证号" name="personnumber" id="personnumber">
					</div>
					<p class="label_error1" id="errormessage7"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;身份证不能为空</p>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">&nbsp;手机：</label>
					<div class="col-sm-10 input_div">
						<input type="text" class="form-control inputSth" placeholder="请输入手机号码" name="telphone" id="telphone">
					</div>
					<p class="label_error1" id="errormessage8"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;手机不能为空</p>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 input_div">
						<button type="submit" class="btn btn-default col-sm-12" id="btn_login" onclick="return validate()">注册</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 input_div">
					</div>
				</div>
			</form>
			</div>
				
		</div>
	</div>


	<div class="bottom-grid1">
		<div class="fit1">
			<h3>HAPPY SHOPPING</h3>
			<p>Lorem Ipsum sit amet consectuer adipiscing elitsed diam
				nonummy nibh euismod</p>
		</div>
	</div>

	<div class="row add_hidden_bg"></div>

	<div class="row ok_remove">
		<p>注册成功！</p>
		<button class="col-xs-offset-4 col-xs-4 btn_remove" onclick="ok_remove1()">确定</button>
	</div>
	

	<div class="footer">
		<div class="container footer-div">
			<div class="col-md-12 footer-middle">
				<p>公司简介：这里是公司简介公司简介公司简介公司简介公司简介公司简介</p>
				<p>地址：福建省厦门市思明区422号厦门大学</p>
			</div>
			<div class="col-md-12 company">
				<p class="footer-class">Copyright &copy; 2015.Company name All
					rights reserved.</p>
			</div>
		</div>
	</div>


</body>
</html>