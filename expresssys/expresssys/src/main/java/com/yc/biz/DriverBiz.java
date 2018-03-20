package com.yc.biz;

import java.util.Map;

import com.yc.bean.Driver;

public interface DriverBiz {
	//查询所有司机
			public Map<String, Object> findAll(Integer start, Integer pagesize);
			
			//根据id查询
			public Map<String, Object> findById(Driver s,Integer start, Integer pagesize);
			
			//添加司机
			public int add(Driver s);
			
			//修改司机
			public int update(Driver s);
			
			//删除
			public int delete(Driver s);

}
