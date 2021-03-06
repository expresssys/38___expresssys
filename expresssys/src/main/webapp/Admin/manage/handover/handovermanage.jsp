<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<meta charset="UTF-8" >

<table id="handover_manager" data-options="fit:true"></table>
<div id="handover_orders_search">
	<a id="btn" href="javascript:jiaojie()" class="easyui-linkbutton" data-options="iconCls:'icon-script-add',plain:true" style="float:left">添加交接单</a>  
	<div class="datagrid-btn-separator"></div>
	<a id="btn" href="javascript:ckjiaojie()" class="easyui-linkbutton" data-options="iconCls:'icon-script-add',plain:true" style="float:left">查看交接单</a>
	<div class="datagrid-btn-separator"></div>
	<label>订单编号：</label>
	<input type="text" name="osid" id="handover_orders_search_osid"/>
	<a href="javascript:handover_orders_searchorders()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
</div>
<div id="handover_orders_update" class="easyui-dialog" title="添加订单信息" style="width:600px;height:400px;align:center"
		data-options="iconCls:'icon-user-add',resizable:true,modal:true,closed:true" >
	<form id="handover_orders_update_orders">
		<ul>
			<li>
				<input type="hidden" name="osid" id="handover_orders_update_osid" value="">
				<label>寄件人姓名：</label>
				<input type="text" name="osendname" id="handover_orders_update_osendname" class="orders_input"/>
			
				<label>寄件人电话：</label>
				<input type="text" name="osendtel" id="handover_orders_update_osendtel" class="orders_input"/>
			</li>
			<li>
				<label>寄件人地址：</label>
				<input type="text" name="osendaddress" id="handover_orders_update_osendaddress" class="orders_input2"/>
			</li>
			<li>
				<label>收件人姓名：</label>
				<input type="text" name="orecname" id="handover_orders_update_orecname" class="orders_input"/>
			
				<label>收件人电话：</label>
				<input type="text" name="orectel" id="handover_orders_update_orectel" class="orders_input"/>
				
			</li>
			<li>
			<label>收件人邮编：</label>
				<input type="text" name="oreccode" id="handover_orders_update_oreccode" class="orders_input"/>
			
				<label>收件人地址：</label>
				<input type="text" name="orecaddress" id="handover_orders_update_orecaddress" class="orders_input2"/>
			</li>
			
			<li>
				<label>订单日期：</label>
				<input type="text" name="otime" id="handover_orders_update_otime"  class="easyui-datetimebox" />
			</li>
			<li>
				<label>配送费：</label>
				<input type="text" name="oprice" id="handover_orders_update_oprice" class="orders_input" />
			
				<label>保价金额：</label>
				<input type="text" name="oinsureprice" id="handover_orders_update_oinsureprice" class="orders_input"/>
			</li>
			<li>
				<label>订单类型：</label>
				<select  name="otype" id="handover_orders_update_otype" >
					<c:forEach items="${ALLCONST.orderType}" varStatus="i" var="item" >  
						<option value="${item.cstatus}">${item.cname}</option>
					</c:forEach>
				</select>
				<label>所属单位：</label>
				<select name="spid" id="handover_orders_update_spid" >
				</select>
			</li>
			<li>
				<label>要求启程时间：</label>
				<input type="text" name="ostarttime" id="handover_orders_update_ostarttime"  class="easyui-datetimebox" />
			
				<label>要求到达时间：</label>
				<input type="text" name="oendtime" id="handover_orders_update_oendtime"  class="easyui-datetimebox" />
			</li>
			<li>
				<label>备注：</label>
				<textarea  rows="5" cols="20"  id="handover_orders_update_oremark" >
				</textarea>
			</li>
		</ul>
		
	</form>
</div>

