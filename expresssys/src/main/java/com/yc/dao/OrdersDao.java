package com.yc.dao;

import java.util.List;

import com.yc.bean.Orders;

public interface OrdersDao {
	//查询所有订单
	public List<Orders> findAll(Integer start, Integer pagesize);
	
	//根据id查询
	public List<Orders> findById(Orders s,Integer start, Integer pagesize);
	
	//添加订单
	public int add(Orders s);
	
	//修改订单
	public int update(Orders s);
	
	//删除
	public int delete(Orders s);
	
	//总数
	public int total(Orders s);
	
	//发货
	public int updateStatus(Orders s);

}
