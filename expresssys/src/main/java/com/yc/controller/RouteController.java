package com.yc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.JsonModel;
import com.yc.bean.Route;
import com.yc.biz.RouteBiz;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/route")
public class RouteController {
	@Resource(name="routeBizImpl")
	private RouteBiz routeBiz;
	
	private JsonModel jm = new JsonModel();
	
	
	@RequestMapping("add.action")
	public @ResponseBody JsonModel addRoute(Route route,int num,String rviastart,String rviaend,HttpServletRequest request){
		String rvia = "";
		
		if(num==0){
			rvia += rviastart + "-" + rviaend;
		}else{
			rvia += rviastart;
			for(int i =1;i<=num;i++){
				rvia +="-"+ request.getParameter("rvia"+i);
			}
			rvia += "-" + rviaend;
		}
		
		route.setRvia(rvia);
		
		if(route.getRname()==null){
			jm.setCode(0);
			jm.setMsg("添加信息不完整");
			return jm;
		}
		int status = this.routeBiz.add(route);
		jm.setCode(status);
		jm.setObj(route);
		return jm;
	}
	
	@RequestMapping("update.action")
	public @ResponseBody JsonModel updateRoute(Route route,int num,String rviastart,String rviaend,HttpServletRequest request){
		String rvia = "";
		
		if(num==0){
			rvia += rviastart + "-" + rviaend;
		}else{
			rvia += rviastart;
			for(int i =1;i<=num;i++){
				rvia +="-"+ request.getParameter("rvia"+i);
			}
			rvia += "-" + rviaend;
		}
		
		route.setRvia(rvia);
		
		
		if(route.getRid()==null){
			jm.setCode(0);
			jm.setMsg("信息不完整");
			return jm;
		}
		int status = this.routeBiz.update(route);
		jm.setCode(status);
		jm.setObj(route);
		return jm;
	}
	
	@RequestMapping("find.action")
	public @ResponseBody Map<String,Object> findBy(Route route,int page,int rows){
		Map<String,Object> map = new HashMap<String,Object>();	
		route.setRes1("1");
		map.put("route", route);
		map.put("start", page-1);
		map.put("pagesize", rows);
		Map<String,Object> result = this.routeBiz.findBy(map);
		return result;
	}
}
