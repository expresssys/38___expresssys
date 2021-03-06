<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<meta charset="UTF-8">
<table id="table_users_manager" data-options="fit:true" ></table>
<div id="users_search">
	<a id="btn" href="javascript:users_showAddusers()" class="easyui-linkbutton" data-options="iconCls:'icon-script-add',plain:true" style="float:left">添加</a>  
	<div class="datagrid-btn-separator"></div>
	<a id="btn" href="javascript:users_showUpdateusers()" class="easyui-linkbutton" data-options="iconCls:'icon-server-edit',plain:true" style="float:left">修改</a>  
	<div class="datagrid-btn-separator"></div>
	<label>管理员姓名：</label>
	<input type="text" name="uname" id="users_search_uname"/>
	
	<label>真实名字：</label>
	<input type="text" name="urealname" id="users_search_urealname"/>
	
	<label>身份：</label>
	<select id="users_search_res1" name="res1">
		<option value="0">--请选择--</option>
		<c:forEach items="${ALLCONST.userStatus}" varStatus="i" var="item" >  
			<option value="${item.cstatus}">${item.cname}</option>
		</c:forEach>
	</select>
	
	<a href="javascript:users_searchusers(1)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
	
	<a href="javascript:users_searchusers(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查看已离职员工</a>
</div>

<div id="users_update" class="easyui-dialog" title="添加管理员信息" style="width:400px;height:500px;align:center"
		data-options="iconCls:'icon-user-add',resizable:true,modal:true,closed:true" >
	<form id="form_users_update">
		<input type="hidden"  name="usid" id="users_update_usid"  />
		<ul>
			<li>
				<label>管理员名称<span></span></label>
				<input type="text" name="uname" id="users_update_uname" class="users_input"/>
			</li>
			<li>
				<label>密码<span></span></label>
				<input type="password" name="upwd" id="users_update_upwd" class="users_input"/>
			</li>
			<li>
				<label>真实姓名<span></span></label>
				<input type="text" name="urealname" id="users_update_urealname" class="users_input"/>
			</li>
			<li>
				<label>电话<span></span></label>
				<input type="text" name="utel" id="users_update_utel" class="users_input"/>
			</li>
			<li>
				<label>手机<span></span></label>
				<input type="text" name="uphone" id="users_update_uphone" class="users_input"/>
			</li>
			
			<li>
				<label>地址<span></span></label>
				<input type="text" name="uaddress" id="users_update_uaddress" class="users_input"/>
			</li>
			<li>
				<label>邮箱<span></span></label>
				<input type="text" name="uemail" id="users_update_uemail" class="users_input"/>
			</li>
			<li>
				<label>身份<span></span></label>
				<select id="users_update_res1" name="res1">
					<option value="0">--请选择--</optionv>
					<c:forEach items="${ALLCONST.userStatus}" varStatus="i" var="item" >  
						<option value="${item.cstatus}">${item.cname}</option>
					</c:forEach>
				</select>
			</li>
		</ul>
	</form>
</div>
<style>

#users_search label{
	margin-left:20px;
}

#users_update label{
	display:inline-block;
	width:66px;	
	text-align:justify;
	margin-top: 15px;
	margin-right: 10px;
}
#users_update label span{
  display:inline-block;
  width:100%;
}

#users_update li{
	list-style-type:none;
}

#users_update .users_input{
	width:160px;
	border:1px solid #95B8E7;
	line-height:20px;
}
</style>

<script type="text/javascript">
var usersObject=$('#table_users_manager').datagrid({   
    url:'users/find.action',
    fitColumns:true,
    pagination:true,	//设置true将在数据表格底部显示分页工具栏。
    striped:true,	//交替显示行背景
    loadMesg:'数据加载中',
    rownumbers:true,
    pageNumber:1,
    pageSize:50,
    pageList:[10,20,40,50,100],
    sortName:'usid',
    remoteSort:false,	//升序降序排列
    columns:[[   
		{checkbox:true},  
        {field:'usid',title:'管理员编号',width:100,align:'center',sortable:true},   
        {field:'uname',title:'管理员姓名',width:100,align:'center'},   
        {field:'urealname',title:'真实姓名',width:100,align:'center'},
        {field:'uphone',title:'电话',width:100,align:'center'},
        {field:'utel',title:'手机',width:100,align:'center'},
        {field:'uaddress',title:'地址',width:100,align:'center'},
        {field:'uemail',title:'邮箱',width:100,align:'center'},
        {field:'ustatus',title:'工作状态',width:100,align:'center',formatter:function(val,row,index){
        	if(val==1) return "在岗";
        	else return "离职";
        }},  
        {field:'res1',title:'身份',width:100,align:'center',formatter:function(val,row,index){
        	if(val==1) return "物流公司管理员";
        	else if(val==2) return "配送点管理员";
        	else if(val==3) return "普通用户";
        }},
        {field:'_operate',title:'操作',width:100,align:'center',formatter:function(val,row,index){
        	if(row.ustatus==0){
        		return "<a href='javascript:users_findusers("+row.usid+")'> 详情</a><a href='javascript:users_update_ustatus("+row.usid+",1)'> 复职</a>"  //详情查看
        	}else{
        		return "<a href='javascript:users_findusers("+row.usid+")'> 详情</a><a href='javascript:users_update_ustatus("+row.usid+",0)'> 离职</a>"  //详情查看
        	}
        }}
    ]],
    toolbar:"#users_search"
});  

