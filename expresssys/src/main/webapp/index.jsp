<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YC物流</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script src="js/common.js"></script>
<script src="js/Popt.js"></script>
<script src="js/cityJson.js"></script>
<script src="js/citySet.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=fHrNQj6DHTjZtfTvfqbsuvTzKc5V9SBl"></script>
</head>
<body>
		<div class="container">
			 <div class="row">
			 	<div class="list">
			 		<div class="list-content">
			 			<h3>服务支持</h3>
			 			<ul>
			 				<li class="list-item">
			 					<span onclick="javascript:showPages('addOrders')">我要寄件</span>
			 				</li>
			 				<li class="list-item current">
			 					<span onclick="javascript:showPages('ordersSearch')">物流查询</span>
			 				</li>
			 				<li class="list-item">
			 					<span onclick="javascript:showPages('priceSearch')">运费时效查询</span>
			 				</li>
			 				<li class="list-item">
			 					<span onclick="javascript:showPages('mapSearch')">服务网点查询</span>
			 				</li>
			 			</ul>
			 		</div>
			 	</div>
			 	
			 	<div class="content" id="content">
			 		
			 	</div>
			 </div>
			 	
		</div>
		
		

<script type="text/javascript">
	function showPages(type){
		
		$.ajax({   
            url: 'users/' + type + '.jsp',
            data:'{}',
            type: 'post',
            dataType: 'text',
            contentType: 'application/json; charset=utf-8',
            success: function (data){                           
           		$("#content").html(data);
            }
        });
		                           
	}
</script>


</body>
</html>