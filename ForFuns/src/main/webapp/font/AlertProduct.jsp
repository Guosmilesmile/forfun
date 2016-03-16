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
	<title>Publish</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/Publish.css">
	<link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/iscroll.js" ></script>
	<script charset="utf-8" src="<%=path%>/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=path%>/kindeditor/lang/zh_CN.js"></script>

<script src="<%=basePath%>js/lanrenzhijia.js"></script>
<script>
KindEditor.ready(function(K) {
	 window.editor =K.create('#editor_id', {
       uploadJson : '<%=basePath%>imageupload.do?method=keuploadimg',
       allowFileManager : false,
       items:[
		   'emoticons'
      ],
	});
});
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
//下面用于图片上传预览功能
function setImagePreview(avalue) 
{
	var docObj = document.getElementById("doc");
	 
	var imgObjPreview = document.getElementById("preview");
	if(docObj.files &&docObj.files[0])
	{
		//火狐下，直接设img属性
		imgObjPreview.style.display = 'block';
		// imgObjPreview.style.width = '150px';
		// imgObjPreview.style.height = '180px'; 
		//imgObjPreview.src = docObj.files[0].getAsDataURL();
		 
		//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
		imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	}
	else
	{
		//IE下，使用滤镜
		docObj.select();
		var imgSrc = document.selection.createRange().text;
		var localImagId = document.getElementById("localImag");
		//必须设置初始大小
		// localImagId.style.width = "150px";
		// localImagId.style.height = "180px";
		//图片异常的捕捉，防止用户修改后缀来伪造图片
		try
		{
			localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
		}
		catch(e)
		{
			alert("您上传的图片格式不正确，请重新选择!");
			return false;
		}
		imgObjPreview.style.display = 'none';
		document.selection.empty();
	}
	return true;
}

function setImagePreview1(avalue) 
{
	var docObj = document.getElementById("doc1");
	 
	var imgObjPreview = document.getElementById("preview1");
	if(docObj.files &&docObj.files[0])
	{
		//火狐下，直接设img属性
		imgObjPreview.style.display = 'block';
		// imgObjPreview.style.width = '150px';
		// imgObjPreview.style.height = '180px'; 
		//imgObjPreview.src = docObj.files[0].getAsDataURL();
		 
		//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
		imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	}
	else
	{
		//IE下，使用滤镜
		docObj.select();
		var imgSrc = document.selection.createRange().text;
		var localImagId = document.getElementById("localImag");
		//必须设置初始大小
		// localImagId.style.width = "150px";
		// localImagId.style.height = "180px";
		//图片异常的捕捉，防止用户修改后缀来伪造图片
		try
		{
			localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
		}
		catch(e)
		{
			alert("您上传的图片格式不正确，请重新选择!");
			return false;
		}
		imgObjPreview.style.display = 'none';
		document.selection.empty();
	}
	return true;
}

function setImagePreview2(avalue) 
{
	var docObj = document.getElementById("doc2");
	 
	var imgObjPreview = document.getElementById("preview2");
	if(docObj.files &&docObj.files[0])
	{
		//火狐下，直接设img属性
		imgObjPreview.style.display = 'block';
		// imgObjPreview.style.width = '150px';
		// imgObjPreview.style.height = '180px'; 
		//imgObjPreview.src = docObj.files[0].getAsDataURL();
		 
		//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
		imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	}
	else
	{
		//IE下，使用滤镜
		docObj.select();
		var imgSrc = document.selection.createRange().text;
		var localImagId = document.getElementById("localImag");
		//必须设置初始大小
		// localImagId.style.width = "150px";
		// localImagId.style.height = "180px";
		//图片异常的捕捉，防止用户修改后缀来伪造图片
		try
		{
			localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
		}
		catch(e)
		{
			alert("您上传的图片格式不正确，请重新选择!");
			return false;
		}
		imgObjPreview.style.display = 'none';
		document.selection.empty();
	}
	return true;
}

