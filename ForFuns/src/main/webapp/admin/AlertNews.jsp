<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
<title>查看列表</title>
<%-- <link rel="stylesheet" type="text/css"
	href="<%=path%>/css/easyUI/themes/gray/easyui.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyUI/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyUI/themes/icon.css">
<script type="text/javascript" src="<%=path%>/js/easyUI/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/easyUI/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/AddCss.css">
<script charset="utf-8" src="<%=path%>/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=path%>/kindeditor/lang/zh_CN.js"></script>
<style type="text/css">
	body{background: url(css/img/bg.png);}
</style>


<script>
KindEditor.ready(function(K) {
	 window.editor =K.create('#editor_id', {
        uploadJson : '<%=basePath%>imageupload.do?method=keuploadimg',
        allowFileManager : false,
        items:[
               'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
               'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
               'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
               'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
               'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
               'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 
               'media', 'table', 'hr', 'baidumap', 'pagebreak',
               'anchor', 'link', 'unlink', '|', 'about'
       ],
	});
});

function submitForm(){
	editor.sync();
	var html = document.getElementById('editor_id').value;
	
	var title = $("#title").val();
	if(title == null || title ==""){
		$.messager.alert('警告','请填写标题','error');
		return ;
	}
	var author = $("#author").val();
	if(author == null || author ==""){
		$.messager.alert('警告','请填写作者','error');
		return ;
	}
	var summary = $("#summary").val();
	if(summary == null || summary ==""){
		$.messager.alert('警告','请填写概要','error');
		return ;
	}
	
	
	var timestart = $('#timestart').datebox('getValue');
	var timeout = $('#timeout').datebox('getValue');
	if(timestart>timeout){
		$.messager.alert('警告','下线时间不能大于上线时间','error');
		return ;
	}
	if(timestart == null || timestart ==""){
		$.messager.alert('警告','请选择上线时间','error');
		return ;
	}
	
	if(timeout == null || timeout ==""){
		$.messager.alert('警告','请选择下线时间','error');
		return ;
	}
	//$('#timestart').datebox('setValue',timestart);
	//$('#timeout').datebox('setValue',timeout);
	$('#ff').form('submit',{
		success:function(data){   
			if(0==data){
				$.message.alert('警告','发布失败','error');
			}else if(1==data){
				location.href="WatchNews.jsp";
			}
		}
	});
}
//更改datebox的日期格式
function myformatter(value) {
	if(value != null && value != ""){
		var date = new Date(value);
        //return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
		return (date.getMonth() + 1) +"/"+ date.getDate()+"/"+date.getFullYear() ;
	}
}
//获取链接数据
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}; 
//通过id获取资讯详情 
function GetNewsById(newsid){
	$.ajax({
		type:'post',
		url:'<%=basePath%>news.do?method=getnewsbyid',
		data:{newsid:newsid},
		success:function(json){
			var news = json.news;
			var ishot = news.ishot;
			var title = news.title;
			var author = news.author;
			var summary = news.summary;
			var money = news.money;
			var timestart = news.timestart;
			var timeout = news.timeout;
			var content = news.content;
			if(ishot ==1 ){
				$('#ishot').find("option").eq(0).attr("selected",true); 
			}else{
				$('#ishot').find("option").eq(1).attr("selected",true); 
			}
			$('#title').val(title);
			$('#author').val(author);
			$('#summary').val(summary);
			$('#money').val(money);
			timestart = myformatter(timestart);
			timeout = myformatter(timeout);
			$('#timestart').datebox('setValue',timestart);
			$('#timeout').datebox('setValue',timeout);
			editor.html(content);
		},error:function(){
			$.message.alert('警告','连接服务器失败','error');
		}
	});
}
$(document).ready(function(){
	var newsid = getUrlParam('newsid');
	GetNewsById(newsid);
	$('#newsid').val(newsid);
});
</script>

<style type="text/css">

</style>
</head>

<body bgcolor="#DDF3FF" class = "h2" >
	<form action="<%=basePath%>news.do?method=alertnews" id="ff" method="post" style="height: 98%;margin-left: 2%;margin-top: 2%;" enctype="multipart/form-data">
		<input type="hidden" id="newsid" name="newsid">
		<fieldset class="simpborder" style="width: 48%; float: left; margin-right: 3%;">
			<label>是否为首页资讯</label> 
			<select name="ishot" id="ishot" onchange="addFile(this.options[this.options.selectedIndex].value)" style="width: 92%;" >
					<option value="1">是</option>
					<option value="0">否</option>
			</select>
		</fieldset>
		<fieldset class="simpborder" style="width: 48%; float: left; ">
			<label>资讯标题</label>
			<input type="text" name="title" id="title">
		</fieldset>
		<fieldset class="simpborder"  style="width: 48%; float: left;margin-right: 3%;">
			<label>作者</label>
			<input  type="text" name="author" id="author">
		</fieldset>
		<fieldset class="simpborder" style="width: 48%; float: left;">
			<label>封面图片</label>
			<input  type="file" name="file" id="file">
		</fieldset>
		<fieldset class="simpborder" style="width: 48%; float: left; margin-right: 3%;">
			<label>资讯概要</label>
			<input type="text" name="summary" id="summary">
		</fieldset>
		<fieldset class="simpborder" style="width: 48%; float: left;">
			<label>费用</label>
			<input type="text" name="money" id="money">
		</fieldset>
		<fieldset class="simpborder" style="width: 47%; float: left;margin-right: 3%;padding-left: 12px;">
			<label>上线时间</label>
			<input class="easyui-datebox" name="timestart" id="timestart" style="width:91%;margin-left: 2%;">
		</fieldset>
		<fieldset class="simpborder"  style="width: 47%; float: left;padding-left: 12px;">
			<label>下线时间</label>
			<input  class="easyui-datebox" name="timeout" id="timeout"  style="width:91%">
		</fieldset>
		
		<br/>
		<fieldset>
		<textarea id="editor_id" name="content" style="width:99%;height:400px;"></textarea>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" id="formsubmit">保存修改</a>
		</fieldset>
	
	</form>
	
	
	
</body>
</html>







