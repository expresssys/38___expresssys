package com.yc.biz;

import java.util.Map;

import com.yc.bean.Orders;

public interface OrdersBiz {
	//查询所有订单
		public Map<String, Object> findAll(Integer start, Integer pagesize);
		
		//根据id查询
		public Map<String, Object> findById(Orders s,Integer start, Integer pagesize);
		
		//添加订单
		public int add(Orders s);
		
		//修改订单
		public int update(Orders s);
		
		//删除
		public int delete(Orders s);
		
		//修改订单状态
		public int updateStatus(Orders s);

}
