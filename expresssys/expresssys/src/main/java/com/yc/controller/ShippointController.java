package com.yc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.Proxy;
import com.yc.bean.Shippoint;
import com.yc.biz.ProxyBiz;
import com.yc.biz.ShippointBiz;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/point/")
public class ShippointController {
	@Resource(name="shippointBizImpl")
	private ShippointBiz pointBiz;
	
	@Resource(name="proxyBizImpl")
	private ProxyBiz proxyBiz;

	public void setPointBiz(ShippointBiz pointBiz) {
		this.pointBiz = pointBiz;
	}
	
	public void setProxyBiz(ProxyBiz proxyBiz) {
		this.proxyBiz = proxyBiz;
	}

	@RequestMapping(value="findAll.action")
	public @ResponseBody Map<String,Object> findAll(int rows,int page,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//查询所有配送点
		Map<String,Object> s=this.pointBiz.findAll(page-1,rows);
		session.setAttribute("AllshipPoint", s);
		return s;
	}

	@RequestMapping(value="selectAll.action")
	public @ResponseBody List<Shippoint> selectAll(HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//查询所有配送点
		List<Shippoint> s=this.pointBiz.selectAll();
		return s;
	}

	//条件查询
	@RequestMapping(value="findByCondition.action")
	public @ResponseBody Map<String,Object> findByCondition(Shippoint s,int rows,int page,HttpServletRequest request,HttpServletResponse resp,HttpSession session){

		Map<String,Object> m=this.pointBiz.findById(s, page-1, rows);
		session.setAttribute("AllshipPoint", s);
		return m;
	}
	//通过id查询
	@RequestMapping(value="findByID.action")
	public @ResponseBody Map<String,Object> findByID(Shippoint s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//查询所有配送点	
		Map<String,Object> m=this.pointBiz.findById(s, 0, 1);	
		return m;
	}
	//添加配送点
	@RequestMapping(value="add.action")
	public @ResponseBody int add(Shippoint s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){

		int result=0;
		this.pointBiz.add(s);
		result=1;
		return result;
	}

	//修改配送点
	@RequestMapping(value="update.action")
	public @ResponseBody int update(Shippoint s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		int result=0;
		this.pointBiz.update(s);
		result=1;
		return result;
	}

	//删除配送点
	@RequestMapping(value="delete.action")
	public @ResponseBody int delete(Shippoint s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		int result=0;
		this.pointBiz.delete(s);
		result=1;
		return result;
	}

	//根据addr查询配送点
	@RequestMapping(value="findByAddr.action")
	public @ResponseBody Map<String,Object> findByAddr(String address,Integer searchType,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		Shippoint shippoint = new Shippoint();
		Proxy proxy = new Proxy();
		shippoint.setSpaddress(address);
		proxy.setRes2(address);
	 if(searchType==1){//配送点
			List<Shippoint> shippoints = this.pointBiz.findByAddr(shippoint);
			if(shippoints !=null && shippoints.size()>0){
				map.put("code", 1);
				map.put("shippoints", shippoints);
			}else{
				map.put("code", 0);
				map.put("msg", "该地址暂时没有服务网点");
			}
		}else if(searchType==2){//代理点
			List<Proxy> proxys = this.proxyBiz.findByAddr(proxy);
			if(proxys !=null && proxys.size()>0){
				map.put("code", 1);
				map.put("proxys", proxys);
			}else{
				map.put("code", 0);
				map.put("msg", "该地址暂时没有服务网点");
			}
		}
		return map;
	}


}
