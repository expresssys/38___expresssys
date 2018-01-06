package com.yc.biz;

import java.util.List;

import com.yc.bean.Orderinfo;
import com.yc.bean.Orders;

public interface OrderinfoBiz {
	
public void addOrderInfo(Orderinfo ordersinfo) throws Exception;
	
	public void updateOrderInfo (Orderinfo orderinfo) throws Exception;
	
	public void delOrderInfo(Orderinfo orderinfo) throws Exception;
	
	public Orderinfo findOrderOsid(Orderinfo orderinfo);
	
	public List<Orderinfo> findorderInfo(Orders orders) throws Exception;
	
}
