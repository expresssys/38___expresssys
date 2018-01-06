package com.yc.dao;

import java.util.List;

import com.yc.bean.Shippoint;

public interface ShipPointDao {
	//查询所有配送点
	public List<Shippoint> findAll(Integer start, Integer pagesize);
	
	//根据id查询
	public List<Shippoint> findById(Shippoint s,Integer start, Integer pagesize);
	
	//添加配送点
	public int add(Shippoint s);
	
	//修改配送点
	public int update(Shippoint s);
	
	//删除
	public int delete(Shippoint s);
	
	//总数
	public int total(Shippoint s);
	
	
	public List<Shippoint> selectAll();

}
