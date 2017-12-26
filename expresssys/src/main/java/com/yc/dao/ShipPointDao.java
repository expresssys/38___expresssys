package com.yc.dao;

import java.util.List;

import com.yc.bean.Shippoint;

public interface ShipPointDao {
	//查询所有配送点
	public List<Shippoint> findAll();
	
	//根据id查询
	public Shippoint findById(Shippoint s);
	
	//添加配送点
	public int add(Shippoint s);
	
	//修改配送点
	public int update(Shippoint s);
	
	//删除
	public int delete(Shippoint s);
	

}
