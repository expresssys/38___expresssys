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

</div>

<script type="text/javascript">
$(function(){
	var usid=$("#order_usid").val();
	$("#listinfo").html('');
	var orderInfo="<h3>我的订单</h3><ul>";
	$.ajax({   
        url: 'orders/findAllBy.action',
        data:{usid:usid},
        type: 'post',
        success: function (data){  
        	$.each(data.rows,function(index,value){
        		orderInfo+="<li class='list-item'><span onclick='javascript:showOrders("+value.osid+")'>收件人："+value.orecname+"</span></li>";
        	});
        	$("#listinfo").append($(orderInfo));
         }
    });
})

function showOrders(osid){
	$.ajax({   
        url: 'users/OrdersInfo.jsp',
        data:'{}',
        type: 'post',
        dataType: 'text',
        contentType: 'application/json; charset=utf-8',
        success: function (data){                           
       		$("#content").html(data);
       		$.ajax({   
       	        url: 'orders/findByCondition.action',
       	        data:{osid:osid,rows:1,page:1},
       	        type: 'post',
       	        success: function (data){  
       	        	
       	        	$("#orecName").html(data.rows[0].orecname);
       	        	$("#osid").html(data.rows[0].osid);
       	        	$("#orecTel").html(data.rows[0].orectel);
       	        	$("#orecCode").html(data.rows[0].oreccode);
       	        	$("#orecAddress").html(data.rows[0].orecaddress);
       	        	$("#sendName").html(data.rows[0].osendname);
       	        	$("#osendTel").html(data.rows[0].osendtel);
       	        	$("#orecName").html(data.rows[0].orecname);
       	        	$("#osendAddress").html(data.rows[0].osendaddress);
       	        	$("#res1").html(data.rows[0].res1);
       	        	
       	        	if(data.rows[0].ostatus!=100){
       	        		$("#orderInfo-search-btn").css("display","none");
       	        	}else{
       	        		$("#orderInfo-search-btn").css("display","block");
       	        	}
       	        	
       	        	if(data.rows[0].ostatus==4){
       	        		$("#orderInfo-search-sh").css("display","block");
       	        	}else{
       	        		$("#orderInfo-search-sh").css("display","none");
       	        	}
       	         }
       	    });
        }
    });
	
}

function updateorders(osid){
	$.ajax({   
	        url: 'orders/find.action',
	        data:{osid:osid},
	        type: 'post',
	        success: function (data){  
					$("#updateorders_osendname").val(data.rows[0].orders.osendname);
					$("#updateorders_osid").val(data.rows[0].orders.osid);
					$("#updateorders_orectel").val(data.rows[0].orders.orectel);
					$("#updateorders_oreccode").val(data.rows[0].orders.oreccode);
					$("#updateorders_orecname").val(data.rows[0].orders.orecname);
					$("#updateorders_orecaddress").val(data.rows[0].orders.orecaddress);
					$("#updateorders_osendtel").val(data.rows[0].orders.osendtel);
					$("#updateorders_orecname").val(data.rows[0].orders.orecname);
					$("#updateorders_osendaddress").val(data.rows[0].orders.osendaddress);
					$("#updateorders_oremark").val(data.rows[0].orders.oremark);
					$("#updateorders_goodsType").val(data.rows[0].goods.gtype);
					$("#updateorders_gid").val(data.rows[0].goods.gid);
					
	        }
	    });
}
</script>