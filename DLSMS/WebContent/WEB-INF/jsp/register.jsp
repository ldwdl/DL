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
<script src="<%=basePath %>js/jquery.min.js"></script>
<script>
function nameps(){
	var userName = $("#name");
	var nameps = document.getElementById("nameps");
	if(userName.val() && userName.val().length >= 3){
		//定义验证规则，由于字符串数字和字母的顺序可能不同。
		//也有可能字母和数字中间还包含了其他字符。故将验证规则分开定义。
		var regNumber = /\d+/; //验证0-9的任意数字最少出现1次。
		var regString = /[a-zA-Z]+/; //验证大小写26个字母任意字母最少出现1次。
		if (regNumber.test(userName.val()) && regString.test(userName.val()) ) {
			
			
			nameps.innerHTML = "<span style='color:green;'>√！</span>";
		    return true;
		}else{
			nameps.innerHTML = "<span style='color:red;'>×！</span>";
		    return false;
		}
	}else{
		nameps.innerHTML = "<span style='color:red;'>×！</span>";
		return false;
	}

}

function usernameps(){
	var userName = $("#username");
	var nameps = document.getElementById("usernameps");
	if(userName.val() && userName.val().length >= 3){
		//定义验证规则，由于字符串数字和字母的顺序可能不同。
		//也有可能字母和数字中间还包含了其他字符。故将验证规则分开定义。
		var regString = /[a-z]+/; //验证大小写26个字母任意字母最少出现1次。
		if (regString.test(userName.val()) ) {
			
			
			nameps.innerHTML = "<span style='color:green;'>√！</span>";
		    return true;
		}else{
			nameps.innerHTML = "<span style='color:red;'>×！</span>";
		    return false;
		}
	}else{
		nameps.innerHTML = "<span style='color:red;'>×！</span>";
		return false;
	}

}

function passWord1ps(){

	var passWord1 = document.getElementById("password");
	var passWord1ps = document.getElementById("passWord1ps");
	if(passWord1.value && passWord1.value.length >=6){
		passWord1ps.innerHTML = "<span style='color:green;'>√！</span>";
		return true;
	}else{
		passWord1ps.innerHTML = "<span style='color:red;'>×！</span>";
		return false;
	}
}

function passWord2ps(){
	var passWord2 = document.getElementById("passWord2");
	var passWord1 = document.getElementById("password");
	var passWord2ps = document.getElementById("passWord2ps");
	if(passWord2.value == passWord1.value && passWord2.value){
		passWord2ps.innerHTML = "<span style='color:green;'>√！</span>";
		return true;
	}else{
		passWord2ps.innerHTML = "<span style='color:red;'>×！</span>";
		return false;
	}
}

function formsubmit(){
	if(nameps() && passWord1ps() && passWord2ps()){
		document.forms[0].submit();
	}else{
		alert("信息有误，请检查！");
	}
	
}

</script>

</head>
<body style="background-color: #00ddff">

<div id="register" style="margin-top:10%">
	
<div style="text-align: center;"><h1 style="">注&nbsp&nbsp&nbsp册</h1></div>


<div id="centers" style="">
<div>
	<form action="<%=path %>/welcome/user/register" method="get">
		<table align="center" cellspacing="10px">
  
			<tr>
				<td>
					<label>注册账号：</label>
				</td>
				<td>
					<input type="text" name="name" id="name" size="30" placeholder="请输入3-6个字母数字组合" maxlength="7" onblur="nameps()"/>
					<span id="nameps"></span>
				</td>
				
			</tr>
			<tr>
				<td>
					<label>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名：</label>
				</td>
				<td>
					<input type="text" name="username" id="username" size="30" placeholder="请输入姓名全拼音小写" maxlength="25" onblur="usernameps()"/>
					<span id="usernameps"></span>
				</td>
				
			</tr>

			<tr>
				<td>
					<label>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别：</label>
				</td>
				<td>
					&nbsp&nbsp&nbsp&nbsp<label><input type="radio" name="sex" value="1"/>男</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<label><input type="radio" name="sex" value="0" />女</label>
					<span id="sexps"></span>
				</td>
			</tr>
			<tr>
				<td>
					<label>电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话：</label>
				</td>
				<td>
					<input type="text" name="phone" size="30">
				</td>
			</tr>
			
			<tr>
				<td>
					<label>邮&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp箱：</label>
				</td>
				<td>
					<input type="text" name="email" placeholder="请输入你的邮箱" size="30">
						<span>
							<select id="emailsel">
								<option value="@chinasie.com">@chinasie.com</option>
								<option value="@qq.com">@qq.com</option>
								<option value="@163.com">@163.com</option>
							</select>
						</span>
				</td>
			</tr>
			<tr>
				<td>
					<label>备&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp注：</label>
				</td>
				<td>
					<textarea name="remark" placeholder="500字符以内" maxlength="50" rows="3" cols="27"></textarea>
						
				</td>
			</tr>
			<tr>
				<td>
					<label>密&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码：</label>
				</td>
				<td>
					<input type="password" name="password" id="password" placeholder="请输入6-16个字符" onblur="passWord1ps()" size="30"/>
					<span id="passWord1ps"></span>
				</td>
			</tr>
			<tr>
				<td>
					<label>确认密码：</label>
				</td>
				<td>
					<input type="password" name="passWord2" id="passWord2" placeholder="请再次确认密码" onblur="passWord2ps()" size="30"/>
					<span id="passWord2ps"></span>
				</td>
			</tr>
			
			<tr >
				<td colspan="2" align="center">
					<input type="button" onclick="formsubmit()" value="注&nbsp&nbsp&nbsp&nbsp&nbsp册" style="padding:5px;width: 50%;background:red;border-style:none;border-radius: 5px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					已有账号->&nbsp<a href="<%=path %>/welcome/tologin" >跳转登录</a>
				</td>
			</tr>
		
		</table>
		

	</form>
</div>
</div>

</div>

</body>
</html>