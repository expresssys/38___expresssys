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
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.Goods;
import com.yc.bean.JsonModel;
import com.yc.bean.Users;
import com.yc.biz.GoodsBiz;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/goods/")
public class GoodsController {
	@Resource(name="goodsBizImpl")
	private GoodsBiz goodsBiz;

	public void setdriverBiz(GoodsBiz goodsBiz) {
		this.goodsBiz = goodsBiz;
	}

	//条件查询
	@RequestMapping("find.action")
	public @ResponseBody Map<String,Object> find(Goods goods,int page,int rows,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();	
		System.out.println("1" + goods);
		map.put("goods", goods);
		map.put("start", page-1);
		map.put("pagesize", rows);
		Map<String,Object> results = this.goodsBiz.findBy(map);
		return results;
	}

	//添加
	@RequestMapping("add.action")
	public @ResponseBody JsonModel addUsers(Goods goods,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		JsonModel jm = new JsonModel();
		int status = this.goodsBiz.addGoods(goods);

		if(status==1){
			jm.setCode(1);
		}else{
			jm.setCode(0);
			jm.setMsg("添加失败");
		}

		return jm;
	} 

	//更新
	@RequestMapping("update.action")
	public @ResponseBody JsonModel updateUsers(Goods goods,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		JsonModel jm = new JsonModel();

		int status = this.goodsBiz.updateGoods(goods);

		if(status==1){
			jm.setCode(1);
		}else{
			jm.setCode(0);
			jm.setMsg("更新失败");
		}

		return jm;
	} 

}
