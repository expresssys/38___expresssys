package com.yc.biz.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Shippoint;
import com.yc.biz.ShippointBiz;
import com.yc.dao.ShipPointDao;

@Service
public class ShippointBizImpl implements ShippointBiz {
	
	private ShipPointDao shipDao;
	
	@Resource(name="shippointDaoImpl")
	public void setShipDao(ShipPointDao shipDao) {
		this.shipDao = shipDao;
	}

	@Override
	public Map<String, Object> findAll(Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Shippoint> rows= this.shipDao.findAll(start,pagesize);

		int total=this.shipDao.total(null);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@Override
	public Map<String, Object> findById(Shippoint s,Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Shippoint> rows=this.shipDao.findById(s,start,pagesize);
		int total=this.shipDao.total(s);
		result.put("rows", rows);
		result.put("total", total);
		return result;			
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
		return this.shipDao.delete(s);
	}

}
