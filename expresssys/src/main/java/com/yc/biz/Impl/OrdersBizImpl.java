package com.yc.biz.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Orders;
import com.yc.biz.OrdersBiz;
import com.yc.dao.OrdersDao;

@Service
@Transactional
public class OrdersBizImpl implements OrdersBiz {
	
	private OrdersDao ordersDao;
	
	@Resource(name="ordersDaoImpl")
	public void setordersDao(OrdersDao ordersDao) {
		this.ordersDao = ordersDao;
	}

	@Override
	public Map<String, Object> findAll(Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Orders> rows= this.ordersDao.findAll(start,pagesize);
		Orders s=new Orders();
		int total=this.ordersDao.total(s);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@Override
	public Map<String, Object> findById(Orders s,Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		
		List<Orders> rows=this.ordersDao.findById(s,start,pagesize);
		if(rows.size()==1){
			rows.get(0).setOendtimeString(rows.get(0).getOendtimeString());
			rows.get(0).setOstarttimeString(rows.get(0).getOstarttimeString());
			rows.get(0).setOtimeString(rows.get(0).getOtimeString());
		}
		int total=this.ordersDao.total(s);
		result.put("rows", rows);
		result.put("total", total);
		return result;			
	}

	@Override
	public int add(Orders s) {
		
		return this.ordersDao.add(s);
	}

	@Override
	public int update(Orders s) {
		
		return this.ordersDao.update(s);
	}

	@Override
	public int delete(Orders s) {
		// TODO Auto-generated method stub
		return this.ordersDao.delete(s);
	}
	
	public int updateStatus(Orders s){
		return this.ordersDao.updateStatus(s);
	}

}
