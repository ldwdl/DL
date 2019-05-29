<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div>
	<form action="" method="get">
		<table align="center" cellspacing="10px">
		
			<tr>
				<td>
					<label>类&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp型：</label>
				</td>
				<td>
				<script>
					function a(thisml){
						if($(thisml).prop("checked") == true){
							document.getElementById("parentMenu").disabled = true;
							document.getElementById("menuUrl").disabled = true;
						}else{
							
							return false;
						}
					}
					function b(thiscd){
						if($(thisml).prop("checked") == true){
							document.getElementById("parentMenu").disabled = true;
							document.getElementById("menuUrl").disabled = true;
						}else{
							
							return false;
						}
					}
					function c(thisan){
						if($(thisml).prop("checked") == true){
							document.getElementById("parentMenu").disabled = true;
							document.getElementById("menuUrl").disabled = true;
						}else{
							
							return false;
						}
					}
				
				</script>
					&nbsp&nbsp&nbsp&nbsp<label><input type="radio" name="menuType" id="ml" value="0" onload="a(this)" onclick="a(this)"/>目录</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<label><input type="radio" name="menuType" value="1" id="cd" onload="b(this)" onclick="b(this)"/>菜单</label>&nbsp&nbsp&nbsp&nbsp
					<label><input type="radio" name="menuType" value="2" id="an" onload="c(this)" onclick="c(this)"/>按钮</label>
					
				</td>
			</tr>
  
			<tr>
				<td>
					<label>上级菜单：</label>
				</td>
				<td>
					<input type="text" name="parentMenu" id="parentMenu" size="30" value="${menuup.name }" />
				
				</td>
				
			</tr>
			<tr>
				<td>
					<label>菜单名称：</label>
				</td>
				<td>
					<input type="text" name="menuName" id="menuName" value="${menuup.truename }"  size="30"/>
					<select name="menuName" id="menuName" style="display: none;">
						<option value="${menuup.truename }">${menuup.truename }</option>
						<option>首页</option>
						<option>用户管理系统</option>
					
					</select>
					
				</td>
				
			</tr>
			<tr>
				<td>
					<label>菜单地址：</label>
				</td>
				<td>
					<input type="text" name="menuUrl" id="menuUrl" value="${menuup.truename }"  size="30"/>
					
				</td>
				
			</tr>

			
			
			
			<tr>
				<td>
					<label>授权标识：</label>
				</td>
				<td>
					<input type="text" name="autTag" id="autTag"  value="${menuup.email }" size="30">
						
				</td>
			</tr>
			
			<tr>
				<td>
					<label>顺序号：</label>
				</td>
				<td>
					<input type="text"  value=""  name="password" id="password" placeholder="" size="30"/>
					
				</td>
			</tr>
			
			
			<tr >
				<td colspan="2" align="center">
					<input hidden="true" value="${menuup.creatdata}" id="creatdata">
					<input hidden="true" id="adduserdepage">
					<input type="button" onclick="submittomenu(${menuup.roleId })" value="提&nbsp&nbsp&nbsp&nbsp&nbsp交" style="padding:5px;width: 50%;background:red;border-style:none;border-radius: 5px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="menusms()" value="取&nbsp&nbsp&nbsp&nbsp&nbsp消" style="padding:5px;width: 50%;background:red;border-style:none;border-radius: 5px;">
				</td>
			</tr>
		
		</table>
		

	</form>
</div>