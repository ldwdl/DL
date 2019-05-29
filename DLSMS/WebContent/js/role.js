
function updeloraddrole(thisrole,userid){                             //设置角色

	if($(thisrole).prop("checked") == true){
		if(window.confirm('你确定要增加角色吗？')){                        //ajax提交增加userrole表信息
			$.ajax({
		      	 type:"post",
		      	 url:"role/upAddRole",
		      	 data:{
		      		 roleId:$(thisrole).val(),
		      		 userId:userid
		      		 },
		      	 dataType:"text",
		      	 success:function(data){
		      		alert(data);
		          },   
		      	 error:function(data){
		               alert("提交失败！");
		               return false;
		          }   
			});

			
			
			 }else{
				 $(thisrole).prop("checked",false);
		         return false;
			 }
	}else{
//		alert($(thisrole).val());
//		alert(userid);
		if(window.confirm('你确定要删除角色吗？')){                        //ajax提交删除userrole表信息
			$.ajax({
		      	 type:"post",
		      	 url:"role/upDelRole",
		      	 data:{
		      		 roleId:$(thisrole).val(),
		      		 userId:userid
		      		 },
		      	 dataType:"text",
		      	 success:function(data){
		      		alert(data);
		          },   
		      	 error:function(data){
		               alert("提交失败！");
		               return false;
		          }   
			});
		
		 }else{
			 $(thisrole).prop("checked",true);;
	            return false;
		 }
	}
}


function getUserRole(userid,truenamees){                                                       //查询出用户已有哪些角色
//	alert(userid);
	$.ajax({
	   	 type:"post",
	   	 url:"role/roleFindAll",
	   	 data:{
	   		 "userid":userid
	   		 },
	   	 dataType:"json",
	   	 success:function(data){
//	   		 alert(userid);
//	   		 alert(data.list.roleId);
			$("#spanname").html(truenamees);
			console.log(data.list);
	   		$("#test tbody").html("");
	   		var item=null;			
	   		$.each(data.listrole,function (i,listrole) {
	   			item=
   					"<tr>"+
	   				"<td>"+
					"<input type='checkbox' onclick='updeloraddrole(this,"+userid+")' value="+listrole.roleId+" name='roleid'>"+
					"</td>"
	   				+"<td>"+i+"</td><td>"+listrole.roleId+"</td><td>"+listrole.roleName+"</td><td>"+listrole.roleRemark+"</td></tr>";
	   			$.each(data.list,function (j,list) {
	   				if(list.roleId == listrole.roleId){
		   			   item="<tr>"+
			   				"<td>"+
							"<input type='checkbox' checked='checked' onclick='updeloraddrole(this,"+userid+")'  value="+listrole.roleId+" name='roleid'>"+
							"</td>"
			   				+"<td>"+i+"</td><td>"+listrole.roleId+"</td><td>"+listrole.roleName+"</td><td>"+listrole.roleRemark+"</td></tr>";
	   				}
	   			});	
	   			$("#test tbody").append(item);
	   	    
	   		});
	       },   
	   	 error:function(data){
	            alert("提交失败！");
	            return false;
	       }   
	});
	


}

function touserSetRole(userid,truenamees){ 							//中间跳转显示查询用户已有角色
//	alert(truenamees+"-----"+userid);
	$('#myModal').modal('show');
	getUserRole(userid,truenamees);
}

function toupfindbyid(id,page){                                            //查询要修改的id所有信息
//	alert(id);
	$.ajax({
      	 type:"post",
      	 url:"role/toupfindbyid",
      	 data:{roleId:id},
      	 dataType:"html",
      	 success:function(data){
      		$("#center_rigth").html(data);
          },   
      	 error:function(data){
               alert("提交失败！");
               return false;
          }   
	});
}