<!-- 交接单 -->
<div id="jiaojie" style="padding: 10px">  
    <form id="addHandover" method="post">
	    <table cellpadding="8" >
	    	<tr>
	    		<td>
	    			<input type="text" name="osid" id="osid" style="display:none">
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<input type="text" name="htoSpname" id="htoSpname" style="display:none">
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>起始地址:</td>
	    		<td>
	    			<select name="hfromSpname" id="hfromSpname" style="width: 200px; height: 25px;">
						<option value="0">--请选择--</option>
					</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>到达地址:</td>
	    		<td>
	    			<input id="htoSpnames" name="htoSpnames" style="width: 200px; height: 25px;" class="easyui-textbox" type="text" disabled="true"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>发车时间:</td>
	    		<td><input id="hstartTime" name="hstartTime" style="width: 200px; height: 25px;" class="easyui-datetimebox" type="text" data-options="required:true, editable:false" /></td>
	    	</tr>
	    	<tr>
	    		<td>到达时间:</td>
	    		<td><input id="hendTime" name="hendTime" style="width: 200px; height: 25px;" class="easyui-datetimebox" type="text" data-options="required:true, editable:false" /></td>
	    	</tr>
	    	<tr>
	    		<td>交接单状态:</td>
	    		<td>
	    			<select name="hstatus" id="hstatus" style="width: 200px; height: 25px;">
						<option>--请选择--</option>
						<c:forEach items="${ALLCONST.handoverStatus}" varStatus="i" var="item" >  
							<option value="${item.cstatus}">${item.cname}</option>
						</c:forEach>
					</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>运输车辆:</td>
	    		<td>
	    			<select name="cids" id="cids" style="width: 100px; height: 25px;">
						<option value="0">--车辆类型--</option>
						<c:forEach items="${ALLCONST.carType}" varStatus="i" var="item" >  
							<option value="${item.cname}">${item.cname}</option>
						</c:forEach>
					</select>
					<select name="cid" id="cid" style="width: 100px; height: 25px;">
						<option value="0">--车牌号--</option>
					</select>
	    		</td>
	    			
	    	</tr>
	    	<tr>
	    		<td>司机:</td>
	    		<td>
	    			<select name="did" id="did" style="width: 200px; height: 25px;">
						<option value="0">--请选择--</option>
					</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>备注:</td>
	    		<td>
					<textarea rows="3" cols="20" name="hremark" id="hremark" style="width: 200px; "> 
					</textarea>
				</td>
	    	</tr>
	    </table>
	</form>
</div>

<!-- 交接单查看 -->
<div id="ckjiaojie" style="padding: 10px">  
		<div style="padding: 10px">
			<label>收发地：</label>
			<select name="fromaddr" id="fromaddr" style="width: 190px; height: 30px;">
				<option value="0">--请选择--</option>
			</select>
			<label>交接地：</label>
			<select name="toaddr" id="toaddr" style="width: 190px; height: 30px;">
				<option value="0">--请选择--</option>
			</select>
			<a href="javascript:ckjj()" class="easyui-linkbutton" iconCls="icon-print" style="float:right">导出</a>
		</div>
		<div class="datagrid-toolbar"></div> 
	<form id="chjj">
	<input type="hidden" name="hid" value="" id="hid"/>
	    <table cellpadding="8" >
	   		 <tr>
	    		<td>订单编号:</td>
	    		<td>
	    			<input value="" id="bianhao" name="bianhao" style="width: 200px; height: 25px;" class="easyui-textbox" type="text" disabled="true"/>
	    		</td>
	    		<td>收件人:</td>
	    		<td>
	    			<input id="shoujianren" name="shoujianren" style="width: 200px; height: 25px;" class="easyui-textbox" type="text" disabled="true"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>收寄地:</td>
	    		<td>
	    			<input id="jijianren" name="jijianren" style="width: 200px; height: 25px;" class="easyui-textbox" type="text" disabled="true"/>
	    		</td>
	    		<td>交接地:</td>
	    		<td>
	    			<input id="jiaojiedi" name="jiaojiedi" style="width: 200px; height: 25px;" class="easyui-textbox" type="text" disabled="true"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>运输时间:</td>
	    		<td>
	    			<input id="yunshushijian" name="yunshushijian" style="width: 200px; height: 25px;" class="easyui-textbox" type="text" disabled="true"/>
	    		</td>
	    		<td>到达时间:</td>
	    		<td>
	    			<input id="daodashijian" name="daodashijian" style="width: 200px; height: 25px;" class="easyui-textbox" type="text" disabled="true"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>车牌号:</td>
	    		<td>
	    			<input id="chepaihao" name="chepaihao" style="width: 200px; height: 25px;" class="easyui-textbox" type="text" disabled="true"/>
	    		</td>
	    		<td>司机:</td>
	    		<td>
	    			<input id="siji" name="siji" style="width: 200px; height: 25px;" class="easyui-textbox" type="text" disabled="true"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>备注:</td>
	    		<td>
					<textarea rows="3" cols="20" name="beizhu" id="beizhu" style="width: 200px; " disabled="true"> 
					</textarea>
				</td>
	    	
	    	
	    		<td>交接单状态:</td>
	    		<td>
	    			<select name="hstatus" id="ck-hstatus" style="width: 200px; height: 25px;">
						<option>--请选择--</option>
						<c:forEach items="${ALLCONST.handoverStatus}" varStatus="i" var="item" >  
							<option value="${item.cstatus}">${item.cname}</option>
						</c:forEach>
					</select>
	    		</td>
	    	</tr>
	    </table>
	 </form>
