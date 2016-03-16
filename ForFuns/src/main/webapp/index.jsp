<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
    Welcome<br/>
    <input id="text" type="text" /><button onclick="send()">Send</button>    <button onclick="closeWebSocket()">Close</button>
    <div id="message">
    </div>
  </body>
   
  <script type="text/javascript">
  	  var userid = 1;
      var websocket = null;
      var receiveid = 2;
      //判断当前浏览器是否支持WebSocket
      if('WebSocket' in window){
          websocket = new WebSocket("ws://localhost:8080/forfun/websocket");
      }
      else{
          alert('Not support websocket');
      }
       
      //连接发生错误的回调方法
      websocket.onerror = function(){
          setMessageInnerHTML("error");
      };
       
      //连接成功建立的回调方法
      websocket.onopen = function(event){
          setMessageInnerHTML("open");
          var o = {sendid:userid,receiverid:receiveid,content:"",flag:"0"};
          var json =  JSON.stringify(o);  
          websocket.send(json);
      };
       
      //接收到消息的回调方法
      websocket.onmessage = function(){
          setMessageInnerHTML(event.data);
      };
       
      //连接关闭的回调方法
      websocket.onclose = function(){
          setMessageInnerHTML("close");
      };
       
      //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
      window.onbeforeunload = function(){
    	  closeWebSocket();
      };
       
      //将消息显示在网页上
      function setMessageInnerHTML(innerHTML){
          document.getElementById('message').innerHTML += innerHTML + '<br/>';
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
          var message = document.getElementById('text').value;
          var o = {sendid:userid,receiverid:receiveid,content:message,flag:"2"};
          var json =  JSON.stringify(o);  
          websocket.send(json);
      };
  </script>
</html>