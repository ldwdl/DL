<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<table align="center" cellspacing="20px">
  
			<tr>
				<td>
					<label>角色名：</label>
				</td>
				<td>
					<input type="text" name="roleName" id="roleName" value="${roleup.roleName }" size="30"/>
					
				</td>
				
			</tr>
			<tr>
				<td>
					<label>备注：</label>
				</td>
				<td>
					<input type="text" name="roleRemark" id="roleRemark" value="${roleup.roleRemark }" size="30" />
					
				</td>
				
			</tr>
			
			<tr >
				<td colspan="2" align="center">
					
					<input hidden="true" id="adduserdepage">
					<input type="button" onclick="submittorole(${roleup.roleId })" value="提&nbsp&nbsp&nbsp&nbsp&nbsp交" style="padding:5px;width: 50%;background:red;border-style:none;border-radius: 5px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="rolesms()" value="取&nbsp&nbsp&nbsp&nbsp&nbsp消" style="padding:5px;width: 50%;background:red;border-style:none;border-radius: 5px;">
				</td>
			</tr>
</table>
