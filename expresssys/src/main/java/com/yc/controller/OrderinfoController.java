package com.yc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.JsonModel;
import com.yc.bean.Orderinfo;
import com.yc.bean.Orders;
import com.yc.biz.OrderinfoBiz;
import com.yc.dao.OrderInfoDao;

@Controller
@Scope(value="prototype")
@RequestMapping(value="Admin/orders/")
public class OrderinfoController {
	
	@Resource(name="orderinfoBizImpl")
	private OrderinfoBiz orderinfoBiz;
	@Resource(name="orderInfoDaoImpl")
	private OrderInfoDao orderInfoDao;
	
	
	
	@RequestMapping(value="addOrderInfo.action")
	public @ResponseBody JsonModel addOrderInfo(Orderinfo orderinfo){
		JsonModel jm=new JsonModel();
		try {
			orderinfoBiz.addOrderInfo(orderinfo);
			jm.setCode(1);
			jm.setObj(orderinfo);
		} catch (Exception e) {
			jm.setCode(0);
			jm.setMsg(e.getMessage());
			e.printStackTrace();
		}
		
		return jm;
	}
	
	

	@RequestMapping(value="find.action")
	public @ResponseBody JsonModel find(Orders orders){
		JsonModel jm=new JsonModel();
		try {
			List<Orderinfo> list=orderinfoBiz.findorderInfo(orders);
			jm.setCode(1);
			jm.setRows(list);
		} catch (Exception e) {
			jm.setCode(0);
			jm.setMsg(e.getMessage());
			e.printStackTrace();
		}
		return jm;
	}
	
	@RequestMapping(value="findByOsid.action")
	public @ResponseBody JsonModel find(Orderinfo orderinfo){
		JsonModel jm=new JsonModel();
		try {
			Orderinfo list=orderinfoBiz.findOrderOsid(orderinfo);
			jm.setCode(1);
			jm.setObj(list);
		} catch (Exception e) {
			jm.setCode(0);
			jm.setMsg(e.getMessage());
			e.printStackTrace();
		}
		return jm;
	}


	
	

}
