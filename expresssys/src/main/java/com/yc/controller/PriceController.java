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

import com.yc.bean.Price;
import com.yc.biz.PriceBiz;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/")
public class PriceController {
	@Resource(name="priceBizImpl")
	private PriceBiz priceBiz;

	//查询数据
	@RequestMapping(value="selectPrice.action")
	@ResponseBody
	public Map<String,Object> selectPrice(String pfrom,String pto,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		Integer start=Integer.parseInt(request.getParameter("page"));
		Integer pagesize=Integer.parseInt(request.getParameter("rows"));
		map.put("pfrom", pfrom);
		map.put("pto", pto);
		map.put("start", start-1);
		map.put("pagesize", pagesize);
		List<Price> list=priceBiz.selectPrice(map);
		map=new HashMap<String,Object>();
		map.put("pfrom", pfrom);
		map.put("pto", pto);
		List<Price> list1=priceBiz.selectcount(map);
		map=new HashMap<String,Object>();
		map.put("total", list1.get(0).getRes4());
		map.put("rows", list);
		return map;
	}

	//查询配送点
	@RequestMapping(value="selectaddr.action")
	@ResponseBody
	public List<Price> selectaddr(HttpServletRequest request){
		List<Price> list=priceBiz.selectaddr();
		return list;
	}

	//添加价格
	@RequestMapping(value="addprice.action")
	@ResponseBody
	public Map<String,Object> addprice(Price price,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		int result=priceBiz.addprice(price);
		if(result>0){
			map.put("code", 1);
		}else{
			map.put("code", 0);
		}
		return map;
	}

	//修改价格
	@RequestMapping(value="updateprice.action")
	@ResponseBody
	public Map<String,Object> updateprice(Price price,HttpServletRequest request){
		System.out.println("----------------"+price);
		Map<String,Object> map=new HashMap<String,Object>();
		int result=priceBiz.updateprice(price);
		if(result>0){
			map.put("code", 1);
		}else{
			map.put("code", 0);
		}
		return map;
	}
	
	//删除价格
	@RequestMapping(value="deleteprice.action")
	@ResponseBody
	public Map<String,Object> deleteprice(Integer pid,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		int result=priceBiz.deleteprice(pid);
		if(result>0){
			map.put("code", 1);
		}else{
			map.put("code", 0);
		}
		return map;
	}
	
	
	@RequestMapping(value="calPrice.action")
	@ResponseBody
	public Map<String,Object> calculate(String pfrom,String pto,double weight){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pfrom", pfrom);
		map.put("pto", pto);
		map.put("start", 0);
		map.put("pagesize", 1);
		List<Price> list=priceBiz.selectPrice(map);
		map.clear();
		
		double price = 0.0;
		if(list != null && list.size()>0){
			if(weight>1){
				price += list.get(0).getPrestwei() * (weight-1);
				map.put("weight",weight );
			}else{
				map.put("weight",1 );
			}
			price += list.get(0).getPfirstwei();
			map.put("code", 1);
			map.put("price", price);
		}else{
			map.put("code", 0);
		}
		return map;
	}
}
