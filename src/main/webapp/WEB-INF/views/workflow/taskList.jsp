<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>任务规则管理</title>
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

	function viewTaskForm(formKey,businessType,businessId){
		console.debug(arguments);
		if(formKey){
		//加载表单内容
		var url = "/workflow/getTaskForm?formUrl=" + formKey;
		//重新初始化对话框的href属性
		$("#taskDlg").dialog({
				"href":url,
				"onLoad":function(){
					var url = "/"+businessType+"/getTaskFormData?businessId="+businessId;
					$.get(url,{"businessId":businessId},function(data){
						// 拿到表单
						var taskForm = $("#taskDlg").find("#customer-form");
						// 加载表单数据
						taskForm.form("load",data);
					},"json")
				}
			});
		//打开对话框
		$("#taskDlg").dialog("open");
		
		}
	}

	//---页面加载完毕后---
	$(function() {
		// 1. 声明页面中可能会用到组件
		var Grid, taskDlg, taskForm;

		// 2. 缓存页面组件
		taskGrid = $("#taskGrid");
		taskDlg = $("#taskDlg");
		taskForm = $("#taskForm");

		// 3. 定义一个事件处理对象,把事件相关的逻辑都封装到一个对象上(命令对象)
		var cmdObj = {
				create : function() {
				taskForm.form("clear");
				taskDlg.dialog("open");
			},
			edit : function() {

				// 获取行选中数据
				var rowData = taskGrid.datagrid("getSelected");
				// 判断
				if (!rowData) {
					$.messager.alert("温馨提示", "请选中一行!!", "info");
					return;
				}
				// 重置表单
				taskForm.form("reset");
				// 打开对话框
				taskDlg.dialog("open");

				// 加载数据
				/*
				 * form的load方法运行的机制:根据表单中元素的name属性,去json对象中,取值.
					 例如: <input name="dept.name">  , {name:"zs",dept:{name:""}}  >> obj["dept.name"]
				                             针对上面特殊情况,{name:"zs",dept:{name:""}}>> {name:"zs",dept:{name:"ls"},"dept.name":"zs"}
				 */
				taskForm.form("load", rowData);

			},
			del : function() {
				//console.debug('del:function');
				// 获取行选中数据
				var rowData = taskGrid.datagrid("getSelected");
				// 判断
				if (!rowData) {
					$.messager.alert("温馨提示", "请选中一行!!", "info");
					return;
				}
				$.messager.confirm("温馨提示", "是否要删除该任务规则?", function(yes) {
					if (yes) {
						$.get("/task/delete", {
							"id" : rowData.id
						}, function(data) {
							console.debug(data);
							if (data.success) {
								// 关闭对话框
								taskDlg.dialog("close");
								// 提示,刷新
								$.messager.alert("温馨提示", data.message, "info",
										function() {
											// 刷新表格数据
											taskGrid
													.datagrid("reload");
										});
							} else {
								$.messager.alert("温馨提示", data.message, "info",
										function() {
											// 根据错误码,定位到单元格
										});
							}
						}, "json");
					}
				});
			},
			refresh : function() {
				taskGrid.datagrid("reload");
			},
			newDeploy : function() {
				taskForm.submit();
			},
			cancel : function() {
				taskDlg.dialog("close");
			}

		};
		function opFormatter(v,r,i){
			return "<a href='javascript:viewTaskForm(\""+r.formKey+"\",\""+r.businessTpye+"\","+r.businessId+")'>办理业务</a>";
		}
		
		// 4. 初始化组件
		taskGrid.datagrid({
			url : "/workflow/listTaskData",
			fit : true,
			border : false,
			fitColumns : true,
			striped : true,
			toolbar : [ {
				text : "办理任务",
				iconCls : "icon-add",
				plain : true,
				handler : cmdObj['create']
			}, {
				text : "删除任务",
				iconCls : "icon-remove",
				plain : true,
				handler : cmdObj['del']
			}, {
				text : "刷新",
				iconCls : "icon-reload",
				plain : true,
				handler : cmdObj['refresh']
			}, "-", {
				text : "查看任务规则图",
				iconCls : "icon-search",
				plain : true,
				handler : cmdObj['viewCurrentImage']
			} ],//"#taskTb",
			rownumbers : true,
			singleSelect : true,
			pagination : true,
			columns : [ [ {
				field : 'id',
				title : '任务ID',
				width : 10
			}, {
				field : 'name',
				title : '任务名称',
				width : 10
			}, {
				field : 'createTime',
				title : '创建时间',
				width : 10
			}, {
				field : 'assignee',
				title : '任务办理人',
				width : 10
			}, {
				field : 'description',
				title : '任务描述',
				width : 10
			}, {
				field : 'op',
				formatter:opFormatter,
				title : '操作',
				width : 10
			}

			] ]
		});

		taskDlg.dialog({
			width : 350,
			height : 500,
			title : "查看任务详情",
			closed : true,
			modal : true,
			buttons : [ {
				text : "完成业务",
				iconCls : "icon-save",
				handler : cmdObj['newDeploy']
			}, {
				text : "取消",
				iconCls : "icon-cancel",
				handler : cmdObj['cancel']
			} ]
		//"#taskDlgBtn"
		});

		// 任务规则表单
		taskForm.form({
			url : "/workflow/newDeploy",
			success : function(data) {
				// 把响应结果转换成JSON对象
				data = $.parseJSON(data);
				if(data.success){
					// 关闭对话框
					taskDlg.dialog("close");
					// 提示,刷新
					$.messager.alert("温馨提示",data.message,"info",function(){
						// 刷新表格数据
						taskGrid.datagrid("reload");
					});
				}else{
					$.messager.alert("温馨提示",data.message,"info",function(){
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
	<table id="taskGrid">
	</table>
	<!-- 2. 对话框-->
	<div id="taskDlg">
		<font style="font-weight: bold;"></font>
		<form id="taskForm" method="post">
			<table align="center" style="margin-top: 10px;">
			</table>
		</form>
	</div>

</body>
</html>