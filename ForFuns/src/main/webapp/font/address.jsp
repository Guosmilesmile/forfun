<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">
	<title>Address</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/address.css">
	<link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
<script type="text/javascript">
function validate(obj){  
     var reg = new RegExp("^[0-9]*$");  
	 if(!reg.test(obj)){  
	     alert("请输入数字!");  
	     return false;
	 }  
	 return true;
}
function addNewOne(){
	$(".add_hidden_bg").show();
	$(".add_hidden").show();
}

function submitNewOne(){
	$(".add_hidden_bg").hide();
	$(".add_hidden").hide();
}

function remove1(obj){
	var id = obj.getAttribute("class");
	id = id.substring(7,id.length);
	$('#ok_remove').attr('name',id);
	$(".ok_remove_bg").show();
	$(".ok_remove").show();
}

function ok_remove2(){
	var id = $('#ok_remove').attr('name');
	deleteAddress(id);
	$(".ok_remove_bg").hide();
	$(".ok_remove").hide();
}
function ok_remove1(){
	$(".ok_remove_bg").hide();
	$(".ok_remove").hide();
}
//删除地址
function deleteAddress(id){
	$.ajax({
		type:'post',
		url:'<%=basePath%>address.do?method=deleteCustomerAddress',
		data:{addressid:id},
		success:function(json){
			if(json==-1){
				location.href="<%=basePath%>font/Login.jsp";
			}else if(json==0){
				alert("删除失败");
			}else if(json==1){
				alert("删除成功");
				var customerUserid = getCookieUserid();
				if(null==customerUserid)
					location.href="<%=basePath%>font/Login.jsp";
				getAddress(customerUserid);
			}
		},error:function(){
			
		}
	});
};
//获取地址列表
function getAddress(customerUserId){
	$.ajax({
		type:'post',
		url:'<%=basePath%>address.do?method=getAddressByCustomerid',
		data:{customerUserid:customerUserId},
		success:function(json){
			var body = "";
			if(json.length>0){
				for(var i=0;i<json.length;i++){
					var receiver = json[i].receiver;
					var address = json[i].address;
					var telephone = json[i].telephone;
					var id = json[i].id;
					body+="<div class='row add_div'>"
						+"<div class='radio add_radio'>"
			  			+"<label>"
			    			+"<input type='radio' name='blankRadio' id='blankRadio1' value='option1'>"
			  			+"</label>"
					+"</div>"
					+"<div class='add_info'>"
						+"<p>收货人："+receiver+"</p>"
						+"<p>地址："+address+"</p>"
						+"<p>电话："+telephone+"</p>"
					+"</div>"
					+"<div class='add_remove'>"
						+"<button onclick='remove1(this)' class='remove_"+id+"'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>"
					+"</div>"
				+"</div>";
				}
				
			}
			body+="<div class='row add_new'>"
			+"<button class='new_btn' onclick='addNewOne()'><span class='glyphicon glyphicon-plus-sign'aria-hidden='true'></span>&nbsp;&nbsp;新增地址</button>"
			+"</div>";
			$('#addresslist').html(body);
			
			var btn_remove_h = $(".add_div").height();
			$(".add_remove").height(btn_remove_h);
			
			var add_hidden_w = $(".new_btn").width()-35;
			$(".add_hidden").width(add_hidden_w);
			

			var ok_remove_w = $(".new_btn").width()-35;
			$(".ok_remove").width(ok_remove_w);
		},error:function(){
			
		}
	});
};
function addAddress(address,telephone,receiver){
	$.ajax({
		type:'post',
		asycn:false,
		url:'<%=basePath%>address.do?mehtod=addCustomerAddress',
		data:{address:address,telephone:telephone,receiver:receiver},
		success:function(json){
			if(json==-1){
				location.href="<%=basePath%>font/Login.jsp";
			}else if(json==0){
				alert("添加失败");
			}else if(json==1){
				alert("添加成功");
				$(".add_hidden_bg").hide();
				$(".add_hidden").hide();
				var customerUserid = getCookieUserid();
				if(null==customerUserid)
					location.href="<%=basePath%>font/Login.jsp";
				getAddress(customerUserid);
				$('#inputreceiver').val("");
				$('#inputaddress').val("");
				$('#inputtelephone').val("");
			} 
		},error:function(){
			alert("fail");
		}
	});
};
$(document).ready(function()
{
	$('.back_btn').click(function(){
		location.href="<%=basePath%>font/personal.jsp";
	});
	var customerUserid = getCookieUserid();
	if(null==customerUserid)
		location.href="<%=basePath%>font/Login.jsp";
	getAddress(customerUserid);
	

	
	
	$('#submitbtn').click(function(){
		var receiver = $('#inputreceiver').val();
		var address = $('#inputaddress').val();
		var telephone =$('#inputtelephone').val();
		if(""==receiver || undefined == receiver || null ==receiver){
			alert("收货人不得为空");
			return;
		}
		if(""==address || undefined == address|| null==address){
			alert("地址不得为空");
			return;
		}
		if(""==telephone || undefined == telephone|| null==telephone){
			alert("联系电话不得为空");
			return;
		}
		if(validate(telephone)){
			addAddress(address,telephone,receiver);
		}
	});
	
	var btn_remove_h = $(".add_div").height();
	$(".add_remove").height(btn_remove_h);
	var add_hidden_w = $(".new_btn").width()-35;
	$(".add_hidden").width(add_hidden_w);
	

	var ok_remove_w = $(".new_btn").width()-35;
	$(".ok_remove").width(ok_remove_w);
});
 
