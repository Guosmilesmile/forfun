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
	<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">
	<title>MessageList</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/MessageList.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>

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
var customerUserid = null;
function getUnReadMessage(){
	$.ajax({
		type:'post',
		url:'<%=basePath%>message.do?method=getUndReadMessage',
		data:{customerUserid:customerUserid},
		success:function(json){
			var unread = json.unread;
			var read = json.read;
			var body = "";
			if(unread.length>0){
				var unreadcontent = "";
				for(var i=0;i<unread.length;i++){
					var id = unread[i].id;
					var content = unread[i].content;
					if(content.length>20)
						content = content.substring(1,20)+"...";
					var time = myformattertwo(unread[i].time);
					var sendavator = unread[i].sendavator;
					var sendname = unread[i].sendname;
					var fromid = unread[i].fromid;
					var link = "<%=basePath%>customer.do?method=EnterChat&toid="+fromid;
					unreadcontent += "<a href='"+link+"'><div class='row message_div'><img class='col-xs-3 message_photo' src='"+sendavator+"'>"
						+"<div class='col-xs-9 row message_label'><div class='col-xs-12 row label1'><p class='col-xs-9 send_message'>"+sendname+"</p>"
						+"<p class='col-xs-3 send_time'>"+time+"</p></div><div class='col-xs-12 row label1'><p class='col-xs-11 new_message'>"+content+"</p><div class='col-xs-1 num_message'><div class='circle_num'></div></div></div></div></div></a>";
				}
				body = unreadcontent;
			}
			if(read.length>0){
				var readcontent = "";
				for(var i=0;i<read.length;i++){
					var id = read[i].id;
					var content = read[i].content;
					if(content.length>20)
						content = content.substring(1,20)+"...";
					var time = myformattertwo(read[i].time);
					var sendavator = read[i].sendavator;
					var sendname = read[i].sendname;
					var fromid = read[i].fromid;
					var link = "<%=basePath%>font/chat.jsp?id="+fromid;
					readcontent += "<a href='"+link+"'><div class='row message_div'><img class='col-xs-3 message_photo' src='"+sendavator+"'>"
						+"<div class='col-xs-9 row message_label'><div class='col-xs-12 row label1'><p class='col-xs-9 send_message'>"+sendname+"</p>"
						+"<p class='col-xs-3 send_time'>"+time+"</p></div><div class='col-xs-12 row label1'><p class='col-xs-11 new_message'>"+content+"</p><div class='col-xs-1 num_message'></div></div></div></div></a>";
				}
				body +=readcontent ;
			}
			$('#messagelist').html(body);
			var photo_w = $(".message_photo").width();
			var photo_h = photo_w;
			$(".message_photo").height(photo_h);

			var label_h = $(".message_photo").height();
			$(".message_label").height(label_h);

			var circle_h = $(".circle_num").width();
			$(".circle_num").height(circle_h);
		},error:function(){
			
		}
	});
}
$(document).ready(function()
{
	$('.back_btn').click(function(){
		location.href="<%=basePath%>font/personal.jsp";
	});
	customerUserid = getCookieUserid();
	if(null==customerUserid)
		location.href="<%=basePath%>font/Login.jsp";
	getUnReadMessage();
	setInterval(getUnReadMessage, 5000);  
	var photo_w = $(".message_photo").width();
	var photo_h = photo_w;
	$(".message_photo").height(photo_h);

	var label_h = $(".message_photo").height();
	$(".message_label").height(label_h);

	var circle_h = $(".circle_num").width();
	$(".circle_num").height(circle_h);

	$(window).resize(function() {
		var photo_w = $(".message_photo").width();
		var photo_h = photo_w;
		$(".message_photo").height(photo_h);

		var label_h = $(".message_photo").height();
		$(".message_label").height(label_h);

		var circle_h = $(".circle_num").width();
		$(".circle_num").height(circle_h);
  	});
});
</script>

</head>

<body>

<a href="javascript:;" class="lanrenzhijia_top"></a>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left partten" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;我的消息</p>
	</div>
</div>

<div class="container-fluid mainer" id="messagelist">
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="<%=basePath%>image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
					</div>
				</div>				
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="<%=basePath%>image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="<%=basePath%>image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="<%=basePath%>image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="<%=basePath%>image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="<%=basePath%>image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="<%=basePath%>image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="<%=basePath%>image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>

</div>

</body>
</html>