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
<meta name="viewport" id="viewport"
	content="width=device-width, initial-scale=1">
<title>Balance</title>
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/footer2.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/balance.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
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


<script type="text/javascript">
//检测用户是否已登录
//获取cookie
function getCookie(objName){//获取指定名称的cookie的值 
	var arrStr = document.cookie.split("; "); 
	for(var i = 0;i < arrStr.length;i ++){ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName) return unescape(temp[1]); 
	} 
};
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

function keyPress() {    
    var keyCode = event.keyCode;    
    if ((keyCode >= 48 && keyCode <= 57))    
   {    
        event.returnValue = true;    
    } else {    
          event.returnValue = false;    
   }    
}  

function addNewOne(){
	$(".add_hidden").show();
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

function validate(){
	var money = $("#money").val();
	if(money == null || money == "" )
	{
		$("#alertmessage").show();
		return false;
	}
	else {
		$(".add_hidden_bg").show();
		$(".ok_remove").show();
	}
}

$(document).ready(function()
{
	$('#back_btn').click(function(){
		location.href="<%=basePath%>font/personal.jsp";
	});
	var pic_w = $(".order_pic").width();
	var pic_h = pic_w;
	$(".order_pic").height(pic_h);
	var add_hidden_w = $(".order_div").width();
	$(".add_hidden").width(add_hidden_w);
	var ok_remove_w = $(".order_div").width();
	$(".ok_remove").width(ok_remove_w);

	$(window).resize(function() {
  		var pic_w = $(".order_pic").width();
		var pic_h = pic_w;
		$(".order_pic").height(pic_h);
		var add_hidden_w = $(".new_btn").width();
		$(".add_hidden").width(add_hidden_w);
		var ok_remove_w = $(".new_btn").width();
		$(".ok_remove").width(ok_remove_w);
  	});
	$('#usernameaction').hide();
	$('#loginoutaction').hide();
	CheckUser();
	$("#alertmessage").hide()
	
	//过程
	var useridtoken = getCookie("useridtoken");
	if(null==useridtoken || "" == useridtoken){
		return ;
	}
	var index = useridtoken.indexOf("&");
	var id =  useridtoken.substring(0,index);//拿到了  在这里   id
	//alert(id);
	
	$.ajax({
		type:'post',
		url:'<%=basePath%>/customer.do?method=getCustomerByUserid',
				data : {
					customerid : id
				},
				success : function(json) {
					var customer = json.customer;
					var balance = customer.balance;
					//if($("#id").attr("checked")==true)
					//alert(userid+" "+username+" "+personnumber+" "+telphone+" "+realname);
					
					$('#balance').text('￥'+balance);
				},
				error : function() {

				}
			});
	
  	$('#username').live('click',function(){
  		var useridtoken = getCookie("useridtoken");
  		var useridtoken = getCookie("useridtoken");
  		if(null==useridtoken || "" == useridtoken){
  			return ;
  		}
  		var index = useridtoken.indexOf("&");
  		var id =  useridtoken.substring(0,index);
  		var address = "<%=basePath%>ont/personal.jsp?id=";
			location.href = address + id;
		});

	});
</script>

</head>

<body>

	<a href="javascript:;" class="lanrenzhijia_top"></a>

	<div class="container-fluid header">
		<div class="title_bar">
			<p class="back_btn" id="back_btn">
				<span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
			</p>
			<p>
				<span class="glyphicon glyphicon-piggy-bank" aria-hidden="true"></span>&nbsp;&nbsp;我的余额
			</p>
		</div>
	</div>

	<div class="container-fluid mainer" >
		<div class="row order_div" >
			<p class="col-xs-12 statue_label">
				<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;当前余额
			</p>
			<p class="col-xs-12 statue_label now_balance" id="balance"></p>
		</div>
		<div class="row add_new">
			<button class="new_btn" onclick="addNewOne()">
				<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>&nbsp;&nbsp;现在充值
			</button>
		</div>

	</div>

	<div class="row add_hidden_bg"></div>
	<form
		action="${pageContext.request.contextPath}/customer.do?method=addbalance"
		method="post">
		<div class="row add_hidden">
			<div class="row add_name">
				<p>充值金额：</p>
				<input type="text" class="col-xs-12" name="money" id="money"
					style="ime-mode: disabled;" onpaste="return false;"
					onkeypress="keyPress()" />
			</div>

			<div class="row password_error" id="alertmessage">
				<p>
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;充值金额不能为空
				</p>
			</div>
			<div class="row add_name">
				<button class="col-xs-12 new_submit" onclick="return validate()">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;确认充值
				</button>
			</div>

		</div>
	</form>
	<div class="row ok_remove">
		<p>充值成功！</p>
		<button class="col-xs-offset-4 col-xs-4 btn_remove"
			onclick="ok_remove1()">确定</button>
	</div>

</body>
</html>