</div>


<style>
#handover_orders_search label{
	margin-left:20px;
	width:30px;
}

#handover_orders_update li{
	list-style-type:none;
	margin-top:20px;
}

#handover_orders_update .orders_input{
	width:100px;
	border:1px solid #95B8E7;
	line-height:20px;
}
#handover_orders_update .orders_input2{
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
</style>
<script type="text/javascript">

function changstr(str){
	var s = str.split(" ");
	var ss = s[3];
	var sss = ss.split(":");
	return sss;
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

$(function(){
	$.ajax({
		type: 'POST',
		url: "selectpoint.action",
		dataType: 'JSON',
	 	success: function( data ){
	 		var str="";
			for(var i=0;i<data.length;i++){
				str+="<option value="+data[i].spname+">"+data[i].spname+"</option>";
			}
			$("#hfromSpname").append(str);
			$("#fromaddr").append(str);
			$("#toaddr").append(str);
		}
	});
	
	$.ajax({
		type: 'POST',
		url: "handover/selectDriver.action",
		dataType: 'JSON',
	 	success: function( data ){
	 		var str="";
			for(var i=0;i<data.length;i++){
				str+="<option value="+data[i].did+">"+data[i].dname+"</option>";
			}
			$("#did").append(str);
		}
	});
	
	var shippointStr="";
	var shippointTypeStr="";
	$.get("point/findAll.action",{rows:100,page:1},function(data){
		var str="";
	
		shippointList=data.rows;
		$.each(shippointList,function(index,item){
			shippointStr+="<option value='"+item.spid+"'>"+item.spname+"</option>";
		});
		$("#handover_orders_update_spid").append($(shippointStr));
	});
});


var ordersEditRow=undefined;
var ordersObject;
var ordersFlag;
var ordersmark="";
var shippointList;
var status;
$(function(){
	
	var shippointStr="";
	var shippointTypeStr="";
	$.get("point/findAll.action",{rows:20,page:1},function(data){
		var str="";
		shippointList=data.rows;
		$.each(shippointList,function(index,item){
			shippointStr+="<option value='"+item.spid+"'>"+item.spname+"</option>";
		});
		$("#handover_orders_search_spid").append($(shippointStr));
		$("#orders_update_spid").append($(shippointStr));
		
		ordersObject = $('#handover_manager').datagrid({
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
			        {field:'osid',title:'配送id',width:100,align:'center',sortable:true},   
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
			        	return "<a href='javascript:orders_findorders("+row.osid+")'> 详情</a>"  //配送点详情查看
			        }}
			    ]],
			    toolbar:"#handover_orders_search"
	
	
		});
	},"json");
	
});	
	

	//详情查询
	function orders_findorders(osid){
		$("#handover_orders_update_orders")[0].reset();
		var rows=$('#handover_manager').datagrid("getChecked");
		if(rows.length<=0){
			$.messager.show({title:"温馨提示",msg:"请选择您要查看的订单...",timeout:2000,showType:"slide"});
		}else{
			var row=rows[0];
			var osid=row.osid;
			$.post("orders/findByID.action",{osid:osid},function(data){
				$("#handover_orders_update_osid").val(osid);
				ordersmark=data.rows[0].spremark;
				$("#handover_orders_update_osendname").val(data.rows[0].osendname);
				$("#handover_orders_update_osendtel").val(data.rows[0].osendtel);
				$("#handover_orders_update_osendaddress").val(data.rows[0].osendaddress);
				$("#handover_orders_update_orecname").val(data.rows[0].orecname);
				$("#handover_orders_update_orectel").val(data.rows[0].orectel);
				$("#handover_orders_update_orecaddress").val(data.rows[0].orecaddress);
				$("#handover_orders_update_oreccode").val(data.rows[0].oreccode);
				$("#handover_orders_update_otime").datebox('setValue',data.rows[0].otimeString);
				
				$("#handover_orders_update_oprice").val(data.rows[0].oprice);
				$("#handover_orders_update_oinsureprice").val(data.rows[0].oinsureprice);
				$("#handover_orders_update_otype").val(data.rows[0].otype);
				$("#handover_orders_update_ostarttime").datebox('setValue',data.rows[0].ostarttimeString);
				$("#handover_orders_update_oendtime").datebox('setValue',data.rows[0].oendtimeString);
				$("#handover_orders_update_spid").val(data.rows[0].spid);
				$("#handover_orders_update_usid").val(data.rows[0].usid);
				$("#handover_orders_update_oremark").val(data.rows[0].oremark);
				
			})
			
		$('#handover_orders_update').dialog({
			title:"查看订单信息",
			iconCls:'icon-user-edit',
			buttons:[{
				text:'确定',
				iconCls:'icon-user-edit',
				handler:function(){
					$('#handover_orders_update').dialog("close");
				}
			}]
		})
		$('#handover_orders_update').dialog("open");
		}
	}
	
	//条件查询
	function handover_orders_searchorders(){
		var otype=$.trim( $("#handover_orders_search_otype").val() );
		var spid=$.trim( $("#handover_orders_search_spid").val() );
		var osid=$.trim( $("#handover_orders_search_osid").val() );
		$('#handover_manager').datagrid({
			url:"orders/findByCondition.action",
			queryParams:{otype:otype,spid:spid,osid:osid}
		});
		
		$("#handover_orders_search_otype").val("");
		 $("#handover_orders_search_spid").val("");
	}
	
	
	
	//添加交接单
	var osids;
	function jiaojie(){
		$("#addHandover")[0].reset();
		var osid;
		var rows=$( '#handover_manager' ).datagrid("getChecked");
		if(rows.length<=0){
			$.messager.show({title:"温馨提示",msg:"请选择您要生成交接单的订单",timeout:2000,showType:"slide"});
			return;
		}else{
			var row=rows[0];
			var osid=row.osid
			osids=osid;
			$('#osid').val(row.osid)
		}
		$('#jiaojie').dialog({
			title:"添加交接单",
			iconCls:'icon-user-add',
			buttons: [{
				text:'确定',
				iconCls:'icon-user-add',
				handler:function(){
					var osid=$('#osid').val();
					var htoSpname=$('#htoSpname').val();
					var hfromSpname=$('#hfromSpname').val();
					var hstartTime=$("#hstartTime").datebox("getValue");
					var hendTime=$("#hendTime").datebox("getValue");
					var hstatus=$('#hstatus').val();
					var cid=$('#cid').val();
					var did=$('#did').val();
					var hremark=$('#hremark').val();
					$.ajax({
						type: 'POST',
						url: "handover/insertHandover.action",
						data:{osid:osid,htoSpname:htoSpname,hfromSpname:hfromSpname,hstartTime:hstartTime,hendTime:hendTime,hstatus:hstatus,cid:cid,did:did,hremark:hremark},
						dataType: 'JSON',
					 	success: function( data ){
							if(data.code==1){
								ordersObject.datagrid("reload");
								$("#addHandover")[0].reset();
								$.messager.show({title:"成功提示",msg:"交接单添加成功...",timeout:2000,showType:"slide"});
								$('#jiaojie').window('close');
							}else if(data.code==0){
								$.messager.alert("失败提示","该订单已经有交接单，请勿重复添加...","error");
							}else if(data.code==2){
								$.messager.alert("失败提示","交接单添加失败...","error");
							}
						}
					});
				}
			}]
		});
		$('#jiaojie').dialog("open");
	}
	
	//改变事件
	$("select#hfromSpname").change(function(){
		 var osid=osids;
		 var nowd=$(this).val()
	     $.ajax({
				type: 'POST',
				url: "handover/selectddByid.action",
				data:{osid:osids,nowd:nowd},
				dataType: 'JSON',
			 	success: function( data ){
			 		if(data.code==1){
			 			for(var i=0;i<data.obj.length;i++){
							$("#htoSpnames").val(data.obj[i].nextd);
							$("#htoSpname").val(data.obj[i].nextd);
						}
			 		}else if(data.code==0){
			 			$.messager.alert('错误提示','当前已经是最后一个配送点，无须添加交接单');
			 			$("#htoSpnames").val("");
			 			$("#htoSpname").val("");
			 		}else if(data.code==2){
			 			$.messager.alert('错误提示','您当前选中的配送点不在此订单路线范围中内');
			 			$("#htoSpnames").val("");
			 			$("#htoSpname").val("");
			 		}
				}
			});
	 });
	
	$("select#cids").change(function(){
		$("#cid").html('');
		 var ctype=$(this).val()
	     $.ajax({
				type: 'POST',
				url: "handover/selectcar.action",
				data:{ctype:ctype},
				dataType: 'JSON',
			 	success: function( data ){
			 		var str="";
					for(var i=0;i<data.length;i++){
						str+="<option value="+data[i].cid+">"+data[i].cnumber+"</option>";
					}
					$("#cid").html('');
					$("#cid").append(str);
				}
			});
	 });
	
	//查看交接单
	var ids;
	function ckjiaojie(){
		$("#ck-hstatus").attr("disabled", "disabled");
		$("#chjj")[0].reset();
		var rows=$( '#handover_manager' ).datagrid("getChecked");
		if(rows.length<=0){
			$.messager.show({title:"温馨提示",msg:"请选择您要查看交接单的订单",timeout:2000,showType:"slide"});
			return;
		}else{
			var row=rows[0];
			var id=row.osid;
			ids=id;
		}
		$('#ckjiaojie').dialog({
			title:"查看交接单信息",
			iconCls:'icon-user-edit',
			buttons:[{
				text:'修改状态',
				iconCls:'icon-user-edit',
				handler:function(){
					if($("#ck-hstatus").prop('disabled ')==true ){
						return ;
					}
					 $.ajax({
							type: 'POST',
							url: "handover/updateHandover.action",
							data:{hstatus:$("#ck-hstatus").val(),hid:$("#hid").val(),osid:ids},
							dataType: 'JSON',
						 	success: function( data ){
						 		if(data.code==1){
						 			alert("修改成功");
						 			if($("#ck-hstatus").val() == 2){
					 					$("#ck-hstatus").attr("disabled", "disabled");
					 				}else{
					 				    $("#ck-hstatus").removeAttr("disabled");  
					 				}
						 		}else{
						 			alert("修改失败");
						 			$("#ck-hstatus").val(status);
						 		}
						 		
							}
						});
				}
			},{
				text:'确定',
				iconCls:'icon-user-edit',
				handler:function(){
					$('#ckjiaojie').dialog("close");
				}
			}]
		})
		$('#ckjiaojie').dialog("open");
	}
	
	
	//收寄地的交接单
	$("select#fromaddr").change(function(){
		$("#chjj")[0].reset();
		 var hfromSpname=$(this).val()
	     $.ajax({
				type: 'POST',
				url: "handover/selectfromaddr.action",
				data:{hfromSpname:hfromSpname,osid:ids},
				dataType: 'JSON',
			 	success: function( data ){
			 		if(data.code==1){
			 			for(var i=0;i<data.obj.length;i++){
			 				$("#hid").val(data.obj[i].hid);
			 				$("#bianhao").val(data.obj[i].osid);
			 				$("#shoujianren").val(data.obj[i].orecName);
			 				$("#jijianren").val(data.obj[i].hfromSpname);
			 				$("#jiaojiedi").val(data.obj[i].htoSpname);
			 				$("#yunshushijian").val(new Date(data.obj[i].hstartTime).format("yyyy-MM-dd hh:mm:ss",data.obj[i].hstartTime));
			 				$("#daodashijian").val(new Date(data.obj[i].hendTime).format("yyyy-MM-dd hh:mm:ss",data.obj[i].hendTime));
			 				$("#chepaihao").val(data.obj[i].cnumber);
			 				$("#siji").val(data.obj[i].dname);
			 				$("#beizhu").val(data.obj[i].hremark);
			 				$("#ck-hstatus").val(data.obj[i].hstatus);
			 				status = data.obj[i].hstatus;
			 				if(data.obj[i].hstatus == 2){
			 					$("#ck-hstatus").attr("disabled", "disabled");
			 				}else{
			 				    $("#ck-hstatus").removeAttr("disabled");  
			 				}
			 			}
			 		}else{
			 			$.messager.alert('温馨提示','当前地点无交接单');
			 		}
				}
			});
	 });
	
	//收寄地的交接单
	$("select#toaddr").change(function(){
		$("#chjj")[0].reset();
		 var htoSpname=$(this).val()
	     $.ajax({
				type: 'POST',
				url: "handover/selecttoaddr.action",
				data:{htoSpname:htoSpname,osid:ids},
				dataType: 'JSON',
			 	success: function( data ){
					if(data.code==1){
						for(var i=0;i<data.obj.length;i++){
							$("#hid").val(data.obj[i].hid);
			 				$("#bianhao").val(data.obj[i].osid);
			 				$("#shoujianren").val(data.obj[i].orecName);
			 				$("#jijianren").val(data.obj[i].hfromSpname);
			 				$("#jiaojiedi").val(data.obj[i].htoSpname);
			 				$("#yunshushijian").val(new Date(data.obj[i].hstartTime).format("yyyy-MM-dd hh:mm:ss",data.obj[i].hstartTime));
			 				$("#daodashijian").val(new Date(data.obj[i].hendTime).format("yyyy-MM-dd hh:mm:ss",data.obj[i].hendTime));
			 				$("#chepaihao").val(data.obj[i].cnumber);
			 				$("#siji").val(data.obj[i].dname);
			 				$("#beizhu").val(data.obj[i].hremark);
			 				$("#ck-hstatus").val(data.obj[i].hstatus);
			 				status = data.obj[i].hstatus;
			 				if(data.obj[i].hstatus == 2){
			 					$("#ck-hstatus").attr("disabled", "disabled");
			 				}else{
			 				    $("#ck-hstatus").removeAttr("disabled");  
			 				}
			 				
			 			}
			 		}else{
			 			$.messager.alert('温馨提示','当前地点无交接单');
			 		}
				}
			});
	 });
	
	function ckjj(){
		var osid=$("#bianhao").val();
		var orecName=$("#shoujianren").val();
		var hfromSpname=$("#jijianren").val();
		var htoSpname=$("#jiaojiedi").val();
		var hstartTime=$("#yunshushijian").val();
		var hendTime=$("#daodashijian").val();
		var cnumber=$("#chepaihao").val();
		var dname=$("#siji").val();
		if(osid==""){
			$.messager.alert('温馨提示','请查看您要导出的交接单在导出');
		}
		window.location.href="http://localhost:8080/expresssys/Admin/exportHandover.action?"+"osid="+osid+"&hfromSpname="+hfromSpname+"&htoSpname="+htoSpname+"&orecName="+orecName+"&hstartTime="+hstartTime+"&hendTime="+hendTime+"&cnumber="+cnumber+"&dname="+dname; 
	}


</script>



<meta charset="UTF-8">
