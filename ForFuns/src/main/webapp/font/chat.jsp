<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
  <meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">

  <title>Chat</title>
  	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
  	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<script charset="utf-8" src="<%=path%>/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=path%>/kindeditor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="../css/chat.css" media="screen" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
	<script type="text/javascript">
		KindEditor.ready(function(K) {
			 window.editor =K.create('#editor_id', {
				height:'100px',
		        uploadJson : '<%=basePath%>imageupload.do?method=keuploadimg',
		        allowFileManager : false,
		        items:[
		               'emoticons'
		       ],
			});
		});
		
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			var name = getUrlParam("name");
			$('#toname').html(name);
			var receiveid = getUrlParam("id");
			$('.back_btn').click(function(){
				location.href="<%=basePath%>message.do?method=entermymessage";
			});
		});
	  var userid = getUrlParam("fromid");
      var receiveid = getUrlParam("id");
      
	  if(userid=="" || receiveid==""||null == receiveid){
		  location.href="<%=basePath%>font/error.jsp";
	  }
	  
      var websocket = null;
      //判断当前浏览器是否支持WebSocket
      if('WebSocket' in window){
          websocket = new WebSocket("ws://<%=request.getServerName()%>:<%=request.getServerPort()%>/forfun/websocket");
      }
      else{
          alert('Not support websocket');
      }
       
      //连接发生错误的回调方法
      websocket.onerror = function(){
          //setMessageInnerHTML("error");
          alert("sorry，连接发生错误");
      };
       
      //连接成功建立的回调方法
      websocket.onopen = function(event){
    	  
          //setMessageInnerHTML("open");
          var o = {sendid:userid,receiverid:receiveid,content:"",flag:"0"};
          var json =  JSON.stringify(o);  
          websocket.send(json);
      };
       
      //接收到消息的回调方法
      websocket.onmessage = function(){
          //setMessageInnerHTML(event.data);
          var date = eval("(" + event.data + ")");
          for(var i=0;i<date.length;i++){
        	  setMessageOther(date[i]);
          }
          
      };
       
      //连接关闭的回调方法
      websocket.onclose = function(){
          //setMessageInnerHTML("close");
      };
       
      //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
      window.onbeforeunload = function(){
    	  closeWebSocket();
      };
       
      //将消息显示在网页上
      function setMessageInnerHTML(innerHTML){
    	  content = "<li class='chatleft'>"+innerHTML+"</li>";
    	  $('#chatframge').prepend(content);
      };
      
      //将消息显示在网页上
      function setMessageMine(innerHTML){
    	  content = "<li class='chatright'>"+innerHTML+"</li>";
    	  $('#chatframge').prepend(content);
      };
      
      //将消息显示在网页上
      function setMessageOther(json){
    	  content = "<li class='chatleft'>"+json.content+"</li>";
    	  $('#chatframge').prepend(content);
      };
       
       
      //关闭连接
      function closeWebSocket(){
    	  var o = {sendid:userid,receiverid:receiveid,content:message,flag:"1"};
          var json =  JSON.stringify(o);  
          websocket.send(json);
          websocket.close();
      };
       
      //发送消息
      function send(){
    	  editor.sync();
    	  var message = document.getElementById('editor_id').value;
          setMessageMine(message);
          var o = {sendid:userid,receiverid:receiveid,content:message,flag:"2"};
          var json =  JSON.stringify(o);  
          websocket.send(json);
          editor.html("");
      };
  </script>
	
</head>

<body>

<!-- 
<div id="personinfo">


	<img id="personavator" src="../image/good.jpg"> 
	<div id="personright">
		<div id="personname">christy</div>
		<div id="persionintor">yes, what time suits you?I was thinking after lunch, I have a meeting in the morning</div>
	</div>
	
	
	
</div>-->

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></p>
		<p id="toname">对方用户名</p>
	</div>
</div>

<div id="textform">
	<textarea id="editor_id" name="content" style="width:100%;height:100px;"></textarea>
	<input type="button" class="btn btn-default btn-lg btn-block btn_send" value="发送" onclick="send();"/>
</div>

<div id="convo" data-from="Sonu Joshi">  
<ul class="chat-thread" id="chatframge">
	<!-- <li class="chatleft">Are we meeting today?</li>
	<li class="chatright">yes, what time suits you?</li>
	<li class="chatleft">I was thinking after lunch, I have a meeting in the morning</li>
  	<li class="chatright">Are we meeting today?</li>
	<li class="chatleft">yes, what time suits you?</li>
	<li class="chatright">I was thinking after lunch, I have a meeting in the morning</li>
  	<li class="chatleft">Are we meeting today?</li>
	<li class="chatright">yes, what time suits you?</li>
	<li class="chatleft">I was thinking after lunch, I have a meeting in the morning</li>
  	<li class="chatright">Are we meeting today?</li>
	<li class="chatleft">yes, what time suits you?</li>
	<li class="chatright">I was thinking after lunch, I have a meeting in the morning</li> -->
</ul>
</div>
<div style="text-align:center;clear:both"></div>

<div>
	
</div>
</body>

</html>