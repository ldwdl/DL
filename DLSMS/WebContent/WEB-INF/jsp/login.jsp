<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆</title>

<style>


</style>

<script src="<%=basePath %>js/jquery.min.js"></script>
<script src="<%=basePath %>js/jquery.cookie.js"></script>

<script type="text/javascript">

	$(function() {
	
		if(!($.cookie("dlsms_name")&&$.cookie("dlsms_password"))){//cookie中没有用户信息时
			
		  }else{
			  $("#name").val($.cookie("dlsms_name"));
			  $("#password").val($.cookie("dlsms_password"));
		  }
	
	});
	
	function toregister(){
		window.location.href = "<%=path %>/welcome/toregister";
	}
	
	function sublogin(){
		$.ajax({
        	 type:"post",
        	 url:"user/login",
        	 data:{
        		 name:$("#name").val(),
        		 password:$("#password").val()
        		 },
        	 dataType:"text",
        	  
        	 success:function(data){
        		 if("登陆成功！"==data.split("-")[0]){
        			 setCookie(data.split("-")[1],data.split("-")[2]);
        			 window.location.href = "/DLSMS/welcome/tohome";
        		 }else{
        			 alert("用户名或密码不正确！");
        			 return false;
        		 }   
            },   
        	 error:function(data){
                 alert("提交失败！");
                 return false;
            }   
         });


	}


	 function getcookie(){
		  var name = $("#name").val();
		  var password = $("#password").val();
		  if($.cookie("dlsms_name")==name&&$.cookie("dlsms_password")==password){
			  
		  }else{
				$.cookie("dlsms_name",name, { expires: 1 }); // 存储一个带1天期限的 cookie
				$.cookie("dlsms_password",password, { expires: 1 }); // 存储一个带1天期限的 cookie 
				
		  }
	}
 
	 function setCookie(name,password) {  
		

		$.cookie("dlsms_name",name, { expires: 2 }); // 存储一个带1天期限的 cookie
		$.cookie("dlsms_password",password, { expires: 2 }); // 存储一个带1天期限的 cookie
		
		//读取cookie
		$.cookie("dlsms_name");
		
		//读取cookie
		$.cookie("dlsms_password");

		
	}   
	/*  验证输入  */

</script>


</head>


<body style="background-color: #00ddff">



<div id="login" style="margin-top:15%">
<div style="text-align: center;"><h1 style="">登&nbsp&nbsp&nbsp陆</h1></div>
<form action="" method="post">
	<table align="center" cellspacing="10px">
  
			<tr>
				<td>
					<label>用户账号：</label>
				</td>
				<td>
					<input type="text" name="name" id="name" placeholder="请输入账号"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<label>密&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码 ：</label>
				</td>
				<td>
					<input type="password" name="password" id="password" placeholder="请输入密码"/>
				</td>
			</tr>
			
			<tr >
				<td colspan="2" align="center">
					<input type="button" id="loginbut" onclick="sublogin()" value="登&nbsp&nbsp&nbsp&nbsp&nbsp录" style="padding:5px;width: 50%;background:red;border-style:none;border-radius: 5px;">
				</td>
				
			</tr>
			<tr >
				<td colspan="2" align="center">
					<input type="button" value="注&nbsp&nbsp&nbsp&nbsp&nbsp册" style="padding:5px;width: 50%;background:red;border-style:none;border-radius: 5px;"
							onclick="toregister()">
				</td>
				
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					忘记密码->&nbsp<a href="javascript:void(0)" onclick="toregister()">修改密码</a>
				</td>
				
			</tr>
		
	</table>
</form>

</div>



</body>
</html>