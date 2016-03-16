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
<title>ChangePhoto</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../css/dom.css" rel="stylesheet" type="text/css" />
<link href="../css/footer2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/ChangePhoto.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
<script src="../js/lanrenzhijia.js"></script>
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

<script>
//获取cookie
function getCookie(objName){//获取指定名称的cookie的值 
	var arrStr = document.cookie.split("; "); 
	for(var i = 0;i < arrStr.length;i ++){ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName) return unescape(temp[1]); 
	} 
};

//获取用户信息
function GetUser()
{
	var useridtoken = getCookie("useridtoken");
	if(null==useridtoken || "" == useridtoken){
		return ;
	}
	var index = useridtoken.indexOf("&");
	var id =  useridtoken.substring(0,index);
	
	$.ajax({
		type:'post',
		url:'<%=basePath%>customer.do?method=getCustomerByUserid',
		data:{customerid:id},
		success:function(json){
			var customer = json.customer;
			var userid = customer.userid;
			var username = customer.username;
			var personnumber = customer.personnumber;
			var telphone = customer.telphone;
			var realname = customer.realname;
			var avator = customer.avator;
			var isartist = customer.isartist;
			
			$('#preview').attr('src',avator);
		},error:function(){
			
		}
	});
}
</script>

<script type="text/javascript">
	//下面用于图片上传预览功能
	function setImagePreview(avalue) {
		var docObj = document.getElementById("doc");

		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			// imgObjPreview.style.width = '150px';
			// imgObjPreview.style.height = '180px'; 
			//imgObjPreview.src = docObj.files[0].getAsDataURL();

			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小
			// localImagId.style.width = "150px";
			// localImagId.style.height = "180px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}

	function file_change_photo() {
		document.getElementById("doc").click();
	}

	$(document).ready(function() {
		var photo_w = $("#preview").width();
		var photo_h = photo_w;
		$("#preview").height(photo_h);

		$(window).resize(function() {
			var photo_w = $("#preview").width();
			var photo_h = photo_w;
			$("#preview").height(photo_h);
		});
		
		GetUser();
	});
</script>

</head>

<body>

	<a href="javascript:;" class="lanrenzhijia_top"></a>

	<div class="container-fluid header">
		<div class="title_bar">
			<p class="back_btn">
				<a href="modify.jsp">
				<span class="glyphicon glyphicon-menu-left partten"
					aria-hidden="true"></span>
				</a>
			</p>
			<p>
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;修改头像
			</p>
		</div>
	</div>

	<div class="container-fluid mainer">
		<form action="<%=basePath%>customer.do?method=alertAvator" method="post" enctype="multipart/form-data">
			<table class="change_table">
				<tbody>
					<tr>
						<td class="table_photo">
							<div id="localImag">
								<img id="preview" src="../image/default.jpg">
							</div>
						</td>
					</tr>
					<tr>
						<td class="table_btn">
						<input type="file" name="file" id="doc"
							onchange="javascript:setImagePreview();"> 
						<input
							type="button" value="选择图片" class="btn_change"
							onclick="file_change_photo()" />
						</td>
					</tr>
					<tr>
						<td class="table_submit"><input type="submit" value="确认修改"
							class="btn_change btn_submit" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>

</html>