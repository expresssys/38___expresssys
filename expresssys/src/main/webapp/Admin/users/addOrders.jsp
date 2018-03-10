<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<meta charset="UTF-8" >

<style>
ul{
	border:none;
	list-style-type:none;
}
ul>.addorders>input{
    height:30px;
}
ul>.addorders>.orders_input2{
	width:400px;
}
ul>.addorders{
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
.exp-container {
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
.exp-container .search-input {
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
.exp-container .search-box .search-btn {
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
.exp-container .result-list {
	position: relative;
	z-index: 1;
}
.exp-container .result-top {
	margin-bottom: 10px;
	position: relative;
}
.exp-container .result-top .numbers {
	display: block;
	width: 530px;
	font-size: 20px;
	line-height: 56px;
	border-bottom: 1px solid #f3f3f3;
	margin-bottom: 30px;
}
.exp-container .result-top .result-status {
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

<div class="exp-container">
	
	<form id="ordersinformation">
	<h2 class="exp-title exp-check">寄件人信息</h2>
		<ul>
		    
			<li  class="addorders">
				<label>寄件人姓名：</label>
				<input type="hidden" name="ostatus" value="100"/>
				<input type="text" name="osendname" id="orders_update_osendname" class="orders_input" placeholder="请输入寄件人姓名"/>
			</li>
			<li class="addorders">
				<label>寄件人电话：</label>
				<input type="text" name="osendtel" id="orders_update_osendtel" class="orders_input"placeholder="请输入寄件人电话"/>
			</li>
			<li class="addorders">
				<label>寄件人地址：</label>
				<input type="text" name="osendaddress" id="orders_update_osendaddress" class="orders_input2" placeholder="请输入寄件人地址"/>
			</li>
			</ul>
			<h2 class="exp-title exp-check">收件人信息</h2>
			<ul>
			<li class="addorders">
				<label>收件人姓名：</label>
				<input type="text" name="orecname" id="orders_update_orecname" class="orders_input" placeholder="请输入收件人姓名"/>
			</li>
			<li class="addorders">
				<label>收件人电话：</label>
				<input type="text" name="orectel" id="orders_update_orectel" class="orders_input" placeholder="请输入收件人电话"/>
				
			</li>
			<li class="addorders">
			<label>收件人邮编：</label>
				<input type="text" name="oreccode" id="orders_update_oreccode" class="orders_input" placeholder="请输入收件人邮编"/>
			</li>
			<li class="addorders">
				<label>收件人地址：</label>
				<input type="text" name="orecaddress" id="orders_update_orecaddress" class="orders_input2" placeholder="请输入收件人地址"/>
			</li>
			
			
			</ul>
			<h2 class="exp-title exp-check">物品信息</h2>
			<ul>
			<li  class="addorders">
			<label>商品编号名称：</label>
				<select name="res1" id="orders_update_gid"  class="orders_input">
				</select>
			</li>
			<li  class="addorders">
				<label>备注：</label>
				<textarea  rows="5" cols="20"  id="orders_update_oremark" name="oremark">
				</textarea>
			</li>
			
			
		</ul>
		
	</form>
	<div class="search-box">
		<input class="search-btn" value="提交" type="button" id="search-btn">
	</div>

</div>

<script type="text/javascript">
$(function(){
	 		var gidandname="<option value='0'>--商品编号名称--</option>";
	 		$.get("goods/find.action",{res1:1,rows:100,page:1},function(datas){
	 			$.each(datas.rows,function(index,item){
	 				gidandname+="<option value='"+item.gid+"'>"+item.gid+"_"+item.gname+"</option>";
	 			})
	 			$("#orders_update_gid").append($(gidandname));
	 		},"json");
	
})
$("#search-btn").click(function(){
	var gid=$.trim($("#orders_update_gid").val());
	$.ajax({
		url:"orders/add.action",
		secureuri:false,
		type : "POST",
		dataType:"text",
		data:$("#ordersinformation").serialize(),
		success:function(data,status){
			if(data>0){
				//订单添加成功时  将所对应商品状态改为已发货
				$.post("goods/update.action",{res1:2,gid:gid},function(data){
				},"json");
				$("#ordersinformation")[0].reset();
				alert("提交成功")
			}else{
				alert("失败提示","提交失败...","error");
			}
			
		},
		error:function(data,status,e){
			alert("失败提示","提交失败...\n"+e,"error");
		}
	});
})
</script>