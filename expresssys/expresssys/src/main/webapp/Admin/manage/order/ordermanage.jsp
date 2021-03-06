<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<meta charset="UTF-8" >

<table id="orders_manager" data-options="fit:true"></table>
<div id="orders_search">
	<a id="btn" href="javascript:orders_showAddorders()" class="easyui-linkbutton" data-options="iconCls:'icon-script-add',plain:true" style="float:left">添加</a>  
	<div class="datagrid-btn-separator"></div>
	<a id="btn" href="javascript:orders_showUpdateorders()" class="easyui-linkbutton" data-options="iconCls:'icon-server-edit',plain:true" style="float:left">修改</a>  
	<div class="datagrid-btn-separator"></div>
	
	<label>订单编号：</label>
	<input type="text" name="osid" id="orders_search_osid"/>
	
	<label>所属单位：</label>
	<select name="spid" id="orders_search_spid">
		<option value="">--全部--</option>
	</select>
	
	<label>快递类型：</label>
	<select  name="otype" id="orders_search_otype" >
		<option value="">--全部--</option>
		<c:forEach items="${ALLCONST.orderType}" varStatus="i" var="item" >  
			<option value="${item.cstatus}">${item.cname}</option>
		</c:forEach>
	</select>
	<a href="javascript:orders_searchorders()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
</div>

<div id="orders_goods_update" class="easyui-dialog" title="添加货物信息" style="width:400px;height:500px;align:center"
		data-options="iconCls:'icon-user-add',resizable:true,modal:true,closed:true" >
	<form id="form_orders_goods_update">
		<input type="hidden"  name="gid" id="orders_goods_update_gid"  />
		<ul>
			<li>
				<label>货物名称<span></span></label>
				<input type="text" name="gname" id="orders_goods_update_gname" class="goods_input"/>
			</li>
			<li>
				<label>货物数量<span></span></label>
				<input type="text" name="gcount" id="orders_goods_update_gcount" class="goods_input"/>
			</li>
			<li>
				<label>单位<span></span></label>
				<select id="orders_goods_update_gunit" name="gunit" class="goods_input">
					<option value="-1">--请选择--</optionv>
					<c:forEach items="${ALLCONST.comUnit}" varStatus="i" var="item" > 
 						<option value="${item.cname}">${item.cname}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label>货物价值<span></span></label>
				<input type="text" name="gprice" id="orders_goods_update_gprice" class="goods_input"/>
			</li>
			<li>
				<label>货物重量<span></span></label>
				<input type="text" name="gweight" id="orders_goods_update_gweight" class="goods_input" placeholder="单位：${ALLCONST.goodsWUnit[0].cname}" />
			</li>
			<li>
				<label>货物体积<span></span></label>
				<input type="text" name="gvolume" id="orders_goods_update_gvolume" class="goods_input" placeholder="单位： ${ALLCONST.goodsVUnit[0].cname}" />
			</li>
			<li>
				<label>货物类别<span></span></label>
				<input type="text" name="gtype" id="orders_goods_update_gtype" class="goods_input"/>
			</li>
			<li>
				<label>货物状态：</label>
				<select id="orders_goods_update_res1" name="res1" class="goods_input">
					<option value="-1">--请选择--</optionv>
					<c:forEach items="${ALLCONST.goodsStatus}" varStatus="i" var="item" > 
 						<option value="${item.cstatus}">${item.cname}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label>备注<span></span></label>
				<textarea rows="5" cols="23" name="gremark" id="orders_goods_update_gremark" class="goods_input"></textarea>
			</li>
		</ul>
	</form>
</div>

<div id="order_route_update" class="easyui-dialog" title="添加路线信息" style="width:500px;height:500px;align:center"
		data-options="iconCls:'icon-user-add',resizable:true,modal:true,closed:true" >
	<form id="form_order_route_update">
		<input type="hidden"  name="rid" id="order_route_update_rid"  />
		<input type="hidden"  name="num" id="order_route_update_num"  />
		<ul>
			<li>
				<label>路线名称<span></span></label>
				<input type="text" name="rname" id="order_route_update_rname" class="route_input"/>
			</li>
			<li id="start">
				<label>路线起点<span></span></label>
				<select name="rviastart" id="order_route_update_rviastart" class="route_input"></select><input id="addStart" type="button" value="添加" onclick="javascript:addElement()" />
			</li>
			<li id="end">
				<label>路线终点<span></span></label>
				<select  name="rviaend" id="order_route_update_rviaend" class="route_input" ></select>
			</li>
		</ul>
	</form>