//添加
function users_showAddusers(){
	$("#form_users_update")[0].reset();
	$('#users_update').dialog({
		title:"添加管理员信息",
		iconCls:'icon-user-add',
		buttons:[{
			text:'确定',
			iconCls:'icon-user-add',
			handler:function(){
				var uname=$.trim( $("#users_update_uname").val() );
				var upwd=$.trim( $("#users_update_upwd").val() );
				var res1=$.trim( $("#users_update_res1").val() );
				
				if(uname=="" || upwd==""){
					alert("请填入完整信息");
					return ;
				}else if(res1==0){
					alert("请选择所添加管理员的身份");
					return ;
				}	
				
				$.ajax({
					url:"users/add.action",
					secureuri:false,
					type:"POST",
					data: $('#form_users_update').serialize(),  
					success:function(data,status){
						if(data.code>0){
							usersObject.datagrid("reload");
							$("#form_users_update")[0].reset();
							$.messager.show({title:"成功提示",msg:"管理员信息添加成功...",timeout:2000,showType:"slide"});
							$('#users_update').dialog("close");
						}else{
							$.messager.alert("失败提示","管理员信息添加失败...","error");
						}
					},
					error:function(data,status,e){
						$.messager.alert("失败提示","管理员信息添加失败...\n"+e,"error");
					}
				});
			}
		}]
	});
	$('#users_update').dialog("open");
}


//修改
function users_showUpdateusers(){
	var rows=$('#table_users_manager').datagrid("getChecked");
	
	if(rows.length<=0){
		$.messager.show({title:"温馨提示",msg:"请选择您要修改的管理员信息...",timeout:2000,showType:"slide"});
	}else{
		var row = rows[0];
		
		$("#users_update_uname").val(row.uname);
		$("#users_update_upwd").val(row.upwd);
		$("#users_update_urealname").val(row.urealname);
		$("#users_update_utel").val(row.utel);
		$("#users_update_uphone").val(row.uphone);
		$("#users_update_uaddress").val(row.uaddress);
		$("#users_update_uemail").val(row.uemail);
		$("#users_update_res1").val(row.res1);
		$("#users_update_usid").val(row.usid);
		
		$('#users_update').dialog({
			title:"修改管理员信息",
			iconCls:'icon-user-edit',
			buttons:[{
				text:'修改',
				iconCls:'icon-user-edit',
				handler:function(){
					
					var uname=$.trim( $("#users_update_uname").val() );
					var upwd=$.trim( $("#users_update_upwd").val() );
					var res1=$.trim( $("#users_update_res1").val() );
					
					if(uname=="" || upwd==""){
						alert("请填入完整的修改信息");
						return ;
					}else if(res1==0){
						alert("请选择所修改管理员的身份");
						return ;
					}
					
					$.ajax({
						url:"users/update.action",
						secureuri:false,
						type:"POST",
						data: $('#form_users_update').serialize(), 
						success:function(data,status){
							if(data.code>0){
								usersObject.datagrid("reload");
								$("#form_users_update")[0].reset();
								$.messager.show({title:"成功提示",msg:"管理员信息修改成功...",timeout:2000,showType:"slide"});
								$('#users_update').dialog("close");
							}else{
								$.messager.alert("失败提示","管理员信息修改失败...","error");
							}
						},
					})
					
				}
			}]
		});
		$('#users_update').dialog("open");
	}
	
}

//条件查询
function users_searchusers(ustatus){
	var uname=$.trim( $("#users_search_uname").val() );
	var urealname=$.trim( $("#users_search_urealname").val() );
	var res1=$.trim( $("#users_search_res1").val() );
	if(res1==0){
		res1="";
	}
	$('#table_users_manager').datagrid({
		url:"users/find.action",
		queryParams:{uname:uname,urealname:urealname,res1:res1,ustatus:ustatus}
	});
}

//离职 复职
function users_update_ustatus(usid,ustatus){
	$.post("users/update.action",{usid:usid,ustatus:ustatus},function(data){
		if(data.code>0){
			$.messager.show({title:"成功提示",msg:"该管理员工作状态已修改",timeout:2000,showType:"slide"});
			usersObject.datagrid("reload");
		}else{
			$.messager.alert("失败提示","该管理员工作状态修改失败...","error");
			usersObject.datagrid("reload");
		}
	})
}



</script>