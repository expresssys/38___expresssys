package com.yc.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
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
public class BackLoginController {
	@Resource(name="usersBizImpl")
	private UsersBiz ad;
	
	@RequestMapping(value="/login.action")
	public @ResponseBody JsonModel Login(Users admin,String code,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//从application中取出所有tag 
		JsonModel jm=new JsonModel();
		Users c=this.ad.adminlogin(admin);
		
		String codes=String.valueOf(session.getAttribute("rand"));
		if(!code.equals(codes)){
			jm.setCode(1);//验证码错误
		}
		else{
			try{
				jm.setCode(3);
				jm.setObj(c);	
			} catch (Exception e) {
				jm.setCode(2);
				jm.setMsg(e.getMessage());
			}
		}
		session.setAttribute("user", c);
		return jm;
	}
	
	@RequestMapping(value="Admin/loginout.action")
	public void LoginOut(Users admin,String code,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		
		session.removeAttribute("user");
		try {
			resp.sendRedirect("../back/login.html");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


}
