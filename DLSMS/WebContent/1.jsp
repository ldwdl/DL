<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">

function a(){

	var b =document.getElementById("a").innerHTML;
	alert(b);
	var a = $("#a").html();
	alert(a);
	}


</script>

<style type="text/css">
#div1 {
	display:none;

left: 50%;
top:50%;
margin-left:500px;
margin-top:500px;
}
</style>
<script type="text/javascript">


function but(){
	$("div1").show();
}

</script>

</head>
<body>
<form action="view/index" method="get" >
	id:<input type="text" name="id" size="15"/><br/>
	name:<input type="text" name="name" size="15"/><br/>
	pasw:<input type="password" name="password" size="15"/><br/>
	<input type="submit" value="提交">
	
</form>


<div id="a">www</div>
<a href="javascript:void(0)" onclick="a()" >
	<h1><%=basePath %></h1>
	</a>
	
	
<div id="div1">aaaaaa</div>
<button id="bu" onclick="but()">按钮</button>

</body>
</html>