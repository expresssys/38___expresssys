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
	<h2 class="exp-title exp-check">查件</h2>
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
	var expShowLeave = "${ALLCONST.expShowLeave[0].cname}"; 
	var expShowArr = "${ALLCONST.expShowArr[0].cname}";
	var expShowSendTo = "${ALLCONST.expShowSendTo[0].cname}";
	var expShowGet = "${ALLCONST.expShowGet[0].cname}";
	var expShowSales = "${ALLCONST.expShowSales[0].cname}";
	var expShowSend = "${ALLCONST.expShowSend[0].cname}";
	
	function changstr(str){
		var s = str.split(" ");
		var ss = s[3];
		var sss = ss.split(":");
		
		if(s[4]== 'PM'){
			sss[0] = parseInt(sss[0])+12 + "";
		}
		return sss;
	}
	
	
	function expressImf(obj){
		var expstr = "";
		if(obj.hstatus == 2){
			expstr += "<p class='branch-text'><span class='color'>【  " + obj.htoSpname +" 】</span>" + expShowArr + "<span class='color'> " + obj.htoSpname +" </span>" +"</p>";
			expstr += "<p class='branch-time'>"+new Date(obj.hendTime).format("yyyy-MM-dd hh:mm:ss",obj.hendTime)+"</p>";
			
			expstr += "<p class='branch-text'><span class='color'>【 " + obj.hfromSpname +" 】</span>" + expShowLeave + "<span class='color'> " + obj.hfromSpname +" </span>"+ expShowSendTo + "<span class='color'> " + obj.htoSpname +" </span>"+ "</p>";
			expstr += "<p class='branch-time'>"+new Date(obj.hstartTime).format("yyyy-MM-dd hh:mm:ss",obj.hstartTime)+"</p>";
			
		}else if(obj.hstatus==1){
			expstr += "<p class='branch-text'><span class='color'>【 " + obj.hfromSpname +" 】</span>" + expShowLeave + "<span class='color'> " + obj.hfromSpname +" </span>"+ expShowSendTo + "<span class='color'> " + obj.htoSpname +" </span>"+ "</p>";
			expstr += "<p class='branch-time'>"+new Date(obj.hstartTime).format("yyyy-MM-dd hh:mm:ss",obj.hstartTime)+"</p>";
			
		}/* else if(obj.hstatus==0){
			expstr += "<p class='branch-text'><span class='color'>【 " + obj.htoSpname +" 】</span>" + expShowArr + "<span class='color'> " + obj.htoSpname +" </span>" +"</p>";
			expstr += "<p class='branch-time'>"+new Date(obj.hendTime).format("yyyy-MM-dd hh:mm:ss",obj.hendTime)+"</p>";
		} */
		return expstr; 
		
	}

	$("#search-btn").click(function(){
		var searchVal = $("#search-input").val();
		if(searchVal ==null || searchVal == ''){
			return ;
		}
		
		Date.prototype.format = function (format,str) {
			var strsss = changstr(str);
		    var args = {
		        "M+": this.getMonth() + 1,
		        "d+": this.getDate(),
		        "h+": strsss[0],
		        "m+": strsss[1],
		        "s+": strsss[2],
		        "q+": Math.floor((this.getMonth() + 3) / 3), 
		        "S": this.getMilliseconds()
		    };
		    
		    if (/(y+)/.test(format))
		        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		    for (var i in args) {
		        var n = args[i];
		        if (new RegExp("(" + i + ")").test(format)){
		            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? n : ("00" + n).substr(("" + n).length));
		        }
		        
		    }
		    return format;
		};
		
		
		
		$.ajax({
			url:"orders/findByID.action",
			secureuri:false,
			type:"POST",
			data: {"osid":searchVal},
			success:function(data){	 
				if(data.total>0){
					$("#show-orderid").html(data.rows[0].osid);
					$.ajax({
						url:"handover/findBy.action",
						secureuri:false,
						type:"POST",
						data: {"osid":searchVal},
						success:function(datas){	 
							$("#show-orderStatus").html(datas.msg);
							$("#branch-list").html('');
							if(datas.code==0 || datas.code==100 || datas.code==1){
								var str = "<div class='branch-item show'><p class='branch-text'>暂无最新物流信息</p></div>";
								$("#branch-list").append(str);
								console.info(str)
							}else{
								
								var str ="<div class='branch-item show'>";; 
								for(var i= datas.obj.length-1;i>=0;i--){
									var item = datas.obj[i];
									if(i == 0){
										if(item.hstatus !=0){
											str += expressImf(item);
										}
										str += "<p class='branch-text'><span class='color'>【  " + item.hfromSpname +" 】</span>" + " <span class='color'> " + item.hfromSpname +" </span>" +expShowSales + expShowGet + "</p>";
										str += "<p class='branch-time'>"+new Date(data.rows[0].otime).format("yyyy-MM-dd hh:mm:ss",data.rows[0].otime)+"</p>";
										
									}else if(i == datas.obj.length-1 && item.hstatus == 2){
										str += "<p class='branch-text'><span class='color'>【 " + item.htoSpname +" 】</span>"+" <span class='color'> " + item.htoSpname +" </span>" + expShowSales + expShowSend + "</p>";
										str += "<p class='branch-time'>"+new Date(item.hendTime).format("yyyy-MM-dd hh:mm:ss",item.hendTime)+"</p>";
										str += expressImf(item);
									}else{
										 str += expressImf(item);
									}
									console.info(str);
								}
								str += "</div>";
								$("#branch-list").append(str);
							}
						}
					});
					
				}else{
					alert("暂无此运单号的物流信息");
				}
			}
		})
	});

</script>