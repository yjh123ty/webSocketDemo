<%@page import="org.xdemo.example.websocket.entity.User"%>
<%@page import="org.xdemo.example.websocket.utils.UserContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</a>
				<span class="brand">用户面板</span>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
								<i class="icon-user"></i>
									${user.name}
								<i class="caret"></i>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a tabindex="-1" href="#">Profile</a>
								</li>
								<li class="divider"></li>
								<li>
									<a tabindex="-1" href="${ctx}/user/logout.do">退出登录</a>
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
