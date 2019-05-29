<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript" src="js/jquery.min.js"></script>

<script type="text/javascript">
	function a(){
		alert(1);
		$.ajax({
	       	 type:"post",
	       	 url:"<%=basePath %>welcome/toerror",
	       	 dataType:"html",
	       	 success:function(data){
	       		$("#a").html(data);
	           },   
	       	 error:function(data){
	                alert("提交失败！");
	                return false;
	           }   
		});
	}
</script>

</head>
<body>
<button onclick="a()">加载</button>
<div id="a"></div>

</body>

</html>
