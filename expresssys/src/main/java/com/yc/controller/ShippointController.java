package com.yc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.JsonModel;
import com.yc.bean.Shippoint;
import com.yc.bean.Users;
import com.yc.biz.ShippointBiz;

@Controller
@Scope(value="prototype")
public class ShippointController {
	@Resource(name="shippointBizImpl")
	private ShippointBiz pointBiz;

	public void setPointBiz(ShippointBiz pointBiz) {
		this.pointBiz = pointBiz;
	}

	@RequestMapping(value="point/findAll.action")
	public @ResponseBody List Login(HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//查询所有配送点
		JsonModel jm=new JsonModel();
		List<Shippoint> s=this.pointBiz.findAll();
		try{
			jm.setCode(3);
			jm.setObj(s);	
		} catch (Exception e) {
			jm.setCode(2);
			jm.setMsg(e.getMessage());
		}
		session.setAttribute("AllshipPoint", s);
		return s;
	}

}
