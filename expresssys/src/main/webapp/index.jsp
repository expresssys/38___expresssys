<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>你好</title>
<script src="js/echarts.js"></script>
</head>
<body>

<script type="text/javascript">
var geoCoordMap = {
	    '上海': [121.4648,31.2891],
	    '东莞': [113.8953,22.901],
	    '东营': [118.7073,37.5513],
	    '中山': [113.4229,22.478],
	    '临汾': [111.4783,36.1615],
	    '临沂': [118.3118,35.2936]
}


console.info(geoCoordMap);
var str='长沙';
console.info(geoCoordMap[str]);

</script>

</body>

</html>