package cn.sie.dl.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import cn.sie.dl.entity.Page;
import cn.sie.dl.entity.UserInfo;
import cn.sie.dl.service.UserService;

@Controller
@RequestMapping("/welcome/user")
public class UserController {

	@Autowired
	private UserService userService;
	private UserInfo user;
	private List<UserInfo> list;
	private Map<String, Object> params;

	// 声明请求的方法，默认为GET方法
	@RequestMapping(value = "/login")
	public String login(String name, String password, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub

//		addCookie(name, password, response, request);

//		System.out.println(name + password);
		user = new UserInfo(name, password);
		list = userService.finduser(user);
		String mes = "登陆成功！";
		if (list.size() != 0) {
			// System.out.println(list.get(0).getName());
			session.setAttribute("user", list.get(0));
			// return "redirect:/welcome/tohome";
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write(mes+"-"+name+"-"+password);
		} else {
			// request.setAttribute("str", "false");
			// return "forward:/welcome/toerror";
			mes = "用户名或密码不正确！";
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write(mes);
		}
		return null;

	}
	
	 @RequestMapping("/findNewsPage")
     public String showNewsInfo(HttpServletRequest request, HttpServletResponse response){
//		 System.out.println("1111111111111111111111111111111");
         //获取当前页数
         String pageNow = request.getParameter("pageNow");
//         System.out.println("page-----"+pageNow);
         String name = request.getParameter("findname");
         String truename = request.getParameter("findtruename");
         String mincreatdata = request.getParameter("mincreatdata");
         String maxcreatdata = request.getParameter("maxcreatdata");
         String sex = request.getParameter("findsex");
//         System.out.println(name+"-----"+truename+"-----:"+mincreatdata+"-----:"+maxcreatdata+"-----"+sex);
//         System.out.println(pageNow);
       
        
         //获取总页数
         params = new HashMap<String, Object>();  
         params.put("name", name); 
         params.put("truename", truename); 
         params.put("mincreatdata", mincreatdata); 
         params.put("maxcreatdata", maxcreatdata); 
         params.put("sex", sex);
         int totalCount = (int)userService.findNewCont(params);
         
//         System.out.println(totalCount);
         
         Page page=null;
         list=new ArrayList<UserInfo>();
         if (pageNow!=null) {
             page=new Page(Integer.parseInt(pageNow), totalCount);
             request.removeAttribute("list");
             
             params.put("startPos", page.getStartPos());  
             params.put("pageSize", page.getPageSize()); 
            
             
             list=this.userService.findNewsPage(params);
         }else {
 //       	 System.out.println("now=null");
             page=new Page(1, totalCount);
             request.removeAttribute("list");

             params.put("startPos", page.getStartPos());  
             params.put("pageSize", page.getPageSize()); 
  
//             System.out.println(page.getStartPos()+"-----"+page.getPageNow()+"-----"+page.getPageSize());
             list = userService.findNewsPage(params);
 //            System.out.println(list.size());
             request.setAttribute("list", list);
             request.setAttribute("page", page);
             return "forward:/welcome/tousersms";
         }
         request.setAttribute("list", list);
         request.setAttribute("page", page);
         return "forward:/welcome/tolist";
     }
	 
	// 声明请求的方法，默认为GET方法
		@RequestMapping(value = "/usersmsdels")
		public String usersmsdels(HttpServletResponse response,
				HttpServletRequest request) throws IOException {
			// TODO Auto-generated method stub
			String[] ids = request.getParameterValues("ids");
			for(String i : ids) {
				Integer id = Integer.parseInt(i);
				userService.deleteById(id);
			}

			return null;
			
		}
	
	// 声明请求的方法，默认为GET方法
	@RequestMapping(value = "/usersmsdel")
	public String usersmsdel(Integer id, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		
//		addCookie(name, password, response, request);
		
//		System.out.println(id);
		
		userService.deleteById(id);
		
		return null;
		
	}
	// 声明请求的方法，默认为GET方法
	@RequestMapping(value = "/userFindByName")
	public String userFindByName(String name,HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		
//		addCookie(name, password, response, request);
		
//		System.out.println(name);
		
		list = userService.userFindByName(name);
		
//		System.out.println(list.size());
		if(list.size() != 0) {
//			System.out.println(list.get(0).getName());
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write("用户名不可用！");
			return null;
		}else {
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write("用户名可用！");
			return null;
		}
		
		
	}
	
