<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div>
	<form action="<%=path %>/welcome/user/register" method="get">
		<table align="center" cellspacing="10px">
  
			<tr>
				<td>
					<label>账&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号：</label>
				</td>
				<td>
					<input type="text" name="name" id="name" size="30" value="${userup.name }" placeholder="请输入3-6个字母数字组合" maxlength="7" onblur="nameps()"/>
					<span id="nameps"></span>
				</td>
				
			</tr>
			<tr>
				<td>
					<label>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名：</label>
				</td>
				<td>
					<input type="text" name="username" id="username" value="${userup.truename }"  size="30" placeholder="请输入姓名全拼音小写" maxlength="25" onblur="usernameps()"/>
					<span id="usernameps"></span>
				</td>
				
			</tr>

			<tr>
				<td>
					<label>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别：</label>
				</td>
				<td>
					&nbsp&nbsp&nbsp&nbsp<label><input type="radio" checked="checked" name="sex" id="sex" value="1"/>男</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<label><input type="radio" name="sex" value="0" />女</label>
					<span id="sexps"></span>
				</td>
			</tr>
			
			
			<tr>
				<td>
					<label>邮&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp箱：</label>
				</td>
				<td>
					<input type="text" name="email" id="email"  value="${userup.email }"  placeholder="请输入你的邮箱" size="30">
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
					<textarea name="remark" id="remark" placeholder="500字符以内" maxlength="50" rows="3" cols="27">${userup.remark }</textarea>
						
				</td>
			</tr>
			<tr>
				<td>
					<label>密&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码：</label>
				</td>
				<td>
					<input type="password"  value="${userup.password }"  name="password" id="password" placeholder="请输入6-16个字符" onblur="passWord1ps()" size="30"/>
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
					<input hidden="true" value="${userup.creatdata}" id="creatdata">
					<input hidden="true" id="adduserdepage">
					<input type="button" onclick="formsubmit(${userup.id });" value="提&nbsp&nbsp&nbsp&nbsp&nbsp交" style="padding:5px;width: 50%;background:red;border-style:none;border-radius: 5px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="usersms()" value="取&nbsp&nbsp&nbsp&nbsp&nbsp消" style="padding:5px;width: 50%;background:red;border-style:none;border-radius: 5px;">
				</td>
			</tr>
		
		</table>
		

	</form>
</div>