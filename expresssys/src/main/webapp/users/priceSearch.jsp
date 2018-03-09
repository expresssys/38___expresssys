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
	<h2 class="exp-title exp-check">运费时效查询</h2>
	<div class="search-txt">
		<input type="text" class="search-input" id="search-input" />
	</div>
	<div class="search-box">
		<input class="search-btn" value="查询" type="button" id="search-btn">
	</div>

	<div class="result-list">
		<div class="result-top">
			<strong class="numbers"><span>运单号:</span><span id="show-orderid"></span></strong>
			<div class="result-status">
				<span class="static-text" id="show-orderStatus"></span>
			</div>
		</div>
		<div class="branch-list" id="branch-list">
			
		</div>

	</div>

</div>

<script type="text/javascript">
	

</script>