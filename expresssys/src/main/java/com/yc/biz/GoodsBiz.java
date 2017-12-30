package com.yc.biz;

import java.util.Map;

import com.yc.bean.Goods;

public interface GoodsBiz {
	
	
	public int addGoods(Goods goods);
	
	public Map<String,Object> findBy(Map map);
	
	public int updateGoods(Goods goods);
	
	
	
}
