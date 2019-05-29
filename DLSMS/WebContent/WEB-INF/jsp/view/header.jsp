<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<a href="javascript:void(0)" onclick="home()" style="left: 20px;display: block;position: fixed;">
	<img alt="" src="<%=basePath %>js/image/home.jpg" title="回到首页" style="height: 100px;">
	</a>

<div style="rigth:0px;text-align: right;">
	
	<div style="margin-right: 60px">
		<h1>welcome:   ${user.name }!</h1>
		<a href="<%=path %>/welcome/tologin">切换账号</a>
		<a href="<%=path %>/welcome/toregister">注册</a>
		<a href="<%=path %>/welcome/hometologin">退出</a>
	</div>
</div>


<hr>


