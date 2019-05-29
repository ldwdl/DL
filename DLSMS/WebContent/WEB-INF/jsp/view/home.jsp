<%@ page language="java" contentType="text/html; charset=utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%-- <script src="<%=basePath %>js/jquery.min.js"></script>
<script src="<%=basePath %>js/role_js.js"></script> --%>

<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<!-- menu  -->

<script>

function updCatalogue(flag){
	$("#catalogueDL").empty();
	var item = "<dt>"+
	"<a href='javascript:void(0)' onclick='home()' >首页</a>"+
	"</dt>";
	if(flag == 1){
		item += "<dt>"+
		"<a href='javascript:void(0)' onclick='usersms()' >用户管理</a>"+
		"</dt>";
	}else if(flag == 2){
		item += "<dt>"+
		"<a href='javascript:void(0)' onclick='rolesms()' >角色管理</a>"+
		"</dt>";
	}else if(flag == 3){
		item += "<dt>"+
		"<a href='javascript:void(0)' onclick='menusms()' >菜单管理</a>"+
		"</dt>";
	}else{//flag == 0 首页
		item = "<dt>"+
		"<a href='javascript:void(0)' onclick='home()' >首页</a>"+
		"</dt>";
	}
		
	$("#catalogueDL").append(item);
}


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
	       	 url:"<%=basePath %>welcome/role/updateByrole",
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
		       	 url:"<%=basePath %>welcome/menu/save",
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
      	 url:"<%=basePath %>welcome/tomenuadd",
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
		   	 url:"<%=basePath %>welcome/menu/findPaging",
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
		   	 url:"<%=basePath %>welcome/menu/findPaging",
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

</script>


<!--role  -->
<script type="text/javascript">

