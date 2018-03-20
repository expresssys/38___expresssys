package com.yc.dao;

import java.util.List;

import com.yc.bean.Driver;

public interface DriverDao {
	//查询所有司机
	public List<Driver> findAll(Integer start, Integer pagesize);
	
	//根据条件查询
	public List<Driver> findById(Driver s,Integer start, Integer pagesize);
		
		//添加司机
		public int add(Driver s);
		
		//修改司机
		public int update(Driver s);
		
		//删除
		public int delete(Driver s);
		
		//总数
		public int total(Driver s);

}
