<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>物流平台--后台管理</title>
<link rel="stylesheet" type="text/css" href="../easyui/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="../easyui/css/wu.css" />
<link rel="stylesheet" type="text/css" href="../easyui/css/icon.css" />
<script type="text/javascript" src="../easyui/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../easyui/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../easyui/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
</head>
<body class="easyui-layout">
	<!-- begin of header -->
	<div class="wu-header"
		data-options="region:'north',border:false,split:true">
		<div class="wu-header-left">
			<h1>物流平台--后台管理</h1>
		</div>
		<div class="wu-header-right">
			<p>
				<strong class="easyui-tooltip" title="2条未读消息">admin</strong>，欢迎您！
			</p>
			<p>
				<a href="#">网站首页</a>|<a href="#">支持论坛</a>|<a href="#">帮助中心</a>|<a
					href="#">安全退出</a>
			</p>
		</div>
	</div>
	<!-- end of header -->
	<!-- begin of sidebar -->
	<div class="wu-sidebar"
		data-options="region:'west',split:true,border:true,title:'物流平台导航菜单'">
		<div class="easyui-accordion" data-options="border:false,fit:true">
			<div title="人员管理" data-options="iconCls:'icon-users'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-user"><a href="javascript:void(0)"
						data-icon="icon-user" data-link="manage/people/adminManage.html"
						iframe="0">管理员管理</a></li>
					<li iconCls="icon-group"><a href="javascript:void(0)"
						data-icon="icon-group" data-link="manage/people/userManage.html"
						iframe="0">用户管理</a></li>
				</ul>
			</div>

			<div title="路线管理" data-options="iconCls:'icon-rgb'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-search"><a href="javascript:void(0)"
						data-icon="icon-search" data-link="manage/line/linemanage.html"
						iframe="0">路线管理</a></li>

				</ul>
			</div>

			<div title="配送点管理" data-options="iconCls:'icon-note'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-search"><a href="javascript:void(0)"
						data-icon="icon-search" data-link="manage/point/pointmanage.html"
						iframe="0">配送点管理</a></li>
				</ul>
			</div>


			<div title="代理点管理" data-options="iconCls:'icon-note'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-search"><a href="javascript:void(0)"
						data-icon="icon-search" data-link="manage/proxy/proxymanage.html"
						iframe="0">代理点管理</a></li>
				</ul>
			</div>


			<div title="司机管理" data-options="iconCls:'icon-contrast'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-search"><a href="javascript:void(0)"
						data-icon="icon-search"
						data-link="manage/driver/drivermanage.html" iframe="0">司机管理</a></li>

				</ul>
			</div>

			<div title="报表管理" data-options="iconCls:'icon-layout'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-map"><a href="javascript:void(0)"
						data-icon="icon-map" data-link="manage/form/yearform.html"
						iframe="0">年收入汇总表</a></li>
					<li iconCls="icon-map"><a href="javascript:void(0)"
						data-icon="icon-map" data-link="manage/form/pointform.html"
						iframe="0">配送点年收入汇总表</a></li>
				</ul>
			</div>

			<div title="订单管理" data-options="iconCls:'icon-textfield'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-car"><a href="javascript:void(0)"
						data-icon="icon-car" data-link="manage/order/ordermanage.html"
						iframe="0">订单管理</a></li>
					<li iconCls="icon-car"><a href="javascript:void(0)"
						data-icon="icon-car" data-link="manage/order/shouhuo.html"
						iframe="0">收货查询</a></li>
					<li iconCls="icon-car"><a href="javascript:void(0)"
						data-icon="icon-car" data-link="manage/order/maintenance.html"
						iframe="0">新增订单维护</a></li>
					<li iconCls="icon-car"><a href="javascript:void(0)"
						data-icon="icon-car" data-link="manage/order/count.html"
						iframe="0">订单统计</a></li>
				</ul>
			</div>

			<div title="车辆管理" data-options="iconCls:'icon-car'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-car"><a href="javascript:void(0)"
						data-icon="icon-car" data-link="manage/car/carmanage.html"
						iframe="0">车辆查询</a></li>
				</ul>
			</div>

			<div title="交接单管理" data-options="iconCls:'icon-cart'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-car"><a href="javascript:void(0)"
						data-icon="icon-car"
						data-link="manage/handover/handovermanage.html" iframe="0">交接单管理</a>
					</li>
				</ul>
			</div>


			<div title="权限管理" data-options="iconCls:'icon-key'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-car"><a href="javascript:void(0)"
						data-icon="icon-car" data-link="manage/authority/role.html"
						iframe="0">角色管理</a></li>
					<li iconCls="icon-car"><a href="javascript:void(0)"
						data-icon="icon-car" data-link="manage/authority/authority.html"
						iframe="0">权限管理</a></li>
				</ul>
			</div>

			<div title="系统设置" data-options="iconCls:'icon-cog'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-car"><a href="javascript:void(0)"
						data-icon="icon-car" data-link="manage/system/assign.html"
						iframe="0">分配设置</a></li>
					<li iconCls="icon-car"><a href="javascript:void(0)"
						data-icon="icon-car" data-link="manage/system/category.html"
						iframe="0">类别设置</a></li>
				</ul>
			</div>

		</div>
	</div>
	<!-- end of sidebar -->
	<!-- begin of main -->
	<div class="wu-main" data-options="region:'center'">
		<div id="wu-tabs" class="easyui-tabs"
			data-options="border:false,fit:true">
			<div title="首页"
				data-options="href:'',closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
		</div>
	</div>
	<!-- end of main -->
	<!-- begin of footer -->
	<div class="wu-footer"
		data-options="region:'south',border:true,split:true">&copy; 2017
		物流平台</div>
	<!-- end of footer -->
	<script type="text/javascript">
		$(function() {
			$('.wu-side-tree a').bind("click", function() {
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe') == 1 ? true : false;
				addTab(title, url, iconCls, iframe);
			});
		});

		/**
		 * Name 选项卡初始化
		 */
		$('#wu-tabs').tabs({
			tools : [ {
				iconCls : 'icon-reload',
				border : false,
				handler : function() {
					$('#wu-datagrid').datagrid('reload');
				}
			} ]
		});

		/**
		 * Name 添加菜单选项
		 * Param title 名称
		 * Param href 链接
		 * Param iconCls 图标样式
		 * Param iframe 链接跳转方式（true为iframe，false为href）
		 */
		function addTab(title, href, iconCls, iframe) {
			var tabPanel = $('#wu-tabs');
			if (!tabPanel.tabs('exists', title)) {
				var content = '<iframe scrolling="auto" frameborder="0"  src="'
						+ href + '" style="width:100%;height:100%;"></iframe>';
				if (iframe) {
					tabPanel.tabs('add', {
						title : title,
						content : content,
						iconCls : iconCls,
						fit : true,
						cls : 'pd3',
						closable : true
					});
				} else {
					tabPanel.tabs('add', {
						title : title,
						href : href,
						iconCls : iconCls,
						fit : true,
						cls : 'pd3',
						closable : true
					});
				}
			} else {
				tabPanel.tabs('select', title);
			}
		}
		/**
		 * Name 移除菜单选项
		 */
		function removeTab() {
			var tabPanel = $('#wu-tabs');
			var tab = tabPanel.tabs('getSelected');
			if (tab) {
				var index = tabPanel.tabs('getTabIndex', tab);
				tabPanel.tabs('close', index);
			}
		}
	</script>
</body>
</html>
