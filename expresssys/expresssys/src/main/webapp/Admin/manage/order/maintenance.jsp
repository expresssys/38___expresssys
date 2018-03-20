<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.order-list {
	width: 200px;
	height: auto;
	border: 1px solid #ccc;
	float: left;
	margin-top: 20px;
	margin-left: 30px;
	padding: 10px 20px;
}

#order-c a{
	color: gray;
	text-decoration: underline;
}

.order-content {
	float: left;
	width: 750px;
	height: 500px;
	margin-left: 100px;
	margin-top: 20px;
}

ul, li {
	list-style: none;
	padding-left: 0px;
}

.order-content ul li {
	margin-bottom: 30px;
}

.order-content ul li h3 {
	width: 50px;
	margin: 0 auto;
	margin-bottom: 0px;
	margin-bottom: 20px;
}

.order-content ul li input, select {
	margin-right: 20px;
}

.order-content .to_Imf {
	width: 600px;
	margin: 0 auto;
	width: 462px;
}

.order-content .to_Imf label {
	margin-bottom: 10px;
	display: inline-block;
}

.order-content .to_Imf input {
	margin-bottom: 10px;
}

.order-content .other_imf{
	margin-top: 10px;
}

.order-content .other_imf .label {
	margin-bottom: 10px;
	display: inline-block;
}

.order-content .other_imf input, select {
	margin-bottom: 10px;
}

.order-content .W-Imf {
	margin: 0 auto;
	width: 300px;
}


#ord_goods_update label{
	display:inline-block;
	width:66px;	
	text-align:justify;
	margin-top: 15px;
	margin-right: 10px;
	margin-left:10px;
}
#ord_goods_update label span{
  display:inline-block;
  width:100%;
}

#ord_goods_update li{
	list-style-type:none;
}

#ord_goods_update .goods_input{
	width:160px;
	border:1px solid #95B8E7;
	line-height:20px;
}



#ord_route_showAddroute label{
	display:inroute-block;
	width:66px;	
	text-align:justify;
	margin-top: 20px;
	margin-right: 10px;
	margin-left:10px;
}

#ord_route_showAddroute label span{
  display:inroute-block;
  width:100%;
}

#ord_route_showAddroute input[type=button]{
  margin-left:15px;
}

#ord_route_showAddroute li{
	list-style-type:none;
	margin-bottom: 20px;
}
#ord_route_showAddroute .add_li{
	margin-left: 53px;
}

#ord_route_showAddroute .route_input{
	width:160px;
	border:1px solid #95B8E7;
	route-height:20px;
}
.btn-imf{
	width: 120px;
	margin: 0 auto;
	
}
.btn {
	display: block;
	width: 100px;
	line-height: 40px;
	color: #fff;
	background: #33a2f7;
	border: 0;
	font-family: microsoft yahei;
	border-radius: 4px;
	cursor: pointer;
}

</style>

<div class="order-list">
	<span>新增订单</span>
	<ul id="order-c">
	</ul>
</div>

