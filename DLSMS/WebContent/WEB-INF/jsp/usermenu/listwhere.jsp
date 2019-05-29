<%@ page language="java" contentType="text/html; charset=utf-8"%>
<div id="onedl" style="width: 100%;height: 50%;">
<dl>
  <dt>
  	用户名:<input type="text" class="findinput" name="findname" id="findname" size="5"/>
  </dt>
 
  <dt> 
  	姓名:<input  type="text" class="findinput" name="findtruename" id="findtruename" size="5"/>
  </dt>
  
  <dt> 
  	创建时间从:<input type="date" class="findinput" name="mincreatdata" id="mincreatdata" size="5" />
  		 到:<input type="date" class="findinput" name="maxcreatdata" id="maxcreatdata" size="5"/>
  </dt>
  
  
</dl>
<dl>
	<dt> 
  	性别:<select id="findsex" style= "font-size: 25px;">
  		<option></option>
  		<option value="1">男</option>
  		<option value="0">女</option>
  	</select>
  	</dt>
</dl>
	
  
</div>

<div style="width: 90%;margin-top: 20px;text-align: right;">

 	<input type="button" size="10" value="查询" onclick="findwheres(1)" />
 	<input type="button" size="10" value="重置" onclick="clearwhere()" />
 	<input type="button" size="10" value="新增" onclick="toadduser()" />
 	<input type="button" size="10" value="批量删除" onclick="roledels('/user/usersmsdels')" />


</div>


