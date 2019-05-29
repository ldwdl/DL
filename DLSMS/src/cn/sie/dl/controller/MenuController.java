package cn.sie.dl.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sie.dl.entity.Menu;
import cn.sie.dl.entity.Page;
import cn.sie.dl.service.MenuService;

@Controller
@RequestMapping("/welcome/menu")
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	private List<Menu> list;
	private Menu menu;

	private Map<String, Object> params;

	
	 @RequestMapping("/findPaging")
     public String findPaging(HttpServletRequest request, HttpServletResponse response){
		 System.out.println("1111111111111111111111111111111");
         //获取当前页数
         String pageNow = request.getParameter("pageNow");
//         System.out.println("page-----"+pageNow);
         String menuName = request.getParameter("menuName");

//         System.out.println(name+"-----"+truename+"-----:"+mincreatdata+"-----:"+maxcreatdata+"-----"+sex);
//         System.out.println(pageNow);
       
        System.out.println("1111111"+menuName);
         //获取总页数
         params = new HashMap<String, Object>();  
         params.put("menuName", menuName); 
         int totalCount = (int)menuService.findroleCont(params);
         System.out.println("mmmmmmmmmmmmm"+totalCount);
         
         
//         int totalCount = (int)roleService.findroleCont(params);
         
//         System.out.println(totalCount);
         
         Page page=null;
         list=new ArrayList<Menu>();
         if (pageNow!=null) 
         {
        	 page=new Page(Integer.parseInt(pageNow), totalCount);
             request.removeAttribute("list");
             
//             System.out.println("sssssss======"+page.getStartPos()+page.getPageSize());
             
             params.put("startPos", page.getStartPos());  
             params.put("pageSize", page.getPageSize());
            
             
             list = menuService.findRolePage(params);
             for(Menu a : list) {
            	 System.out.println(a.getMenuId());
             }
             
             request.setAttribute("list", list);
             request.setAttribute("page", page);
             return "forward:/welcome/tomenulist";
         }
         else {
       	 System.out.println("now=null");
             page=new Page(1, totalCount);
             request.removeAttribute("list");

             params.put("startPos", page.getStartPos());  
             params.put("pageSize", page.getPageSize()); 
  
//             System.out.println(page.getStartPos()+"-----"+page.getPageNow()+"-----"+page.getPageSize());
             list = menuService.findRolePage(params);
             System.out.println(list.size());
             request.setAttribute("list", list);
             request.setAttribute("page", page);
             return "forward:/welcome/tomenu";
         }
         
        
     }
	 
	 @RequestMapping(value = "/save")
		public String save(HttpServletResponse response,HttpServletRequest request) throws IOException {
			// TODO Auto-generated method stub
			String menuName = request.getParameter("menuName");
			String parentMenu = request.getParameter("parentMenu");
			String menuUrl = request.getParameter("menuUrl");
			String autTag = request.getParameter("autTag");
			String menuType = request.getParameter("menuType");
			
			System.out.println(menuName+"------"+parentMenu+"------"+menuUrl+"------"+autTag+"------"+menuType);
			menu = new Menu(menuName,parentMenu,menuUrl,autTag,menuType);
			menuService.save(menu);
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write("增加成功！");
			return null;
			
		}
	 
	// 声明请求的方法，默认为GET方法
			@RequestMapping(value = "/delByID")
			public String delByID(HttpServletResponse response,HttpServletRequest request) throws IOException {
				// TODO Auto-generated method stub
				Integer menuId = Integer.parseInt(request.getParameter("id"));
				menuService.deleteById(menuId);
				response.setContentType("text/plain;charset=UTF-8");
				response.getWriter().write("删除成功！");
				return null;
			}
			
			// 声明请求的方法，默认为GET方法
			@RequestMapping(value = "/delsByID")
			public String dels(HttpServletResponse response,HttpServletRequest request) throws IOException {
				// TODO Auto-generated method stub
				String[] ids = request.getParameterValues("ids");
				for(String i : ids) {
					Integer id = Integer.parseInt(i);
					menuService.deleteById(id);
				}
				response.setContentType("text/plain;charset=UTF-8");
				response.getWriter().write("menu删除成功！");
				return null;

			}
	 
	 
/*	// 声明请求的方法，默认为GET方法
		@RequestMapping(value = "/toupfindbyid")
		public String toupfindbyid(HttpSession session, HttpServletResponse response,
				HttpServletRequest request) throws IOException {
			// TODO Auto-generated method stub
			
//			addCookie(name, password, response, request);
			Integer roleId = Integer.parseInt(request.getParameter("roleId"));
			
//			System.out.println("toupfindbyid]]]]]]]]]]]]]"+roleId);
			
			list = roleService.toupfindbyid(roleId);
			
//			System.out.println(list.get(0).getId());
			
			
			request.setAttribute("roleup", list.get(0));
			
			
			return "forward:/welcome/toroleadd";
			
		}
		
		
		
		// 声明请求的方法，默认为GET方法
		@RequestMapping(value = "/updateByrole")
		public String updateByrole(Role role, HttpSession session, HttpServletResponse response,
				HttpServletRequest request) throws IOException {
			
			String a = request.getParameter("roleId");
			Integer roleId = Integer.parseInt(a);
			String roleName = request.getParameter("roleName");
			String roleRemark = request.getParameter("roleRemark");
//			System.out.println(roleId+roleName+roleRemark+"==========");
			
			role = new Role(roleId,roleName,roleRemark);
			roleService.updateByrole(role);
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write("修改成功！");
			return null;
			
		}
		
		
	
		
	*/		
}