</div>
<div id="orders_update" class="easyui-dialog" title="添加订单信息" style="width:600px;height:650px;align:center"
		data-options="iconCls:'icon-user-add',resizable:true,modal:true,closed:true" >
	<form id="orders_update_orders">
		<input type="hidden" name="osid" id="orders_update_osid" value="">
		
		<ul>
		    <li>
		        <label>商品编号名称：</label>
				<select name="res1" id="orders_update_gid" >
				</select>
				<input id="addGoods" type="button" value="添加" onclick="javascript:order_goods_showAddgoods()" />
				
				<label>所属路线：</label>
				<select name="res2"  id="orders_update_rid" autocomplete="off">
				</select>
				<input id="addRoute" type="button" value="添加" onclick="javascript:order_route_showAddroute()" />
			</li>
			<li>
				<label>寄件人姓名：</label>
				<input type="text" name="osendname" id="orders_update_osendname" class="orders_input"/>
			
				<label>寄件人电话：</label>
				<input type="text" name="osendtel" id="orders_update_osendtel" class="orders_input"/>
			</li>
			<li>
				<label>寄件人地址：</label>
				<input type="text" name="osendaddress" id="orders_update_osendaddress" class="orders_input2"/>
			</li>
			<li>
				<label>收件人姓名：</label>
				<input type="text" name="orecname" id="orders_update_orecname" class="orders_input"/>
			
				<label>收件人电话：</label>
				<input type="text" name="orectel" id="orders_update_orectel" class="orders_input"/>
				
			</li>
			<li>
			<label>收件人邮编：</label>
				<input type="text" name="oreccode" id="orders_update_oreccode" class="orders_input"/>
			
				<label>收件人地址：</label>
				<input type="text" name="orecaddress" id="orders_update_orecaddress" class="orders_input2"/>
			</li>
			
			<li>
				<label>订单日期：</label>
				<input type="text" name="otime" id="orders_update_otime"  class="easyui-datetimebox" />
			</li>
			<li>
				<label>配送费：</label>
				<input type="text" name="oprice" id="orders_update_oprice" class="orders_input" />
			
				<label>保价金额：</label>
				<input type="text" name="oinsureprice" id="orders_update_oinsureprice" class="orders_input"/>
			</li>
			<li>
				<label>订单类型：</label>
				<select  name="otype" id="orders_update_otype" >
					<c:forEach items="${ALLCONST.orderType}" varStatus="i" var="item" >  
						<option value="${item.cstatus}">${item.cname}</option>
					</c:forEach>
				</select>
				<label>所属单位：</label>
				<select name="spid" id="orders_update_spid" >
				</select>
			</li>
			<li>
				<label>要求启程时间：</label>
				<input type="text" name="ostarttime" id="orders_update_ostarttime"  class="easyui-datetimebox" />
			
				<label>要求到达时间：</label>
				<input type="text" name="oendtime" id="orders_update_oendtime"  class="easyui-datetimebox" />
			</li>
			
			<li>
				<label>备注：</label>
				<textarea  rows="5" cols="20"  id="orders_update_oremark" name="oremark">
				</textarea>
			</li>
			
			
		</ul>
		
	</form>
	
	<div id="orders_orderinfo">
	
	</div>
</div>
<style>
#orders_search label{
	margin-left:20px;
	width:30px;
}

#orders_update li{
	list-style-type:none;
	margin-top:20px;
}

#orders_update .orders_input{
	width:100px;
	border:1px solid #95B8E7;
	line-height:20px;
}
#orders_update .orders_input2{
	width:200px;
	border:1px solid #95B8E7;
	line-height:20px;
}

.orders_delpic_show{
	width:100px;
	height:100px;
	overflow:hidden;
	position:relative;
	float:left;
	border:1px solid #fff;
}

.orders_delpic_show>span{
	margin:0px;
	padding:0px;
	background:url(../../images/cancel.png) no-repeat; center center;
	width:16px;
	height:16px;
	display:none;
	position:absolute;
	top:2px;
	right:2px;
}

.orders_delpic_show:hover{
	border-color:#f63;
}

.orders_delpic_show:hover span{
	display:block;
	cursor:orderser;
}