	// 声明请求的方法，默认为GET方法
	@RequestMapping(value = "/usersmsupfindbyid")
	public String usersmsupfindbyid(Integer id, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		
//		addCookie(name, password, response, request);
		
//		System.out.println(id);
		
		list = userService.finduserById(id);
		
//		System.out.println(list.get(0).getId());
		
		
		request.setAttribute("userup", list.get(0));
		
		
		return "forward:/welcome/toadduser";
		
	}
	
	// 声明请求的方法，默认为GET方法
	@RequestMapping(value = "/updateuserById")
	public String updateuserById(UserInfo user, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		
//		addCookie(name, password, response, request);
		/*System.out.println(user.getId());
		System.out.println(user.getName());
		System.out.println(user.getTruename());
		System.out.println(user.getSex());
		System.out.println(user.getRemark());
		System.out.println(user.getEmail());
		
		System.out.println(user.getPassword());*/
		
		user.setCreatdata(new Date());
//		System.out.println(user.getCreatdata());
		
		userService.updateuserById(user);
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().write("修改成功！");
		return null;
		
	}



	// 声明请求的方法，默认为GET方法
	@RequestMapping(value = "/register")
	public String register(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String remark = request.getParameter("remark");
		String password = request.getParameter("password");
//		System.out.println(remark);

//		long time=new Date().getTime();
//		Date date=new Date(time);
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
		Date creatdata = new Date();
		
		user = new UserInfo(name,username,sex,email,remark,creatdata,password);
		userService.save(user);

		return "redirect:/welcome/tologin";
	}
	
	// 声明请求的方法，默认为GET方法
		@RequestMapping(value = "/userlist")
		public String userlist(HttpServletRequest request, HttpServletResponse response) {
			

			list = userService.findNewsPage(params);
			
			request.setAttribute("list", list);

			return "forward:/welcome/tousersms";
		}
		
		
		
//		private void addCookie(String name, String password, HttpServletResponse response,
//		HttpServletRequest request) throws UnsupportedEncodingException {
//	if (!name.equals("") && !password.equals("")) {
//		// 创建 Cookie
//		Cookie nameCookie = new Cookie("name", name);
//		Cookie passwordCookie = new Cookie("password", password);
//		// 设置Cookie的父路经
//		nameCookie.setPath(request.getContextPath() + "/");
//		passwordCookie.setPath(request.getContextPath() + "/");
//		// 获取是否保存Cookie（例如：复选框的值）
//		String rememberMe = request.getParameter("rememberMe");
//		if (rememberMe == null || rememberMe.equals(false)) {
//			// 不保存Cookie
//			nameCookie.setMaxAge(0);
//			passwordCookie.setMaxAge(0);
//		} else {
//			// 保存Cookie的时间长度，单位为秒
//			nameCookie.setMaxAge(7 * 24 * 60 * 60);
//			passwordCookie.setMaxAge(7 * 24 * 60 * 60);
//		}
//		// 加入Cookie到响应头
//		response.addCookie(nameCookie);
//		response.addCookie(passwordCookie);
//	}
//}

///**
//    	 * 获取 Cookie中的信息
//	 * @param request
//	 * @return
//	 * @throws IOException
//	 */
//	@RequestMapping(value="/getCookie")
//	@ResponseBody
//	public String getCookie(HttpServletRequest request)throws IOException{
//		String name = "";
//		String password = "";
//		Cookie[] cookies = request.getCookies();
//		if(cookies!=null&&cookies.length>0){
//			//遍历Cookie
//			for(int i=0;i<cookies.length;i++){
//				Cookie cookie = cookies[i];
//				//此处类似与Map有
//				if("name".equals(cookie.getName())){
//					name = cookie.getValue();
//				}
//				if("password".equals(cookie.getName())){
//					password = cookie.getValue();
//				}
//			}
//		}
//		//自己定义的javabean Cookies
//		Cookies co = new Cookies();
//		co.setLoginAccount(name);
//		co.setLoginPassword(password);
//		Gson gson = new Gson();
//		return gson.toJson(co);
//	}
		
		


// 声明请求的方法，默认为GET方法
	// @ResponseBody
	// @RequestMapping("login")
	// public String login(ModelMap model) {
	// // TODO Auto-generated method stub
	// return "jsp/login";
	// }
	// public ModelAndView login(HttpServletRequest request, HttpServletResponse
	// response) throws Exception {
	// // TODO Auto-generated method stub
	//
	// String name = request.getParameter("name");
	// String password = request.getParameter("password");
	// System.out.println(name + password);
	//
	// UserInfo user = new UserInfo(name, password);
	//
	// user = userService.finduser(user);
	//
	// System.out.println("2222" + user.getId());
	//
	// return new ModelAndView("/2");
	// }

		}
