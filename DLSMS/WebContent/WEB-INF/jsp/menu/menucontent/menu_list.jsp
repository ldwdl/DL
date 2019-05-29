<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
					菜单名称
				</td>
				
				<td>
					上级菜单
				</td>
				<td>
					地址
				</td>
				<td>
					授权标识
				</td>
				<td>
					类型
				</td>
				<td colspan="2">
					操作
				</td>

			</tr>
	</thead>
	
	<tbody id="usersmstbody" class="usersmstbody">	
<c:forEach var="list" items="${list }" varStatus="status">			
			<tr>
				<td>
					<input type="checkbox" value="${list.menuId }" name="dels">
				</td>
				<td>
					${status.index + 1 }
				</td>
				<td>
					${list.menuId }
				</td>
				<td>
					${list.menuName }
				</td>
				
				<td>
					${list.parentMenu }
				</td>
				<td>
					${list.menuUrl }
				</td>
				<td>
					${list.autTag }
				</td>
				<td>
					<c:choose>  
           			 	<c:when test="${list.menuType  == '0'}">  
                		<span>目录</span>
           				 </c:when>  
            			<c:when test="${list.menuType  == '1'}">  
               			<span>菜单</span>
            			</c:when>  
            			<c:when test="${list.menuType  == '2'}">  
               			<span>按钮</span>
            			</c:when>  
            			<c:otherwise>  
                			
            			</c:otherwise>
        			</c:choose>  
					
				</td>                   
				<td>
					<button onclick="del(${list.menuId },${page.pageNow},'/menu/delByID')">删除</button>
				</td>
				<td>
					<button onclick="toupfindbyid(${list.menuId },${page.pageNow})">修改</button>
				</td>
			
			</tr>	
			
	
</c:forEach>
	</tbody>	
	
</table>
<div style="width: 89%;margin-top: 10px;text-align: right;">
<div class="pager">
          <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="javascript:void(0)" onclick="menusms(1)">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="javascript:void(0)" onclick="menusms(${page.pageNow - 1})">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="javascript:void(0)" onclick="menusms(1)">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="javascript:void(0)" onclick="menusms(${page.pageNow})">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="javascript:void(0)" onclick="menusms(${page.pageNow + 1})">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="javascript:void(0)" onclick="menusms(${page.totalPageCount})">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="javascript:void(0)" onclick="menusms(${page.pageNow})">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="javascript:void(0)" onclick="menusms(${page.totalPageCount})">尾页</a>  
            </c:otherwise>  
        </c:choose> 
        
        <input type="text" size="3" id="go"><a href="javascript:void(0)" onclick="menusms($('#go').val())">跳转</a>
       </div>
</div>




</div>


	

