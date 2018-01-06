package com.yc.dao;

import java.util.List;

import com.yc.bean.Orderinfo;
import com.yc.bean.Orders;

public interface OrderInfoDao {
	
	public void addOrderInfo(Orderinfo ordersinfo) throws Exception;
	
	public void updateOrderInfo (Orderinfo orderinfo) throws Exception;
	
	public void delOrderInfo(Orderinfo orderinfo) throws Exception;
	
	
	public List<Orderinfo> findorderInfo(Orders orders) throws Exception;
	
	public Orderinfo findOrderOsid(Orderinfo orderinfo);
	
	public int total(Orders orders) throws Exception;

}
