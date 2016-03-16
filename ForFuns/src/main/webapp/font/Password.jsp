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
<title>Password</title>
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/footer2.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/Password.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
<script src="<%=basePath%>js/lanrenzhijia.js"></script>
<script>
	$(function() {
		$(window).scroll(function() {
			var _top = $(window).scrollTop();
			if (_top > 300) {
				$('.lanrenzhijia_top').fadeIn(600);
			} else {
				$('.lanrenzhijia_top').fadeOut(600);
			}
		});
		$(".lanrenzhijia_top").click(function() {
			$("html,body").animate({
				scrollTop : 0
			}, 500);
		});
	});
</script>

<script type="text/javascript">
	function validate() {
		$('#errormessage3').hide();
		$('#errormessage2').hide();
		var raw_password = $("#raw-password").val();
		var new_password = $("#new-password").val();
		var confirm_new_password = $("#confirm-new-password").val();

		if (raw_password == null || raw_password == "" || new_password == null
				|| new_password == "" || confirm_new_password == null
				|| confirm_new_password == "") {
			$('#errormessage3').show();
			return false;
		}

		if (new_password != confirm_new_password) {
			$('#errormessage2').show();
			return false;
		}

		return true;
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.back_btn').click(function(){
			location.href="<%=basePath%>font/personal.jsp";
		});
		var error = getUrlParam("error");
		if (error == 1) 
		{
			$('#errormessage1').show();
		}
		var customerUserid = getCookieUserid();

		var pic_w = $(".order_pic").width();
		var pic_h = pic_w;
		$(".order_pic").height(pic_h);
		$(window).resize(function() {
			var pic_w = $(".order_pic").width();
			var pic_h = pic_w;
			$(".order_pic").height(pic_h);
		});
	});
</script>

</head>

<body>

	<a href="javascript:;" class="lanrenzhijia_top"></a>

	<div class="container-fluid header">
		<div class="title_bar">
			<p class="back_btn">
				<span class="glyphicon glyphicon-menu-left partten"
					aria-hidden="true"></span>
			</p>
			<p>
				<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;&nbsp;修改密码
			</p>
		</div>
	</div>

	<div class="container-fluid mainer">
		<form
			action="${pageContext.request.contextPath}/customer.do?method=changePassword"
			method="post">
			<div class="row password_label">
				<p>
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;&nbsp;请输入原密码：
				</p>
			</div>
			<div class="row password_input">
				<input class="col-xs-12" id="raw-password" type="password" name="password"/>
			</div>
			<div class="row password_error">
				<p id="errormessage1"  style="display:none;">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;密码输入错误
				</p>
			</div>

			<div class="row password_label">
				<p>
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;&nbsp;请输入新密码：
				</p>
			</div>
			<div class="row password_input">
				<input class="col-xs-12" type="password" id="new-password" name="new_password"/>
			</div>

			<div class="row password_label">
				<p>
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;&nbsp;请再次输入新密码：
				</p>
			</div>
			<div class="row password_input">
				<input class="col-xs-12" type="password" id="confirm-new-password" />
			</div>
			<div class="row password_error" id="errormessage2"  style="display:none;">
				<p>
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;两次密码输入不一致
				</p>
			</div>
			<div class="row password_error" id="errormessage3"  style="display:none;">
				<p>
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;请输入密码
				</p>
			</div>

			<div class="row password_btn">
				<input type="submit" value="确认修改" class="col-xs-12 btn_submit"
					onclick="return validate()" />
			</div>
		</form>
	</div>

</body>

</html>