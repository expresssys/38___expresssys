package com.yc.biz.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Shippoint;
import com.yc.biz.ShippointBiz;
import com.yc.dao.ShipPointDao;

@Service
@Transactional
public class ShippointBizImpl implements ShippointBiz {
	@Resource(name="shippointDaoImpl")
	private ShipPointDao shipDao;
	

	public void setShipDao(ShipPointDao shipDao) {
		this.shipDao = shipDao;
	}

	@Override
	public List<Shippoint> findAll() {
		return this.shipDao.findAll();
	}

	@Override
	public Shippoint findById(Shippoint s) {
		return this.shipDao.findById(s);
	}

	@Override
	public int add(Shippoint s) {
		
		return this.shipDao.add(s);
	}

	@Override
	public int update(Shippoint s) {
		
		return this.shipDao.update(s);
	}

	@Override
	public int delete(Shippoint s) {
		// TODO Auto-generated method stub
		return this.shipDao.delete(s);
	}

}