</script>

</head>

<body>

<a href="javascript:;" class="lanrenzhijia_top"></a>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left partten" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&nbsp;&nbsp;我的地址</p>
	</div>
</div>

<div class="container-fluid mainer" id="addresslist">
	<!-- <div class="row add_div">
		<div class="radio add_radio">
  			<label>
    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
  			</label>
		</div>
		<div class="add_info">
			<p>收货人：孔日天</p>
			<p>地址：福建省厦门市思明区厦门大学</p>
			<p>电话：15659992000</p>
		</div>
		<div class="add_remove">
			<button onclick="remove1()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
	</div>
	<div class="row add_div">
		<div class="radio add_radio">
  			<label>
    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
  			</label>
		</div>
		<div class="add_info">
			<p>收货人：孔日天</p>
			<p>地址：福建省厦门市思明区厦门大学</p>
			<p>电话：15659992000</p>
		</div>
		<div class="add_remove">
			<button onclick="remove1()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
	</div>
	<div class="row add_div">
		<div class="radio add_radio">
  			<label>
    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
  			</label>
		</div>
		<div class="add_info">
			<p>收货人：孔日天</p>
			<p>地址：福建省厦门市思明区厦门大学</p>
			<p>电话：15659992000</p>
		</div>
		<div class="add_remove">
			<button onclick="remove1()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
	</div>
	<div class="row add_div">
		<div class="radio add_radio">
  			<label>
    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
  			</label>
		</div>
		<div class="add_info">
			<p>收货人：孔日天</p>
			<p>地址：福建省厦门市思明区厦门大学</p>
			<p>电话：15659992000</p>
		</div>
		<div class="add_remove">
			<button onclick="remove1()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
	</div>

	<div class="row add_new">
		<button class="new_btn" onclick="addNewOne()"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>&nbsp;&nbsp;新增地址</button>
	</div> -->

	
</div>

	<div class="row add_hidden_bg"></div>
	<div class="row add_hidden">
		<div class="row add_name">
			<p>收货人：</p>
			<input type="text" class="col-xs-12" id="inputreceiver"/>
		</div>
		<div class="row add_name">
			<p>地址：</p>
			<input type="text" class="col-xs-12" id="inputaddress"/>
		</div>
		<div class="row add_name">
			<p>电话：</p>
			<input type="text" class="col-xs-12" id="inputtelephone"/>
		</div>
		<div class="row add_name">
			<button class="col-xs-12 new_submit" id='submitbtn'><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;提交</button>
		</div>
	</div>

	<div class="row ok_remove_bg"></div>
	<div class="row ok_remove">
		<p>是确认否删除？</p>
		<button class="col-xs-5 btn_remove" onclick="ok_remove2()" id="ok_remove" name="">是</button>
		<button class="col-xs-offset-2 col-xs-5 btn_remove" onclick="ok_remove1()">否</button>
	</div>

</body>
</html>