function submittorole(id){                                              //提交增加或修改
	if(id){
		if(window.confirm('你确定要修改吗？')){
            
        }else{
           //alert("取消");
           return false;
       	}
//		alert(id);
		$.ajax({
	       	 type:"post",
	       	 url:"role/updateByrole",
	       	 data:{
	       		 	"roleId":id,
	       	 		"roleName":$("#roleName").val(),
	       	 		"roleRemark":$("#roleRemark").val()
	       	 },
	       	 dataType:"text",
	       	 success:function(data){
	       		 alert(data);
	       		rolesms();
	           },   
	       	 error:function(data){
	                alert("提交失败！");
	                return false;
	           }   
		});
		
	}else{
		if(window.confirm('你确定要增加吗？')){
            
        }else{
           //alert("取消");
           return false;
       }
		$.ajax({
		  type:"post",
		       	 url:"role/save",
		       	 data:{
		       		 
		       		 roleName:$("#roleName").val(),
		       		roleRemark:$("#roleRemark").val(),
		       	 },
		       	 dataType:"text",
		       	 success:function(data){
		       		alert(data);
		       		rolesms();
		           },   
		       	 error:function(data){
		                alert("提交失败！");
		                return false;
		           }   
			});
	}	
}

function toroleadd(){                                                        //载入role表的添加页面
	$.ajax({
      	 type:"post",
      	 url:"toroleadd",
      	 dataType:"html",
      	 success:function(data){
      		$("#center_rigth").html(data);
          },   
      	 error:function(data){
               alert("跳转失败！");
               return false;
          }   
	});
}

function del(id,page,url){                                                    //按当前页码删除单条数据
	var confirmdel= confirm('确认要删除吗?'); 
	url = "/welcome"+url;
		if(confirmdel)
		{ 
			$.ajax
			({
		      	 type:"post",
		      	 url:url,
		      	 data:{id:id},
		      	 dataType:"text",
		      	 success:function(data){
		      		 if(url == "role/delByID"){
		      			rolesms(page);
		      			alert("删除成功!");
		      			return true;
		      		 }else if(url == "menu/delByID"){
		      			menusms(page);
		      			alert("删除成功!");
		      			return true;
		      		 }else{
		      			return false;
		      		 }
		      		
		      		 
		          },   
		      	 error:function(data){
		               alert("提交失败！");
		               return false;
		          }   
			});
		}
}

function roledels(url){                                                         //批量删除（url作用：降重复）
	var checkData = new Array();//获取被选中id
	$('input[name="dels"]').each(function(){
		if($(this).is(':checked')){
			checkData.push($(this).val()); 
		}
	});	
	
	if(checkData != ''){
		var confirmdel= confirm('确认要删除吗?'); 
		if(confirmdel){ 
			var url = url;	
			//ajax提交
			$.ajax({
				url:url,
				type: "Post",
				data:{
					ids:checkData
					}, 
				traditional: true,//这里设置为true
				dataType:"text",
				 
			   	 success:function(data){
			   		 if(data == "删除成功！"){
			   			 	alert(data);
					   		rolesms();
			   		 }else if(data == "menu删除成功！"){
			   			alert("删除成功！");
			   			 menusms();
			   		 }else{
			   			usersms();
			   		 }
			   		
			       },   
			   	 error:function(data){
			            alert("提交失败！");
			            return false;
			       }
			});
		}
	}else{
		alert("请到左侧栏选择删除对象！");
	}
}

function checkrole(){
	if($("#selectdelallrole").is(':checked')){
		$('input[name="roleid"]').each(function(){
				$(this).prop("checked",true);
			});
	}else{
		$('input[name="roleid"]').each(function(){
				$(this).prop("checked",false);
			});
	}
}

function checkdels(){

	if($("#selectdelall").is(':checked')){

		$('input[name="dels"]').each(function(){
				$(this).prop("checked",true);
			});
	}else{

		$('input[name="dels"]').each(function(){
				$(this).prop("checked",false);
			});
	}
}


function rolesms(page){                                                           //角色表分页查询
	updCatalogue(2);
	if(page)        //有页码时加载页码数据
	{
		var findrolename = $("#findrolename").val();
		
		$.ajax({
		   	 type:"post",
		   	 url:"role/findPaging",
		   	data:{
		   		 pageNow:page,
		   		"roleName":findrolename
		   	 },
		   	 dataType:"html",
		   	 success:function(data){
		   		 $("#rigth_bottom").html(data);
		       },   
		   	 error:function(data){
		            alert("提交失败！");
		            return false;
		       }   
		});
		
	}
	else                         //无页码时，默认加载第一页
	{
		$.ajax({
		   	 type:"post",
		   	 url:"role/findPaging",
		   	 dataType:"html",
		   	 success:function(data){
//		   		 alert(data);
		   		 $("#center_rigth").html(data);
		       },   
		   	 error:function(data){
		            alert("提交失败！");
		            return false;
		       }   
		});
		
	}
	
}

