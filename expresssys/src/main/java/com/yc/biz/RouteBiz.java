package com.yc.biz;

import java.util.Map;

import com.yc.bean.Route;

public interface RouteBiz {
	//查询所有路线
			public Map<String, Object> findAll();
			
			//根据id查询
			public Map<String, Object> findBy(Map map);
			
			//添加路线
			public int add(Route s);
			
			//修改路线
			public int update(Route s);
			
			//删除
			public int delete(Route s);

}