.orders_delsaddr_show{
	width:300px;
	height:30px;
	overflow:hidden;
	position:relative;
	float:left;
	border:1px solid #fff;
}
.orders_delsaddr_show>span{
	margin:0px;
	padding:0px;
	background:url(../../images/cancel.png) no-repeat; center center;
	width:16px;
	height:16px;
	display:none;
	position:absolute;
	top:2px;
	right:2px;
}
.orders_delsaddr_show:hover{
	border-color:#f63;
}

.orders_delsaddr_show:hover span{
	display:block;
	cursor:orderser;
}
#order_route_update label{
	display:inroute-block;
	width:66px;	
	text-align:justify;
	margin-top: 20px;
	margin-right: 10px;
	margin-left:10px;
}

#order_route_update label span{
  display:inroute-block;
  width:100%;
}

#order_route_update input[type=button]{
  margin-left:15px;
}

#order_route_update li{
	list-style-type:none;
	margin-bottom: 20px;
}
#order_route_update .add_li{
	margin-left: 53px;
}

#order_route_update .route_input{
	width:160px;
	border:1px solid #95B8E7;
	route-height:20px;
}
</style>
<script type="text/javascript">
function changstr(str){
	var s = str.split(" ");
	var ss = s[3];
	var sss = ss.split(":");
	
	if(s[4]== 'PM'){
		sss[0] = parseInt(sss[0])+12 + "";
	}
	return sss;
}


var ordersEditRow=undefined;
var ordersObject;
var ordersFlag;
var ordersmark="";
var shippointList;
var elementNum = 0;



function freshData(){
	$("#orders_update_gid").html("");
	$("#orders_update_rid").html("");
	$("#orders_search_spid").html("");
	$("#orders_update_spid").html("");
	var gidandname="<option value='0'>--商品编号名称--</option>";
	$.get("goods/find.action",{res1:1,rows:100,page:1},function(datas){
		$.each(datas.rows,function(index,item){
			gidandname+="<option value='"+item.gid+"'>"+item.gid+"_"+item.gname+"</option>";
		})
		$("#orders_update_gid").append($(gidandname));

	},"json");
	
	var rname="<option value='0'>--路线名称--</option>";
	$.get("route/find.action",{res1:1,rows:100,page:1},function(dataes){
		$.each(dataes.rows,function(index,item){
			rname+="<option value='"+item.rid+"'>"+item.rname+"</option>"

		})
		$("#orders_update_rid").append($(rname));

	},"json");
	
	var shippointStr="";
	var shippointTypeStr="";
	$.get("point/findAll.action",{rows:20,page:1},function(data){
		var str="";
	
		shippointList=data.rows;
		
		$.each(shippointList,function(index,item){
			shippointStr+="<option value='"+item.spid+"'>"+item.spname+"</option>";
		});
		$("#orders_search_spid").append($(shippointStr));
		$("#orders_update_spid").append($(shippointStr));
	});
}

