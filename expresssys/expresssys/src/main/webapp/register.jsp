<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<meta charset="UTF-8" >
<title>用户注册</title>

<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

<style>
ul{
	border:none;
	list-style-type:none;
}
ul>.addorders>input{
    height:30px;
    width:260px;
}
ul>.addorders>.users_input2{
	width:280px;
}
ul>.addorders{
padding-top: 15px;
    padding-bottom: 15px;
    list-style-type: none;
	
font-size: 18px;
	line-height: 18px;
	list-style:none;
	
	margin-bottom: 20px;
	
border:none;
}
.exp-container {
	width: 450px;
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
	background: url(Admin/images/users/exCheck_icon.png) left center no-repeat;
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
	width: 250px;
	line-height: 40px;
	color: #fff;
	background: #33a2f7;
	border: 0;
	font-family: microsoft yahei;
	cursor: pointer;
	margin-top: 30px;
	margin-left: 100px;
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
	<h3 class="exp-title exp-check">用户注册</h3>
	
	<div class="search-content">
		<form id="form_users_update">
		<input type="hidden"  name="usid" id="users_update_usid"  />
		<ul>
			<li class="addorders">
				<label>名称:</label>
				<input type="text" name="uname"  class="users_input"/>
			</li>
			<li class="addorders">
				<label>密码:</label>
				<input type="password" name="upwd"  class="users_input"/>
			</li>
			<li class="addorders">
				<label>真名:</label>
				<input type="text" name="urealname"  class="users_input"/>
			</li>
			<li class="addorders">
				<label>电话:</label>
				<input type="text" name="utel" id="users_update_utel" class="users_input"/>
			</li>
			<li class="addorders">
				<label>手机:<span></span></label>
				<input type="text" name="uphone" id="users_update_uphone" class="users_input"/>
			</li>
			
			<li class="addorders">
				<label>地址:</label>
				<input type="text" name="uaddress" id="users_update_uaddress" class="users_input2"/>
			</li>
			<li class="addorders">
				<label>邮箱:</label>
				<input type="text" name="uemail" id="users_update_uemail" class="users_input"/>
				<input type="hidden" name="res1" value="3"/>
			</li>
			
		</ul>
	</form>
	
	
	</div>
	<div class="search-box">
		<input class="search-btn" value="注册" type="button" id="search-btn">
	</div>
	

</div>

<script type="text/javascript">
$("#search-btn").click(function(){
	$.ajax({
		url:"add.action",
		secureuri:false,
		type:"POST",
		data: $('#form_users_update').serialize(),  
		success:function(data,status){
			if(data.code>0){
				
				$("#form_users_update")[0].reset();
				alert("注册成功...");
				location.href="login.html";
			}else{
				alert("失败提示","注册失败...","error");
			}
		},
		error:function(data,status,e){
			alert("失败提示","注册失败...\n"+e,"error");
		}
	});
})


</script>
</html>

