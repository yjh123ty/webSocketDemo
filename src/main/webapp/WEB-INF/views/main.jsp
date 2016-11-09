<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<%@ include file="/WEB-INF/views/commons/head.jsp"%>
<%@ include file="/WEB-INF/views/commons/head_bootstrap.jsp"%>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="#">用户面板</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
								<i class="icon-user"></i>
								abby yu
								<i class="caret"></i>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a tabindex="-1" href="#">Profile</a>
								</li>
								<li class="divider"></li>
								<li>
									<a tabindex="-1" href="login.html">Logout</a>
								</li>
							</ul>
						</li>
					</ul>
					
					<ul class="nav">
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" data-toggle="dropdown">
								Settings
								<b class="caret"></b>
							</a>
							<ul id="menu1" class="dropdown-menu">
								<li>
									<a href="#">
										Tools
										<i class="icon-arrow-right"></i>
									</a>
								</li>
								<li>
									<a href="#">Other Link</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">SEO Settings</a>
						</li>
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
					<li>
						<a href="${ctx}/main/index.do">
							<i class="icon-chevron-right"></i>
							主页
						</a>
					</li>
					<li>
						<a href="${ctx}/workflow/processDefinition.do">
							<i class="icon-chevron-right"></i>
							流程管理
						</a>
					</li>
					<li>
						<a href="${ctx}/datatable/index.do">
						<i class="icon-chevron-right"></i>
							Tables
						</a>
					</li>
				</ul>
			</div>
			<div id="content" class="span9">
				<div class="row-fluid">
					<div class="alert alert-success">
						<button class="close" type="button" data-dismiss="alert">×</button>
						<h4>Success</h4>
						The operation completed successfully
					</div>
					<div class="navbar">
						<div class="navbar-inner">
							<ul class="breadcrumb">
								<li>
									<a href="${ctx}/main/index.do">主页</a>
									<span class="divider">/</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">我的工作</div>
						</div>
						
						<div class="block-content collapse in">
							<div class="span12">
								2016-11-11 xxxxxx
							</div>
						</div>
					</div>
				</div>
			</div>
			
<!-- 			<div> -->
<%-- 				<a href="${ctx}/user/index.do">用户管理</a><br />  --%>
<%-- 				<a href="${ctx}/workflow/processDefinition.do">部署流程</a><br />  --%>
<%-- 				<a href="${ctx}/workflow/task.do">申请请假流程</a><br /> --%>
<!-- 			</div> -->
		</div>
		<hr>
		
		<footer>
			<p>© 余子酱 2016</p>
		</footer>
	</div>
	
<script type="text/javascript">
	
</script>
</body>
</html>