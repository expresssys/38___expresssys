package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Shippoint;

public interface ShippointBiz {
	//查询所有配送点
		public Map<String, Object> findAll(Integer start, Integer pagesize);
		
		//根据id查询
		public Map<String, Object> findById(Shippoint s,Integer start, Integer pagesize);
		
		//添加配送点
		public int add(Shippoint s);
		
		//修改配送点
		public int update(Shippoint s);
		
		//删除
		public int delete(Shippoint s);
		
		public List<Shippoint> selectAll();
		
		//根据地址查询
		public List<Shippoint> findByAddr(Shippoint s);

}