<div class="order-content">
	<form id="orders_imf_orders" >
		<input type="hidden" name="osid" id="orders_imf_osid" value="">
		<input type="hidden" name="flag" id="orders_imf_flag" value="flag">
		<input type="hidden" name="res1" id="orders_imf_gid" value="">
		<input type="hidden" name="res2" id="orders_imf_rid" value="">
		<ul>
			<li>
				<h3>寄件方</h3>
				<label>寄件人姓名：</label>
				<input type="text" name="osendname" id="orders_imf_osendname" class="orders_input"/>
				<label>寄件人电话：</label>
				<input type="text" name="osendtel" id="orders_imf_osendtel" class="orders_input"/>
				<label>寄件人地址：</label>
				<input type="text" name="osendaddress" id="orders_imf_osendaddress" class="orders_input2"/>
			</li>
			<li class="to_Imf">
				<h3>收件方</h3>
				<label>收件人姓名：</label>
				<input type="text" name="orecname" id="orders_imf_orecname" class="orders_input"/>
				<label>收件人电话：</label>
				<input type="text" name="orectel" id="orders_imf_orectel" class="orders_input"/><br/>
				<label>收件人邮编：</label>
				<input type="text" name="oreccode" id="orders_imf_oreccode" class="orders_input"/>
				<label>收件人地址：</label>
				<input type="text" name="orecaddress" id="orders_imf_orecaddress" class="orders_input2"/>
			</li>
			<li class="other_imf">
				<h3>其他</h3>
				<label class=".label">配送费：</label>
				<input type="text" name="oprice" id="orders_imf_oprice" class="orders_input" />
				<label class=".label">保价金额：</label>
				<input type="text" name="oinsureprice" id="orders_imf_oinsureprice" class="orders_input"/>
				<label class=".label">订单类型：</label>
				<select  name="otype" id="orders_imf_otype" >
					<c:forEach items="${ALLCONST.orderType}" varStatus="i" var="item" >  
						<option value="${item.cstatus}">${item.cname}</option>
					</c:forEach>
				</select>
				<label class=".label">所属单位：</label>
				<select name="spid" id="orders_imf_spid" >
				</select>
				<br/>
				<label>订单日期：</label>
				<input type="text" name="otime" id="orders_imf_otime"  class="easyui-datetimebox" />
				
				<label>要求启程时间：</label>
				<input type="text" name="ostarttime" id="orders_imf_ostarttime"  class="easyui-datetimebox" />
			
				<label>要求到达时间：</label>
				<input type="text" name="oendtime" id="orders_imf_oendtime"  class="easyui-datetimebox" />
			</li>
			
			<li class="W-Imf">
				<span>商品信息</span><span id="goods_imf"></span>
				<input id="addGoods" type="button" value="添加" onclick="javascript:order_goods_showAddgoods()" />
				<span>路线</span><span id="route_imf"></span>
				<input id="addRoute" type="button" value="添加" onclick="javascript:order_route_showAddroute()" />
			</li>
			
			<li style="margin-top: 20px;">
				<label>备注：</label>
				<textarea  rows="2" cols="100"  id="orders_imf_oremark" name="oremark">
				</textarea>
			</li>
			
			<li class="btn-Imf">
				<input class="btn" id="addOrders" type="button" value="确认订单" onclick="javascript:orders_showUpdateorders()" />
			</li>
		</ul>
		
	</form>
</div>


<!-- 货物修改信息   -->
<div id="ord_goods_update" class="easyui-dialog" title="修改货物信息" style="width:400px;height:500px;align:center"
		data-options="iconCls:'icon-user-add',resizable:true,modal:true,closed:true" >
	<form id="form_ord_goods_update">
		<input type="hidden"  name="gid" id="ord_goods_update_gid"  />
		<ul>
			<li>
				<label>货物名称<span></span></label>
				<input type="text" name="gname" id="ord_goods_update_gname" class="goods_input"/>
			</li>
			<li>
				<label>货物数量<span></span></label>
				<input type="text" name="gcount" id="ord_goods_update_gcount" class="goods_input"/>
			</li>
			<li>
				<label>单位<span></span></label>
				<select id="ord_goods_update_gunit" name="gunit" class="goods_input">
					<option value="-1">--请选择--</optionv>
					<c:forEach items="${ALLCONST.comUnit}" varStatus="i" var="item" > 
 						<option value="${item.cname}">${item.cname}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label>货物价值<span></span></label>
				<input type="text" name="gprice" id="ord_goods_update_gprice" class="goods_input"/>
			</li>
			<li>
				<label>货物重量<span></span></label>
				<input type="text" name="gweight" id="ord_goods_update_gweight" class="goods_input" placeholder="单位：${ALLCONST.goodsWUnit[0].cname}" />
			</li>
			<li>
				<label>货物体积<span></span></label>
				<input type="text" name="gvolume" id="ord_goods_update_gvolume" class="goods_input" placeholder="单位： ${ALLCONST.goodsVUnit[0].cname}" />
			</li>
			<li>
				<label>货物类别<span></span></label>
				<input type="text" name="gtype" id="ord_goods_update_gtype" class="goods_input"/>
			</li>
			<li>
				<label>货物状态：</label>
				<select id="ord_goods_update_res1" name="res1" class="goods_input">
					<option value="-1">--请选择--</optionv>
					<c:forEach items="${ALLCONST.goodsStatus}" varStatus="i" var="item" > 
 						<option value="${item.cstatus}">${item.cname}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label>备注<span></span></label>
				<textarea rows="5" cols="23" name="gremark" id="ord_goods_update_gremark" class="goods_input"></textarea>
			</li>
		</ul>
	</form>
