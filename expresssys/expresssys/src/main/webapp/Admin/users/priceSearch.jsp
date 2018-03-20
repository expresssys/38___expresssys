<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<meta charset="UTF-8" >
<style>
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


.exp-container .search-content{
	padding: 20px 20px;
	border-radius: 3px;
	border: 1px solid #bfbfbf;
	color: gray;
	width:400px;
}

.exp-container .search-txt{
	margin-top: 25px;
}

.exp-container .search-txt label{
	width:80px;
	display: inline-block;
}

.exp-container .search-input {
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
	cursor: pointer;
	margin-top: 10px;
}


.exp-container .error{
	display: none;
	color: red;
}
.exp-container .result-list {
	position: relative;
	z-index: 1;
}

.color{
	color: #ff5a00;
} 

.exp-container .result-list{
	padding: 20px 20px 10px;
	border-radius: 3px;
	border: 1px solid #bfbfbf;
	color: gray;
	width:400px;
	margin-top: 30px;
}

.exp-container .result-txt{
	margin-bottom: 15px;
}

.exp-container .result-txt label{
	width:100px;
	display: inline-block;
}
._citys {
	width: 50%;
	height: 50%;
	display: inline-block;
	position: relative;
	background: white;
	margin-left: 380px;
	margin-top: -95px;
}

._citys span {
	color: #56b4f8;
	height: 15px;
	width: 15px;
	line-height: 15px;
	text-align: center;
	border-radius: 3px;
	position: absolute;
	right: 1em;
	top: 10px;
	border: 1px solid #56b4f8;
	cursor: pointer;
}

._citys0 {
	width: 100%;
	height: 34px;
	display: inline-block;
	border-bottom: 2px solid #56b4f8;
	padding: 0;
	margin: 0;
	margin-top: -10px;
}

._citys0 li {
	float: left;
	height: 34px;
	line-height: 34px;
	overflow: hidden;
	font-size: 15px;
	color: #888;
	width: 80px;
	text-align: center;
	cursor: pointer;
}

.citySel {
	background-color: #56b4f8;
	color: #fff !important;
}

._citys1 {
	width: 100%;
	height: 80%;
	display: inline-block;
	overflow: auto;
}

._citys1 a {
	height: 35px;
	display: block;
	color: #666;
	padding-left: 6px;
	margin-top: 3px;
	line-height: 35px;
	cursor: pointer;
	font-size: 13px;
	overflow: hidden;
}

._citys1 a:hover {
	color: #fff;
	background-color: #56b4f8;
}

#cColse {
	top:-400px;
}
.ui-content {
	border: 1px solid #EDEDED;
}

</style>
<meta charset="UTF-8">

<div class="exp-container">
	<h3 class="exp-title exp-check">运费时效查询</h3>
	
	<div class="search-content">
		<div id="search-fromtxt" class="search-txt first">
			<label>始发点：</label><input type="text" class="search-input" id="search-frominput" />
			<span id="start-error" class="error" for="start">请选择您的始发地</span>
		</div>
		<div id="search-totxt" class="search-txt">
			<label>目的地：</label><input type="text" class="search-input" id="search-toinput" />
			<span id="end-error" class="error" for="end">请选择您的目标地</span>
		</div>
		<div id="search-weight" class="search-txt">
			<label>重量：</label><input type="number" class="search-input" id="search-winput" min="0" step="0.1" value="1"/>&nbsp;&nbsp;&nbsp;KG
		</div>
	</div>
	
	<div class="search-box">
		<input class="search-btn" value="查询" type="button" id="search-btn" >
		<span id="search-error" class="error" for="end">暂无价格记录</span>
	</div>

	<div class="result-list">
		<div id="" class="result-txt">
			<label>实际计费重量：</label><span id="result-weight">0</span> KG
		</div>
		<div id="" class="result-txt">
			<label>预计费用：</label><span id="result-price">0</span> 元
		</div>

	</div>

</div>

<script type="text/javascript">
	
	$("#search-frominput").click(function(e) {
		SelCity(this, e,"search-frominput");
		$("._citys").css("margin-top","-95px");	
	});
		
	$("#search-toinput").click(function(e) {
		SelCity(this, e,"search-toinput");
		$("._citys").css("margin-top","-25px");
	});

	$("#search-btn").click(function(){
		var fromVal = $("#search-frominput").val();
		var toVal = $("#search-toinput").val();
		var weight = $("#search-winput").val();
		
		if(fromVal == null || fromVal == ''){
			$("#start-error").css("display","inline-block");
		}else{
			$("#start-error").css("display","none");
		}
		
		if(toVal == null || toVal == ''){
			$("#end-error").css("display","inline-block");
		}else{
			$("#end-error").css("display","none");
		}
		
		
		if(fromVal == null || fromVal == '' || toVal == null || toVal == ''){
			return ;
		} 
		
		fromVal = fromVal.split("-")[1];
		if(fromVal.indexOf("市")>=0){
			fromVal = fromVal.split("市")[0];
			
		}
		
		toVal = toVal.split("-")[1];
		if(toVal.indexOf("市")>=0){
			toVal = toVal.split("市")[0];
		}
		
		$.ajax({
			url:"calPrice.action",
			secureuri:false,
			type:"POST",
			data: {pfrom:fromVal,pto:toVal,weight:weight},  
			success:function(data,status){
				if(data.code > 0){
					$("#search-error").css("display","none");
					$("#result-weight").html(data.weight);
					$("#result-price").html(data.price);
				}else{
					$("#search-error").css("display","inline-block");
				}
			},
			error:function(data,status,e){
				$("#start-error").css("display","inline-block");
			}
		});
		
		
	});

</script>