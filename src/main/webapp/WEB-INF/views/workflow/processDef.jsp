<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/commons/head.jsp"%>
<%@ include file="/WEB-INF/views/commons/head_bootstrap.jsp"%>
</head>
<body>
	<!-- top引入 -->	
	<%@ include file="/WEB-INF/views/commons/top.jsp"%>
	
	
	<!-- 正文 -->
	<div class="container-fluid">
		<div class="row-fluid">
			<!-- sidebar start -->
			<%@ include file="/WEB-INF/views/commons/sidebar.jsp"%>
			<!-- sidebar end -->
			
			<!-- content start -->
			<div id="content" class="span9">
				<div class="row-fluid">
					<!-- 面包屑 -->
					<div class="navbar">
						<div class="navbar-inner">
							<ul class="breadcrumb">
								<li>
									<a href="">流程部署</a>
									<span class="divider">/</span>
								</li>
							</ul>
						</div>
					</div>
					<!-- 面包屑 end -->
				</div>
				
				<div class="row-fluid">
					<div class="block">
					
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">流程部署信息</div>
						</div>
						
						<div class="block-content collapse in">
							<div class="span12">
								<!-- table toolbar -->
								<div class="table-toolbar">
									<div class="btn-group">
										<button class="btn btn-success" data-toggle="modal" data-target="#myModal">
											部署新流程 <i class="icon-plus icon-white"></i>
										</button>
									</div>
								</div>
								<!-- table toolbar End -->
								
								<table id="processDefinitionGrid" cellspacing="0" cellpadding="0" border="0"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- content end -->
			
			
<!-- 部署流程表单 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
        <h4 class="modal-title" id="myModalLabel">部署新流程</h4>
      </div>
      <div class="modal-body">
	        <form id="editForm" class="form-horizontal" style="text-align: center;" role="form" enctype="multipart/form-data" method="post">
			  
			   <div class="form-group">
				  <label for="inputEmail3" class="col-sm-2 control-label">流程名称</label>
				  <div class="col-sm-10">
				  	<input type="text" class="form-control" id="inputEmail3" name="processName" placeholder="请输入流程名称">
				  </div>
				</div>
			  
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">流程文件</label>
			    <div class="col-sm-10">
			    	<input type="file" id="exampleInputFile" name="processFile">
			    </div>
			  </div>
			  
			  <div class="form-group" style="margin:10px">
			   	<button type="button" class="btn btn-success" id="confirm">部署</button>
			   	<button type="reset" class="btn btn-success">重置</button>
			  </div>
			</form>
      </div>
    </div>
  </div>
</div>

<!-- 消息框 -->
<div class="modal fade" id="msg-modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div id="msg_content" class="modal-body" style="text-align: center;color: red;">
      </div>
      <div class="modal-footer">
	      <button type="button" class="btn btn-default" data-dismiss="modal">
	      	<span class="am-modal-btn data-am-modal-confirm">确定</span>
      	  </button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
			
<script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
<script type="text/javascript">
//初始化表格
var table = $("#processDefinitionGrid");

//列表url
var listUrl = _ctx+"/workflow/listProcessDefinition.do";
//删除流程Url
var delUrl = _ctx + "/workflow/deleteProcessDefinition.do";

//表格删除
function del(id){
		$.post( delUrl, {"processId" : id},function(data){
			alert(data.msg);
			location.href = _ctx + "/workflow/index.do";
		});
}


$(function(){
	table.bootstrapTable({
		url: listUrl, 
	    dataType: "json",
	  	//分页
	    pagination: true,                  
	    //单行选择
	    singleSelect: true,
	  	//服务端处理分页
	    sidePagination: "server",
	  	//初始化加载第一页，默认第一页
	    pageNumber: 1,
	  	//每页的记录行数（*）   
        pageSize: 10,  
        //可供选择的每页的行数（*）    
        pageList: [10, 25, 50, 100],
      	//最少允许的列数
        minimumCountColumns: 10,
      	//是否启用点击选中行
        clickToSelect: true,                
	    columns: [
                  {
				field : 'id',
				title : '流程ID',
				align: 'center',
			}, {
				field : 'name',
				title : '流程名称',
				align: 'center',
			}, {
				field : 'key',
				title : '流程Key',
				align: 'center',
			}, {
				field : 'version',
				title : '流程版本',
				align: 'center',
			}, {
				field : 'description',
				title : '流程描述',
				align: 'center',
			}, {
				field : 'deploymentId',
				title : '部署ID',
				align: 'center',
			}, {
				field : 'resourceName',
				title : '流程文件',
				align: 'center',
			}, {
				field : 'diagramResourceName',
				title : '流程图片',
				align: 'center',
			},
               {
                   title: '操作',
                   field: 'id',
                   align: 'center',
                   formatter:function(value,row,index){  
               	   		return '<a href="javascript:void(0);" onclick="del(\''+ row.deploymentId +'\')">删除</a> ';  
                 } 
               }
              ]
	});
	
	var editForm = $("#editForm");
	
	$("#confirm").click(function(){
		/* 
		3.验证表单
		4.使用ajax的方式提交
		5.成功返回上级界面刷新
		6.失败直接提示 */
		
		var data = {};
		editForm.ajaxSubmit( {    
		       url:       _ctx + "/workflow/newDeploy.do", 
		       type:      "post",
		       data: data,        
		       clearForm: true,     
		       resetForm: true,     
		       beforeSubmit: function(){
		    		// 校验参数
		       }, 
		       success: function(data){
    	           var modal = $('#msg-modal');
    	           if(isJsonObj(data)){
			    	   modal.find("#msg_content").text(data.msg);

						modal.find(".data-am-modal-confirm").on("click", function(){
							console.debug("确定。。。");
			    	    });
			    	   modal.modal();
		    	  }else {
		    		  modal.find("#msg_content").text(data.msg);
		    		  modal.modal();
		    	  }
    	           table.bootstrapTable('refresh', {url: listUrl});
		       } 
		   });
	});
	
	//清空表单
	var closeBtn = $(".close");
	closeBtn.on("click",function(){
		//重置表单
		editForm.reset();
	});
})
</script>
	
</body>
</html>