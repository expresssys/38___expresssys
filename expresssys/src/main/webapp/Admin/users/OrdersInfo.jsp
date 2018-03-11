<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<meta charset="UTF-8" >

<style>
ul{
	border:none;
	list-style-type:none;
}
.ordersInfo>input{
    height:30px;
}
.ordersInfo>.orders_input2{
	width:400px;
}
.ordersInfo{
padding-top: 15px;
    padding-bottom: 15px;
    list-style-type: none;
	color: #888;
	font-size: 16px;
	line-height: 18px;
	list-style:none;
	
	margin-bottom: 20px;
	
border:none;
}
.ordersInfo-container {
	width: 550px;
	height: 400px;
	margin: 0 auto;
}
.exp-title {
	display: block;
	font-size: 26px;
	color: #0c0c0c;
	padding-left: 46px;
	margin-bottom: 20px;
	line-height: 32px;
	position: relative;
}
.exp-check {
	background: url(images/users/exCheck_icon.png) left center no-repeat;
}
.ordersInfo-container .search-input {
	width: 550px;
	height: 100px;
	font-size: 14px;
	line-height: 18px;
	resize: none;
	overflow: auto;
	background: #fff;
	padding: 5px 10px;
	margin-bottom: 15px;
	border: 1px solid #0099d9;
	position: relative;
}
.ordersInfo-container .search-box .orderInfo-search-btn {
	display: block;
	width: 140px;
	line-height: 40px;
	color: #fff;
	background: #33a2f7;
	border: 0;
	font-family: microsoft yahei;
	border-radius: 4px;
	cursor: pointer;
}
.ordersInfo-container .result-list {
	position: relative;
	z-index: 1;
}
.ordersInfo-container .result-top {
	margin-bottom: 10px;
	position: relative;
}
.ordersInfo-container .result-top .numbers {
	display: block;
	width: 530px;
	font-size: 20px;
	line-height: 56px;
	border-bottom: 1px solid #f3f3f3;
	margin-bottom: 30px;
}
.ordersInfo-container .result-top .result-status {
	position: absolute;
	right: 0;
	top: 18px;
	text-align: right;
}
.branch-list .branch-item .branch-text {
	width: 540px;
	font-size: 14px;
	line-height: 22px;
	margin: 0 auto;
}
.branch-list .branch-time {
	font-size: 12px;
	color: #a1a1a1;
	margin-left: 10px;
}
.color{
	color: #ff5a00;
} 
</style>
<meta charset="UTF-8">

<div class="ordersInfo-container">
	
	<form id="rmation">
	<h2 class="exp-title exp-check">收件人信息</h2>
			<ul>
			<li class="ordersInfo">
				<label>收件人姓名：</label>
				<label id="orecName"></label>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>收件人电话：</label>
				<label id="orecTel"></label>
			</li>
			<li class="ordersInfo">
			<label>收件人邮编：</label>
			<label id="orecCode"></label>&nbsp;&nbsp;&nbsp;
				<label>收件人地址：</label>
				<label id="orecAddress"></label>				
			</li>
			
			
			</ul>
	
			<h2 class="exp-title exp-check">订单信息</h2>
			<ul>
			<li  class="ordersInfo">
			<label>订单编号：</label>
				<label id="osid"></label>&nbsp;&nbsp;&nbsp;
			<label>商品类型：</label>
				<label id="res1"></label>
			</li>
			
			
		</ul>
	
		<h2 class="exp-title exp-check">寄件人信息</h2>
		<ul>
		    
			<li  class="ordersInfo">
				<label>寄件人姓名：</label>
				<label id="sendName"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>寄件人电话：</label>
				<label id="osendTel"></label>
			</li>
			<li class="ordersInfo">
				<label>寄件人地址：</label>
				<label id="osendAddress"></label>
			</li>
			</ul>
			
			
		
	</form>
	<div class="search-box">
		<input class="orderInfo-search-btn" value="修改订单" type="button" id="orderInfo-search-btn">
	</div>

</div>

<script type="text/javascript">
$("#orderInfo-search-btn").click(function(){
	var osid=$.trim($("#osid").html());
	$.ajax({
   	        url: 'orders/findByID.action',
   	        data:{osid:osid},
   	        type: 'post',
   	        success: function (data){  
   	        	console.info(data);
   	        	if(data.rows[0].ostatus==100){
   	        		showPages("updateOrder");
   	     		updateorders(osid);
   	        		
   	        	}else{
   	        		alert("订单已发件不能修改，请联系管理员");
   	        	}
   	     }
   });
})
</script>