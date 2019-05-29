
function submittomenu(id){                                              //提交增加或修改
	$("#menuType").val()
	
	if(id){
		if(window.confirm('你确定要修改吗？')){
            
        }else{
           //alert("取消");
           return false;
       	}
		alert(id);
		$.ajax({
	       	 type:"post",
	       	 url:"role/updateByrole",
	       	 data:{
	       		 	"roleId":id,
	       		 	menuName:$("#menuName").val(),
	     			parentMenu:$("#parentMenu").val(),
	     			menuUrl:$("#menuUrl").val(),
	     			autTag:$("#autTag").val(),
	     			menuType:$("input[name='menuType']:checked").val()
	       	 },
	       	 dataType:"text",
	       	 success:function(data){
	       		 alert(data);
	       		menusms();
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
		       	 url:"menu/save",
		       	 data:{
		       			
		       			menuName:$("#menuName").val(),
		     			parentMenu:$("#parentMenu").val(),
		     			menuUrl:$("#menuUrl").val(),
		     			autTag:$("#autTag").val(),
		     			menuType:$("input[name='menuType']:checked").val()
		       	 },
		       	 dataType:"text",
		       	 success:function(data){
		       		alert(data);
		       		menusms();
		           },   
		       	 error:function(data){
		                alert("提交失败！");
		                return false;
		           }   
			});
	}	
}

function tomenuadd(){                                                        //载入menu表的添加页面
	
	
	$.ajax({
      	 type:"post",
      	 url:"tomenuadd",
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

function menusms(page){                                                           //menu表分页查询
//	alert(page);
	updCatalogue(3);
	if(page)        //有页码时加载页码数据
	{
		var findmenuname = $("#findmenuname").val();
		
		$.ajax({
		   	 type:"post",
		   	 url:"menu/findPaging",
		   	data:{
		   		 pageNow:page,
		   		"menuName":findmenuname
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
		   	 url:"menu/findPaging",
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
