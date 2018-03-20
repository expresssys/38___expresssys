<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<meta charset="UTF-8">
<style>

._citys {
	width: 50%;
	height: 50%;
	display: inline-block;
	position: relative;
	background: white;
	margin-left: 210px;
	margin-top: -120px;
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
	top:0;
}
.ui-content {
	border: 1px solid #EDEDED;
}

li {
	list-style-type: none;
}

#search-btn {
	margin-top: 20px;
}

.col-md-offset-3 {
	margin-left: 3%;
	margin-top: 8%;
}

.col-md-6 {
	margin-top: 6%;
	margin-left: 3%;
	width: 700px;
}

.col-md-3 {
	width: 50%;
}

.col-md-3, .col-md-6 {
	float: left;
}

.col-md-3 {
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 20px;
}

.form-control {
	display: block;
	float: left;
	width: 55%;
	height: 30px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.search_type{
	padding: 6px 12px;
	font-size: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	float: left;
	height: 40px;
	margin-left: 5px;
}


#search-btn {
	margin-top: 20px;
	clear: both;
	float:left;
}

.btn-success {
	color: #fff;
	background-color: #5cb85c;
	border-color: #4cae4c;
}

.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-top-color: transparent;
	border-right-color: transparent;
	border-bottom-color: transparent;
	border-left-color: transparent;
	border-radius: 4px;
}

button, input, select, textarea {
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}
</style>
<div class="exp-container">
	<div class="row">
		<div class="col-md-3 col-md-offset-3">
			<form class="form-horizontal">
				<input id="place-input" type="text" class="form-control"
					placeholder="请输入地址">
				<select id="search_type" name="searchType" class="search_type">
					<option value="0">查询类型</option>
					<option value="1">配送点</option>
					<option value="2">代理点</option>
				</select>
				<button type="button" id="search-btn" class="btn btn-success">
					查询</button>
			</form>
		</div>
		<div class="col-md-6">
			<div id="main" style="height: 500px;"></div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$("#place-input").click(function(e) {
		SelCity(this, e);
	});

	var token = 'fHrNQj6DHTjZtfTvfqbsuvTzKc5V9SBl';
	var url = 'http://api.map.baidu.com/geocoder/v2/?output=json&ak=' + token
			+ '&address=';

	// 百度地图API功能
	var map = new BMap.Map("main"); // 创建Map实例
	map.centerAndZoom("长沙", 15); // 初始化地图,用城市名设置地图中心点
	map.enableScrollWheelZoom(true);
	var eSearchBtn = $('#search-btn');
	var ePlaceInput = $('#place-input');
	eSearchBtn.click(function() {
		var place = ePlaceInput.val();
		var searchType = $('#search_type').val();
		var reg = new RegExp("-","g");
		var leg = place.split("-").length-1;
		place = place.replace(reg,'');
		if(leg < 1){
			alert("请选择详细的地址");
			return ;
		}
		if( searchType ==0 ){
			alert("请选择详细的类型");
			return ;
		}		
		$.ajax({
			url:"Admin/point/findByAddr.action",
			secureuri:false,
			type:"POST",
			data: {"address":place,"searchType":searchType},
			success:function(data){
				var allOverlay = map.getOverlays();
				for (var i = 0; i < allOverlay.length -1; i++){
						map.removeOverlay(allOverlay[i]);
					}
			
				if(data.code > 0){
					if(data.shippoints != null && data.shippoints.length > 0){
						$.each(data.shippoints,function(index,value){
							$.getJSON(url + value.spaddress + '&callback=?', function(res) {
								var loc;
								if (res.status === 0) {
									loc = res.result.location;
									var point = new BMap.Point(loc.lng, loc.lat);
									map.centerAndZoom(point, 15);
									var marker = new BMap.Marker(point);
									map.addOverlay(marker);
									//marker.setLabel(label);
									
									var label = new BMap.Label(value.spaddress,{offset:new BMap.Size(20,-10)});
									marker.setLabel(label);
									
									marker.addEventListener("click", getAttr);
									function getAttr() {
										var p = marker.getPosition(); //获取marker的位置
										alert("marker的位置是" + p.lng + "," + p.lat);
									}
								} else {
									alert('当前地址暂时没有服务网点');
								}
							});
							
						});
					}
					
					if(data.proxys != null && data.proxys.length >0){
						$.each(data.proxys,function(index,value){
							$.getJSON(url + value.res2 + '&callback=?', function(res) {
								var loc;
								if (res.status === 0) {
									loc = res.result.location;
									var point = new BMap.Point(loc.lng, loc.lat);
									map.centerAndZoom(point, 15);
									var marker = new BMap.Marker(point);
									map.addOverlay(marker);
									//marker.setLabel(label);
									marker.addEventListener("click", getAttr);
									function getAttr() {
										var p = marker.getPosition(); //获取marker的位置
										alert("marker的位置是" + p.lng + "," + p.lat);
									}
								} else {
									alert('当前地址暂时没有服务网点');
								}
							});
							
						});
					}
				}else {
					alert(data.msg);
				}
			}
		});

	});
</script>
