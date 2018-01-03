package com.yc.biz.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Route;
import com.yc.biz.RouteBiz;
import com.yc.dao.RouteDao;

@Service
@Transactional
public class RouteBizImpl implements RouteBiz {
	private RouteDao RouteDao;

	@Resource(name="routeDaoImpl")
	public void setRouteDao(RouteDao RouteDao) {
		this.RouteDao = RouteDao;
	}

	@Override
	public Map<String, Object> findAll(Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Route> rows=this.RouteDao.findAll(start, pagesize);
		Route s=new Route();
		int total=this.RouteDao.total(s);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@Override
	public Map<String, Object> findById(Route s, Integer start, Integer pagesize) {
		Map<String, Object> result=new  HashMap<String, Object>();
		List<Route> rows=this.RouteDao.findById(s, start, pagesize);
		int total=this.RouteDao.total(s);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@Override
	public int add(Route s) {
		return this.RouteDao.add(s);
	}

	@Override
	public int update(Route s) {
		return this.RouteDao.update(s);
	}

	@Override
	public int delete(Route s) {
		return this.RouteDao.delete(s);
	}

}