$(function(){
	freshData();
		ordersObject = $('#orders_manager').datagrid({
			url : "orders/findAll.action",
			fitColumns : true,
			striped : true,
			loadMsg : '数据加载中...',
			rownumbers : true,
			pagination : true,
			pageNumber : 1,
			pageSize : 10,
			pageList : [  10, 20, 30, 40, 50 ],
			sortName:'osid',
			remoteSort:false,
			columns:[[   
			        {checkbox:true},      
			        {field:'osid',title:'订单id',width:100,align:'center',sortable:true},   
			        {field:'osendname',title:'寄件人姓名',width:100,align:'center'},   
			        {field:'osendtel',title:'联系人',width:100,align:'center'},
			        {field:'osendaddress',title:'寄件人地址',width:100,align:'center',sortable:true},   
			        {field:'orectel',title:'收件人电话ַ',width:100,align:'center'},
			        {field:'orecaddress',title:'收件人地址',width:100,align:'center'}, 
			        {field:'ostatus',title:'订单状态',width:100,align:'center',formatter:function(val,row,index){
			        	if(val==0){
			        		return '已签收';
			        	} else if(val==1 || val==100){
			        		return '等待揽件';
			        	}   else if(val==2){
			        		return '已发货';
			        	}else if(val==3){
			        		return '运输中';
			        	}else if(val==4){
			        		return '派送中';
			        	}
			        }}, 
			        
			        {field:'_operate',title:'操作',width:100,align:'center',formatter:function(val,row,index){
			        	return "<a href='javascript:orders_findorders("+row.osid+")'> 详情</a><a href='javascript:orders_delorders("+row.osid+")'> 删除</a>"  //配送点详情查看
			        }}
			    ]],
			    toolbar:"#orders_search"
	
		});
	},"json");
	

	//添加订单信息
	function orders_showAddorders(){
		$("#orders_update_orders")[0].reset();
		$("#orders_orderinfo").html("")
		freshData();
		var gid="";
		$('#orders_update').dialog({
			title:"添加订单信息",
			iconCls:'icon-user-add',
			buttons:[{
				text:'确定',
				iconCls:'icon-user-add',
				handler:function(){
				
					gid=$.trim($("#orders_update_gid").val());
					$.ajax({
						url:"orders/add.action",
						secureuri:false,
						type : "POST",
						dataType:"text",
						data:$("#orders_update_orders").serialize(),
						success:function(data,status){
							if(data>0){
								//订单添加成功时  将所对应商品状态改为已发货
								$.post("goods/update.action",{res1:2,gid:gid},function(data){
								},"json");
								
								ordersObject.datagrid("reload");
								$("#orders_update_orders")[0].reset();
								$.messager.show({title:"成功提示",msg:"订单添加成功...",timeout:2000,showType:"slide"});
								$('#orders_update').dialog("close");
							}else{
								$.messager.alert("失败提示","订单添加失败...","error");
							}
							
						},
						error:function(data,status,e){
							$.messager.alert("失败提示","订单添加失败...\n"+e,"error");
						}
					});
				}
			}]
		});
		$('#orders_update').dialog("open");
	}
	
	//修改订单
	function orders_showUpdateorders(){
		$("#orders_update_orders")[0].reset();
		$("#orders_orderinfo").html("")
		var rows=$('#orders_manager').datagrid("getChecked");
		if(rows.length<=0){
			$.messager.show({title:"温馨提示",msg:"请选择您要修改的订单信息...",timeout:2000,showType:"slide"});
		}else{
			var row=rows[0];
			var osid=row.osid;
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
			
			$.post("orders/find.action",{osid:osid},function(date){
				var data=date.rows;
				$.each(data,function(index,item){
					freshData();
					$("#orders_update_gid").append("<option value='"+item.goods.gid+"'>"+item.goods.gid+"_"+item.goods.gname+"</option>");
					$("#orders_update_gid").val(item.goods.gid);
					$("#orders_update_osendname").val(item.orders.osendname);
					$("#orders_update_rid").val(item.route.rid);
					
					$("#orders_update_osendtel").val(item.orders.osendtel);
					$("#orders_update_osendaddress").val(item.orders.osendaddress);
					$("#orders_update_orecname").val(item.orders.orecname);
					$("#orders_update_orectel").val(item.orders.orectel);
					$("#orders_update_orecaddress").val(item.orders.orecaddress);
					$("#orders_update_oreccode").val(item.orders.oreccode);
					$("#orders_update_otime").datebox('setValue',(new Date(item.orders.otime).format("yyyy-MM-dd hh:mm:ss",item.orders.otime)));
					
					$("#orders_update_oprice").val(item.orders.oprice);
					$("#orders_update_oinsureprice").val(item.orders.oinsureprice);
					$("#orders_update_otype").val(item.orders.otype);
					
					$("#orders_update_ostarttime").datebox('setValue',(new Date(item.orders.ostarttime).format("yyyy-MM-dd hh:mm:ss",item.orders.ostarttime)));
					$("#orders_update_oendtime").datebox('setValue',(new Date(item.orders.oendtime).format("yyyy-MM-dd hh:mm:ss",item.orders.oendtime)));
					$("#orders_update_spid").val(item.orders.spid);
					$("#orders_update_usid").val(item.orders.usid);
					$("#orders_update_oremark").val(item.orders.oremark);
					
					$("#orders_update_osid").val(osid);
					
					
				});
			});	
			
		$('#orders_update').dialog({
			title:"修改订单信息",
			iconCls:'icon-user-edit',
			buttons:[{
				text:'修改',
				iconCls:'icon-user-edit',
				handler:function(){
					
					$.ajax({
						url:"orders/update.action",
						secureuri:false,
						type : "POST",
						dataType:"text",
						data:$("#orders_update_orders").serialize(),
						success:function(data,status){
							data=parseInt($.trim(data));
							if(data>0){
								$.messager.show({title:"成功提示",msg:"订单信息修改成功...",timeout:2000,showType:"slide"});
								$('#orders_update').dialog("close");
								ordersObject.datagrid("reload");
							}else{
								$.messager.alert("失败提示","订单信息修改失败...","error");
							}
						},
						error:function(data,status,e){
							$.messager.alert("失败提示","订单信息添加失败...\n"+e,"error");
						}
					});
				
				}
			}]
		})
		$('#orders_update').dialog("open");
		}
	}


	//删除订单
	function orders_delorders(osid){
		$.post("orders/delete.action",{osid:osid},function(data){
			data=parseInt($.trim(data));
			if(data>0){
				$.messager.show({title:"成功提示",msg:"订单信息删除成功...",timeout:2000,showType:"slide"});
				ordersObject.datagrid("reload");
			}else{
				$.messager.alert("失败提示","订单信息删除失败...","error");
				ordersObject.datagrid("reload");
			}
		})
	}
	
	
	function orders_findorders(osid){
		
		//js中date时间转换yyyy-mm-dd hh:MM:ss等格式字符串
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
			
		
		$.post("orders/find.action",{osid:osid},function(date){
			var data=date.rows;
		$.each(data,function(index,item){
			$("#orders_update_gid").html("<option>"+item.goods.gid+"_"+item.goods.gname+"</option>");
			$("#orders_update_rid").val(item.route.rid);
			$("#orders_update_osendname").val(item.orders.osendname);
			$("#orders_update_osendtel").val(item.orders.osendtel);
			$("#orders_update_osendaddress").val(item.orders.osendaddress);
			$("#orders_update_orecname").val(item.orders.orecname);
			$("#orders_update_orectel").val(item.orders.orectel);
			$("#orders_update_orecaddress").val(item.orders.orecaddress);
			$("#orders_update_oreccode").val(item.orders.oreccode);
			$("#orders_update_otime").datebox('setValue',(new Date(item.orders.otime).format("yyyy-MM-dd hh:mm:ss",item.orders.otime)));
			
			$("#orders_update_oprice").val(item.orders.oprice);
			$("#orders_update_oinsureprice").val(item.orders.oinsureprice);
			$("#orders_update_otype").val(item.orders.otype);
			
			
			$("#orders_update_ostarttime").datebox('setValue',(new Date(item.orders.ostarttime).format("yyyy-MM-dd hh:mm:ss",item.orders.ostarttime)));
			$("#orders_update_oendtime").datebox('setValue',(new Date(item.orders.oendtime).format("yyyy-MM-dd hh:mm:ss",item.orders.oendtime)));
			$("#orders_update_spid").val(item.orders.spid);
			$("#orders_update_usid").val(item.orders.usid);
			$("#orders_update_oremark").val(item.orders.oremark);
			
			
			$("#orders_update_rid").val(item.route.rid);
			
			var orderinfo="&nbsp;&nbsp;&nbsp;&nbsp";
			//orderinfo+="路线:"+item.route.rvia+"<br/>商品数量:"+item.goods.gcount+"";
			orderinfo+="路线：<input type='text' value="+item.route.rvia+">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;货物数量:<input type='count' value="+item.goods.gcount+"><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;商品价值:<input type='text' value="+item.goods.gprice+">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;货物单位:<input type='text' value="+item.goods.gunit+"><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;货物体重:<input type='text' value="+item.goods.gweight+">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;货物体积:<input type='text' value="+item.goods.gvolume+">"			
			$("#orders_orderinfo").html("").append(orderinfo);
			
			$('#orders_update').dialog({
				title:"查看订单信息",
				iconCls:'icon-user-edit',
				buttons:[{
					text:'确定',
					iconCls:'icon-user-edit',
					handler:function(){
						$('#orders_update').dialog("close");
					}
				}]
			});
			$('#orders_update').dialog("open");
		})
		
		
		},"json")
		
	}
	
	//条件查询
	function orders_searchorders(){
		var otype=$.trim( $("#orders_search_otype").val() );
		var spid=$.trim( $("#orders_search_spid").val() );
		var osid=$.trim( $("#orders_search_osid").val() );
		$('#orders_manager').datagrid({
			url:"orders/findByCondition.action",
			queryParams:{otype:otype,spid:spid,osid:osid}
		});
		
		$("#orders_search_otype").val("");
		 $("#orders_search_spid").val("");
	}
