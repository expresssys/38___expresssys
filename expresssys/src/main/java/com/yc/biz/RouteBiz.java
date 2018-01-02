package com.yc.biz;

import java.util.Map;

import com.yc.bean.Route;

public interface RouteBiz {
	//查询所有路线
			public Map<String, Object> findAll(Integer start, Integer pagesize);
			
			//根据id查询
			public Map<String, Object> findById(Route s,Integer start, Integer pagesize);
			
			//添加路线
			public int add(Route s);
			
			//修改路线
			public int update(Route s);
			
			//删除
			public int delete(Route s);

}
