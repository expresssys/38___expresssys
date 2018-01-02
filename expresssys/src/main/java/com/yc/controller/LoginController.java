package com.yc.controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.JsonModel;
import com.yc.bean.Users;
import com.yc.biz.UsersBiz;

@Controller
@Scope(value="prototype")
public class LoginController {
	@Resource(name="usersBizImpl")
	private UsersBiz ad;
	
	@RequestMapping(value="back/login.action")
	public @ResponseBody JsonModel Login(Users users,String code,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//从application中取出所有tag 
		JsonModel jm=new JsonModel();
		
		String codes=String.valueOf(session.getAttribute("rand"));
		if(!code.equals(codes)){
			jm.setCode(1);//验证码错误
			jm.setMsg("验证码错误");
		}else{
			Users c=this.ad.adminlogin(users);
			
			if(c!=null){
				if(c.getUstatus()!=0){
					jm.setCode(3);
					jm.setObj(c);
					session.setAttribute("user", c);
				}else{
					jm.setCode(0);
					jm.setMsg("该用户权限不足");
				}
			} else{
				jm.setCode(2);
				jm.setMsg("用户名或密码错误");
			}
		}
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