function addElement(rvias){
    	
    	if(elementNum==0){
    		$("#addStart").remove();
    	}else{
    		$("#add"+elementNum).remove();
    		$("#del"+elementNum).remove();
    	}
    	elementNum++;
    	var str="<li id='route"+elementNum+"' class='add_li'><label><span></span></label><select type='text' name='rvia"+elementNum+"' id='order_route_update_rvia"+elementNum+"' class='route_input'></select>"
    			+"<input id='add"+elementNum+"' type='button' value='添加' onclick='javascript:addElement()' />"
    		    +	"<input id='del"+elementNum+"' type='button' value='删除' onclick='javascript:delElement()' /></li>";
    	 $("#end").before(str);  	 
    	 freshDataRoute("order_route_update_rvia"+elementNum);
    }
    
    
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
    
    function order_route_showAddroute(start,end){
    	$("#form_order_route_update")[0].reset();
    	$("#order_route_update_rid").val("");
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
    		$("#order_route_update_rviastart").val(start);
    	}
    	if(end!=''){
    		$("#order_route_update_rviaend").val(end);
    	}
    	
    	$('#order_route_update').dialog({
    		title:"添加路线信息",
    		iconCls:'icon-user-add',
    		buttons:[{
    			text:'确定',
    			iconCls:'icon-user-add',
    			handler:function(){
    				var rname=$.trim( $("#order_route_update_rname").val() );
    				$("#order_route_update_num").val(elementNum);
    				
    				if(rname=="" ){
    					alert("请填入完整信息");
    					return ;
    				}
    				
    				$.ajax({
    					url:"route/add.action",
    					secureuri:false,
    					type:"POST",
    					data: $('#form_order_route_update').serialize(),  
    					success:function(data,status){
    						if(data.code>0){
    							freshData();
    							$("#orders_update_rid").val(data.obj.rid);
    							$("#form_order_route_update")[0].reset();
    							$.messager.show({title:"成功提示",msg:"路线信息添加成功...",timeout:2000,showType:"slide"});
    							$('#order_route_update').dialog("close");
    						}else{
    							$.messager.alert("失败提示","路线信息添加失败...","error");
    						}
    					},
    					error:function(data,status,e){
    						$.messager.alert("失败提示","路线员信息添加失败...\n"+e,"error");
    					}
    				});
    			}
    		}]
    	});
    	$('#order_route_update').dialog("open");
    }
    
    
    function freshDataRoute(id){
    	$.post("point/selectAll.action",function(data){
    		if(data!=null){
    			var str ="";
    			$.each(data,function(index,value){
    				str += "<option value='"+value.spname+"'>"+value.spname+"</option>"
    			});
    			
    			if(id==''){
    				$("#order_route_update_rviastart").html($(str));
    				$("#order_route_update_rviaend").html($(str));
    			}else{
    				$("#"+id).html($(str));
    			}
    		}
    	});
    }  

    //添加货物
    function order_goods_showAddgoods(){
    	$("#form_orders_goods_update")[0].reset();
    	$('#orders_goods_update').dialog({
    		title:"添加货物信息",
    		iconCls:'icon-user-add',
    		buttons:[{
    			text:'确定',
    			iconCls:'icon-user-add',
    			handler:function(){
    				var gname=$.trim( $("#orders_goods_update_gname").val() );
    				var gtype=$.trim( $("#orders_goods_update_gtype").val() );
    				var res1=$.trim( $("#orders_goods_update_res1").val() );
    				
    				if(gname=="" || gtype=="" || res1==-1){
    					alert("请填入完整信息");
    					return ;
    				}
    				
    				$.ajax({
    					url:"goods/add.action",
    					secureuri:false,
    					type:"POST",
    					data: $('#form_orders_goods_update').serialize(),  
    					success:function(data,status){
    						if(data.code>0){
    							$("#form_orders_goods_update")[0].reset();
    							alert("货物信息添加成功");
    							$('#orders_goods_update').dialog("close");
    							freshData();
    						}else{
    							alert("货物信息添加失败");
    						}
    					},
    					error:function(data,status,e){
    						alert("货物信息添加失败");
    					}
    				});
    			}
    		}]
    	});
    	$('#orders_goods_update').dialog("open");
    }
</script>



<meta charset="UTF-8">
