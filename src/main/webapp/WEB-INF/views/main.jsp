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
					<div class="alert alert-success">
						<button class="close" type="button" data-dismiss="alert">×</button>
						<h4>Success</h4>
						The operation completed successfully
					</div>
					
					<!-- 面包屑 -->
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
					<!-- 面包屑 end -->
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
			<!-- content end -->
			
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