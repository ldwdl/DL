function homepage(page){
	
	var findname = $("#findname").val();
	var findtruename = $("#findtruename").val();
	var mincreatdata = $("#mincreatdata").val();
	var maxcreatdata = $("#maxcreatdata").val();
	var findsex = $("#findsex").val();
	
	$.ajax({
   	 type:"post",
   	 url:"user/findNewsPage",
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


	
	