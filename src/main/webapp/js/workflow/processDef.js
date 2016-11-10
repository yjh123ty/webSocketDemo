/**
 * 部署流程的js
 */

//初始化表格
var table = $("#processDefinitionGrid");

//列表url
var listUrl = _ctx+"/workflow/listProcessDefinition.do";
//删除流程Url
var delUrl = _ctx + "/workflow/deleteProcessDefinition.do";

//表格删除
function del(id){
	return confirm("是否删除？", function(yes) {
		if (yes) {
			$.post( delUrl, {"id" : id}, 
				function(data) {
					// 判断
					if (data.success) {
						// 提示
						$.messager.alert("温馨提示", data.msg, "info",
							function() {
								//刷新页面
								 table.bootstrapTable('refresh', {url: listUrl});
							});
					} else {
						$.messager.alert("温馨提示", data.msg, "info");
					}
				}, "json");
		}
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
               	   		return '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
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
					    	   if(data.success) {
					    		   window.top.location = _ctx + "/workflow/index.do";
					    	   }
			    	    });
			    	   modal.modal();
		    	  }else {
		    		  modal.find("#msg_content").text(data.msg);
		    		  modal.modal();
		    	  }
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