</div>

<!-- 路线添加  -->
<div id="ord_route_showAddroute" class="easyui-dialog" title="添加路线信息" style="width:500px;height:500px;align:center"
		data-options="iconCls:'icon-user-add',resizable:true,modal:true,closed:true" >
	<form id="form_ord_route_showAddroute">
		<input type="hidden"  name="rid" id="ord_route_showAddroute_rid"  />
		<input type="hidden"  name="num" id="ord_route_showAddroute_num"  />
		<ul>
			<li>
				<label>路线名称<span></span></label>
				<input type="text" name="rname" id="ord_route_showAddroute_rname" class="route_input"/>
			</li>
			<li id="start">
				<label>路线起点<span></span></label>
				<select name="rviastart" id="ord_route_showAddroute_rviastart" class="route_input"></select><input id="addStart" type="button" value="添加" onclick="javascript:addElement()" />
			</li>
			<li id="end">
				<label>路线终点<span></span></label>
				<select  name="rviaend" id="ord_route_showAddroute_rviaend" class="route_input" ></select>
			</li>
		</ul>
	</form>
</div>


<script type="text/javascript">
var elementNum = 0;


	function changstr(str) {
		var s = str.split(" ");
		var ss = s[3];
		var sss = ss.split(":");
		return sss;
	}
	
	
	Date.prototype.format = function (format,str) {
		var strsss = changstr(str);
		console.info(str);
		console.info(strsss);
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
	
	

	$(function() {
		freshOrders();
		freshShippoint();
	});

	//更新订单
	function freshOrders() {
		var str = "";
		$.ajax({
					url : "orders/findAllBy.action",
					secureuri : false,
					type : "POST",
					dataType : "JSON",
					data : {ostatus : 100},
					success : function(data, status) {
						if (data.total > 0) {
							$.each(data.rows,function(index, item) {
								str += "<li id='"+item.osid+"'><a href='javascript:showOrders("+item.osid+")'>"+item.osid+"   "+item.osendname+"</a></li>"
							});
							$("#order-c").html("");
							$("#order-c").append(str);
						}
					},
					error : function(data, status) {

					}
				});
	}

	//更新配送点
	function freshShippoint() {
		var shippointStr = "";
		var shippointTypeStr = "";
		$.get("point/findAll.action", {
			rows : 100,
			page : 1
		}, function(data) {
			var str = "";

			shippointList = data.rows;

			$.each(shippointList, function(index, item) {
				shippointStr += "<option value='"+item.spid+"'>" + item.spname
						+ "</option>";
			});
			$("#orders_imf_spid").append($(shippointStr));
			$("#orders_imf_spid").append($(shippointStr));
			$("#orders_imf_spid").append($(shippointStr));
		});
	}

	//显示用户下单的订单详情
	function showOrders(osid) {
		$("#goods_imf").html("");
		$("#route_imf").html("");
		
		$.post("orders/find.action",{osid:osid},function(date){
			var data=date.rows;
			$.each(data,function(index,item){
				$("#orders_imf_gid").val(item.goods.gid);
				$("#orders_imf_osendname").val(item.orders.osendname);
				$("#orders_imf_rid").val(item.route.rid);
				
				$("#orders_imf_osendtel").val(item.orders.osendtel);
				$("#orders_imf_osendaddress").val(item.orders.osendaddress);
				$("#orders_imf_orecname").val(item.orders.orecname);
				$("#orders_imf_orectel").val(item.orders.orectel);
				$("#orders_imf_orecaddress").val(item.orders.orecaddress);
				$("#orders_imf_oreccode").val(item.orders.oreccode);
				
				$("#orders_imf_oprice").val(item.orders.oprice);
				$("#orders_imf_oinsureprice").val(item.orders.oinsureprice);
				
				$("#orders_imf_otime").datebox('setValue',(new Date(item.orders.otime).format("yyyy-MM-dd hh:mm:ss",item.orders.otime)));
				
				$("#orders_imf_usid").val(item.orders.usid);
				$("#orders_imf_oremark").val(item.orders.oremark);
				
				$("#orders_imf_osid").val(osid);
				
			});
		});	
	}
		
		//货物信息修改  添加
		function order_goods_showAddgoods(){
			var gid = $("#orders_imf_gid").val();
			
			$.post("goods/find.action",{gid:gid,page:1,rows:1},function(goodsdata){
				if(goodsdata != null){
					$("#ord_goods_update_gtype").val(goodsdata.rows[0].gtype);
					$("#ord_goods_update_gname").val(goodsdata.rows[0].gname);
					$("#ord_goods_update_gcount").val(goodsdata.rows[0].gcount);
					$("#ord_goods_update_gunit").val(goodsdata.rows[0].gunit);
					$("#ord_goods_update_gprice").val(goodsdata.rows[0].gprice);
					$("#ord_goods_update_gweight").val(goodsdata.rows[0].gweight);
					$("#ord_goods_update_gvolume").val(goodsdata.rows[0].gvolume);
					$("#ord_goods_update_gtype").val(goodsdata.rows[0].gtype);
					$("#ord_goods_update_gremark").val(goodsdata.rows[0].gremark);
					$("#ord_goods_update_res1").val(goodsdata.rows[0].res1);
				}
			},"json");
			
				$('#ord_goods_update').dialog({
					title:"添加货物信息",
					iconCls:'icon-user-add',
					buttons:[{
						text:'确定',
						iconCls:'icon-user-add',
						handler:function(){
							var gname=$.trim( $("#ord_goods_update_gname").val() );
							var gtype=$.trim( $("#ord_goods_update_gtype").val() );
							if(gname=="" || gtype==""){
								alert("请填入完整的信息");
								return ;
							}
							
							$("#ord_goods_update_gid").val(gid);
							
							$.ajax({
								url:"goods/update.action",
								secureuri:false,
								type:"POST",
								data: $('#form_ord_goods_update').serialize(),  
								success:function(data,status){
									if(data.code>0){
										alert("添加成功");
										$("#goods_imf").html(":"+gid+"_"+gname);
										$('#ord_goods_update').dialog("close");
									}else{
										alert("添加失败");
									}
								},
								error:function(data,status,e){
									alert("添加失败");
								}
							});
						}
					}]
				});
				$('#ord_goods_update').dialog("open");
			}
		
		//路线添加js处理
		//添加节点 --路线
	function addElement(rvias){
    	
    	if(elementNum==0){
    		$("#addStart").remove();
    	}else{
    		$("#add"+elementNum).remove();
    		$("#del"+elementNum).remove();
    	}
    	elementNum++;
    	var str="<li id='route"+elementNum+"' class='add_li'><label><span></span></label><select type='text' name='rvia"+elementNum+"' id='ord_route_showAddroute_rvia"+elementNum+"' class='route_input'></select>"
    			+"<input id='add"+elementNum+"' type='button' value='添加' onclick='javascript:addElement()' />"
    		    +	"<input id='del"+elementNum+"' type='button' value='删除' onclick='javascript:delElement()' /></li>";
    	 $("#end").before(str);  	 
    	 freshDataRoute("ord_route_showAddroute_rvia"+elementNum);
    }
    
    //删除节点 --路线
    function delElement(){
    		$("#route"+elementNum).remove();
    		elementNum--;
    		if(elementNum==0){
    			var str="<input id='addStart' type='button' value='添加' onclick='javascript:addElement()' />"
    			$("#start").append(str);
    		}else{
	    		var str="<input id='add"+elementNum+"' type='button' value='添加' onclick='javascript:addElement()' />"
	    		    	+	"<input id='del"+elementNum+"' type='button' value='删除' onclick='javascript:delElement()' />";
	    		$("#route"+elementNum).append(str);
    		}
    }
    
    //配送点更新
    function freshDataRoute(id){
    	$.post("point/selectAll.action",function(data){
    		if(data!=null){
    			var str ="";
    			$.each(data,function(index,value){
    				str += "<option value='"+value.spname+"'>"+value.spname+"</option>"
    			});
    			
    			if(id==''){
    				$("#ord_route_showAddroute_rviastart").html($(str));
    				$("#ord_route_showAddroute_rviaend").html($(str));
    			}else{
    				$("#"+id).html($(str));
    			}
    		}
    	});
    }  

    
    //添加路线
    function order_route_showAddroute(start,end){
    	$("#form_ord_route_showAddroute")[0].reset();
    	$("#ord_route_showAddroute_rid").val("");
    	freshDataRoute('');
    	if(elementNum > 0){
    		for(var i=1;i<=elementNum;i++){
    			$("#route"+i).remove();
    		}
    		var str="<input id='addStart' type='button' value='添加' onclick='javascript:addElement()' />"
    			$("#start").append(str);
    	}
    	elementNum=0;
    	
    	
    	if(start!=''){
    		$("#ord_route_showAddroute_rviastart").val(start);
    	}
    	if(end!=''){
    		$("#ord_route_showAddroute_rviaend").val(end);
    	}
    	
    	$('#ord_route_showAddroute').dialog({
    		title:"添加路线信息",
    		iconCls:'icon-user-add',
    		buttons:[{
    			text:'确定',
    			iconCls:'icon-user-add',
    			handler:function(){
    				var rname=$.trim( $("#ord_route_showAddroute_rname").val() );
    				$("#ord_route_showAddroute_num").val(elementNum);
    				
    				if(rname=="" ){
    					alert("请填入完整信息");
    					return ;
    				}
    				
    				$.ajax({
    					url:"route/add.action",
    					secureuri:false,
    					type:"POST",
    					data: $('#form_ord_route_showAddroute').serialize(),  
    					success:function(data,status){
    						if(data.code>0){
    							$("#ord_route_showAddroute_rid").val(data.obj.rid);
    							$("#orders_imf_rid").val(data.obj.rid);
    							alert("添加成功");
								$("#route_imf").html(":"+data.obj.rid+"_"+data.obj.rname);
    							$('#ord_route_showAddroute').dialog("close");
    						}else{
    							alert("添加失败");
    						}
    					},
    					error:function(data,status,e){
    						alert("添加失败");
    					}
    				});
    			}
    		}]
    	});
    	$('#ord_route_showAddroute').dialog("open");
    }

		
    
    
	function orders_showUpdateorders() {
		$.ajax({
			url : "orders/update.action",
			secureuri : false,
			type : "POST",
			dataType : "text",
			data : $("#orders_imf_orders").serialize(),
			success : function(data, status) {
				data = parseInt($.trim(data));
				if (data > 0) {
					alert("修改成功");
					var osid = $("#orders_imf_osid").val();
					$('#order-c>#'+osid).remove();
					$("#orders_imf_orders")[0].reset();
				} else {
					alert("修改失败");
				}
			},
			error : function(data, status) {
				alert("修改失败");
			}
		});

	}
</script>