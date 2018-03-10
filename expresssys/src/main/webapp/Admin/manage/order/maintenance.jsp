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
	width: 250px;
}
</style>

<div class="order-list">
	<ul class="easyui-tree" state="closed">
		<li><span>新增订单</span>

			<ul>
				<li>11</li>
				<li>11</li>
				<li>11</li>
			</ul>
		</li>
	</ul>
</div>

<div class="order-content">
	<form id="orders_imf_orders" >
		<input type="hidden" name="osid" id="orders_imf_osid" value="">
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
				<span>商品信息</span>
				<input id="addGoods" type="button" value="添加" onclick="javascript:order_goods_showAddgoods()" />
				<span>路线</span>
				<input id="addRoute" type="button" value="添加" onclick="javascript:order_route_showAddroute()" />
			</li>
			
			<li style="margin-top: 20px;">
				<label>备注：</label>
				<textarea  rows="2" cols="100"  id="orders_imf_oremark" name="oremark">
				</textarea>
			</li>
		</ul>
		
	</form>
</div>






















<script type="text/javascript">

var ordersObject;

$(function(){
		ordersObject = $('#orders_addMaint').datagrid({
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
			        		return '未发件';
			        	} else if(val==1){
			        		return '已发件';
			        	}   else if(val==3){
			        		return '已送达';
			        	}
			        }}, 
			        
			        {field:'_operate',title:'操作',width:100,align:'center',formatter:function(val,row,index){
			        	return "<a href='javascript:orders_findorders("+row.osid+")'> 详情</a><a href='javascript:orders_delorders("+row.osid+")'> 删除</a>"  //配送点详情查看
			        }}
			    ]],
			    toolbar:"#orders_search"
	
		});
	},"json");
</script>