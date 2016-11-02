<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>流程规则管理</title>
<!-- 
	统一步骤：
	* 引入通用资源"WebContent/WEB-INF/views/common.jsp"
	-------在页面加载完毕后----------
	1、声明页面中，哪些组件需要获取后，使用的
	2、获取需要使用的组件，并缓存
	3、初始化
	4、创建一个命令对象，来管理页面中，需要调用的方法
	5、对页面中所有按钮，统一添加事件（如何区分不同按钮的逻辑？？）
 -->
<%@ include file="/WEB-INF/views/commons/head.jsp" %>
<%@ include file="/WEB-INF/views/commons/head_amazeui.jsp" %>
<%@ include file="/WEB-INF/views/commons/head_easyui.jsp" %>
<script type="text/javascript">
	//---页面加载完毕后---
	$(function() {
		// 1. 声明页面中可能会用到组件
		var Grid, processDefinitionDlg, processDefinitionForm;

		// 2. 缓存页面组件
		processDefinitionGrid = $("#processDefinitionGrid");
		processDefinitionDlg = $("#processDefinitionDlg");
		processDefinitionForm = $("#processDefinitionForm");

		// 3. 定义一个事件处理对象,把事件相关的逻辑都封装到一个对象上(命令对象)
		var cmdObj = {
				create : function() {
				processDefinitionForm.form("clear");
				processDefinitionDlg.dialog("open");
			},
			edit : function() {

				// 获取行选中数据
				var rowData = processDefinitionGrid.datagrid("getSelected");
				// 判断
				if (!rowData) {
					$.messager.alert("温馨提示", "请选中一行!!", "info");
					return;
				}
				// 重置表单
				processDefinitionForm.form("reset");
				// 打开对话框
				processDefinitionDlg.dialog("open");

				// 加载数据
				/*
				 * form的load方法运行的机制:根据表单中元素的name属性,去json对象中,取值.
					 例如: <input name="dept.name">  , {name:"zs",dept:{name:""}}  >> obj["dept.name"]
				                             针对上面特殊情况,{name:"zs",dept:{name:""}}>> {name:"zs",dept:{name:"ls"},"dept.name":"zs"}
				 */
				processDefinitionForm.form("load", rowData);

			},
			del : function() {
				//console.debug('del:function');
				// 获取行选中数据
				var rowData = processDefinitionGrid.datagrid("getSelected");
				// 判断
				if (!rowData) {
					$.messager.alert("温馨提示", "请选中一行!!", "info");
					return;
				}
// 				console.debug("删除的id"+rowData.deploymentId);
				$.messager.confirm("温馨提示", "是否要删除该流程规则?", function(yes) {
					if (yes) {
						$.get(_ctx+"/workflow/deleteProcessDefinition.do", {
							"processId" : rowData.deploymentId
						}, function(data) {
							if (data.success) {
								// 关闭对话框
								processDefinitionDlg.dialog("close");
								// 提示,刷新
								$.messager.alert("温馨提示", data.msg, "info",
										function() {
											// 刷新表格数据
											processDefinitionGrid
													.datagrid("reload");
										});
							} else {
								$.messager.alert("温馨提示", data.msg, "info",
										function() {
											// 根据错误码,定位到单元格
										});
							}
						}, "json");
					}
				});
			},
			refresh : function() {
				processDefinitionGrid.datagrid("reload");
			},
			newDeploy : function() {
				processDefinitionForm.submit();
			},
			cancel : function() {
				processDefinitionDlg.dialog("close");
			}

		};
		// 4. 初始化组件
		processDefinitionGrid.datagrid({
			url : _ctx+"/workflow/listProcessDefinition.do",
			fit : true,
			border : false,
			fitColumns : true,
			striped : true,
			toolbar : [ {
				text : "部署新流程",
				iconCls : "icon-add",
				plain : true,
				handler : cmdObj['create']
			}, {
				text : "删除流程",
				iconCls : "icon-remove",
				plain : true,
				handler : cmdObj['del']
			}, {
				text : "刷新",
				iconCls : "icon-reload",
				plain : true,
				handler : cmdObj['refresh']
			}, "-", {
				text : "查看流程规则图",
				iconCls : "icon-search",
				plain : true,
				handler : cmdObj['refresh']
			} ],//"#processDefinitionTb",
			rownumbers : true,
			singleSelect : true,
			pagination : true,
			columns : [ [ {
				field : 'id',
				title : '流程ID',
				width : 10
			}, {
				field : 'name',
				title : '流程名称',
				width : 10
			}, {
				field : 'key',
				title : '流程Key',
				width : 10
			}, {
				field : 'version',
				title : '流程版本',
				width : 10
			}, {
				field : 'description',
				title : '流程描述',
				width : 10
			}, {
				field : 'deploymentId',
				title : '部署ID',
				width : 10
			}, {
				field : 'resourceName',
				title : '流程文件',
				width : 10
			}, {
				field : 'diagramResourceName',
				title : '流程图片',
				width : 10
			}

			] ]
		});

		processDefinitionDlg.dialog({
			width : 320,
			height : 170,
			title : "添加/编辑流程规则信息",
			closed : true,
			modal : true,
			buttons : [ {
				text : "部署",
				iconCls : "icon-save",
				handler : cmdObj['newDeploy']
			}, {
				text : "取消",
				iconCls : "icon-cancel",
				handler : cmdObj['cancel']
			} ]
		//"#processDefinitionDlgBtn"
		});

		// 流程规则表单
		processDefinitionForm.form({
			url : _ctx+"/workflow/newDeploy.do",
			success : function(data) {
				// 把响应结果转换成JSON对象
				data = $.parseJSON(data);
				if(data.success){
					// 关闭对话框
					processDefinitionDlg.dialog("close");
					// 提示,刷新
					$.messager.alert("温馨提示",data.msg,"info",function(){
						// 刷新表格数据
						processDefinitionGrid.datagrid("reload");
					});
				}else{
					$.messager.alert("温馨提示",data.msg,"info",function(){
						// 根据错误码,定位到单元格
					});
				}
			}
		});
	})
</script>
</head>
<body>
	<!-- 1. 表格-->
	<table id="processDefinitionGrid">
	</table>
	<!-- 2. 对话框-->
	<div id="processDefinitionDlg">
		<font style="font-weight: bold;"></font>
		<form id="processDefinitionForm" method="post" enctype="multipart/form-data">
			<input name="id" type="hidden">
			<table align="center" style="margin-top: 10px;">
				<tr>
					<td height="15">流程名称：</td>
					<td height="15"><input name="processName"></td>
				</tr>
				<tr>
					<td height="15">流程文件：</td>
					<td height="15"><input name="processFile" type="file">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>