package cn.sie.dl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/welcome")
public class ViewController {
	 
		@RequestMapping(value="/tohello" ,method=RequestMethod.GET)  
		public String printWelcome(ModelMap model){   
		model.addAttribute("message" ,"Spring 3 MVC Hello World");  
		 return "hello";    
		 }    
		
		@RequestMapping("tohome")
		public String home(ModelMap model) {
			// TODO Auto-generated method stub
			return "jsp/view/home";
		}
		
		@RequestMapping("tologin")
		public String login(ModelMap model) {
			// TODO Auto-generated method stub	
			return "jsp/login";
		}
		@RequestMapping("tousersms")
		public String usersms(ModelMap model) {
			// TODO Auto-generated method stub	
			return "jsp/usermenu/usersms";
		}
		
		@RequestMapping("toregister")
		public String register(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/register";
		}
		
		@RequestMapping("toadduser")
		public String toadduser(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/usersms/adduser";
		}
		
		@RequestMapping("tolist")
		public String tolist(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/usermenu/list";
		}
		@RequestMapping("torolelist")
		public String torolelist(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/role/rolecontent/role_list";
		}
		@RequestMapping("tomenulist")
		public String tomenulist(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/menu/menucontent/menu_list";
		}
	
		@RequestMapping("tomenuadd")
		public String tomenuadd(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/menu/menuadd";
		}
		
		@RequestMapping("toroleadd")
		public String toroleadd(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/role/roleadd";
		}
		
		
		@RequestMapping("torole")
		public String torole(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/role/rolesms";
		}
		@RequestMapping("tomenu")
		public String tomenu(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/menu/menusms";
		}
		
		@RequestMapping("tocenter")
		public String tocenter(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/view/center";
		}
		
		@RequestMapping("hometologin")
		public String hometologin(HttpSession session, HttpServletResponse response,
				HttpServletRequest request) {
			// TODO Auto-generated method stub	
			
			session = request.getSession();
			session.invalidate();
			
			return "jsp/login";
		}
		
		@RequestMapping("toerror")
		public String error(ModelMap model) {
			// TODO Auto-generated method stub			
			return "jsp/puw/error";
		}

}
