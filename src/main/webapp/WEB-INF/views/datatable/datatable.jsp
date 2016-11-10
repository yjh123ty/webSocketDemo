<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tables</title>
<%@ include file="/WEB-INF/views/commons/head.jsp"%>
<%@ include file="/WEB-INF/views/commons/head_bootstrap.jsp"%>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">用户面板</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							role="button" data-toggle="dropdown"> <i class="icon-user"></i>
								abby yu <i class="caret"></i>
						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="#">Profile</a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="login.html">Logout</a></li>
							</ul></li>
					</ul>

					<ul class="nav">
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown"> Settings <b class="caret"></b>
						</a>
							<ul id="menu1" class="dropdown-menu">
								<li><a href="#"> Tools <i class="icon-arrow-right"></i>
								</a></li>
								<li><a href="#">Other Link</a></li>
							</ul></li>
						<li><a href="#">SEO Settings</a></li>
					</ul>

				</div>
			</div>
		</div>
	</div>

	<!-- 正文 -->
	<div class="container-fluid">
		<div class="row-fluid">
			<div id="sidebar" class="span3">
				<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
					<li><a href="${ctx}/main/index.do"> <i
							class="icon-chevron-right"></i> 主页
					</a></li>
					<li><a href="${ctx}/workflow/index.do"> <i
							class="icon-chevron-right"></i> 流程管理
					</a></li>
					<li><a href="${ctx}/datatable/index.do"> <i
							class="icon-chevron-right"></i> Tables
					</a></li>
				</ul>
			</div>
			<div id="content" class="span9">
				<div class="row-fluid">
					<div class="navbar">
						<div class="navbar-inner">
							<ul class="breadcrumb">
								<li><a href="${ctx}/datatable/index.do">Tables</a> <span
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

								<div id="example2_wrapper" class="dataTables_wrapper form-inline" role="grid">
<!-- 									<div class="row"> -->
<!-- 										<div class="span6"> -->
<!-- 											<div id="example2_length" class="dataTables_length"> -->
<!-- 												<label> <select size="1" name="example2_length" -->
<!-- 													aria-controls="example2"> -->
<!-- 														<option value="10" selected="selected">10</option> -->
<!-- 														<option value="25">25</option> -->
<!-- 														<option value="50">50</option> -->
<!-- 														<option value="100">100</option> -->
<!-- 												</select> records per page -->
<!-- 												</label> -->
<!-- 											</div> -->
<!-- 										</div> -->

<!-- 										<div class="span6"> -->
<!-- 											<div id="example2_filter" class="dataTables_filter" style="text-align: right"> -->
<!-- 												<label> Search: <input aria-controls="example2" -->
<!-- 													type="text"> -->
<!-- 												</label> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
									
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
	                      title: '昵称',
	                      field: 'name',
	                      align: 'center',
	                  },
	                  {
	                      title: '操作',
	                      field: 'id',
	                      align: 'center',
	                      formatter:function(value,row,index){  
	                   var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id + '\')">编辑</a> ';  
	                   var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
	                        return e+d;  
	                    } 
	                  }
	              ]
		});
	})
	
</script>

</body>
</html>