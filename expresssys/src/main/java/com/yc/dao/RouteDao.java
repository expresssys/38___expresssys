package com.yc.dao;

import java.util.List;
import java.util.Map;

import com.yc.bean.Route;

public interface RouteDao {
	//查询所有路线
	public List<Route> findAll();

	//根据条件查询
	public List<Route> findBy(Map map);

	//添加路线
	public int add(Route s);

	//修改路线
	public int update(Route s);

	//删除
	public int delete(Route s);

	//总数
	public int total(Route s);

}
