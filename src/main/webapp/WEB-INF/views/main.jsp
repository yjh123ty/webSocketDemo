<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<%@ include file="/WEB-INF/views/commons/head.jsp" %>
<%@ include file="/WEB-INF/views/commons/head_amazeui.jsp" %>
<%@ include file="/WEB-INF/views/commons/head_easyui.jsp" %>
</head>
<body>
	<h1>主页</h1>
	<hr>
	<div>
		<a href="${ctx}/user/index.do">用户管理</a><br/>
		<a href="${ctx}/workflow/processDefinition.do">部署流程</a><br/>
		<a href="${ctx}/workflow/task.do">申请请假流程</a><br/>
	</div>
</body>
</html>