function updeloraddrole(thisrole,userid){                             //设置角色

	if($(thisrole).prop("checked") == true){
		if(window.confirm('你确定要增加角色吗？')){                        //ajax提交增加userrole表信息
			$.ajax({
		      	 type:"post",
		      	 url:"<%=basePath %>welcome/role/upAddRole",
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
		      	 url:"<%=basePath %>welcome/role/upDelRole",
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
	   	 url:"<%=basePath %>welcome/role/roleFindAll",
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
      	 url:"<%=basePath %>welcome/role/toupfindbyid",
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
	       	 url:"<%=basePath %>welcome/role/updateByrole",
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
		       	 url:"<%=basePath %>welcome/role/save",
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
      	 url:"<%=basePath %>welcome/toroleadd",
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
	url = "<%=basePath %>welcome"+url;
		if(confirmdel)
		{ 
			$.ajax
			({
		      	 type:"post",
		      	 url:url,
		      	 data:{id:id},
		      	 dataType:"text",
		      	 success:function(data){
		      		 if(url == "<%=basePath %>welcome/role/delByID"){
		      			rolesms(page);
		      			alert("删除成功!");
		      			return true;
		      		 }else if(url == "<%=basePath %>welcome/menu/delByID"){
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
			var url = "<%=basePath %>welcome" + url;	
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
		   	 url:"<%=basePath %>welcome/role/findPaging",
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
		   	 url:"<%=basePath %>welcome/role/findPaging",
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

</script>

<!--分页  -->
<script>

function homepage(page){
	
	var findname = $("#findname").val();
	var findtruename = $("#findtruename").val();
	var mincreatdata = $("#mincreatdata").val();
	var maxcreatdata = $("#maxcreatdata").val();
	var findsex = $("#findsex").val();
	
	$.ajax({
   	 type:"post",
   	 url:"<%=basePath %>welcome/user/findNewsPage",
   	 data:{
   		 pageNow:page,
   		findname:findname,
		findtruename:findtruename,
		mincreatdata:mincreatdata,
		maxcreatdata:maxcreatdata,
		findsex:findsex   	 
   	 },
   	 dataType:"html",
   	 success:function(data){
//   		 alert(data);
   		 $("#rigth_bottom").html(data);

       },   
   	 error:function(data){
            alert("提交失败！");
            return false;
       }   
	});
}

</script>


<!-- 新增 -->
<script>
function nameps(pass){           //验证输入信息是否合格
	
	var userName = $("#name");
	var nameps = document.getElementById("nameps");
	if(userName.val() && userName.val().length >= 3){
		//定义验证规则，由于字符串数字和字母的顺序可能不同。
		//也有可能字母和数字中间还包含了其他字符。故将验证规则分开定义。
		var regNumber = /\d+/; //验证0-9的任意数字最少出现1次。
		var regString = /[a-zA-Z]+/; //验证大小写26个字母任意字母最少出现1次。
		if (regNumber.test(userName.val()) && regString.test(userName.val()) ) {
				$.ajax({                                                            //查询是否有重复的账号
			       	 type:"post",
			       	 url:"<%=basePath %>welcome/user/userFindByName",
			       	 async:false,
			       	 data:{
			       		 "name":userName.val()
			       		 },
			       	 dataType:"text",
			       	 success:function(data){
			       		
			       		 if(data == "用户名可用！"){
			       			pass = true;
			       			nameps.innerHTML = "<span style='color:green;'>√！</span>";
						   
			       		 }else{
			       			 alert("用户名已存在！");
			       			 pass=false;
			       			nameps.innerHTML = "<span style='color:red;'>×！</span>";
			       		 }
			           },   
			       	 error:function(data){
			                alert("提交失败！");
			                return false;
			           }   
				});
				return pass;
		}else{
			alert("用户名格式不对！");
			nameps.innerHTML = "<span style='color:red;'>×！</span>";
		    return false;
		}
	}else{
		alert("用户名格式不对！");
		nameps.innerHTML = "<span style='color:red;'>×！</span>";
		return false;
	}

}

function usernameps(){                                                           //验证输入信息是否合格
	var userName = $("#username");
	
	var nameps = document.getElementById("usernameps");
	if(userName.val() && userName.val().length >= 3){
		//定义验证规则，由于字符串数字和字母的顺序可能不同。
		//也有可能字母和数字中间还包含了其他字符。故将验证规则分开定义。
		var regNumber = /\d+/;
		var regString = /[a-z]+/; //验证大小写26个字母任意字母最少出现1次。
		if (regString.test(userName.val()) ) {
			
			nameps.innerHTML = "<span style='color:green;'>√！</span>";
			$("#email").val(userName.val().toUpperCase());
		    return 1;
		}else{
			nameps.innerHTML = "<span style='color:red;'>×！</span>";
		    return false;
		}
	}else{
		nameps.innerHTML = "<span style='color:red;'>×！</span>";
		return false;
	}

}

function passWord1ps(){                                                               //验证输入信息是否合格

	var passWord1 = document.getElementById("password");
	var passWord1ps = document.getElementById("passWord1ps");
	if(passWord1.value && passWord1.value.length >=6){
		passWord1ps.innerHTML = "<span style='color:green;'>√！</span>";
		return 1;
	}else{
		passWord1ps.innerHTML = "<span style='color:red;'>×！</span>";
		return false;
	}
}

function passWord2ps(){                                                               //验证输入信息是否合格
	var passWord2 = document.getElementById("passWord2");
	var passWord1 = document.getElementById("password");
	var passWord2ps = document.getElementById("passWord2ps");
	if(passWord2.value == passWord1.value && passWord2.value){
		passWord2ps.innerHTML = "<span style='color:green;'>√！</span>";
		return 1;
	}else{
		passWord2ps.innerHTML = "<span style='color:red;'>×！</span>";
		return false;
	}
}

function formsubmit(id){                                                           //用户管理的修改和增加
	if(id){
		if(window.confirm('你确定要修改吗？')){
            
         }else{
            //alert("取消");
            return false;
        }
		$.ajax({
	       	 type:"post",
	       	 url:"<%=basePath %>welcome/user/updateuserById",
	       	 data:{
	       		 	id:id,
	       	 		name:$("#name").val(),
	       	 		truename:$("#username").val(),
	       		 	sex:$("#sex").val(),
	       			email:$("#email").val(),
	       			remark:$("#remark").val(),
	       			creatdata:$("#creatdata").val(),
	       			password:$("#password").val()

	       	 },
	       	 dataType:"text",
	       	 success:function(data){
	       		 alert(data);
	       		usersms();
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
		if(nameps() && passWord1ps() && passWord2ps()){
			var email = $("#email").val() + $("#emailsel").val()
			$.ajax({
		       	 type:"post",
		       	 url:"<%=path %>/welcome/user/register",
		       	 data:{
		       		 	id:id,
		       	 		name:$("#name").val(),
		       	 		username:$("#username").val(),
		       		 	sex:$('input[type=radio][name=sex]:checked').val(),
		       			email:email,
		       			remark:$("#remark").val(),
		       			password:$("#password").val()

		       	 },
		       	 dataType:"text",
		       	 success:function(data){
		       		
		       		usersms();
		           },   
		       	 error:function(data){
		                alert("提交失败！");
		                return false;
		           }   
			});
			
			
		}else{
			alert("信息有误，请检查！");
			return false;
		}
	}
	

}

</script>

<script>

	function findwheres(page){                                                        //条件查询
		var findname = $("#findname").val();
		var findtruename = $("#findtruename").val();
		var mincreatdata = $("#mincreatdata").val();
		var maxcreatdata = $("#maxcreatdata").val();
		var findsex = $("#findsex").val();

		var data = {
				pageNow:page,
		   		findname:findname,
				findtruename:findtruename,
				mincreatdata:mincreatdata,
				maxcreatdata:maxcreatdata,
				findsex:findsex   
		}
		
		$.ajax({
	       	 type:"post",
	       	 url:"<%=basePath %>welcome/user/findNewsPage",
	       	 data:data,
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

	function upfindbyid(id,page){                                                          //修改--找出修改数据
		$.ajax({
	       	 type:"post",
	       	 url:"<%=basePath %>welcome/user/usersmsupfindbyid",
	       	 data:{id:id},
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
	

	function clearwhere(){                                                           //清空
		$("#findname").val("");
		$("#findtruename").val("");
		$("#mincreatdata").val("");
		$("#maxcreatdata").val("");
		$("#findsex").val("");
		$("#findrolename").val("");
		$("#findmenuname").val("");
		
	}
	
	function toadduser(page){                                                       //加载用户管理（user）的添加页面
		
		$.ajax({
       	 type:"post",
       	 url:"<%=basePath %>welcome/toadduser",
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
	
	function usersmsdel(id,page){                                                    //user删除
		
		if(window.confirm('你确定要删除吗？')){
            //alert("确定");
			$.ajax({
		       	 type:"post",
		       	 url:"<%=basePath %>welcome/user/usersmsdel",
		       	 data:{id:id},
		       	 dataType:"text",
		       	 success:function(data){
		       		 homepage(page);
		       		 alert("删除成功!");
		           },   
		       	 error:function(data){
		                alert("提交失败！");
		                return false;
		           }   
			});
         }else{
            //alert("取消");
            return false;
        }
		
		
		
	}


	function usersms(){                                                           //点击用户管理
		updCatalogue(1);
		$.ajax({
	        	 type:"post",
	        	 url:"<%=basePath %>welcome/user/findNewsPage",
	        	 dataType:"html",
	        	 success:function(data){
//	        		 alert(data);
	        		 $("#center_rigth").html(data);
	            },   
	        	 error:function(data){
	                 alert("提交失败！");
	                 return false;
	            }   
		});
	}
	
	function home(){
		updCatalogue(0);
			$.ajax({
	       	 type:"post",
	       	 url:"<%=basePath %>welcome/tocenter",
	       	 dataType:"html",
	       	 success:function(data){
	//       		 alert(data);
	       		 $("#center_rigth").html(data);
	           },   
	       	 error:function(data){
	                alert("提交失败！");
	                return false;
	           }   
			});
		
	}

</script>


<!-- center——left -->

<script type="text/javascript">
$(document).ready(function() {
	$('.inactive').click(function(){
		if($(this).siblings('ul').css('display')=='none'){
			$(this).parent('li').siblings('li').removeClass('inactives');
			$(this).addClass('inactives');
			$(this).siblings('ul').slideDown(100).children('li');
			if($(this).parents('li').siblings('li').children('ul').css('display')=='block'){
				$(this).parents('li').siblings('li').children('ul').parent('li').children('a').removeClass('inactives');
				$(this).parents('li').siblings('li').children('ul').slideUp(100);

			}
		}else{
			//控制自身变成+号
			$(this).removeClass('inactives');
			//控制自身菜单下子菜单隐藏
			$(this).siblings('ul').slideUp(100);
			//控制自身子菜单变成+号
			$(this).siblings('ul').children('li').children('ul').parent('li').children('a').addClass('inactives');
			//控制自身菜单下子菜单隐藏
			$(this).siblings('ul').children('li').children('ul').slideUp(100);

			//控制同级菜单只保持一个是展开的（-号显示）
			$(this).siblings('ul').children('li').children('a').removeClass('inactives');
		}
	})
});
</script>

<style>
div {

}
body{font-family: "宋体","微软雅黑";}

ul, ol,
dl, dt, dd,
p {
 margin: 0;
 padding: 0;
 list-style: none;
 font-size: 35px;	
}



.usersmsthead td {
	font-size: 26px;
	text-align:center;
	padding-left: 10px;
	padding-right: 10px;
	border:1px solid #000;

}

#usersmstbody td {
	font-size: 26px;
	
	text-align:center;
	padding: 5px;
	border:1px solid #000;
	
	
}
.usersmstab{
	border:1px solid #000;
 	border-spacing:inherit;
 	border-collapse:collapse;
}

a {
	text-decoration:none;
	color: #000;
}

li {
	margin-top: 10px;
}


dl{margin-left: 100px;}
#onedl dt,dd{float:left;font-size: 28px;margin-left: 10px;}
#cataDl dt,dd{float:left;font-size: 15px;margin-left: 10px;}
.findinput{
	font-size: 30px;
	}

#header {
	position: relative;
	height: 10%;
	width: 100%;
	
}
#center {
	position: absolute;
	height: 90%;
	width: 100%;
	
}
#center_left {
	
	border-right:1px solid #000;
	height: 90%;
	width: 20%;
	text-align: center;
	float: left;
}
#rigth {
	
	border-left:1px solid #000;
	height: 90%;
	width: 70%;

	float: left;
	margin-left: 20px;
}

#center_rigth {
	
	
	height: 100%;
	width: 100%;
	margin-left: 20px;
}
#rigth_top {
	
	
	height: 16%;
	width: 100%;

}
#rigth_bottom {
	
	border-top:1px solid #000;
	height: 80%;
	width: 100%;


}

a:link,a:visited{text-decoration: none;}
.userautsmslist{width: 210px;border-bottom:solid 1px #316a91;margin:40px auto 0 auto;}
.userautsmslist ul li{background-color:#467ca2; border:solid 1px #316a91; border-bottom:0;}
.userautsmslist ul li a{padding-left: 10px;color: #fff; font-size:12px; display: block; font-weight:bold; height:36px;line-height: 36px;position: relative;
}
.userautsmslist ul li .inactive{ background:url(images/off.png) no-repeat 184px center;}
.userautsmslist ul li .inactives{background:url(images/on.png) no-repeat 184px center;} 
.userautsmslist ul li ul{display: none;}
.userautsmslist ul li ul li { border-left:0; border-right:0; background-color:#6196bb; border-color:#467ca2;}
.userautsmslist ul li ul li ul{display: none;}
.userautsmslist ul li ul li a{ padding-left:20px;}
.userautsmslist ul li ul li ul li { background-color:#d6e6f1; border-color:#6196bb; }
.userautsmslist{ background-color:#d6e6f1; border-color:#6196bb; }
.userautsmslist ul li ul li ul li a{ color:#316a91; padding-left:30px;}


</style>



</head>
<body>

<%-- <h1>welcome:   ${user.name }!</h1>
<a href="<%=path %>/welcome/tologin">登陆</a><br>
<a href="<%=path %>/welcome/toregister">注册</a> --%>

<div id="header">
	<jsp:include page="header.jsp" />

</div>

<div id="center">

	<div id="center_left">
		<jsp:include page="center_left.jsp" />
	</div>
	<div id="rigth">
	
	<div >
		<jsp:include page="center_catalogue.jsp" />
	</div>
		
	<div id="center_rigth" >
		<jsp:include page="center.jsp" />
	</div>
	</div>
	
	
</div>


</body>
</html>