//获取url链接
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}; 
//获取cookie
function getCookie(objName){//获取指定名称的cookie的值 
	var arrStr = document.cookie.split("; "); 
	for(var i = 0;i < arrStr.length;i ++){ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName) return unescape(temp[1]); 
	} 
};
//更改datebox的日期格式
function myformatter(value) {
	if(value != null && value != ""){
		var date = new Date(value);
        return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
	}
}
//更改datebox的日期格式
function myformattertwo(value) {
	if(value != null && value != ""){
		var date = new Date(value);
        return (date.getMonth() + 1) + '-' + date.getDate();
	}
}
//移动函数
function mScroll(id){$("html,body").stop(true);$("html,body").animate({scrollTop: $("#"+id).offset().top-150}, 1000);}
//检测用户是否已登录
function CheckUser(){
	var useridtoken = getCookie("useridtoken");
	if(null==useridtoken || "" == useridtoken){
		return ;
	}
	var index = useridtoken.indexOf("&");
	var id =  useridtoken.substring(0,index);
	$.ajax({
		type:'post',
		url:'../customer.do?method=GetCustomerName',
		data:{customerid:id},
		success:function(json){
			$('#registeraction').hide();
			$('#loginaction').hide();
			$('#usernameaction').show();
			$('#loginoutaction').show();
			$('#username').html("<i class='item_login'/>"+json);
		},error:function(){
			
		}
	});
}
function getCookieUserid(){
	var useridtoken = getCookie("useridtoken");
	if(null==useridtoken || "" == useridtoken){
		return null;
	}
	var index = useridtoken.indexOf("&");
	var id =  useridtoken.substring(0,index);
	return id;
}

$(document).ready(function(){
	var bg_h = $(".content").height() + $(".header-top").height() + $(".bar_news").height();
	$("#fontbg").height(bg_h);
});