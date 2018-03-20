package com.yc.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.JsonModel;
import com.yc.bean.Logininfo;
import com.yc.bean.Users;
import com.yc.biz.LoginInfoBiz;
import com.yc.biz.UsersBiz;

@Controller
@Scope(value="prototype")
public class LoginController {
	@Resource(name="usersBizImpl")
	private UsersBiz ad;
	@Resource(name="logininfoBizImpl")
	private LoginInfoBiz lb;
	
	@RequestMapping(value="login.action")
	public @ResponseBody JsonModel Login(Users users,String code,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//从application中取出所有tag 
		JsonModel jm=new JsonModel();
		Logininfo l=new Logininfo();
		String codes=String.valueOf(session.getAttribute("rand"));
		if(!code.equals(codes)){
			jm.setCode(1);//验证码错误
			jm.setMsg("验证码错误");
		}else{
			Users c=this.ad.adminlogin(users);
			
			if(c!=null){
				if(c.getUstatus()!=0 ){
					jm.setCode(Integer.parseInt(c.getRes1()));
					jm.setObj(c);
					l.setLstatus("1");//登录成功
					l.setLname(c.getUname());
					System.out.println(c);
					session.setAttribute("user", c);
				}else{
					jm.setCode(0);
					jm.setMsg("该用户权限不足");
				}
			} else{
				l.setLstatus("0");//登录失败
				l.setLname(c.getUname());
				jm.setCode(2);
				jm.setMsg("用户名或密码错误");
			}
			l.setLip(request.getRemoteAddr());
			Calendar calendar = Calendar.getInstance();
			Date time = calendar.getTime();
			l.setLtime(time);
			if(l.getLname()!=null&&l.getLname()!=""){
				this.lb.addLoginInfo(l);
			}
		}
		return jm;
	}
	
	@RequestMapping(value="Admin/loginout.action")
	public void LoginOut(Users admin,String code,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		session.removeAttribute("user");
		try {
			resp.sendRedirect("../login.html");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	//添加
		@RequestMapping("add.action")
		public @ResponseBody JsonModel addUsers(Users users,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
			JsonModel jm = new JsonModel();
			users.setUstatus(1);
			int status = this.ad.addUsers(users);
			if(status==1){
				jm.setCode(1);
			}else{
				jm.setCode(0);
				jm.setMsg("添加失败");
			}

			return jm;
		} 
}
