package com.yc.biz.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Orderinfo;
import com.yc.bean.Orders;
import com.yc.biz.OrderinfoBiz;
import com.yc.dao.OrderInfoDao;
@Service
@Transactional
public class OrderinfoBizImpl implements OrderinfoBiz {
	@Resource(name="orderInfoDaoImpl")
	private OrderInfoDao orderinfoDao;

	@Override
	public void addOrderInfo(Orderinfo ordersinfo) throws Exception {
		orderinfoDao.addOrderInfo(ordersinfo);
	}

	@Override
	public void updateOrderInfo(Orderinfo orderinfo) throws Exception {
		orderinfoDao.updateOrderInfo(orderinfo);
	}

	@Override
	public void delOrderInfo(Orderinfo orderinfo) throws Exception {
		orderinfoDao.delOrderInfo(orderinfo);

	}

	@Override
	public List<Orderinfo> findorderInfo(Orders orders) throws Exception {
		return orderinfoDao.findorderInfo(orders);
	}

	@Override
	public Orderinfo findOrderOsid(Orderinfo orderinfo) {
		return this.orderinfoDao.findOrderOsid(orderinfo);
	}

}
