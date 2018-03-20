package com.yc.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.Driver;
import com.yc.biz.DriverBiz;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/driver/")
public class DriverController {
	@Resource(name="driverBizImpl")
	private DriverBiz driverBiz;

	public void setdriverBiz(DriverBiz driverBiz) {
		this.driverBiz = driverBiz;
	}

	@RequestMapping(value="findAll.action")
	public @ResponseBody Map<String,Object> findAll(int rows,int page,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//查询所有司机
		Map<String,Object> s=this.driverBiz.findAll(page-1,rows);
		session.setAttribute("AllDriver", s);
		return s;
	}
	
	//条件查询
	@RequestMapping(value="findByCondition.action")
	public @ResponseBody Map<String,Object> findByCondition(Driver s,int rows,int page,HttpServletRequest request,HttpServletResponse resp,HttpSession session){

		Map<String,Object> m=this.driverBiz.findById(s, page-1, rows);
		
		session.setAttribute("AllDriver", s);
		return m;
	}
	//通过id查询
	@RequestMapping(value="findByID.action")
	public @ResponseBody Map<String,Object> findByID(Driver s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//查询所有司机
		Map<String,Object> m=this.driverBiz.findById(s, 0, 1);	
		return m;
	}
	//添加司机
	@RequestMapping(value="add.action")
	public @ResponseBody int add(Driver s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
	
		int result=0;
		this.driverBiz.add(s);
		result=1;
	
		return result;
	}
	
	//修改司机
	@RequestMapping(value="update.action")
	public @ResponseBody int update(Driver s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
	
		int result=0;
		this.driverBiz.update(s);
		result=1;
	
		return result;
	}
	
	//删除司机
	@RequestMapping(value="delete.action")
	public @ResponseBody int delete(Driver s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		
		int result=0;
		this.driverBiz.delete(s);
		result=1;
	
		return result;
	}

}
