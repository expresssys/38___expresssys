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
@Transactional
public class ShippointBizImpl implements ShippointBiz {
	@Resource(name="shippointDaoImpl")
	private ShipPointDao shipDao;
	

	public void setShipDao(ShipPointDao shipDao) {
		this.shipDao = shipDao;
	}

	@Override
	public Map<String, Object> findAll(Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Shippoint> rows= this.shipDao.findAll(start,pagesize);
		System.out.println(rows);
		int total=this.shipDao.total(null);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@Override
	public Map<String, Object> findById(Map<String, String> map,Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Shippoint> rows=this.shipDao.findById(map,start,pagesize);
		int total=this.shipDao.total(map);
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
		// TODO Auto-generated method stub
		return this.shipDao.delete(s);
	}

}
