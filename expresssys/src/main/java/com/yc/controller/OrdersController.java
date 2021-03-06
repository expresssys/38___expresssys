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

import com.yc.bean.Orders;
import com.yc.bean.Users;
import com.yc.biz.OrdersBiz;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/orders/")
public class OrdersController {
	@Resource(name="ordersBizImpl")
	private OrdersBiz ordersBiz;

	public void setordersBiz(OrdersBiz ordersBiz) {
		this.ordersBiz = ordersBiz;
	}

	@RequestMapping(value="findAll.action")
	public @ResponseBody Map<String,Object> findAll(int rows,int page,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		//查询所有配送点
		Map<String,Object> s=this.ordersBiz.findAll(page-1,rows);
		session.setAttribute("AllOrders", s);
		return s;
	}
	
	//条件查询
	@RequestMapping(value="findByCondition.action")
	public @ResponseBody Map<String,Object> findByCondition(Orders s,Integer rows,Integer page,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		Map<String,Object> m=this.ordersBiz.findById(s, page-1, rows);
		session.setAttribute("AllOrders", s);
		return m;
	}
	//通过id查询
	@RequestMapping(value="findByID.action")
	public @ResponseBody Map<String,Object> findByID(Orders s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		Map<String,Object> m=this.ordersBiz.findById(s, 0, 1);	
		return m;
	}
	//添加订单
	@RequestMapping(value="add.action")
	public @ResponseBody int add(Orders s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		Users us=(Users) session.getAttribute("user");
		int usid=us.getUsid();
		s.setUsid(usid);
		int result=0;
		this.ordersBiz.add(s);
		result=1;
		return result;
	}
	
	//修改订单
	@RequestMapping(value="update.action")
	public @ResponseBody int update(Orders s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		if(request.getParameter("flag")!=null && !"".equals(request.getParameter("flag"))){
			s.setOstatus(1);
			ordersBiz.updateStatus(s);
		}else{
			Users us=(Users) session.getAttribute("user");
			int usid=us.getUsid();
			s.setUsid(usid);
		}
		int result=0;
		this.ordersBiz.update(s);
		result=1;
	
		return result;
	}
	
	//删除订单
	@RequestMapping(value="delete.action")
	public @ResponseBody int delete(Orders s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		
		int result=0;
		this.ordersBiz.delete(s);
		result=1;
		return result;
	}

	//条件查询 不分页
	@RequestMapping(value="findAllBy.action")
	public @ResponseBody Map<String,Object> find(Orders s,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
		int total = this.ordersBiz.findTotal(s);
		Map<String,Object> m=this.ordersBiz.findById(s, 0, total);
		session.setAttribute("AllOrders", s);
		return m;
	}
	
	
	@RequestMapping(value="updateStatus.action")
	public @ResponseBody int updateStatus(Orders s){
		System.out.println(s);
		int result=0;
		this.ordersBiz.updateStatus(s);
		result=1;
		return result;
	}

}
