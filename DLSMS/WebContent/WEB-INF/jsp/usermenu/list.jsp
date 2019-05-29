<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div style="margin-top: 30px;">
<table align="center" id="usersmstab" class="usersmstab">
  <thead id="usersmsthead" class="usersmsthead">
			<tr>
				<td>
					全选<input type="checkbox"  id="selectdelall" onclick="checkdels()">
				</td>
				<td>
					序列号
				</td>
				<td>
					id
				</td>
				<td>
					账号
				</td>
				<td>
					姓名
				</td>
				<td>
					性别
				</td>
				<td>
					创建时间
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
					<input type="checkbox" value="${list.id }" name="dels">
				</td>
				<td>
					${status.index + 1 }
				</td>
				<td>
					${list.id }
				</td>
				<td>
					${list.name }
				</td>
				<td>
					${list.truename }
				</td>
				<td>
					<c:choose>  
           			 	<c:when test="${list.sex  == '1'}">  
                		<span>男</span>
           				 </c:when>  
            			<c:when test="${list.sex  == '0'}">  
               			<span>女</span>
            			</c:when>  
            			<c:otherwise>  
                			
            			</c:otherwise>
        			</c:choose>  
					
				</td>
				<td>
				<fmt:formatDate value="${list.creatdata }" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
					
				</td>
				<td>
					${list.remark }
				</td>
				<td>
					<button onclick="usersmsdel(${list.id },${page.pageNow})">删除</button>
				</td>
				<td>
					<button onclick="upfindbyid(${list.id },${page.pageNow})">修改</button>
				</td>
				<td>
					<button onclick="touserSetRole(${list.id },'${list.truename }')">设置角色</button>
				</td>
			
			</tr>	
			
	
</c:forEach>
	</tbody>	
	
</table>
<div style="width: 89%;margin-top: 10px;text-align: right;">
<div class="pager">
          <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="javascript:void(0)" onclick="homepage(1)">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="javascript:void(0)" onclick="homepage(${page.pageNow - 1})">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="javascript:void(0)" onclick="homepage(1)">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="javascript:void(0)" onclick="homepage(${page.pageNow})">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="javascript:void(0)" onclick="homepage(${page.pageNow + 1})">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="javascript:void(0)" onclick="homepage(${page.totalPageCount})">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="javascript:void(0)" onclick="homepage(${page.pageNow})">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="javascript:void(0)" onclick="homepage(${page.totalPageCount})">尾页</a>  
            </c:otherwise>  
        </c:choose> 
        
        <input type="text" size="3" id="go"><a href="javascript:void(0)" onclick="homepage($('#go').val())">跳转</a>
       </div>
</div>




</div>

<!--设置角色弹出框  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					设置< <span id="spanname"></span> >的角色
				</h4>
			</div>
			<div class="modal-body" >
				<div id="userrole"> 
					<table id="test" class="usersmsthead">
					      <thead class="usersmsthead">
					             <tr><th>
									
									</th>
								<th>序号</th><th>id</th><th>角色名</th><th>备注</th></tr>
					       </thead>
					       <tbody>
					        </tbody>
					</table>

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">确认
				</button>
				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>


	

