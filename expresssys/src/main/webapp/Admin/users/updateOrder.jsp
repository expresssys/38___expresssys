<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<meta charset="UTF-8" >

<style>
ul{
	border:none;
	list-style-type:none;
}
ul>.updateorders>input{
    height:30px;
}
ul>.updateorders>.updateorders_input2{
	width:400px;
}
ul>.updateorders{
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
.update-container {
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
.update-container .search-input {
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
.update-container .search-box .updateOrders {
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
.update-container .result-list {
	position: relative;
	z-index: 1;
}
.update-container .result-top {
	margin-bottom: 10px;
	position: relative;
}
.update-container .result-top .numbers {
	display: block;
	width: 530px;
	font-size: 20px;
	line-height: 56px;
	border-bottom: 1px solid #f3f3f3;
	margin-bottom: 30px;
}
.update-container .result-top .result-status {
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

<div class="update-container">
	
	<form id="updateordersinformation">
	<h2 class="exp-title exp-check">寄件人信息</h2>
		<ul>
		    
			<li  class="updateorders">
				<label>寄件人姓名：</label>
				<input type="hidden" name="ostatus" value="100"/>
				<input type="text" name="osendname" id="updateorders_osendname" class="updateorders_input" placeholder="请输入寄件人姓名"/>
				<input type="hidden" name="usid" value="${user.usid }"/>
				<input type="hidden" name="osid" id="updateorders_osid"/>
	
			</li>
			<li class="updateorders">
				<label>寄件人电话：</label>
				<input type="text" name="osendtel" id="updateorders_osendtel" class="updateorders_input"placeholder="请输入寄件人电话"/>
			</li>
			<li class="updateorders">
				<label>寄件人地址：</label>
				<input type="text" name="osendaddress" id="updateorders_osendaddress" class="updateorders_input2" placeholder="请输入寄件人地址"/>
			</li>
			</ul>
			<h2 class="exp-title exp-check">收件人信息</h2>
			<ul>
			<li class="updateorders">
				<label>收件人姓名：</label>
				<input type="text" name="orecname" id="updateorders_orecname" class="updateorders_input" placeholder="请输入收件人姓名"/>
			</li>
			<li class="updateorders">
				<label>收件人电话：</label>
				<input type="text" name="orectel" id="updateorders_orectel" class="updateorders_input" placeholder="请输入收件人电话"/>
				
			</li>
			<li class="updateorders">
			<label>收件人邮编：</label>
				<input type="text" name="oreccode" id="updateorders_oreccode" class="updateorders_input" placeholder="请输入收件人邮编"/>
			</li>
			<li class="updateorders">
				<label>收件人地址：</label>
				<input type="text" name="orecaddress" id="updateorders_orecaddress" class="updateorders_input2" placeholder="请输入收件人地址"/>
			</li>
			
			
			</ul>
			<h2 class="exp-title exp-check">物品信息</h2>
			<ul>
			<li  class="updateorders">
			<label>商品类型：</label>
				<select name="res1" id="updateorders_gid"  class="updateorders_input">
				</select>
			</li>
			<li  class="updateorders">
				<label>备注：</label>
				<textarea  rows="5" cols="20"  id="updateorders_oremark" name="oremark">
				</textarea>
			</li>
			
			
		</ul>
		
	</form>
	<div class="search-box">
		<input class="updateOrders" value="提交修改" type="button" id="updateOrders_btn">
	</div>

</div>

<script type="text/javascript">
$(function(){
	 		var gidandname="<option value='0'>--商品编号名称--</option>";
	 		$.get("goods/find.action",{res1:1,rows:100,page:1},function(datas){
	 			$.each(datas.rows,function(index,item){
	 				gidandname+="<option value='"+item.gid+"'>"+item.gid+"_"+item.gname+"</option>";
	 			})
	 			$("#updateorders_gid").append($(gidandname));
	 		},"json");
	
})
$("#updateOrders_btn").click(function(){
	$.ajax({
		url:"orders/update.action",
		secureuri:false,
		type : "POST",
		data:$("#updateordersinformation").serialize(),
		success:function(data,status){
			if(data>0){
				//订单添加成功时  将所对应商品状态改为已发货
				$("#updateordersinformation")[0].reset();
				alert("修改成功");
				showPages("myOrders");
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