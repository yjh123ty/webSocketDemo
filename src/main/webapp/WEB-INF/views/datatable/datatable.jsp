<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据表格</title>
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
			
			<div id="content" class="span9">
				<div class="row-fluid">
					<div class="navbar">
						<div class="navbar-inner">
							<ul class="breadcrumb">
								<li><a href="${ctx}/datatable/index.do">数据表格</a> <span
									class="divider">/</span></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="row-fluid">
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Table样式</div>
						</div>

						<!-- block-content start -->
						<div class="block-content collapse in">
							<div class="span12">
								<!-- table toolbar -->
								<div class="table-toolbar">
									<div class="btn-group">
										<a href="#">
											<button class="btn btn-success">
												添加 <i class="icon-plus icon-white"></i>
											</button>
										</a>
									</div>

									<div class="btn-group pull-right">
										<button class="btn dropdown-toggle" data-toggle="dropdown">
											Tools <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
											<li><a href="#">导出数据</a></li>
											<li><a href="#">模板下载</a></li>
											<li><a href="#">导入数据</a></li>
										</ul>
									</div>
								</div>
								<!-- table toolbar End -->

								<div class="dataTables_wrapper form-inline" role="grid">
									<table id="datatable" cellspacing="0" cellpadding="0" border="0"></table>
								</div>
							</div>
						</div>
						<!-- block-content end -->

					</div>
				</div>
			</div>

		</div>
		<hr>

		<footer>
		<p>© 余子酱 2016</p>
		</footer>
	</div>

<script type="text/javascript">
	$(function(){
		var table = $("#datatable");
		table.bootstrapTable({
			url: _ctx + "/datatable/list.do", 
		    dataType: "json",
		  //是否显示行间隔色
            striped: true,
          //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）     
            cache: false, 
		  	//分页
		    pagination: true,                  
		    //单行选择
		    singleSelect: true,
		  	//服务端处理分页
		    sidePagination: "server",
			//是否启用排序  
            sortable: true,    
            //排序方式 
            sortOrder: "desc",
            //可供选择的每页的行数（*）    
            pageList: [10, 25, 50, 100],
          	//是否启用点击选中行
            clickToSelect: true,                
		    columns: [
	                  {
	                      title: '昵称',
	                      field: 'name',
	                      align: 'center',
	                  },
	                  {
	                      title: '操作',
	                      field: 'id',
	                      align: 'center',
	                      formatter:function(value,row,index){  
	                   var e = '<a href="#" onclick="edit(\''+ row.id + '\')">编辑</a> ';  
	                   var d = '<a href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
	                        return e+d;  
	                    } 
	                  }
	              ]
		});
	})
	
</script>

</body>
</html>