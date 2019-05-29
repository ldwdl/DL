<%@ page language="java" contentType="text/html; charset=utf-8"%>
<div id="onedl" style="width: 100%;height: 50%;">
<dl>

 
  <dt> 
  	菜单名称:<input  type="text" class="findinput" name="findmenuname" id="findmenuname" size="5"/>
  </dt>
  

	
  
</div>

<div style="width: 90%;margin-top: 20px;text-align: right;">

 	<input type="button" size="10" value="查询" onclick="menusms(1)" />
 	<input type="button" size="10" value="重置" onclick="clearwhere()" />
 	<input type="button" size="10" value="新增" onclick="tomenuadd()" />
 	<input type="button" size="10" value="批量删除" onclick="roledels('/menu/delsByID')" /><!--可传url去执行不同的方法降低重复性  -->


</div>