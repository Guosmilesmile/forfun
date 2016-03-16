<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
 <head>
        <title>Your Admin Panel</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

        <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyUI/themes/bootstrap/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyUI/themes/icon.css">
        
        <!-- jQuery AND jQueryUI -->
        <script type="text/javascript" src="<%=basePath%>admin/js/libs/jquery/1.6/jquery.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>admin/js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
        
        <!-- Compressed Version
        <link type="text/css" rel="stylesheet" href="min/b=CoreAdmin&f=css/reset.css,css/style.css,css/jqueryui/jqueryui.css,js/jwysiwyg/jquery.wysiwyg.old-school.css,js/zoombox/zoombox.css" />
        <script type="text/javascript" src="min/b=CoreAdmin/js&f=cookie/jquery.cookie.js,jwysiwyg/jquery.wysiwyg.js,tooltipsy.min.js,iphone-style-checkboxes.js,excanvas.js,zoombox/zoombox.js,visualize.jQuery.js,jquery.uniform.min.js,main.js"></script>
        -->
        <script type="text/javascript">
	        function getCookie(objName){//获取指定名称的cookie的值 
	        	var arrStr = document.cookie.split("; "); 
	        	for(var i = 0;i < arrStr.length;i ++){ 
	        		var temp = arrStr[i].split("="); 
	        		if(temp[0] == objName) return unescape(temp[1]); 
	        	} 
	        };
	        function GetTopMenu(){
	        	$.ajax({
	        		type:'post',
	        		url:'<%=basePath%>function.do?method=GetAllTopMenu',
	        		async:false,
	        		data:{},
	        		success:function(json){
	        			var topmenu = "";
	        			for(var i=0;i<json.length;i++){
	        				if(json[i].istopmenu==1){
	        					topmenu += "<li  id='topmenu_"+json[i].id+"' ><a  href='#'>"+json[i].functionname+"</a><li/>";
	        				}
	        			};
	        			$('#sidebarul').html(topmenu);
	        		},error:function(){
	        			$.messager.alert('警告','连接服务器失败','error');
	        		},
	        	});
	        };
	        function GetUserPower(username){
	        	$.ajax({
	        		type:'post',
	        		url:'<%=basePath%>user.do?method=getuserpower',
	        		async:false,
	        		data:{username:username},
	        		success:function(json){
	        			json = json.power;
	        			var arraytemp = new Array();
	        			for(var i=0;i<json.length;i++){
	        				var temp  = json[i].topmenu;
	        				var id = "#topmenu_"+temp;
	        				if(arraytemp[temp]==undefined){
	        					$(id).append("<ul id=topmenuul_"+temp+" class='subul'></ul>");
	        					arraytemp[temp]=1;
	        				}
	        				id = "#topmenuul_"+temp;
	        				$(id).append("<li ><a target='rightFrame' href="+json[i].functionlink+">"+json[i].functionname+"</a></li>");
	        			};
	        		},error:function(){
	        			$.messager.alert('警告','连接服务器失败','error');
	        		},
	        	});
	        }
        	$(document).ready(function(){
        		  var username = getCookie("token");
        		  var index = username.indexOf("&");
        		  username = username.substring(0,index);
        		  GetTopMenu();
        		  GetUserPower(username);
        		  $('.subul').find('li').find('a').click(function(){
        				$(this).parent().siblings().removeClass('current');
        				$(this).parent().addClass('current');
        		  });
        	});
        	
        </script>
        <link rel="stylesheet" href="<%=basePath%>admin/css/min.css" />
        <script type="text/javascript" src="<%=basePath%>admin/js/min.js"></script>
    </head>
    <body>
        
        <script type="text/javascript" src="<%=basePath%>admin/content/settings/main.js"></script>
		<link rel="stylesheet" href="<%=basePath%>admin/content/settings/style.css">

        <div id="sidebar">
            <ul id="sidebarul">
                <li class="current"><a href="#"><img src="<%=basePath%>admin/img/icons/menu/inbox.png" alt="" />系统管理</a>
                    <ul class="subul">
                         <li class="current"><a target="rightFrame" href="./ManageUser.jsp">用户管理</a></li>
                         <li ><a target="rightFrame" href="./ManageRole.jsp">角色管理</a></li>
                         <li ><a target="rightFrame" href="./ManageUserRole.jsp">用户角色管理</a></li>
                         <li ><a target="rightFrame" href="./ManageFunction.jsp">菜单管理</a></li>
                         <li ><a target="rightFrame" href="./ManagePower.jsp">权限管理</a></li>
                    </ul>
                </li>
                <li ><a href="#"><img src="<%=basePath%>admin/img/icons/menu/layout.png" alt="" />客户管理</a>
                    <ul class="subul">
                         <li ><a target="rightFrame" href="./ManageCustomer.jsp">客户管理</a></li>
                         <li ><a target="rightFrame" href="./ManageAddress.jsp">客户地址管理</a></li>
                         <li ><a target="rightFrame" href="./ManageArtist.jsp">艺术家管理</a></li>
                         <li ><a target="rightFrame" href="./ManageExamineArtist.jsp">艺术家审核</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="<%=basePath%>admin/img/icons/menu/comment.png" alt="" />资讯发布</a>
                    <ul class="subul">
                         <li ><a target="rightFrame" href="./AddNews.jsp">发布资讯</a></li>
                         <li ><a target="rightFrame" href="./WatchNews.jsp">查看资讯</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="<%=basePath%>admin/img/icons/menu/layout.png" alt="" />资讯管理</a>
                    <ul class="subul">
                         <li ><a target="rightFrame" href="./ManageNews.jsp">审核资讯</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="<%=basePath%>admin/img/icons/menu/comment.png" alt="" />广告发布</a>
                    <ul class="subul">
                         <li ><a target="rightFrame" href="./AddAdvert.jsp">发布广告</a></li>
                         <li ><a target="rightFrame" href="./WatchAdvert.jsp">查看广告</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="<%=basePath%>admin/img/icons/menu/layout.png" alt="" />广告管理</a>
                    <ul class="subul">
                         <li ><a target="rightFrame" href="./ManageAdvert.jsp">审核广告</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="<%=basePath%>admin/img/icons/menu/brush.png" alt="" />商品管理</a>
                    <ul class="subul">
                         <li ><a target="rightFrame" href="./ManageProduct.jsp">商品管理</a></li>
                         <li ><a target="rightFrame" href="./ManageProductType.jsp">商品类别管理</a></li>
                         <li ><a target="rightFrame" href="./ManageOrder.jsp">订单管理</a></li>
                    </ul>
                </li>
                <!--
                <li ><a href="#"><img src="<%=basePath%>admin/img/icons/menu/brush.png" alt="" /> Elements</a>
                    <ul class="subul">
                         <li class="current"><a href="dashboard.html?p=index">Dashboard</a></li>
                         <li><a href="forms.html?p=forms">Forms</a></li>
                         <li><a href="table.html?p=table">Table</a></li>
                         <li><a href="tabs.html?p=tabs">Tabs</a></li>
                         <li><a href="gallery.html?p=gallery">Gallery</a></li>
                         <li><a href="notifications.html?p=notif">Notifications</a></li>
                         <li><a href="charts.html?p=charts">Charts</a></li>
                         <li><a href="typography.html?p=typo">Typography</a></li>
                         <li><a href="icons.html?p=icons">Icons</a></li>
                         <li><a href="calendar.html?p=calendar">Calendar</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="<%=basePath%>admin/img/icons/menu/brush.png" alt="" /> Another submenu</a>
                    <ul>
                        <li><a href="#">Fake menu #1</a></li>
                        <li><a href="#">Fake menu #2</a></li>
                        <li><a href="#">Fake menu #3</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="<%=basePath%>admin/img/icons/menu/brush.png" alt="" /> Infinite sublevel</a>
                    <ul>
                        <li><a href="#">Fake menu #1</a></li>
                        <li><a href="#">Fake menu #2</a></li>
                        <li><a href="#">Fake menu #3</a>
                        <ul>
                            <li><a href="#">Fake menu #1</a></li>
                            <li><a href="#">Fake menu #2</a></li>
                            <li><a href="#">Fake menu #3</a>
                                <ul>
                                    <li><a href="#">Fake menu #1</a></li>
                                    <li><a href="#">Fake menu #2</a></li>
                                    <li><a href="#">Fake menu #3</a></li>
                                </ul>
                            </li>
                        </ul>
                        </li>
                    </ul>
                </li>
                <li class="nosubmenu"><a href="#"><img src="<%=basePath%>admin/img/icons/menu/lab.png" alt="" /> This button is useless</a></li>
                <li class="nosubmenu"><a href="modal.html" class="zoombox w450 h700"><img src="<%=basePath%>admin/img/icons/menu/comment.png" alt="" /> Modal box</a></li>
            -->
            </ul>


        </div>
                
                        
    </body>
</html>