function setImagePreview3(avalue) 
{
	var docObj = document.getElementById("doc3");
	 
	var imgObjPreview = document.getElementById("preview3");
	if(docObj.files &&docObj.files[0])
	{
		//火狐下，直接设img属性
		imgObjPreview.style.display = 'block';
		// imgObjPreview.style.width = '150px';
		// imgObjPreview.style.height = '180px'; 
		//imgObjPreview.src = docObj.files[0].getAsDataURL();
		 
		//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
		imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	}
	else
	{
		//IE下，使用滤镜
		docObj.select();
		var imgSrc = document.selection.createRange().text;
		var localImagId = document.getElementById("localImag");
		//必须设置初始大小
		// localImagId.style.width = "150px";
		// localImagId.style.height = "180px";
		//图片异常的捕捉，防止用户修改后缀来伪造图片
		try
		{
			localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
		}
		catch(e)
		{
			alert("您上传的图片格式不正确，请重新选择!");
			return false;
		}
		imgObjPreview.style.display = 'none';
		document.selection.empty();
	}
	return true;
}


function file_change_photo()
{
	document.getElementById("doc").click();
}
function file_change_photo1()
{
	document.getElementById("doc1").click();
}
function file_change_photo2()
{
	document.getElementById("doc2").click();
}
function file_change_photo3()
{
	document.getElementById("doc3").click();
}
//获取商品类型
function GetAllType(){
	$.ajax({
		type:'post',
		asycn:false,
		url:'<%=basePath%>productType.do?method=getAllProductType',
		data:{},
		success:function(json){
			json = json.productTypes;
			if(json.length>0){
				var body = "";
				for(var i=0;i<json.length;i++){
					body+= "<option class='col-xs-12 option1' value ='"+json[i].id+"'>"+json[i].name+"</option>";
				}
				$('#typeselect').html(body);
			}
		},error:function(){
		},
	});
};
//获取出售方式
function GetAllSell(){
	$.ajax({
		type:'post',
		asycn:false,
		url:'<%=basePath%>sellmethod.do?method=GetAllSellMethod',
		data:{},
		success:function(json){
			if(json.length>0){
				var body = "";
				for(var i=0;i<json.length;i++){
					body+= "<option class='col-xs-12 option1' value ='"+json[i].id+"'>"+json[i].name+"</option>";
				}
				$('#sellmethodselect').html(body);
			}
		},error:function(){
		},
	});
};
//检验数字
function validatenumber(number){ 
	var reg = /^\d+$/;
    if (!number.match(reg)){
        return false;
    }else{    
    	return true;
    }    
} ;
//时间对比
function timecompare(a, b) {
    var arr = a.split("-");
    var starttime = new Date(arr[0], arr[1], arr[2]);
    var starttimes = starttime.getTime();

    var arrs = b.split("-");
    var lktime = new Date(arrs[0], arrs[1], arrs[2]);
    var lktimes = lktime.getTime();

    if (starttimes >= lktimes) {
        return false;
    }
    else
        return true;

}
//验证
function validate(){
	var productname = $('#productname').val();
	if(""==productname){
		$('#errorname').show();
		mScroll("errorname");
		return false;
	}
	var money = $('#money').val();
	if(!validatenumber(money)){
		$('#errormoney').show();
		mScroll("errormoney");
		return false;
	}
	var starttime = $('#beginTime').val();
	if(""==starttime){
		$('#errorstarttime').show();
		mScroll("errorstarttime");
		return false;
	}
	
	var endtime = $('#beginTime2').val();
	if(""==endtime){
		$('#errorendtime').show();
		mScroll("errorendtime");
		return false;
	}
	if(!timecompare(starttime,endtime)){
		$('#errorendtime').show();
		$('#endtimeerror').html("上架时间不得晚于下架时间");
		mScroll("errorendtime");
		return false;
	};
	editor.sync();
	var html = document.getElementById('editor_id').value;
	
}
//获取商品信息
function getProductInfo(productid){
	$.ajax({
		type:'post',
		asycn:false,
		url:'<%=basePath%>product.do?method=GetProductById',
		data:{productid:productid},
		success:function(json){
			json = json.product;
			if(null!=json){
				var artistuserid = json.artistuserid;
				var customerUserid = getCookieUserid();
				if(artistuserid!=customerUserid){
					location.href="<%=basePath%>font/error.jsp";
				}
				var id = json.id;
				$('#productid').val(id);
				var productname = json.name;
				$('#productname').val(productname);
				var money = json.money;
				$('#money').val(money);
				var starttime = json.timestart;
				$('#beginTime').val(myformatter(starttime));
				var endtime = json.timeout;
				$('#beginTime2').val(myformatter(endtime));
				var content = json.content;
				editor.html(content);
				var imgurl = json.imgurl;
				var imgone = json.imgone;
				var imgtwo = json.imgtwo;
				var imgthree = json.imgthree;
				$('#preview').attr('src',imgurl);
				$('#preview1').attr('src',imgone);
				$('#preview2').attr('src',imgtwo);
				$('#preview3').attr('src',imgthree);
				var situation = json.situation;
				var methodid = json.methodid;
				var typeid = json.typeid;
				var typename = json.typename;
				$('#typeselect').val(typeid);
				$('#sellmethodselect').val(methodid);
				
				if(situation==1||situation==3){
					$('.starttime').hide();
					$('.endtime').hide();
					$('.sellmethod').hide();
				}				
			}else{
				location.href="<%=basePath%>font/error.jsp";
			}
		},error:function(){
		},
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
	var productid = getUrlParam("id");
	if(null == productid)
		location.href="<%=basePath%>font/404.jsp";
	getProductInfo(productid);
	GetAllType();
	GetAllSell();
	var photo_w = $("#preview").width();
	var photo_h = photo_w;
	$("#preview").height(photo_h);

	var photo_w1 = $("#preview1").width();
	var photo_h1 = photo_w1;
	$("#preview1").height(photo_h1);

	var photo_w2 = $("#preview2").width();
	var photo_h2 = photo_w2;
	$("#preview2").height(photo_h2);

	var photo_w3 = $("#preview3").width();
	var photo_h3 = photo_w3;
	$("#preview3").height(photo_h3);

	$(window).resize(function() {
	  	var photo_w = $("#preview").width();
		var photo_h = photo_w;
		$("#preview").height(photo_h);

		var photo_w1 = $("#preview1").width();
		var photo_h1 = photo_w1;
		$("#preview1").height(photo_h1);

		var photo_w2 = $("#preview2").width();
		var photo_h2 = photo_w2;
		$("#preview2").height(photo_h2);

		var photo_w3 = $("#preview3").width();
		var photo_h3 = photo_w3;
		$("#preview3").height(photo_h3);
  	});
});
 
</script>

</head>

<body>
<script type="text/javascript" src="<%=basePath%>js/date.js"></script>
<script type="text/javascript">
$(function(){
	$('#beginTime').date();
	$('#endTime').date({theme:"datetime"});

	$('#beginTime2').date();
	$('#endTime2').date({theme:"datetime"});
});
</script>
<a href="javascript:;" class="lanrenzhijia_top"></a>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left partten" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-cloud-upload" aria-hidden="true"></span>&nbsp;&nbsp;修改艺术品</p>
	</div>
</div>

<div class="container-fluid mainer">
	<form action="<%=basePath%>product.do?method=checkAlertProduct" enctype="multipart/form-data" method="post">
	<input type="hidden" value="" id="productid" name="id">
	<div class="row">
		<img id="preview" class="col-xs-offset-4 col-xs-4" src="<%=basePath%>image/default.jpg" />
	</div>
	<div class="row">
		<input type="file" name="imgurl"  id="doc" class="col-xs-offset-4 col-xs-4" onchange="javascript:setImagePreview();">
		<input type="button" value="选择封面" class="col-xs-offset-4 col-xs-4 btn_change" onclick="file_change_photo()" />
	</div>

	<div class="row password_label">
		<p>商品名称：</p>
	</div>
	<div class="row password_input">
		<input class="col-xs-12" type="text" name="productname" id="productname"/>
	</div>
	<div class="row password_error">
		<p id="errorname"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;商品名称不能为空</p>
	</div>

	<div class="row password_label">
		<p>价格（元）：</p>
	</div>
	<div class="row password_input">
		<input class="col-xs-12" type="text" name="money" id="money"/>
	</div>
	<div class="row password_error">
		<p id="errormoney"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;商品价格不能为空</p>
	</div>

	<div class="row password_label">
		<p>商品类别：</p>
	</div>
	<div class="row password_input">
		<select class="col-xs-12 selection" id="typeselect" name="typeid">
			<option class="col-xs-12 option1">请选择</option>
			<option class="col-xs-12 option1">类别1</option>
			<option class="col-xs-12 option1">类别2</option>
			<option class="col-xs-12 option1">类别3</option>
			<option class="col-xs-12 option1">类别4</option>
		</select>
	</div>
	<div class="row password_error">
		<!-- <p><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;商品类别不能为空</p> -->
	</div>

	<div class="row password_label sellmethod">
		<p>出售方式：</p>
	</div>
	<div class="row password_input sellmethod">
		<select class="col-xs-12 selection" id="sellmethodselect" name="sellid">
			<option class="col-xs-12 option1">请选择</option>
			<option class="col-xs-12 option1">类别1</option>
			<option class="col-xs-12 option1">类别2</option>
			<option class="col-xs-12 option1">类别3</option>
		</select>
	</div>
	<div class="row password_error">
		<!-- <p><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;出售方式不能为空</p> -->
	</div>

	<div class="row password_label starttime" >
		<p>上架时间：</p>
	</div>
	<div class="row password_input starttime">
		<div class="demo">
			<div class="lie"><input id="beginTime" class="col-xs-12 kbtn" name="starttime"/></div>
		</div>
		<div id="datePlugin"></div>
	</div>
	<div class="row password_error">
		<p id="errorstarttime"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;<span id="starttimeerror">上架时间不能为空</span></p>
	</div>

	<div class="row password_label endtime">
		<p>下架时间：</p>
	</div>
	<div class="row password_input endtime">
		<div class="demo">
			<div class="lie"><input id="beginTime2" class="col-xs-12 kbtn" name="endtime"/></div>
		</div>
		<div id="datePlugin2"></div>
	</div>
	<div class="row password_error">
		<p id="errorendtime"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;<span id="endtimeerror">下架时间不能为空</span></p>
	</div>

	<div class="row password_label">
		<p>展示图片：</p>
	</div>
	<div class="row show_pic">
		<div class="col-xs-4">
			<img id="preview1" class="col-xs-12" src="<%=basePath%>image/default.jpg" />
			<input type="file" name="imgone" id="doc1" class="col-xs-12" onchange="javascript:setImagePreview1();">
			<input type="button" value="选择图片" class="col-xs-12 btn_change" onclick="file_change_photo1()" />
		</div>
		<div class="col-xs-4">
			<img id="preview2" class="col-xs-12" src="<%=basePath%>image/default.jpg" />
			<input type="file" name="imgtwo" id="doc2" class="col-xs-12" onchange="javascript:setImagePreview2();">
			<input type="button" value="选择图片" class="col-xs-12 btn_change" onclick="file_change_photo2()" />
		</div>
		<div class="col-xs-4">
			<img id="preview3" class="col-xs-12" src="<%=basePath%>image/default.jpg" />
			<input type="file" name="imgthree" id="doc3" class="col-xs-12" onchange="javascript:setImagePreview3();">
			<input type="button" value="选择图片" class="col-xs-12 btn_change" onclick="file_change_photo3()" />
		</div>	
	</div>

	<div class="row password_label">
		<p>图文详情：</p>
	</div>
	<div class="row password_input">
		<div class="col-xs-12 pic_word">
			<textarea id="editor_id" name="content" style="width:100%;height:100%;"></textarea>
		</div>
	</div>
	<div class="row password_error">
		<!-- <p><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;图文详情不能为空</p> -->
	</div>
	<div class="row password_error">
		<input type="submit" value="确认修改" class="col-xs-12 btn_submit" onclick="return validate()"/>
	</div>
	</form>
</div>

</body>
</html>