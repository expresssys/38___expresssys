package com.yc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.JsonModel;
import com.yc.bean.Proxy;
import com.yc.biz.ProxyBiz;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/")
public class ProxyController {
	@Resource(name="proxyBizImpl")
	private ProxyBiz proxyBiz;

	private JsonModel jsonModel;

	//查找代理点
	@RequestMapping(value="findAllProxy.action")
	@ResponseBody
	public Map<String,Object> findAllProxy(String prname,String spname,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();

		Integer start=Integer.parseInt(request.getParameter("page"));
		Integer pagesize=Integer.parseInt(request.getParameter("rows"));
		map.put("prname", prname);
		map.put("spname", spname);
		map.put("start", start-1);
		map.put("pagesize", pagesize);
		List<Proxy> list=proxyBiz.findAllProxy(map);
		map=new HashMap<String,Object>();
		map.put("prname", prname);
		map.put("spname", spname);
		System.out.println(map);
		Proxy proxy=new Proxy();
		proxy.setRes3(String.valueOf(proxyBiz.proxycount(map).get(0).getRes3()));
		map=new HashMap<String,Object>();
		map.put("total", proxy.getRes3());
		map.put("rows", list);
		return map;
	}

	//增加代理点
	@RequestMapping(value="proxyadd.action")
	@ResponseBody
	public Map<String,Object> proxyadd(Proxy proxy,HttpServletRequest request){
		System.out.println(proxy);
		proxy.setPrtime(proxy.getStime()+"至"+proxy.getEtime());
		Map<String,Object> map=new HashMap<String,Object>();
		int result=this.proxyBiz.proxyadd(proxy);
		if(result>0){
			map.put("code", 1);
		}else{
			map.put("code",0);
		}
		return map;
	}

	//代理点修改
	@RequestMapping(value="proxyupdate.action")
	@ResponseBody
	public Map<String,Object> proxyupdate(Proxy proxy,HttpServletRequest request){
		proxy.setPrtime(proxy.getStime()+"至"+proxy.getEtime());
		Map<String,Object> map=new HashMap<String,Object>();
		int result=this.proxyBiz.proxyupdate(proxy);
		System.out.println(result);
		if(result>0){
			map.put("code", 1);
		}else{
			map.put("code",0);
		}
		return map;
	}

	//删除代理点
	@RequestMapping(value="proxydel.action")
	@ResponseBody
	public Map<String,Object> deleteByPrimaryKey(Integer prid,HttpServletRequest request){
		System.out.println(prid);
		Map<String,Object> map=new HashMap<String,Object>();
		int result=this.proxyBiz.deleteByPrimaryKey(prid);
		if(result>0){
			map.put("code", 1);
		}else{
			map.put("code",0);
		}
		return map;
	}

	//查询所有配送点
	@RequestMapping(value="selectpoint.action")
	@ResponseBody
	public List<Proxy> selectpoint(HttpServletRequest request){
		List<Proxy> list=proxyBiz.selectpoint();
		return list;
	}
}
