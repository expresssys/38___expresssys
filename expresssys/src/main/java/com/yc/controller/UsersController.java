package com.yc.controller;

import java.util.HashMap;
import java.util.Map;

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
@RequestMapping(value="Admin/users/")
public class UsersController {
	@Resource(name="usersBizImpl")
	private UsersBiz ad;



	//条件查询
	@RequestMapping("find.action")
	public @ResponseBody Map<String,Object> find(Users users,int page,int rows,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();	
		
		if(users.getUstatus()==null ){
			users.setUstatus(1);
		}
		
		map.put("users", users);
		map.put("start", page-1);
		map.put("pagesize", rows);
		Map<String,Object> results = this.ad.findBy(map);
		return results;
	}


	//更新
	@RequestMapping("update.action")
	public @ResponseBody JsonModel updateUsers(Users users,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		JsonModel jm = new JsonModel();
		Users u = (Users) session.getAttribute("user");
		System.out.println(users.getUsid() + " " + u.getUsid() );
		if(users.getUsid()==u.getUsid() && users.getUstatus()==0){
			jm.setCode(0);
			jm.setMsg("更新失败");
			return jm;
		}
		int status = this.ad.updateUsers(users);

		if(status==1){
			jm.setCode(1);
		}else{
			jm.setCode(0);
			jm.setMsg("更新失败");
		}

		return jm;
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
