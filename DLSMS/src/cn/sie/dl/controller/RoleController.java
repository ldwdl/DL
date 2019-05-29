package cn.sie.dl.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import cn.sie.dl.entity.Page;
import cn.sie.dl.entity.Role;
import cn.sie.dl.service.RoleService;


@Controller
@RequestMapping("/welcome/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	
	private List<Role> list;
	private List<Role> listrole;
	private Map<String, Object> params;
	private Role role;
	
	 @RequestMapping("/findPaging")
     public String findPaging(HttpServletRequest request, HttpServletResponse response){
//		 System.out.println("1111111111111111111111111111111");
         //获取当前页数
         String pageNow = request.getParameter("pageNow");
//         System.out.println("page-----"+pageNow);
         String roleName = request.getParameter("roleName");

//         System.out.println(name+"-----"+truename+"-----:"+mincreatdata+"-----:"+maxcreatdata+"-----"+sex);
//         System.out.println(pageNow);
       
        System.out.println("1111111"+roleName);
         //获取总页数
         params = new HashMap<String, Object>();  
         params.put("roleName", roleName); 
         int totalCount = (int)roleService.findroleCont(params);
//         System.out.println("rrrrrrrrrrrrrrrrr"+totalCount);
         
//         int totalCount = (int)roleService.findroleCont(params);
         
//         System.out.println(totalCount);
         
         Page page=null;
         list=new ArrayList<Role>();
         if (pageNow!=null) 
         {
        	 page=new Page(Integer.parseInt(pageNow), totalCount);
             request.removeAttribute("list");
             
//             System.out.println("sssssss======"+page.getStartPos()+page.getPageSize());
             
             params.put("startPos", page.getStartPos());  
             params.put("pageSize", page.getPageSize());
            
             
             list = roleService.findRolePage(params);
             for(Role a : list) {
            	 System.out.println(a.getRoleId());
             }
             
             request.setAttribute("list", list);
             request.setAttribute("page", page);
             return "forward:/welcome/torolelist";
         }
         else {
       	 System.out.println("now=null");
             page=new Page(1, totalCount);
             request.removeAttribute("list");

             params.put("startPos", page.getStartPos());  
             params.put("pageSize", page.getPageSize()); 
  
//             System.out.println(page.getStartPos()+"-----"+page.getPageNow()+"-----"+page.getPageSize());
             list = roleService.findRolePage(params);
             System.out.println(list.size());
             request.setAttribute("list", list);
             request.setAttribute("page", page);
             return "forward:/welcome/torole";
         }
         
        
     }
	 
	 
	// 声明请求的方法，默认为GET方法
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
		@RequestMapping(value = "/upDelRole")
		public String upDelRole(HttpServletResponse response,HttpServletRequest request) throws IOException {
			
			Integer roleId = Integer.parseInt(request.getParameter("roleId")); 
			Integer userId = Integer.parseInt(request.getParameter("userId")); 
//			System.out.println("roleid======"+roleId);
//			System.out.println("userid======"+userId);
			
			roleService.upDelRole(roleId,userId);
			
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write("删除角色成功！");
			return null;
			
		}
		
		// 声明请求的方法，默认为GET方法
		@RequestMapping(value = "/upAddRole")
		public String upAddRole(HttpServletResponse response,HttpServletRequest request) throws IOException {
			
			Integer roleId = Integer.parseInt(request.getParameter("roleId")); 
			Integer userId = Integer.parseInt(request.getParameter("userId")); 
//			System.out.println(roleId);
//			System.out.println(userId);
			
			roleService.upAddRole(roleId,userId);
			
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write("添加角色成功！");
			return null;
			
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
		
		
	// 声明请求的方法，默认为GET方法
		@RequestMapping(value = "/delsByID")
		public String dels(HttpServletResponse response,HttpServletRequest request) throws IOException {
			// TODO Auto-generated method stub
			String[] ids = request.getParameterValues("ids");
			for(String i : ids) {
				Integer id = Integer.parseInt(i);
				roleService.deleteById(id);
			}
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write("删除成功！");
			return null;

		}
		
		// 声明请求的方法，默认为GET方法
		@RequestMapping(value = "/delByID")
		public String delByID(HttpServletResponse response,HttpServletRequest request) throws IOException {
			// TODO Auto-generated method stub
			Integer roleId = Integer.parseInt(request.getParameter("id"));
			roleService.deleteById(roleId);
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write("删除成功！");
			return null;
		}
		
		@RequestMapping(value = "/save")
		public String save(HttpServletResponse response,HttpServletRequest request) throws IOException {
			// TODO Auto-generated method stub
			String roleName = request.getParameter("roleName");
			String roleRemark = request.getParameter("roleRemark");
			role = new Role(roleName,roleRemark);
			roleService.save(role);
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write("增加成功！");
			return null;
			
		}
		
		@RequestMapping(value = "/roleFindAll")
		@ResponseBody
		public Map<String, Object> roleFindAll(HttpServletResponse response,HttpServletRequest request) throws IOException {
			// TODO Auto-generated method stub
			
			String userid = request.getParameter("userid");
			Integer userId = Integer.parseInt(userid);
			
			System.out.println(userId);
			
			listrole = roleService.roleFindAll();
			/*ObjectMapper mapper= new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(list);
			System.out.println(jsonStr);
			return jsonStr;*/
			
			
			list = roleService.userGetRole(userId);
			
			Map<String, Object> map= new HashMap<String, Object>();
		    map.put("listrole", listrole);
		    map.put("list", list);
		    return map;
			
		}
			
}
