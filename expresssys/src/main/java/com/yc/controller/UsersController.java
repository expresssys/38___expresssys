package com.yc.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.JsonModel;
import com.yc.bean.Users;
import com.yc.biz.UsersBiz;

@Controller
@Scope(value="prototype")
@RequestMapping("Admin/")
public class UsersController {
	@Resource(name="usersBizImpl")
	private UsersBiz ad;
	
	@RequestMapping(name="update.action",method=RequestMethod.POST)
	public @ResponseBody JsonModel update(Users users){
		JsonModel jm=new JsonModel();
		int result = this.ad.update(users);
		
		if(result>0){
			jm.setCode(1);
			jm.setObj(users);
		}else{
			jm.setCode(0);
			jm.setMsg("更新错误");
		}
		return jm;
	}
	
	@RequestMapping(value="../login.action")
	public @ResponseBody JsonModel Login(Users admin,String code,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//从application中取出所有tag 
		JsonModel jm=new JsonModel();
		Users c=this.ad.adminlogin(admin);
		
		String codes=String.valueOf(session.getAttribute("rand"));
		if(!code.equals(codes)){
			jm.setCode(1);//验证码错误
			jm.setMsg("验证码错误");
		}else{
			try{
				jm.setCode(3);
				jm.setObj(c);
				session.setAttribute("user", c);
			} catch (Exception e) {
				jm.setCode(2);
				jm.setMsg("用户名或密码错误");
			}
		}
		return jm;
	}
	
	@RequestMapping(value="Admin/loginout.action")
	public void LoginOut(Users users,String code,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		
		session.removeAttribute("user");
		try {
			resp.sendRedirect("../back/login.html");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public @ResponseBody JsonModel findAll(Users users,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		JsonModel jm = new JsonModel();
		
		int page = (int) request.getAttribute("page");
		int pagesize = (int) request.getAttribute("pagesize");
		
		
		
		return jm;
	}
	
}
