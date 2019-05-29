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