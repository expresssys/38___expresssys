package com.yc.dao;

import java.util.List;
import java.util.Map;

import com.yc.bean.Goods;

public interface GoodsDao {
	
	public int addGoods(Goods goods);
	
	public int updateGoods(Goods goods);
	
	public List<Goods> findBy(Map map);
	
	public int total(Goods goods);
	
	
	
}
