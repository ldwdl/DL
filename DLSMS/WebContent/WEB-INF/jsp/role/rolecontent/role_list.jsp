<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="<%=basePath %>js/role_js.js"></script>

<div style="margin-top: 30px;">
<table align="center" id="usersmstab" class="usersmstab">
  <thead id="usersmsthead" class="usersmsthead">
			<tr>
				<td>
					全选<input type="checkbox" id="selectdelall" onclick="checkdels()">
					
				</td>
				<td>
					序列号
				</td>
				<td>
					id
				</td>
				<td>
					角色名
				</td>
				
				<td>
					备注
				</td>
				<td colspan="3">
					操作
				</td>

			</tr>
	</thead>
	
	<tbody id="usersmstbody" class="usersmstbody">	
<c:forEach var="list" items="${list }" varStatus="status">			
			<tr>
				<td>
					<input type="checkbox" value="${list.roleId }" name="dels">
				</td>
				<td>
					${status.index + 1 }
				</td>
				<td>
					${list.roleId }
				</td>
				<td>
					${list.roleName }
				</td>
				
				<td>
					${list.roleRemark }
				</td>
				<td>
					<button onclick="del(${list.roleId },${page.pageNow},'/role/delByID')">删除</button>
				</td>
				<td>
					<button onclick="toupfindbyid(${list.roleId },${page.pageNow})">修改</button>
				</td>
				<td>
					<button onclick="toupfindbyid(${list.roleId },${page.pageNow})">设置权限</button>
				</td>
			
			</tr>	
			
	
</c:forEach>
	</tbody>	
	
</table>
<div style="width: 89%;margin-top: 10px;text-align: right;">
<div class="pager">
          <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="javascript:void(0)" onclick="rolesms(1)">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="javascript:void(0)" onclick="rolesms(${page.pageNow - 1})">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="javascript:void(0)" onclick="rolesms(1)">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="javascript:void(0)" onclick="rolesms(${page.pageNow})">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="javascript:void(0)" onclick="rolesms(${page.pageNow + 1})">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="javascript:void(0)" onclick="rolesms(${page.totalPageCount})">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="javascript:void(0)" onclick="rolesms(${page.pageNow})">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="javascript:void(0)" onclick="rolesms(${page.totalPageCount})">尾页</a>  
            </c:otherwise>  
        </c:choose> 
        
        <input type="text" size="3" id="go"><a href="javascript:void(0)" onclick="rolesms($('#go').val())">跳转</a>
       </div>
</div>




</div>


	

