package com.yc.biz.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Driver;
import com.yc.biz.DriverBiz;
import com.yc.dao.DriverDao;

@Service
@Transactional
public class DriverBizImpl implements DriverBiz {
	private DriverDao driverDao;

	@Resource(name="driverDaoImpl")
	public void setDriverDao(DriverDao driverDao) {
		this.driverDao = driverDao;
	}

	@Override
	public Map<String, Object> findAll(Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Driver> rows=this.driverDao.findAll(start, pagesize);
		Driver s=new Driver();
		int total=this.driverDao.total(s);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@Override
	public Map<String, Object> findById(Driver s, Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Driver> rows=this.driverDao.findById(s, start, pagesize);
		int total=this.driverDao.total(s);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@Override
	public int add(Driver s) {
		return this.driverDao.add(s);
	}

	@Override
	public int update(Driver s) {
		return this.driverDao.update(s);
	}

	@Override
	public int delete(Driver s) {
		return this.driverDao.delete(s);
	}

}
